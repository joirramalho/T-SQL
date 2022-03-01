--24fev22
--Monitoring SQL Server Deadlocks – the easy way
--https://www.sqlshack.com/monitoring-sql-server-deadlocks-easy-way/

/*
Declaration of the variables 
 
#DeadLockXMLData to store each Dead lock XML from the extended Event
#DeadLockDetails to store deadlock process, victim and application information
@GetDeadLocksForLastMinutes For how many number of Minutes to watch for
 
*/
SET NOCOUNT ON
CREATE TABLE #DeadLockXMLData( DeadLockXMLData XML, DeadLockNumber INT )
CREATE TABLE #DeadLockDetails( ProcessID nVARCHAR(50), HostName nVARCHAR(50), LoginName nVARCHAR(100), ClientApp nVARCHAR(100), Frame nVARCHAR(MAX), TSQLString nVARCHAR(MAX), DeadLockDateTime DATETIME, IsVictim TINYINT, DeadLockNumber INT )

DECLARE @DeadLockXMLData AS XML,@DeadLockNumber INT,@getInputBuffer CURSOR,@Document AS INT, @SQLString NVARCHAR (MAX),@GetDeadLocksForLastMinutes INT
 
SET	   @GetDeadLocksForLastMinutes = 6000
 
/*INSERT THE DEADLOCKS FROM EXTENDED EVENTS TO TEMP TABLES & FILTER ONLY DEADLOCKS*/
INSERT INTO #DeadLockXMLData( DeadLockXMLData, DeadLockNumber )
	SELECT  CONVERT(XML, event_data) DeadLockXMLData, ROW_NUMBER() OVER (ORDER BY Object_name) DeadLockNumber
	FROM	sys.fn_xe_file_target_read_file(N'system_health*.xel', NULL, NULL, NULL)
	WHERE   OBJECT_NAME = 'xml_deadlock_report'
 
/*START A CURSOR TO LOOP THROUGH ALL THE DEADLOCKS AS YOU MIGHT GET MUTLTIPLE DEADLOCK IN PRODUCTION AND YOU WOULD WANT ALL OF THEM*/
SET	   @getInputBuffer = CURSOR FOR
SELECT  DeadLockXMLData,DeadLockNumber  FROM	#DeadLockXMLData
OPEN	   @getInputBuffer
 
FETCH NEXT
FROM	   @getInputBuffer INTO @DeadLockXMLData,@DeadLockNumber
 
WHILE	@@FETCH_STATUS = 0
 
BEGIN
SET	   @Document	=   0
SET	   @SQLString	=   ''
 
EXEC	   sp_xml_preparedocument @Document OUTPUT, @DeadLockXMLData
 
/*INSERT PARSED DOCUMENT'S DATA FROM XML TO TEMP TABLE FOR READABILITY*/
INSERT INTO #DeadLockDetails(ProcessID,HostName,LoginName,ClientApp,Frame,TSQLString,DeadLockDateTime,DeadLockNumber)
	SELECT  ProcessID, HostName,LoginName,ClientApp, Frame,TSQL AS  TSQLString,LastBatchCompleted,@DeadLockNumber
	FROM	   OPENXML(@Document, 'event/data/value/deadlock/process-list/process')
	WITH 
		(
		ProcessID [varchar](50) '@id',
		HostName [varchar](50) '@hostname',
		LoginName [varchar](50) '@loginname',
		ClientApp [varchar](50) '@clientapp',
		CustomerName [varchar](100) '@clientapp',
		TSQL [nvarchar](MAX) 'inputbuf',
		Frame nVARCHAR(MAX) 'executionStack/frame',
		LastBatchCompleted nVARCHAR(50) '@lastbatchcompleted'
		)
 
/*UPDATE THE VICTIM SPID TO HIGHLIGHT TWO QUERIES SEPARETELY, THE PROCESS (WHO CREATED THE DEADLOCK) AND THE VICTIM*/
UPDATE  #DeadLockDetails
SET	   IsVictim = 1
WHERE   ProcessID IN (
						SELECT  ProcessID 
						FROM	   OPENXML(@Document, 'event/data/value/deadlock/victim-list/victimProcess')
						WITH 
							(
							ProcessID [varchar](50) '@id',
							HostName [varchar](50) '@hostname',
							LoginName [varchar](50) '@loginname',
							ClientApp [varchar](50) '@clientapp',
							CustomerName [varchar](100) '@clientapp',
							TSQL [nvarchar](MAX) 'inputbuf',
							Frame nVARCHAR(MAX) 'executionStack/frame',
							LastBatchCompleted nVARCHAR(50) '@lastbatchcompleted'
							)
					)
 
EXEC sp_xml_removedocument @Document
 
FETCH NEXT
FROM	   @getInputBuffer INTO @DeadLockXMLData,@DeadLockNumber
 
END
 
CLOSE   @getInputBuffer
DEALLOCATE @getInputBuffer
 
 
/*GET ALL THE DEADLOCKS AS A RESULT IN EASY READABLE TABLE FORMAT AND ANALYZE IT FOR FURTHER OPTIMIZATION */
 
SELECT  DeadLockDateTime,HostName,LoginName,ClientApp,ISNULL(Frame,'')+' **' + ISNULL(TSQLString,'') + '**' VictimTSQL, 
		(
			SELECT ISNULL(Frame,'')+' **' + ISNULL(TSQLString,'') + '**' AS TSQLString 
			FROM #DeadLockDetails 
			WHERE DeadLockNumber = D.DeadLockNumber AND ISNULL(IsVictim,0) = 0
		) ProcessTSQL
FROM	#DeadLockDetails D
WHERE   DATEDIFF( MINUTE, DeadLockDateTime, GETDATE() ) <= @GetDeadLocksForLastMinutes
		AND IsVictim = 1
ORDER BY DeadLockNumber
 
--DROP TABLE #DeadLockXMLData,#DeadLockDetails

SELECT * FROM #DeadLockXMLData
SELECT * FROM  #DeadLockDetails
 
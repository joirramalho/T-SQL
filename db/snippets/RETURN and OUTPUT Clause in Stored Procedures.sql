--04fev22
--https://www.mssqltips.com/sqlservertip/7024/sql-return-sql-output-clause-stored-procedure/
	--SQL Server RETURN and OUTPUT Clause in Stored Procedures

/*
DECLARE @Deadlocked INT
DECLARE @CountRecords INT

EXEC sp_countDeadLocks @DiffHoras = 18, @CountRecords = @Deadlocked OUTPUT

SELECT @Deadlocked 
*/

CREATE  PROCEDURE sp_countDeadLocks
(
	@DiffHoras 		TINYINT,
   	@CountRecords 	SMALLINT  OUTPUT
)
AS
BEGIN
	SET NOCOUNT ON
 
	DECLARE @TimeZone INT = DATEDIFF(HOUR, GETUTCDATE(), GETDATE())
	
	DECLARE @Deadlocked SMALLINT
	
	SELECT @Deadlocked = COUNT(*)
	FROM
	(
	    SELECT 
	        CAST(st.[target_data] AS XML) AS TargetData
	    FROM 
	        sys.dm_xe_session_targets AS st
	        INNER JOIN sys.dm_xe_sessions AS s ON s.[address] = st.event_session_address
	    WHERE 
	        s.[name] = N'system_health'
	        AND st.target_name = N'ring_buffer'
	        
	) AS [Data]
	CROSS APPLY TargetData.nodes('RingBufferTarget/event[@name="xml_deadlock_report"]') AS XEventData (xed)

	WHERE DATEDIFF(HOUR, DATEADD(HOUR, @TimeZone, xed.value('@timestamp', 'datetime2(3)')), GETDATE()  ) < @DiffHoras
	
	SELECT @CountRecords = @Deadlocked;
 
END

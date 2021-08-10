SET NOCOUNT ON
 
DECLARE @DBName VARCHAR(100)
DECLARE @FileName VARCHAR(255)
 
USE master
 
CREATE TABLE #clearlogs	( dbname VARCHAR(100), fn VARCHAR(255) )


INSERT INTO #clearlogs (dbname)
	SELECT SUBSTRING( MF.name, 1, LEN(MF.name) -4) 
	FROM sys.master_files AS mf 
	LEFT JOIN sys.databases db ON db.name = mf.name COLLATE Latin1_General_CI_AI
	WHERE data_space_id = 0 -- Logs
		AND mf.database_id > 4
		AND (mf.size * 8) / 1024 > 1
 
DECLARE MyLogs CURSOR FOR
(SELECT dbname FROM #clearlogs)
OPEN MyLogs
FETCH NEXT FROM MyLogs INTO @DBName
WHILE (@@FETCH_STATUS = 0)
BEGIN
--	IF @DBName NOT IN ( 'Banco' )
		EXEC('UPDATE #clearlogs SET fn = (SELECT f.name FROM ' + @DBName + '.dbo.sysfiles AS f WHERE filename LIKE ''%.ldf%'' ) WHERE dbname = ''' + @DBName + '''')

    FETCH NEXT FROM MyLogs INTO @DBName
END
 
CLOSE MyLogs
DEALLOCATE MyLogs
 
DECLARE MyDatabases CURSOR FOR
(SELECT dbname, fn FROM #clearlogs)
 
OPEN MyDatabases
FETCH NEXT FROM MyDatabases INTO @DBName, @FileName
WHILE (@@FETCH_STATUS = 0)
BEGIN
	PRINT ('ALTER DATABASE [' + @DBName + '] SET RECOVERY SIMPLE WITH NO_WAIT')
	PRINT ('GO')

	PRINT ('USE [' + @DBName + ']; DBCC SHRINKFILE(' + @FileName + ', 1024, TRUNCATEONLY);' )
	PRINT ('GO')

	PRINT ('ALTER DATABASE [' + @DBName + '] SET RECOVERY FULL WITH NO_WAIT')
	PRINT ('GO')

	PRINT ('')

    FETCH NEXT FROM MyDatabases INTO @DBName, @FileName
END
 
CLOSE MyDatabases
DEALLOCATE MyDatabases
DROP TABLE #clearlogs
 
SET NOCOUNT OFF
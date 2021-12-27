--12out21

IF OBJECT_ID('TEMPDB..##TEMP') IS NOT NULL
	DROP TABLE ##TEMP

CREATE TABLE ##TEMP ( 
DATABASENAME SYSNAME,
NAME SYSNAME,
PHYSICAL_NAME NVARCHAR(500),
SIZE DECIMAL (18,2),
FREESPACE DECIMAL (18,2),
NAMESIZE VARCHAR(20) 
)

EXEC SP_MSFOREACHDB 'USE [?];
    INSERT INTO ##TEMP (DATABASENAME, NAME, PHYSICAL_NAME, SIZE, FREESPACE)
        SELECT DB_NAME() AS [DATABASENAME], NAME,  PHYSICAL_NAME,
        CAST(CAST(ROUND(CAST(SIZE AS DECIMAL) * 8.0/1024.0,2) AS DECIMAL(18,0)) AS NVARCHAR) SIZE,
        CAST(CAST(ROUND(CAST(SIZE AS DECIMAL) * 8.0/1024.0,2) AS DECIMAL(18,0)) - CAST(FILEPROPERTY(NAME, ''SPACEUSED'') * 8.0/1024.0 AS DECIMAL(18,0)) AS NVARCHAR) AS FREESPACE
        FROM SYS.DATABASE_FILES
        WHERE DB_NAME() NOT IN (''MASTER'',''TEMPDB'',''MODEL'',''MSDB'', ''DBLOGMONITOR'', ''DBSIGAPADRAOINST'') 
		-- AND TYPE_DESC = ''ROWS''
	'
SELECT
	DATABASENAME,
	NAME,
--	PHYSICAL_NAME,
	SIZE,
	FREESPACE
FROM
	##TEMP
	-- WHERE   NAME LIKE 'DBSIGACONTEMPORANEO_ARQUIVO01%'
ORDER BY
--	SIZE DESC
	-- DATABASENAME
	FREESPACE	DESC 
--25dez21
--Logging ALL Queries on a SQL Server 2008 Express Database?
	--https://stackoverflow.com/questions/123781/logging-all-queries-on-a-sql-server-2008-express-database

DECLARE @DatabaseName 	sysname = NULL

--SET @DatabaseName = 'dbSigaAldeiaPE%'

SELECT TOP 100 deqs.last_execution_time AS [Time]
	,DB_Name(	ISNULL(dest.dbid, CONVERT(SMALLINT, att.value))  	) AS my_dbid
	,dest.TEXT AS [Query]
FROM sys.dm_exec_query_stats AS deqs
CROSS APPLY sys.dm_exec_sql_text(deqs.sql_handle) AS dest
CROSS APPLY sys.dm_exec_plan_attributes(deqs.plan_handle) att
WHERE att.attribute='dbid'
--	AND DB_Name(	ISNULL(dest.dbid, CONVERT(SMALLINT, att.value))  	) 		
ORDER BY deqs.last_execution_time DESC
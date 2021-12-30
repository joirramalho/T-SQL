--29dez21
--Logging ALL Queries on a SQL Server 2008 Express Database?
	--https://stackoverflow.com/questions/123781/logging-all-queries-on-a-sql-server-2008-express-database

DECLARE @DatabaseName 	sysname = NULL

--SET @DatabaseName = 'dbCrm%'

SELECT TOP 50  -- *
	deqs.last_execution_time AS [Time]
	,DB_Name(	ISNULL(dest.dbid, CONVERT(SMALLINT, att.value))  	) AS my_dbid
	,OBJECT_NAME(dest.objectid, dest.dbid) AS object_name
	,dest.TEXT AS [Query]
	,deqs.execution_count 
	,deqs.total_rows 
	,deqs.last_rows 
	,deqs.last_worker_time 
	,deqs.total_worker_time 
	,deqs.last_logical_reads 
	,deqs.total_logical_reads 
FROM 	sys.dm_exec_query_stats AS deqs
CROSS 	APPLY sys.dm_exec_sql_text(deqs.sql_handle) AS dest
CROSS 	APPLY sys.dm_exec_plan_attributes(deqs.plan_handle) att
WHERE 	att.attribute='dbid'
	AND DB_Name(dest.dbid) LIKE ISNULL( @DatabaseName, DB_Name(dest.dbid) ) 		
ORDER BY deqs.last_execution_time DESC
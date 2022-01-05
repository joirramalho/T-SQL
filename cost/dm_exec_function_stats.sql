--04jan22 
	--Troubleshoot SQL Server Function Performance with the sys.dm_exec_function_stats DMV
		--https://www.mssqltips.com/sqlservertip/4084/troubleshoot-sql-server-function-performance-with-the-sysdmexecfunctionstats-dmv/

SELECT  DB_NAME(database_id) 
--		,OBJECT_SCHEMA_NAME(OBJECT_ID, database_id)
        ,OBJECT_NAME(OBJECT_ID, database_id) 
		AS Function_Name,
        QS.last_execution_time ,
        T.Text ,
        QS.total_worker_time ,
        QS.max_worker_time ,
        QS.max_physical_reads ,
        QS.max_logical_reads ,
        QS.max_logical_writes
FROM    sys.dm_exec_function_stats QS
        CROSS APPLY sys.dm_exec_sql_text(sql_handle) T
--WHERE  T.dbid = DB_ID('AdventureWorks2014')
        
        
        
-- total_worker_time
SELECT TOP 10
	OBJECT_NAME(object_id, database_id) AS ObjectName
	, SUM(total_worker_time) AS SumOftotal_worker_time
FROM    sys.dm_exec_function_stats QS
        CROSS APPLY sys.dm_exec_sql_text(sql_handle) T
WHERE OBJECT_NAME(object_id, database_id) IS NOT NULL
GROUP BY OBJECT_NAME(object_id, database_id)
ORDER BY
	SUM(total_worker_time)	DESC

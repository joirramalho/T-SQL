--10dez21
	--Troubleshoot SQL Server Function Performance with the sys.dm_exec_function_stats DMV
		--https://www.mssqltips.com/sqlservertip/4084/troubleshoot-sql-server-function-performance-with-the-sysdmexecfunctionstats-dmv/

SELECT  DB_NAME(database_id) + '.' + 
		OBJECT_SCHEMA_NAME(OBJECT_ID, database_id) +
        '.' + OBJECT_NAME(OBJECT_ID, database_id) 
		AS Function_Name,
        QS.last_execution_time ,
        QS.max_worker_time ,
        QS.max_physical_reads ,
        QS.max_logical_reads ,
        QS.max_logical_writes ,
        T.Text
FROM    sys.dm_exec_function_stats QS
        CROSS APPLY sys.dm_exec_sql_text(sql_handle) T
--WHERE  T.dbid = DB_ID('AdventureWorks2014')
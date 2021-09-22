--21set21
--https://www.dbrnd.com/2016/11/sql-server-script-to-find-top-20-stored-procedure-which-are-utilizing-more-cpu/

SELECT
	TOP 30
    (total_logical_reads / execution_count) AS AverageLogicalReads
    ,
	DB_NAME(database_id) AS DatabaseName
    ,
--	OBJECT_SCHEMA_NAME(object_id,database_id) AS SchemaName
--    ,
	OBJECT_NAME(object_id,
	database_id)AS ObjectName
    ,
	cached_time AS CachedTime
    ,
	last_execution_time AS LastExecutionTime
    ,
	execution_count AS TotalNumberOfExecution
    ,
	(total_worker_time / execution_count) AS AvgCPUTime
    ,
	(total_elapsed_time / execution_count) AS AvgElapsedTime
    ,
	(total_logical_writes / execution_count) AS AvgLogicalWrites
    ,
	(total_physical_reads / execution_count) AS AvgPhysicalReads
FROM
	sys.dm_exec_procedure_stats
ORDER BY
	AverageLogicalReads DESC
--04dez22
	--https://www.dbrnd.com/2016/11/sql-server-script-to-find-top-20-stored-procedure-which-are-utilizing-more-cpu/
	

SELECT
	TOP 20
    (total_logical_reads / execution_count) AS AvgLogicalReads
    ,DB_NAME(database_id) AS DatabaseName
--	,OBJECT_SCHEMA_NAME(object_id,database_id) AS SchemaName
	,OBJECT_NAME(object_id
	,database_id)AS ObjectName
--	,cached_time AS CachedTime,
	,last_execution_time AS LastExecutionTime
    ,execution_count AS TotalNumberOfExecution
    ,(total_worker_time / execution_count) AS AvgCPUTime
    ,(total_elapsed_time / execution_count) AS AvgElapsedTime
    ,(total_logical_writes / execution_count) AS AvgLogicalWrites
    ,(total_physical_reads / execution_count) AS AvgPhysicalReads
FROM
	sys.dm_exec_procedure_stats
WHERE OBJECT_NAME(object_id, database_id) IS NOT NULL
ORDER BY
	AvgLogicalReads DESC
	

	
-- total_worker_time
SELECT TOP 10
	OBJECT_NAME(object_id, database_id) AS ObjectName
	, SUM(total_worker_time) AS SumOftotal_worker_time
FROM
	sys.dm_exec_procedure_stats
WHERE OBJECT_NAME(object_id, database_id) IS NOT NULL
GROUP BY OBJECT_NAME(object_id, database_id)
ORDER BY
	SUM(total_worker_time)	DESC
	

	

-- SumOftotal_logical_reads
--SELECT TOP 10
--	OBJECT_NAME(object_id, database_id) AS ObjectName
--	, SUM(total_logical_reads) AS SumOftotal_logical_reads
--FROM
--	sys.dm_exec_procedure_stats
--WHERE OBJECT_NAME(object_id, database_id) IS NOT NULL
--GROUP BY OBJECT_NAME(object_id, database_id)
--ORDER BY
--	SUM(total_logical_reads)	DESC	
	
	
	


-- SumOfTotalLogicalWrites
--SELECT TOP 10
--	OBJECT_NAME(object_id, database_id) AS ObjectName
--	, SUM(total_logical_writes) AS SumOftotal_logical_writes
--FROM
--	sys.dm_exec_procedure_stats
--WHERE OBJECT_NAME(object_id, database_id) IS NOT NULL
--GROUP BY OBJECT_NAME(object_id, database_id)
--ORDER BY
--	SUM(total_logical_writes)	DESC	

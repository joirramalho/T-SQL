--16jan22
--04out21
	--https://docs.microsoft.com/pt-br/sql/relational-databases/system-dynamic-management-views/sys-dm-exec-trigger-stats-transact-sql?view=sql-server-ver15

DECLARE @DatabaseName 	sysname = NULL
DECLARE @TriggerName 	sysname = NULL

--SET @DatabaseName = 'dbSigaCPI%'
--SET @TriggerName = 'TgLancamentoCobrancaValidarRPS%'


--SUM( total_worker_time ) by Database e/ou Trigger
SELECT
	TOP 30
	total_worker_time,
	DB_NAME(database_id) AS 'database_name',
	OBJECT_NAME(object_id, database_id) AS 'trigger_name',
--	d.cached_time, 			-- Hora em que o gatilho foi adicionado ao cache.
	d.execution_count,
	d.last_execution_time,
	d.total_elapsed_time,	-- O tempo total decorrido, em microssegundos, para execuções concluídas desse gatilho.
	d.total_elapsed_time / d.execution_count AS [avg_elapsed_time],
	d.last_elapsed_time
FROM
	sys.dm_exec_trigger_stats AS d
WHERE 
	DB_Name(database_id) LIKE ISNULL( @DatabaseName, DB_Name(database_id) ) 
	AND OBJECT_NAME(object_id, database_id) LIKE ISNULL( @TriggerName, OBJECT_NAME(object_id, database_id) )
ORDER BY
	[total_worker_time] DESC
	


--SUM( total_worker_time )
SELECT
	TOP 10
	OBJECT_NAME(object_id, database_id) AS 'trigger_name',
	SUM( total_worker_time ) AS total_worker_time

FROM
	sys.dm_exec_trigger_stats AS d
WHERE 
--	DB_Name(database_id) LIKE ISNULL( @DatabaseName, DB_Name(database_id) ) 
	OBJECT_NAME(object_id, database_id) LIKE ISNULL( @TriggerName, OBJECT_NAME(object_id, database_id) )
GROUP BY OBJECT_NAME(object_id, database_id)
ORDER BY
	[total_worker_time] DESC

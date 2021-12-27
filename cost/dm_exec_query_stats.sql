
-- 27dez21
-- using statement_start_offset and statement_end_offset we get the query text from inside the entire batch

SELECT	TOP 30
	qs.total_worker_time,
	DB_NAME(qp.dbid) AS [DatabaseName],
	qs.last_execution_time,
	SUBSTRING(qt.TEXT, (qs.statement_start_offset / 2)+ 1,
                           ((CASE qs.statement_end_offset
                                        WHEN -1 THEN DATALENGTH(qt.TEXT)
                                        ELSE qs.statement_end_offset
                           END
                           - qs.statement_start_offset)/ 2)+ 1)
                           as [Text],
	qs.execution_count,
	qs.total_logical_reads,
	qs.last_logical_reads,
	qs.total_logical_writes
--	qs.last_logical_writes,
--	qs.last_worker_time
--	qs.total_elapsed_time / 1000000 total_elapsed_time_in_S,
--	qs.last_elapsed_time / 1000000 last_elapsed_time_in_S
	--	,qp.query_plan
FROM
	sys.dm_exec_query_stats qs
	-- Retrieve the query text
       CROSS APPLY sys.dm_exec_sql_text(qs.sql_handle) qt
	-- Retrieve the query plan
       CROSS APPLY sys.dm_exec_query_plan(qs.plan_handle) qp
ORDER BY
	qs.total_worker_time DESC	-- CPU time
	
	
	

/*
IF OBJECT_ID('TEMPDB..##TEMP') IS NOT NULL	DROP TABLE ##TEMP

CREATE TABLE ##TEMP ( 
QueryText VARCHAR(MAX),
total_worker_time BIGINT
)

INSERT INTO ##TEMP
SELECT	TOP 15
	SUBSTRING(qt.TEXT, (qs.statement_start_offset / 2)+ 1,
                           ((CASE qs.statement_end_offset
                                        WHEN -1 THEN DATALENGTH(qt.TEXT)
                                        ELSE qs.statement_end_offset
                           END
                           - qs.statement_start_offset)/ 2)+ 1)
                           as [Text],
	qs.total_worker_time

FROM
	sys.dm_exec_query_stats qs
       CROSS APPLY sys.dm_exec_sql_text(qs.sql_handle) qt 	-- Retrieve the query text
ORDER BY
	qs.total_worker_time DESC	-- CPU time
	

SELECT 	SUM( total_worker_time ), QueryText
FROM ##TEMP
GROUP BY QueryText
ORDER BY SUM( total_worker_time ) DESC
*/
	
	
/*	
SELECT	TOP 15
	SUBSTRING(qt.TEXT, (qs.statement_start_offset / 2)+ 1,
                           ((CASE qs.statement_end_offset
                                        WHEN -1 THEN DATALENGTH(qt.TEXT)
                                        ELSE qs.statement_end_offset
                           END
                           - qs.statement_start_offset)/ 2)+ 1)
                           as [Text],
	SUM( qs.total_worker_time )                           

FROM
	sys.dm_exec_query_stats qs
	-- Retrieve the query text
       CROSS APPLY sys.dm_exec_sql_text(qs.sql_handle) qt
	-- Retrieve the query plan
       CROSS APPLY sys.dm_exec_query_plan(qs.plan_handle) qp
GROUP BY 	SUBSTRING(qt.TEXT, (qs.statement_start_offset / 2)+ 1,
                           ((CASE qs.statement_end_offset
                                        WHEN -1 THEN DATALENGTH(qt.TEXT)
                                        ELSE qs.statement_end_offset
                           END
                           - qs.statement_start_offset)/ 2)+ 1)
ORDER BY
	SUM( qs.total_worker_time ) DESC	-- CPU time	
*/

--15set21

SELECT
	qs.total_logical_reads AS [TotalLogicalRead],
	DB_NAME(st.dbid) AS [DatabaseName],
	st.[text] AS [QueryText],
	qs.last_execution_time AS [LastExecutionTime],
	qs.execution_count AS [ExecutionCount],
	qs.total_worker_time / 1000000 AS [TotalCPUTime/s],
	qs.total_worker_time / qs.execution_count / 1000 AS [AvgCPUTime/ms]
--	,qp.query_plan AS [Execution Plan]
FROM
	(
	select
		top 10 qs.last_execution_time,
		qs.execution_count,
		qs.plan_handle,
		qs.total_worker_time,
		qs.total_logical_reads
	from
		sys.dm_exec_query_stats qs
	order by
		qs.total_worker_time desc) qs
        cross apply sys.dm_exec_sql_text(plan_handle) st
        cross apply sys.dm_exec_query_plan(plan_handle) qp
order by
	qs.total_logical_reads desc
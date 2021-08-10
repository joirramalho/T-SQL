-- EXEC dbLogMonitor.dbo.sp_Where

Select
     DB_NAME(st.dbid) AS [Database Name],
     st.[text] AS [Query Text],          
     wt.last_execution_time AS [Last Execution Time],
     wt.execution_count AS [Execution Count],
     wt.total_worker_time/1000000 AS [Total CPU Time(second)],
     wt.total_worker_time/wt.execution_count/1000 AS [Average CPU Time(milisecond)],
     qp.query_plan
from 
    (select top 10 qs.last_execution_time, qs.execution_count, qs.plan_handle, qs.total_worker_time from sys.dm_exec_query_stats qs order by qs.total_worker_time desc) wt
cross apply sys.dm_exec_sql_text(plan_handle) st
cross apply sys.dm_exec_query_plan(plan_handle) qp
order by wt.last_execution_time DESC -- wt.total_worker_time desc
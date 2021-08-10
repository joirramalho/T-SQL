-- 18mai21

-- EXEC dbLogMonitor.dbo.sp_Where

SELECT COUNT(*)
        FROM sys.dm_exec_requests r
        WHERE blocking_session_id <> 0


SELECT blocking_session_id, session_id, d.name, start_time, [status], command, wait_type, wait_time 
        FROM sys.dm_exec_requests r
        LEFT JOIN sys.databases d on d.database_id = r.database_id
        WHERE blocking_session_id <> 0
        order by blocking_session_id


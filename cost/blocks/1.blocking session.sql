--23ago21

SELECT COUNT(*)
        FROM sys.dm_exec_requests r
        WHERE blocking_session_id <> 0;


SELECT 'KILL '  + LEFT( CAST( session_id as CHAR), 5) AS session_id, blocking_session_id, d.name, start_time, [status], command, wait_type, wait_time 
        FROM sys.dm_exec_requests r
        LEFT JOIN sys.databases d on d.database_id = r.database_id
        WHERE blocking_session_id <> 0
        order by blocking_session_id;

--10dez21
	--Monitoring SQL Server with Dynamic Management Objects – Requests
		--https://www.sqlshack.com/monitoring-sql-server-with-dynamic-management-objects-requests/
/*
Background
Running
Sleeping
Suspended
Runnable
 */
SELECT 
	s.session_id, s.login_time, s.host_name, s.program_name,
	s.login_name
	--, s.nt_user_name
	, s.is_user_process,
	--r.database_id, -- added r.alias
	DB_NAME(s.database_id) AS [database], 
	s.status,
	s.reads, s.writes, s.logical_reads, s.row_count
	--c.session_id
	--, c.net_transport, c.protocol_type
	--,c.client_net_address
	--, c.client_tcp_port, c.num_writes AS DataPacketWrites 
FROM sys.dm_exec_sessions s
INNER JOIN sys.dm_exec_connections c	ON s.session_id = c.session_id 
-- added join to sys.dm_exec_requests
INNER JOIN sys.dm_exec_requests r ON s.session_id = r.session_id
WHERE s.is_user_process = 1






/*
ALTER INDEX REORGANIZE
AUTO_SHRINK option with ALTER DATABASE
BACKUP DATABASE
DBCC CHECKDB
DBCC CHECKFILEGROUP
DBCC CHECKTABLE
DBCC INDEXDEFRAG
DBCC SHRINKDATABASE
DBCC SHRINKFILE
RECOVERY
RESTORE DATABASE
ROLLBACK
TDE ENCRYPTION
 */
SELECT 
	s.session_id 
	,r.percent_complete 
	,r.command, r.status
	,r.wait_type, r.blocking_session_id
	,s.login_name, s.host_name
--	, c.client_net_address, 
	,s.program_name, db_name(r.database_id) AS [Database]
	,r.total_elapsed_time, r.cpu_time, r.wait_time
	,r.reads, r.logical_reads, r.writes
FROM sys.dm_exec_sessions s
INNER JOIN sys.dm_exec_connections c	ON s.session_id = c.session_id 
INNER JOIN sys.dm_exec_requests r	ON s.session_id = r.session_id
WHERE s.is_user_process = 1
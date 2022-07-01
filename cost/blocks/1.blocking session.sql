--06dez21
	--https://www.dbrnd.com/2016/12/sql-server-script-to-find-waiting-queries-which-are-block-by-other-running-queries-find-block-transaction/
              
SELECT
	dowt.session_id
	,dowt.blocking_session_id
	,dest.text AS QueryText
	,dese.host_name as HostName
	,dowt.wait_duration_ms
	,dowt.wait_type
	,der.command
	,der.percent_complete
	,der.cpu_time
	,der.total_elapsed_time
	,der.reads
	,der.writes
	,der.logical_reads
	,der.row_count
	,dest.dbid AS DatabaseID
	,deqp.query_plan
	,der.plan_handle
FROM
	sys.dm_os_waiting_tasks as dowt
INNER JOIN sys.dm_exec_sessions as dese	ON	dowt.session_id = dese.session_id
INNER JOIN sys.dm_exec_requests as der
	ON
	dese.session_id = der.session_id
CROSS APPLY sys.dm_exec_sql_text(der.plan_handle) as dest
CROSS APPLY sys.dm_exec_query_plan(der.plan_handle) as deqp
WHERE
	dowt.session_id > 50
ORDER BY dowt.blocking_session_id
	
	

	
--SELECT	der.session_id, ib.event_info AS QueryText
--FROM	sys.dm_exec_requests AS der
--JOIN sys.dm_exec_sessions AS des ON	des.session_id = der.session_id
--CROSS APPLY sys.dm_exec_input_buffer(der.session_id, der.request_id) AS ib
--WHERE
--	des.is_user_process = 1

	

--SELECT 'KILL '  + LEFT( CAST( session_id as CHAR), 5) AS session_id, blocking_session_id, d.name, start_time, [status], command, wait_type, wait_time 
--        FROM sys.dm_exec_requests r
--        LEFT JOIN sys.databases d on d.database_id = r.database_id
--        WHERE blocking_session_id <> 0
--        order by blocking_session_id;
	
	
--	
--	
--	(@P1 nvarchar(60))SELECT [TbAccessToken].[IdAccessToken], [TbAccessToken].[IdResourceOwner], [TbAccessToken].[IdSourceRefreshToken], [TbAccessToken].[Token], [TbAccessToken].[IdApplication], [TbAccessToken].[Expires], [TbAccessToken].[Scope], [TbAccessToken].[CreatedAt], [TbAccessToken].[UpdatedAt], [TbResourceOwner].[IdResourceOwner], [TbResourceOwner].[Tipo], [TbResourceOwner].[IdUsuario], [TbResourceOwner].[IdCliente], [TbResourceOwner].[PushToken], [TbApplication].[IdApplication], [TbApplication].[ClientId], [TbApplication].[IdResourceOwner], [TbApplication].[RedirectURIs], [TbApplication].[ClientType], [TbApplication].[AuthorizationGrantType], [TbApplication].[ClientSecret], [TbApplication].[Name], [TbApplication].[SkipAuthorization], [TbApplication].[CreatedAt], [TbApplication].[UpdatedAt] 
--FROM [TbAccessToken] 
--LEFT OUTER JOIN [TbResourceOwner] ON ([TbAccessToken].[IdResourceOwner] = [TbResourceOwner].[IdResourceOwner]) LEFT OUTER JOIN [TbApplication] ON ([TbAccessToken].[IdApplication] = [TbApplication].[IdApplication]) 
--WHERE [TbAccessToken].[Token] = @P1
	

	
	
	
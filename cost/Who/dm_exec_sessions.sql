
--29ago21

SELECT
	last_request_start_time,
	session_id,
	login_name,
	program_name,
	host_name,
	[status],
	login_time,
	row_count,
	reads,
	writes,
	logical_reads
	-- unsuccessful_logons, last_unsuccessful_logon, last_request_end_time
FROM
	sys.dm_exec_sessions
WHERE
	1 = 1
	AND login_name NOT IN ( 'sa', 'sa_DESATIVADO' )
	--is_user_process = 1
	--        and Program_name NOT IN ('ADO_Messenger_ADO(1.049.)')
	-- and DATEDIFF(MINUTE, last_request_start_time, GETDATE()) > 1 -- login_time
	-- and open_transaction_count = 0
	AND login_name IN ('userFaculJardins')
ORDER BY
	last_request_start_time DESC
	-- login_time
	-- ORDER BY login_name  -- login_time
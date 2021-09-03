--03set21

SELECT
	last_request_start_time,
	DB_Name(database_id) AS [DatabaseName], 
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
	 login_name NOT IN ( 'sa', 'sa_DESATIVADO', 'NT AUTHORITY\NETWORK SERVICE' )
	--IS_USER_PROCESS = 1
	--AND DB_Name(database_id) IN ('dbSigaColegioEAG', '')
	--AND LOGIN_NAME IN ('USERCOLEGIOVICENTINA','USERVICENTINASCNSA')
	--AND PROGRAM_NAME NOT IN ('ADO_MESSENGER_ADO(1.049.)')

	--AND HOST_NAME IN ('APP')
	--AND DATEDIFF(MINUTE, LAST_REQUEST_START_TIME, GETDATE()) > 1 -- LOGIN_TIME
	--AND OPEN_TRANSACTION_COUNT = 0
ORDER BY
	last_request_start_time DESC
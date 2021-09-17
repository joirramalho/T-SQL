--16set21

SELECT
	last_request_start_time,
	DB_Name(database_id) AS [DatabaseName], 
	login_name,
	'KILL ' + CAST( session_id AS CHAR ),	
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
	 login_name NOT IN ( 'sa', 'sa_DESATIVADO', 'NT AUTHORITY\NETWORK SERVICE' ) AND PROGRAM_NAME NOT IN ('ADO_MESSENGER_ADO(1.049.)')
	--IS_USER_PROCESS = 1

--	AND DB_Name(database_id) IN ('CRM_EAG', '')
	--AND LOGIN_NAME IN ('userCELogos','')

	--AND HOST_NAME IN ('APP')
	--AND DATEDIFF(MINUTE, LAST_REQUEST_START_TIME, GETDATE()) > 1 -- LOGIN_TIME
	--AND OPEN_TRANSACTION_COUNT = 0
ORDER BY
	last_request_start_time DESC;
	



--GROUP BY program_name
SELECT
	program_name,
	COUNT(*)
FROM
	sys.dm_exec_sessions
WHERE
	 login_name NOT IN ( 'sa', 'sa_DESATIVADO', 'NT AUTHORITY\NETWORK SERVICE' ) AND PROGRAM_NAME NOT LIKE ('ADO_MESSENGER_ADO%') AND PROGRAM_NAME NOT LIKE ('ADO_ActiveMessenger%') AND PROGRAM_NAME NOT LIKE ('DBeaver%')

GROUP BY
	program_name
ORDER BY
	program_name;




--ADO_MESSENGER_ADO
SELECT
	last_request_start_time AS [last_request_Messenger],
	DB_Name(database_id) AS [DatabaseName], 
	login_name,
	'KILL ' + CAST( session_id AS CHAR ),
	program_name,
--	host_name,
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
	login_name NOT IN ( 'sa', 'sa_DESATIVADO', 'NT AUTHORITY\NETWORK SERVICE' ) AND PROGRAM_NAME IN ('ADO_MESSENGER_ADO(1.049.)')
ORDER BY
	last_request_start_time DESC;
	

                            

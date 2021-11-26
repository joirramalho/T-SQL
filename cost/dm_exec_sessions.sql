--04nov21

SELECT	last_request_start_time, DB_Name(database_id)  AS [DatabaseName], login_name, 'KILL ' + TRIM( CAST( session_id AS CHAR ) ) + ';' AS [kill], program_name, host_name, [status], login_time, row_count, reads, writes, logical_reads
	-- unsuccessful_logons, last_unsuccessful_logon, last_request_end_time
FROM	sys.dm_exec_sessions
WHERE	login_name NOT IN ( 'sa', 'sa_DESATIVADO', 'NT AUTHORITY\NETWORK SERVICE' ) AND PROGRAM_NAME NOT LIKE ('ADO_MESSENGER_ADO%')	--IS_USER_PROCESS = 1

	AND DB_Name(database_id) IN ('dbSigaArvoreSaber', 'dbSigaParaisoSaber', 'dbSigaEcoVillePE')

--	AND LOGIN_NAME IN ('userSANTAREM','userActivesoft', 'francisco')

	--AND HOST_NAME IN ('APP')
	--AND DATEDIFF(MINUTE, LAST_REQUEST_START_TIME, GETDATE()) > 1 -- LOGIN_TIME
	--AND OPEN_TRANSACTION_COUNT = 0
ORDER BY
	last_request_start_time DESC;
	



--ADO_MESSENGER_ADO
SELECT	last_request_start_time AS [last_request_Messenger], DB_Name(database_id) AS [DatabaseName], login_name, program_name, 'KILL ' + TRIM( CAST( session_id AS CHAR ) ) + ';' AS [kill], [status], login_time, row_count, reads, writes, logical_reads
	-- unsuccessful_logons, last_unsuccessful_logon, last_request_end_time
FROM	sys.dm_exec_sessions
WHERE login_name NOT IN ( 'sa', 'sa_DESATIVADO', 'NT AUTHORITY\NETWORK SERVICE' ) AND PROGRAM_NAME LIKE ('ADO_MESSENGER_ADO%')

	AND DB_Name(database_id) IN ('dbSigaArvoreSaber', 'dbSigaParaisoSaber', 'dbSigaEcoVillePE')

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



--GROUP BY client_net_address
SELECT
		CASE 
		WHEN client_net_address = '172.31.28.81' THEN 'MSG01'
		WHEN client_net_address = '172.31.28.104' THEN 'MSG02'
		WHEN client_net_address = '172.31.28.121' THEN 'MSG03'
		WHEN client_net_address = '172.31.24.57' THEN 'MSG04'
		ELSE client_net_address
	END AS 'Clientes por Messenger',
	COUNT(*)
FROM
	sys.dm_exec_sessions s
JOIN sys.dm_exec_connections AS c
    ON c.session_id = s.session_id
WHERE
	s.login_name NOT IN ( 'sa', 'sa_DESATIVADO', 'NT AUTHORITY\NETWORK SERVICE' ) AND s.PROGRAM_NAME LIKE ('ADO_MESSENGER_ADO%')

GROUP BY
	client_net_address
ORDER BY
	client_net_address;




--LIST BY client_net_address, DB_Name(database_id)
SELECT
		CASE 
		WHEN client_net_address = '172.31.28.81' THEN 'MSG01'
		WHEN client_net_address = '172.31.28.104' THEN 'MSG02'
		WHEN client_net_address = '172.31.28.121' THEN 'MSG03'
		WHEN client_net_address = '172.31.24.57' THEN 'MSG04'
		ELSE client_net_address
	END AS 'Messenger',
	DB_Name(database_id) AS [DatabaseName]
FROM
	sys.dm_exec_sessions s
JOIN sys.dm_exec_connections AS c
    ON c.session_id = s.session_id
WHERE
	s.login_name NOT IN ( 'sa', 'sa_DESATIVADO', 'NT AUTHORITY\NETWORK SERVICE' ) AND s.PROGRAM_NAME LIKE ('ADO_MESSENGER_ADO%')

ORDER BY
	Messenger, DatabaseName;




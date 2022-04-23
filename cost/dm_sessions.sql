--16abr22

DECLARE @DatabaseName 	sysname = NULL
DECLARE @LoginName 		sysname = NULL

--SET @DatabaseName = 'dbSigaCrEscBabyEase' -- dbSigaIEPAM or dbSigaAraraAzul -- dbSigaCrodrigues ou dbSigaVitGoncalves
--SET @LoginName 	= 'sigaadmin%'

-- Databases on & offline
SELECT 
		CASE 
		WHEN state = 0 THEN 'ONLINE'
		ELSE '-- offline --'
	END AS 'state',
	name, program_name, last_request_start_time, login_name, RTRIM( 'KILL ' + CAST( session_id AS CHAR ) ) + ';' AS [kill], login_time, host_name, recovery_model_desc,
	CASE 
		WHEN is_read_only = 1 THEN 'read-only'
		ELSE 'r/w'
	END AS 'read-write'
FROM	sys.databases d
LEFT JOIN sys.dm_exec_sessions s ON d.database_id  = s.database_id
WHERE
	d.database_id > 4
	and login_name NOT IN ( 'sa', 'sa_DESATIVADO', 'NT AUTHORITY\NETWORK SERVICE' ) AND PROGRAM_NAME NOT LIKE ('ADO_MESSENGER_ADO%') AND PROGRAM_NAME NOT LIKE ('ADO_SIGA_NFSe%')	--IS_USER_PROCESS = 1
--	AND DB_Name(d.database_id) LIKE ISNULL( @DatabaseName, DB_Name(d.database_id) ) 		
--	AND LOGIN_NAME LIKE ISNULL( @LoginName, LOGIN_NAME ) 	
--	and state = 0 			-- 0 ON-LINE -- 6 OFF-LINE
--	and recovery_model = 1   -- 1-FULL 3-simple
--	and is_read_only = 0 	-- Read-only
--	and user_access <> 1 	-- SINGLE_USER
--	and name NOT IN ('?')
--	and create_Date > '2020-04-08 12:47:10.447'	
--	and name LIKE 'dbCrmActivesoft%'
	--AND program_name IN ('httpd')
	--AND HOST_NAME IN ('APP')
	--AND DATEDIFF(MINUTE, LAST_REQUEST_START_TIME, GETDATE()) > 1 -- LOGIN_TIME
	--AND OPEN_TRANSACTION_COUNT = 0
ORDER BY 
--	state_desc DESC, name, program_name DESC
	last_request_start_time DESC



--QtdeConnections
	--	SELECT	DB_Name(database_id)  AS [DatabaseName], count(*) AS QtdeConnections
	--	-- unsuccessful_logons, last_unsuccessful_logon, last_request_end_time
	--	FROM	sys.dm_exec_sessions
	--	WHERE	login_name NOT IN ( 'sa', 'sa_DESATIVADO', 'NT AUTHORITY\NETWORK SERVICE' ) AND PROGRAM_NAME NOT LIKE ('ADO_MESSENGER_ADO%')	--IS_USER_PROCESS = 1
	--	--	AND DB_Name(database_id) LIKE ISNULL( @DatabaseName, DB_Name(database_id) ) 		
	--	--	AND LOGIN_NAME LIKE ISNULL( @LoginName, LOGIN_NAME ) 	
	--	GROUP BY DB_Name(database_id)
	--	ORDER BY count(*) DESC



--ADO_MESSENGER_ADO & ADO_SIGA_NFSe
		SELECT	DB_Name(database_id)  AS [DatabaseName], last_request_start_time, login_name, RTRIM( 'KILL ' + CAST( session_id AS CHAR ) ) + ';' AS [kill], program_name, [status], login_time, host_name--, logical_reads, row_count, reads, writes
		FROM	sys.dm_exec_sessions
		WHERE login_name NOT IN ( 'sa', 'sa_DESATIVADO', 'NT AUTHORITY\NETWORK SERVICE' ) AND ( PROGRAM_NAME LIKE ('ADO_MESSENGER_ADO%') OR PROGRAM_NAME LIKE ('ADO_SIGA_NFSe%') )
			AND DB_Name(database_id) LIKE ISNULL( @DatabaseName, DB_Name(database_id) ) 		
		ORDER BY DB_Name(database_id)
	

                            
--GROUP BY program_name
	--SELECT program_name, COUNT(*)
	--	
	--FROM
	--	sys.dm_exec_sessions
	--WHERE
	--	 login_name NOT IN ( 'sa', 'sa_DESATIVADO', 'NT AUTHORITY\NETWORK SERVICE' ) 
	--	 AND PROGRAM_NAME NOT LIKE ('ADO_MESSENGER_ADO%') AND PROGRAM_NAME NOT LIKE ('ADO_ActiveMessenger%') AND PROGRAM_NAME NOT LIKE ('DBeaver%')
	--	AND DB_Name(database_id) LIKE ISNULL( @DatabaseName, DB_Name(database_id) ) 		
	--GROUP BY
	--	program_name
	--ORDER BY
	--	COUNT(*) DESC, program_name



--GROUP BY client_net_address
	--SELECT
	--		CASE 
	--		WHEN client_net_address = '172.31.28.81' THEN 'MSG01'
	--		WHEN client_net_address = '172.31.28.104' THEN 'MSG02'
	--		WHEN client_net_address = '172.31.28.121' THEN 'MSG03'
	--		WHEN client_net_address = '172.31.24.57' THEN 'MSG04'
	--		WHEN client_net_address = '172.31.22.68' THEN 'MSG05'
	--		ELSE client_net_address
	--	END AS [Messenger],
	--	COUNT(*)
	--FROM
	--	sys.dm_exec_sessions s
	--JOIN sys.dm_exec_connections AS c
	--    ON c.session_id = s.session_id
	--WHERE
	--	s.login_name NOT IN ( 'sa', 'sa_DESATIVADO', 'NT AUTHORITY\NETWORK SERVICE' ) AND s.PROGRAM_NAME LIKE ('ADO_MESSENGER_ADO%')
	--	AND DB_Name(database_id) LIKE ISNULL( @DatabaseName, DB_Name(database_id) ) 		
	--
	--GROUP BY
	--	client_net_address
	--ORDER BY
	--	Messenger




--LIST BY client_net_address, DB_Name(database_id)
	--	SELECT
	--			CASE 
	--			WHEN client_net_address = '172.31.28.81' THEN 'MSG01'
	--			WHEN client_net_address = '172.31.28.104' THEN 'MSG02'
	--			WHEN client_net_address = '172.31.28.121' THEN 'MSG03'
	--			WHEN client_net_address = '172.31.24.57' THEN 'MSG04'
	--			WHEN client_net_address = '172.31.22.68' THEN 'MSG05'
	--			ELSE client_net_address
	--		END AS [Messenger],
	--		DB_Name(database_id) AS [DatabaseName]
	--	FROM
	--		sys.dm_exec_sessions s
	--	JOIN sys.dm_exec_connections AS c
	--	    ON c.session_id = s.session_id
	--	WHERE
	--		s.login_name NOT IN ( 'sa', 'sa_DESATIVADO', 'NT AUTHORITY\NETWORK SERVICE' ) AND s.PROGRAM_NAME LIKE ('ADO_MESSENGER_ADO%')
	--		AND DB_Name(database_id) LIKE ISNULL( @DatabaseName, DB_Name(database_id) ) 		
	--		AND LOGIN_NAME LIKE ISNULL( @LoginName, LOGIN_NAME ) 	
	--	
	--	ORDER BY
	--		Messenger, DatabaseName

	

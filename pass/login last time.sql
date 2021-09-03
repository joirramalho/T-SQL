--03set21

SELECT 
	[Database] = DB_NAME(database_id),
    [Login] = login_name
    ,last_request_start_time 
	,[Host] = HOST_NAME
	,[Program] = PROGRAM_NAME
	,[Last Login Time] = login_time
	--,[Client Interface] =  client_interface_name
FROM sys.dm_exec_sessions
WHERE database_id > 4
    -- [login_time] > DATEADD(HH,-4,getdate())--modify date as needed

    AND login_name NOT IN ('sa','sa_DESATIVADO', 'NT AUTHORITY\NETWORK SERVICE')
 AND PROGRAM_NAME NOT LIKE 'ADO_Messenger_ADO%'
--	AND DB_NAME(database_id) IN ('dbSigaSantAna') -- 

ORDER BY DB_NAME(database_id), Login, [login_time] desc;


--ADO_Messenger_ADO%
SELECT 
	[Database] = DB_NAME(database_id),
    [Login] = login_name
    ,last_request_start_time 
	,[Program] = PROGRAM_NAME
	,[Last Login Time] = login_time
--	,[Client Interface] =  client_interface_name
FROM sys.dm_exec_sessions
WHERE database_id > 4
    -- [login_time] > DATEADD(HH,-4,getdate())--modify date as needed

    AND login_name NOT IN ('sa','sa_DESATIVADO', 'NT AUTHORITY\NETWORK SERVICE')
 AND PROGRAM_NAME LIKE 'ADO_Messenger_ADO%'
--	AND DB_NAME(database_id) IN ('dbSigaSantAna') -- 

ORDER BY DB_NAME(database_id), Login, [login_time] desc;
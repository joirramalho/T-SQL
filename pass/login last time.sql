--25ago21
-- 31jul21 

SELECT 
	[Database] = DB_NAME(database_id),
    [Login] = login_name
	,[Last Login Time] = login_time
	,[Host] = HOST_NAME
	,[Program] = PROGRAM_NAME
	-- ,[Client Interface] =  client_interface_name
FROM sys.dm_exec_sessions
WHERE 
    -- [login_time] > DATEADD(HH,-4,getdate())--modify date as needed

    login_name NOT IN ('sa','sa_DESATIVADO', 'NT AUTHORITY\NETWORK SERVICE')
    -- AND PROGRAM_NAME NOT IN ('ADO_Messenger_ADO(1.048.)')
-- AND DB_NAME(database_id) IN ('dbSigaFACESA')

ORDER BY DB_NAME(database_id),Login, [login_time] desc
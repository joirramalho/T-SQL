--24set21
	--exec sp_MSforeachdb 'select ''?'' as DBNAME, * from ?.sys.sysusers where uid < 16384'

IF OBJECT_ID('tempdb..#users') IS NOT NULL 
  DROP TABLE tempdb..#users

CREATE TABLE tempdb..#users(     Usedb    VARCHAR(128), DropCmd    VARCHAR(128) )


EXEC dbo.sp_foreachdb N' 
	SET NOCOUNT ON

    USE [?]

	INSERT INTO #users

	    SELECT  
	        ''USE '' + DB_NAME() + '';'',
--	            u.name AS [Name],
--				''USE '' + QUOTENAME(?) + '';'',
				''DROP USER ['' + u.name + ''];''
--	            u.create_date AS [CreateDate],
--            	u.principal_id AS [ID],
--	            CAST(CASE dp.state WHEN ''G'' THEN 1 WHEN ''W'' THEN 1 ELSE 0 END AS bit) AS [HasDBAccess]
	    FROM    [?].sys.database_principals AS u
	    LEFT OUTER JOIN [?].sys.database_permissions AS dp ON dp.grantee_principal_id = u.principal_id and dp.type = ''CO''
	    WHERE   (u.type in (''U'', ''S'', ''G'', ''C'', ''K'' ,''E'', ''X''))
	        
	        AND name NOT IN ( ''sigaadmin'', ''sigainternet'', ''sys'', ''guest'', ''dbo'', ''INFORMATION_SCHEMA'')
			AND name NOT LIKE ''user%'' 
			AND name LIKE ''active.%'' 
	    
	    ORDER BY    [Name] ASC
'
,@print_command_only = 0 -- Obrigatório Gerar script
,@print_dbname=1
-- ,@state_desc = N'OFFLINE'
,@user_only = 1
,@suppress_quotename=1
--,@name_pattern='dbSigaA';
,@database_list = 'dbSigaWillyJanz'

SELECT * FROM #users ORDER BY 2,1 --DropCmd;

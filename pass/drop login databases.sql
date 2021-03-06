--14dez21
-- USER of ALL Database


SET NOCOUNT ON;

IF (OBJECT_ID('tempdb..#Databases') IS NOT NULL) 
    DROP TABLE tempdb..#Databases

CREATE TABLE tempdb..#Databases(     DatabaseName VARCHAR(128),	DisableLogin    VARCHAR(128),    DropUser    VARCHAR(128),     CreateDate DATETIME )

EXEC dbo.sp_foreachdb N'
--	IF [?] IN (''dbActivePainelEletronico'')
--	BEGIN
		USE ?
    
		INSERT INTO #Databases 
	        SELECT ''Use '' + DB_NAME() +'';'', ''ALTER LOGIN [''+ name + ''] DISABLE;'', ''DROP USER [''+ name + ''];'', createdate

	            FROM ?.sys.sysusers 
	            WHERE 1=1
	
	            --AND ( name NOT LIKE ''use%''  )
	                -- AND ( name NOT LIKE ''active.modelo''  )
	                -- AND ( name  LIKE ''sigainternet''  )
	                -- AND ( name  LIKE ''%controller%''  )
	
	
	      --          AND ( name  LIKE ''activeuser''  )
	                 
	                
	--          AND name NOT IN (''dbo'', ''sigaadmin'', ''sigainternet'', ''sigauser'', ''active.backup'', ''active.filipe'') -- , ''public'', ''guest'', ''sys'', ''INFORMATION_SCHEMA''
	            AND name NOT IN (''dbo'', ''sigaadmin'', ''sigainternet'') -- , ''public'', ''guest'', ''sys'', ''INFORMATION_SCHEMA''
	
	            -- AND ( name NOT LIKE ''roleEEM''  )
	             AND ( name LIKE ''EEM%'' AND issqlrole = 0 ) OR name LIKE ''%Controller%'' OR ( name LIKE ''%GPA%'' AND issqlrole = 0 ) OR name LIKE ''%visualid%''
	
	            AND gid = 0 AND hasdbaccess = 1 
	        ORDER BY 1,2
--	END
'
,@print_command_only = 0 -- Obrigatório Gerar script
,@print_dbname=0
--,@state_desc = N'ONLINE'
,@user_only = 1
,@system_only = 0
,@suppress_quotename=1
,@is_read_only = 0

 ,@name_pattern='db'; -- VPS06 dbSiga
-- ,@database_list = 'db'

SELECT Databasename, DisableLogin, DropUser, createdate FROM #Databases ORDER BY 2,1


-- SELECT Databasename, 'DROP SCHEMA sigauser', DropUser FROM #Databases ORDER BY DatabaseName, DropUser




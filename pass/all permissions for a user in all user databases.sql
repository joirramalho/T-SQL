--16fev22
--https://sqlgeekspro.com/retrieve-permissions-user-user-databases/
	--Retrieve all permissions for a user in all user databases 
	
--(DATABASE_ROLE) -- Não SERVER_ROLE

DECLARE @dbname VARCHAR(50)   
DECLARE @statement NVARCHAR(MAX)


IF OBJECT_ID('TEMPDB..##TEMP') IS NOT NULL
	DROP TABLE TEMPDB..##TEMP

CREATE TABLE ##TEMP ( ServerName SYSNAME, DatabaseName SYSNAME, Name SYSNAME, TypeOfLogin SYSNAME, PermissionLevel SYSNAME, TypeOfRole SYSNAME ) -- TYPEFILE INT, PHYSICAL_NAME NVARCHAR(500), SIZE DECIMAL (18,2), FREESPACE DECIMAL (18,2), NAMESIZE VARCHAR(20)


DECLARE db_cursor CURSOR 
LOCAL FAST_FORWARD
FOR  
	SELECT name
	FROM master.sys.databases
	WHERE name NOT IN ('master','msdb','model','tempdb') 
	AND state_desc='online' 
OPEN db_cursor  
FETCH NEXT FROM db_cursor INTO @dbname  
WHILE @@FETCH_STATUS = 0  
BEGIN  

	SELECT @statement = 'USE ['+@dbname +'];'+ 'SELECT
	
	ServerName=@@servername, dbname=db_name(db_id()), p.name as UserName, p.type_desc as TypeOfLogin, pp.name as PermissionLevel, pp.type_desc as TypeOfRole 
	
	FROM 	sys.database_role_members roles
	JOIN 	sys.database_principals p ON roles.member_principal_id = p.principal_id
	JOIN 	sys.database_principals pp ON roles.role_principal_id = pp.principal_id

	WHERE 	p.name=''TCE\04484771730''' -- Change the user name
	
	INSERT INTO  TEMPDB..##TEMP ( SERVERNAME, DATABASENAME, NAME, TypeOfLogin, PermissionLevel, TypeOfRole ) 
		EXEC sp_executesql @statement

FETCH NEXT FROM db_cursor INTO @dbname  
END  
CLOSE db_cursor  
DEALLOCATE db_cursor

SELECT DATABASENAME, NAME, TypeOfLogin, PermissionLevel, TypeOfRole FROM  TEMPDB..##TEMP ORDER BY 1,2


--EXEC sp_AddRoleMember 'role_db_gen_tables_except', 'TCE\04484771730'
--EXEC sp_AddRoleMember 'role_db_controleexterno', 'TCE\04484771730'

--EXEC sp_AddRoleMember 'db_datareader', 'TCE\04484771730'

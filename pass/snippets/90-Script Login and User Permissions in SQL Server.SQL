--24ago21
--Script Login and User Permissions in SQL Server
    -- http://udayarumilli.com/script-login-user-permissions-sql-server/

--USE dbSigaDCC

PRINT 'USE ['+DB_NAME()+']';
PRINT 'GO'


SELECT  'Create a new user and map it with login'

SELECT 'CREATE USER [' + NAME + '] FOR LOGIN [' + NAME + ']' 
FROM sys.database_principals
WHERE	[Type] IN ('U','S')
		AND 
		[NAME] NOT IN ('dbo','guest','sys','INFORMATION_SCHEMA')
ORDER BY NAME
GO

-- Troubleshooting User creation issues
PRINT '/***'+CHAR(10)+
'--Error 15023: User or role <XXXX> is already exists in the database.'+CHAR(10)+
'--Then Execute the below code can fix the issue'+CHAR(10)+
'EXEC sp_change_users_login ''Auto_Fix'',''<Failed User>'''+CHAR(10)+
'GO **/'

SELECT 'Create User-Role Scrip'

SELECT 'EXEC sp_AddRoleMember ''' + DBRole.NAME + ''', ''' + DBP.NAME + '''' 
FROM sys.database_principals DBP
INNER JOIN sys.database_role_members DBM ON DBM.member_principal_id = DBP.principal_id
INNER JOIN sys.database_principals DBRole ON DBRole.principal_id = DBM.role_principal_id
WHERE DBP.NAME <> 'dbo'
GO


SELECT  'Database Level Permission'

SELECT	CASE WHEN DBP.state <> 'W' THEN DBP.state_desc ELSE 'GRANT' END
		+ SPACE(1) + DBP.permission_name + SPACE(1)
		+ SPACE(1) + 'TO' + SPACE(1) + QUOTENAME(USR.name) COLLATE database_default
		+ CASE WHEN DBP.state <> 'W' THEN SPACE(0) ELSE SPACE(1) + 'WITH GRANT OPTION' END + ';' 
FROM	sys.database_permissions AS DBP
		INNER JOIN	sys.database_principals AS USR	ON DBP.grantee_principal_id = USR.principal_id
WHERE	DBP.major_id = 0 and USR.name <> 'dbo'
ORDER BY DBP.permission_name ASC, DBP.state_desc ASC


SELECT  'Object Level Permission'

SELECT	CASE WHEN DBP.state <> 'W' THEN DBP.state_desc ELSE 'GRANT' END
		+ SPACE(1) + DBP.permission_name + SPACE(1) + 'ON ' + QUOTENAME(USER_NAME(OBJ.schema_id)) + '.' + QUOTENAME(OBJ.name) 
		+ CASE WHEN CL.column_id IS NULL THEN SPACE(0) ELSE '(' + QUOTENAME(CL.name) + ')' END
		+ SPACE(1) + 'TO' + SPACE(1) + QUOTENAME(USR.name) COLLATE database_default
		+ CASE WHEN DBP.state <> 'W' THEN SPACE(0) ELSE SPACE(1) + 'WITH GRANT OPTION' END + ';' 
FROM	sys.database_permissions AS DBP
		INNER JOIN	sys.objects AS OBJ	ON DBP.major_id = OBJ.[object_id]
		INNER JOIN	sys.database_principals AS USR	ON DBP.grantee_principal_id = USR.principal_id
		LEFT JOIN	sys.columns AS CL	ON CL.column_id = DBP.minor_id AND CL.[object_id] = DBP.major_id
ORDER BY OBJ.name, DBP.permission_name ASC, DBP.state_desc ASC


SET NOCOUNT OFF;
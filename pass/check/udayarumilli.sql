-- udayarumilli ADAPTADO

-- 1

SELECT 'USE '+ DB_NAME()+'; CREATE USER ['+dp.name+'] FOR LOGIN ['+dp.name+'];'+ 
        'ALTER USER ['+dp.name+'] WITH DEFAULT_SCHEMA=['+dp.default_schema_name+'];' AS [-- Logins To Be Created --]
FROM sys.database_principals AS dp
INNER JOIN sys.server_principals sp ON dp.sid = sp.sid
WHERE (dp.type in ('S','G','U'))
        AND dp.name NOT LIKE '##%##'
        AND dp.name NOT LIKE 'NT AUTHORITY%'
        AND dp.name NOT LIKE 'NT SERVICE%'
        AND dp.name <> ('sa')
        AND dp.default_schema_name IS NOT NULL
        AND dp.name <> 'distributor_admin'
        AND dp.principal_id > 4
ORDER  BY dp.name


--   2
SELECT 'USE '+ DB_NAME()+'; '+CASE WHEN dp.state <> 'W' THEN dp.state_desc ELSE 'GRANT' END +' ' + 
        dp.permission_name + ' TO ' + QUOTENAME(dpg.name) COLLATE database_default + 
        CASE WHEN dp.state <> 'W' THEN '' ELSE ' WITH GRANT OPTION' END +';' AS [-- Permission To Be Assign to the User --]
FROM    sys.database_permissions AS dp
INNER JOIN sys.database_principals AS dpg ON dp.grantee_principal_id = dpg.principal_id
WHERE   dp.major_id = 0 AND dpg.principal_id > 4
        AND (dpg.type in ('S','G','U'))
        AND dpg.name NOT LIKE '##%##'
        AND dpg.name NOT LIKE 'NT AUTHORITY%'
        AND dpg.name NOT LIKE 'NT SERVICE%'
        AND dpg.name <> ('sa')
        AND dpg.default_schema_name IS NOT NULL
        AND dpg.name <> 'distributor_admin'
        AND dpg.principal_id > 4
ORDER BY dpg.name



--SELECT  'Create a new user and map it with login'

--SELECT 'CREATE USER [' + NAME + '] FOR LOGIN [' + NAME + ']' 
--FROM sys.database_principals
--WHERE	[Type] IN ('U','S')
--		AND 
--		[NAME] NOT IN ('dbo','guest','sys','INFORMATION_SCHEMA')
--ORDER BY NAME
--GO



--- Pt 2
-- SELECT 'Create User-Role Scrip'

SELECT 'EXEC sp_AddRoleMember ''' + DBRole.NAME + ''', ''' + DBP.NAME + '''' 
FROM sys.database_principals DBP
INNER JOIN sys.database_role_members DBM ON DBM.member_principal_id = DBP.principal_id
INNER JOIN sys.database_principals DBRole ON DBRole.principal_id = DBM.role_principal_id
WHERE DBP.NAME <> 'dbo'
ORDER BY DBP.NAME


--- Pt 3
--SELECT  'Object Level Permission'

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

--

use MASTER


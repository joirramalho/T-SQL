--25ago21

USE dbSigaSantaMadre;

WITH RoleMembers (member_principal_id, role_principal_id)    
AS  
( 
  SELECT  rm1.member_principal_id,  rm1.role_principal_id      
  FROM sys.database_role_members rm1 (NOLOCK)  
   UNION ALL  
  SELECT d.member_principal_id, rm.role_principal_id      
  FROM sys.database_role_members rm (NOLOCK)   
   INNER JOIN RoleMembers AS d     
   ON rm.member_principal_id = d.role_principal_id  
)  
select distinct rp.name as database_role, mp.name as database_userl  
from RoleMembers drm  
  join sys.database_principals rp on (drm.role_principal_id = rp.principal_id)  
  join sys.database_principals mp on (drm.member_principal_id = mp.principal_id)  
--  where rp.name = 'db_owner'  
order by rp.name

-- sp_droprolemember DATABASE
    -- exec sp_droprolemember 'db_owner', 'userEscolaIsrael';
    -- exec sp_droprolemember 'db_datareader', 'active.pollyana';
    -- exec sp_droprolemember 'db_datawriter', 'active.pollyana';
    -- exec sp_droprolemember 'db_accessadmin', 'active';


    
-- sp_addsrvrolemember SERVER ROLE
    -- EXEC sp_addsrvrolemember 'active.filipe', 'dbcreator'


-- sp_dropsrvrolemember SERVER ROLE
    -- EXEC sp_dropsrvrolemember 'active.wantuilson', 'sysadmin'
	-- EXEC sp_dropsrvrolemember 'active.filipe', 'sysadmin'





-- DROP USER from ROLE
    -- ALTER ROLE roleGPA DROP MEMBER [sigauser]


    -- REVOKE EXECUTE TO [active.pollyana];


-- Setar owner para role
    -- ALTER AUTHORIZATION ON ROLE::[roleGPA] TO [dbo];
    



-- Add usuário a Database role

    -- ALTER ROLE roleEEM ADD MEMBER [userELOEMM];

    --exec sp_addrolemember 'roleOperacaoRestore', 'active.teste'
	--exec sp_addrolemember 'roleEEM', 'userEloEMM';

	--ALTER ROLE roleOperacaoRestore ADD MEMBER [active.pinto]



--How to view the roles and permissions granted to any database user in SQL server instance?
--	https://stackoverflow.com/questions/31120912/how-to-view-the-roles-and-permissions-granted-to-any-database-user-in-azure-sql

--lists all permissions explicitly granted or denied to principals in the database you're connected to:
SELECT
	DISTINCT pr.principal_id,
	pr.name,
	pr.type_desc, 
	    pr.authentication_type_desc,
	pe.state_desc,
	pe.permission_name
FROM
	sys.database_principals AS pr
JOIN sys.database_permissions AS pe ON
	pe.grantee_principal_id = pr.principal_id;

--members of the database roles.
	SELECT
		DP1.name AS DatabaseRoleName,
		isnull (DP2.name,
		'No members') AS DatabaseUserName
	FROM
		sys.database_role_members AS DRM
	RIGHT OUTER JOIN sys.database_principals AS DP1  
		    ON
		DRM.role_principal_id = DP1.principal_id
	LEFT OUTER JOIN sys.database_principals AS DP2  
		    ON
		DRM.member_principal_id = DP2.principal_id
	WHERE
		DP1.type = 'R'
	ORDER BY
		DP1.name;

--explicit permissions have been granted on objects
SELECT
	DISTINCT pr.principal_id,
	pr.name AS [UserName],
	pr.type_desc AS [User_or_Role],
	pr.authentication_type_desc AS [Auth_Type],
	pe.state_desc,
	pe.permission_name,
	pe.class_desc,
	o.[name] AS 'Object'
FROM
	sys.database_principals AS pr
JOIN sys.database_permissions AS pe ON
	pe.grantee_principal_id = pr.principal_id
LEFT JOIN sys.objects AS o on
	(o.object_id = pe.major_id)
WHERE
	pr.NAME NOT IN ('PUBLIC', 'sigainternet')
ORDER By
	pr.name
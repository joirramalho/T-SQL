-- 31jul21 #sysadmin
-- 15out20

-- EXEC dbLogMonitor.dbo.sp_ServerName

SELECT [Login] = name
	,[Login Type] = type_desc
	,[Disabled] = is_disabled
FROM     master.sys.server_principals 
WHERE    IS_SRVROLEMEMBER ('sysadmin',name) = 1
ORDER BY [Login]


-- ;with ServerPermsAndRoles as
-- (
--     select spr.name as principal_name, spr.type_desc as principal_type, spm.permission_name collate SQL_Latin1_General_CP1_CI_AS as security_entity, 'permission' as security_type, spm.state_desc
--     from sys.server_principals spr
--     inner join sys.server_permissions spm on spr.principal_id = spm.grantee_principal_id
--     where spr.type in ('s', 'u')

--     union all

--     select sp.name as principal_name, sp.type_desc as principal_type, spr.name as security_entity, 'role membership' as security_type, null as state_desc
--     from sys.server_principals sp
--     inner join sys.server_role_members srm on sp.principal_id = srm.member_principal_id
--     inner join sys.server_principals spr on srm.role_principal_id = spr.principal_id
--     where sp.type in ('s', 'u')
-- )
-- select *
-- from ServerPermsAndRoles
-- WHERE security_entity = 'sysadmin'
-- order by principal_name
--24ago21
--17mai21 

USE dbSigaEnfermagemIsrael;

select DBPrincipal_2.name as role, DBPrincipal_1.name as owner 
from sys.database_principals as DBPrincipal_1 
inner join sys.database_principals as DBPrincipal_2 on DBPrincipal_1.principal_id = DBPrincipal_2.owning_principal_id 
-- where DBPrincipal_1.name = 'active.backup'



Use dbSigaCONFHICSaoJose;


-- sp_droprolemember DATABASE
    -- exec sp_droprolemember 'db_owner', 'userEscolaIsrael';
    -- exec sp_droprolemember 'db_datareader', 'active.pollyana';
    -- exec sp_droprolemember 'db_datawriter', 'active.pollyana';
    -- exec sp_droprolemember 'db_accessadmin', 'active';
    
-- sp_dropsrvrolemember SERVER ROLE
    -- EXEC sp_dropsrvrolemember 'active.wantuilson', 'sysadmin'

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



-- ALTER AUTHORIZATION ON SCHEMA::[db_owner] TO [db_owner];
-- ALTER AUTHORIZATION ON SCHEMA::[db_datareader] TO [db_datareader];
-- ALTER AUTHORIZATION ON SCHEMA::[db_accessadmin] TO [db_accessadmin];



-- GRANT EXECUTE ON OBJECT::FnAnoMes TO [active.filipe]

-- GRANT EXECUTE ON OBJECT::sp_DesmascararBanco TO [active.pinto]

-- GRANT EXECUTE ON OBJECT::sp_restore TO [roleDesmascararDados]



-- REVOKE EXECUTE ON OBJECT::sp_restore FROM [active.pinto]

-- REVOKE EXECUTE ON OBJECT::sp_DesmascararBanco FROM [active.pinto]

-- REVOKE ALL ON dbo.MyObject TO MyUser
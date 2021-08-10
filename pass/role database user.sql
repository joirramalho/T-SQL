-- VERSION 1.01 17mai21 - ALTER ROLE roleOperacaoRestore ADD MEMBER [active.pinto]

USE dbLogRestore;

SELECT DB_NAME()

select DBPrincipal_2.name as role, DBPrincipal_1.name as owner 
from sys.database_principals as DBPrincipal_1 
inner join sys.database_principals as DBPrincipal_2 on DBPrincipal_1.principal_id = DBPrincipal_2.owning_principal_id 
-- where DBPrincipal_1.name = 'active.backup'


-- Setar owner para role
    -- ALTER AUTHORIZATION ON ROLE::[roleGPA] TO [dbo];
    


-- Adicionar usuário a Database role

    -- ALTER ROLE roleOperacaoRestore ADD MEMBER [active.pinto]

    -- exec sp_addrolemember 'roleOperacaoRestore', 'active.teste'


-- DROP USER from ROLE
    -- ALTER ROLE roleGPA DROP MEMBER [sigauser]



-- GRANT EXECUTE ON OBJECT::FnAnoMes TO [active.filipe]


-- Remover permissão de um usuário ou ROLE?

    -- GRANT EXECUTE ON OBJECT::sp_DesmascararBanco TO [active.pinto]

    -- GRANT EXECUTE ON OBJECT::sp_restore TO [roleDesmascararDados]



-- REVOKE EXECUTE ON OBJECT::sp_restore FROM [active.pinto]

-- REVOKE EXECUTE ON OBJECT::sp_DesmascararBanco FROM [active.pinto]

-- REVOKE ALL ON dbo.MyObject TO MyUser
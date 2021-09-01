-- 18mai21 - dbSigaSalePetrolina_Arquivo0X

-- P@ssw0rd


-- CREATE LOGIN
	-- CREATE LOGIN [active.luan] 	WITH PASSWORD=N'*****', DEFAULT_DATABASE=[dbSigaFACHO], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF;

--USE CRM_290223;

-- CREATE USER 	[active.filipe] 	FOR LOGIN [active.filipe] WITH DEFAULT_SCHEMA=[dbo]; -- active.wantuilson
	-- ALTER LOGIN 	[userSaleJuvenal] 	WITH  DEFAULT_DATABASE=[dbSigaSaleJuvenal];
	-- GRANT CONNECT  TO [active.filipe];


--ROLE
--ALTER ROLE [db_datareader] ADD MEMBER [active.marley];
--ALTER ROLE [db_datawriter] ADD MEMBER [active.marley];
--GRANT EXECUTE TO [active.marley]; -- wantuilson

-- ALTER ROLE [db_owner] ADD MEMBER [userEducativo];

-- ALTER ROLE roleEEM ADD MEMBER [userEloEEM];


--ALTER ROLE [db_ddladmin] ADD MEMBER [active.marley];



-- LAB4 
	-- USE dbLogRestore;
	-- CREATE USER...
	-- EXEC sp_addrolemember N'roleOperacaoRestore', N'active.joao'
	-- EXEC sp_addrolemember N'roleDesmascararDados', N'active.joao'

 
-- PASSWORD
-- ALTER LOGIN [active.jader] 	WITH PASSWORD = '***'; -- sigainternet userISO_PowerBI service.account


-- HASHED
	-- ALTER LOGIN [userCognitivoEEM] WITH   PASSWORD = ... HASHED;
	-- ALTER LOGIN [userCognitivoGPA] WITH   PASSWORD = ... HASHED;



-- DROP LOGIn [userEloEMM];
-- DROP USER [userELOEMM];


-- sp_change_users_login
	-- EXEC sp_change_users_login 'Update_one', 'userEloEEM', 'userEloEEM';
	-- EXEC sp_change_users_login 'Auto_Fix', 'userEloEEM', NULL, '*****';



--    ALTER LOGIN [userCognitivoGPA]
--    WITH PASSWORD = 'zd',
--    CHECK_EXPIRATION = OFF,
--    CHECK_POLICY = OFF;


-- User_MUST_CHANGE_password
    -- ALTER LOGIN [active.mislainy]
    -- WITH PASSWORD = '45DX$02' MUST_CHANGE,
    -- CHECK_EXPIRATION = ON,
    -- CHECK_POLICY = ON;

    -- Regras do Windows 10
    -- https://docs.microsoft.com/pt-br/sql/relational-databases/security/strong-passwords?view=sql-server-2017
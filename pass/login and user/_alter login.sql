-- 18mai21 - dbSigaSalePetrolina_Arquivo0X

-- P@ssw0rd

--USE dbSigaELO;

-- CREATE LOGIN [userEloEEM] WITH PASSWORD=N'userEloEEM.', DEFAULT_DATABASE=[dbSigaELO], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF;

-- CREATE USER [active.kezio] FOR LOGIN [active.kezio] WITH DEFAULT_SCHEMA=[dbo]; -- active.wantuilson

-- ALTER LOGIN [userEloEEM2] WITH  DEFAULT_DATABASE=[dbSigaELO];

-- GRANT CONNECT  TO [active.andrielson];

-- ALTER ROLE [db_owner] ADD MEMBER [userAuxilRecife];
-- ALTER ROLE roleEEM ADD MEMBER [userEloEEM];


ALTER ROLE [db_datareader] ADD MEMBER [active.ewerton];
ALTER ROLE [db_datawriter] ADD MEMBER [active.ewerton];
GRANT EXECUTE TO [active.ewerton]; -- wantuilson


--LAB4 
--USE dbLogRestore;
--CREATE USER...
--EXEC sp_addrolemember N'roleOperacaoRestore', N'active.kezio'
--EXEC sp_addrolemember N'roleDesmascararDados', N'active.kezio'

 
--ALTER LOGIN [userEloEEM] 	WITH PASSWORD = '***'; -- sigainternet userISO_PowerBI service.account


-- HASHED
-- ALTER LOGIN [userCognitivoEEM] WITH   PASSWORD = ... HASHED;
-- ALTER LOGIN [userCognitivoGPA] WITH   PASSWORD = ... HASHED;



DROP LOGIn [userEloEMM];
DROP USER [userELOEMM];


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
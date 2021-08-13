-- VERSION 1.01 - 09mai21

-- EXEC dbLogMonitor.dbo.sp_Where

-- P@ssw0rd

-- ALTER LOGIN [sigainternet] WITH PASSWORD = '***' 

-- ALTER LOGIN [userISO_PowerBI] WITH PASSWORD = '****'


-- ALTER LOGIN [active.joir] WITH PASSWORD = '***'

-- ALTER LOGIN [service.account] WITH PASSWORD = '***' 

-- ALTER LOGIN [sigainternet] WITH PASSWORD = '****'




-- USE dbSigaISO;
-- EXEC sp_change_users_login 'Auto_Fix', 'dbSigaDiocBeloJardim', NULL, '***';
-- EXEC sp_change_users_login 'Auto_Fix', 'userCognitivoGPA', NULL, '';



-- ALTER LOGIN [userCognitivoEEM] WITH   PASSWORD = ... HASHED;
-- ALTER LOGIN [userCognitivoGPA] WITH   PASSWORD = ... HASHED;


    ALTER LOGIN [userCognitivoGPA]
    WITH PASSWORD = 'zd',
    CHECK_EXPIRATION = OFF,
    CHECK_POLICY = OFF;


-- User_MUST_CHANGE_password

    -- ALTER LOGIN [active.mislainy]
    -- WITH PASSWORD = '45DX$02' MUST_CHANGE,
    -- CHECK_EXPIRATION = ON,
    -- CHECK_POLICY = ON;

    -- Regras do Windows 10
    -- https://docs.microsoft.com/pt-br/sql/relational-databases/security/strong-passwords?view=sql-server-2017
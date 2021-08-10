-- LOGIN com SENHA expirada - sisController 
    -- https://sqlstudies.com/2019/06/05/how-do-i-force-a-sql-login-to-change-its-password-on-next-login/
    
    -- VERSION 1.00 19Out20

    -- DROP USER  [active.123];
    -- DROP LOGIN  [active.123];

    SELECT 'ALTER LOGIN ' + quotename(name) + ' WITH CHECK_EXPIRATION = OFF'
    FROM sys.server_principals
    WHERE LOGINPROPERTY(name,'IsMustChange') = 0
    AND LOGINPROPERTY(name,'DaysUntilExpiration') IS NOT NULL;


    -- CREATE LOGIN expired
        -- CREATE LOGIN [active.123] WITH PASSWORD ='P@ssw0rd' MUST_CHANGE, DEFAULT_DATABASE=[master], CHECK_EXPIRATION = ON;
        -- CREATE USER [active.123] FOR LOGIN [active.123] WITH DEFAULT_SCHEMA=[dbo];


    -- CLIENTE NAO consegue alterar a senha e desligar expiração
        -- ALTER LOGIN [active.123]   WITH PASSWORD = 'P@ssw0rd.', CHECK_EXPIRATION = OFF;

    -- CLIENTE ALTERA SENHA primeiro logon

    -- JOB  DISABLE  a expiração



-- JOB set CHECK_EXPIRATION = OFF
    -- DECLARE @Login  VARCHAR(64);
        
    -- SELECT TOP 1 @Login = name
    -- FROM sys.server_principals
    -- WHERE LOGINPROPERTY(name,'IsMustChange') = 0
    --     AND LOGINPROPERTY(name,'DaysUntilExpiration') IS NOT NULL;

    -- EXEC( 'ALTER LOGIN [' + @Login + '] WITH CHECK_EXPIRATION = OFF')


-- EXECUTE
    -- SpFreqEfetuarMarcacao
    -- SpFreqEfetuarMarcacao2
-- SELECT    
    -- VwFreqConsulta_Alunos
    -- VwFreqConsulta_Responsaveis
    -- VwFreqConsulta_AlunosResponsaveis
    -- VwFreqConsulta_Enturmacao
    -- VwFreqMarcacao
    -- VwFreqConsulta_Turmas
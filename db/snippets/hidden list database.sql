--https://www.dirceuresende.com/blog/sql-server-como-ocultar-os-databases-para-usuarios-nao-autorizados/


--https://docs.microsoft.com/en-us/answers/questions/221178/how-do-i-grant-view-permissions-so-a-sql-login-can.html

--13mai22
	--https://www.mssqltips.com/sqlservertip/6836/sql-alter-authorization-examples/

-- Banco para POwerBI com Databases Hidden

-- use dbLogRestore
-- DROP LOGIN [teste]

-- ALTER LOGIN teste ENABLE;

-- EXEC dbo.sp_helprotect @username = 'teste'



-- MArley
-- GRANT VIEW ANY DATABASE TO PUBLIC


-- HIDDEN ALL USER DATABASES
    -- USE master
    -- DENY VIEW ANY DATABASE TO teste 



-- HIDDEN ALL DEFINITIONs -- TRIGGERS -- PROCEDURES
-- USE master 
-- REVOKE VIEW ANY DEFINITION TO teste    
-- REVOKE VIEW ANY DEFINITION TO PUBLIC

USE dbSigaModelo
    CREATE USER [teste] FOR LOGIN [teste] WITH DEFAULT_SCHEMA=[dbo]

    -- ALTER ROLE [db_datareader] ADD MEMBER [teste]

-- List Databases
    -- exec sp_helpdb 


-- VIEW TRIGGER OU storedProcName
    -- USE dbSigaModelo
    -- EXEC  dbo.sp_HelpText 'TgLancamentoCobrancaDescontoValidar' 


-- OUTROS

-- ALTER OWNER OF DATABASE 
    -- ALTER AUTHORIZATION ON DATABASE::[dbSigaModelo] TO [NT SERVICE\SQLSERVERAGENT]; 
    

    
    -----16mai22
    
    SELECT 
    A.[name],
    A.[sid],
    A.[type_desc],
    A.is_disabled,
    B.[permission_name],
    B.state_desc
FROM
    sys.server_principals A
    JOIN sys.server_permissions B ON A.principal_id = B.grantee_principal_id
WHERE
    B.[permission_name] = 'VIEW ANY DATABASE'
    AND B.[state] IN ('G', 'W')
    
    
 --USE [master]
--GO
--CREATE LOGIN [userAslan] WITH PASSWORD=N'RWW39uGkM6', DEFAULT_DATABASE=[dbSigaAslan], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
--CREATE LOGIN [userAslan_ReportServer] WITH PASSWORD=N'RWX39uGxM6', DEFAULT_DATABASE=[dbSigaAslan], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
--GO
    

    
--CREATE DATABASE dbTeste
--CREATE DATABASE dbTeste2
    
    
--REVOKE VIEW ANY DATABASE FROM [public]
	--REVOKE VIEW ANY DATABASE FROM [teste]
--GO

    
SELECT name as [DB Name],
    suser_sname(owner_sid) as [Owner] 
FROM sys.databases
    
    
USE [dbSigaAslan]

	--CREATE USER [userAslan_ReportServer] FOR LOGIN [userAslan_ReportServer]
	
	--ALTER ROLE [db_datareader] ADD MEMBER [userAslan_ReportServer]

		--DROP USER [userAslan_ReportServer];
		--exec sp_droprolemember 'db_datareader', 'userAslan_ReportServer';


	ALTER AUTHORIZATION ON DATABASE::dbSigaAslan TO [userAslan_ReportServer];



SELECT *
FROM sys.database_permissions
WHERE grantee_principal_id = USER_ID('userAslan_ReportServer')

--https://www.dirceuresende.com/blog/sql-server-como-ocultar-os-databases-para-usuarios-nao-autorizados/

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
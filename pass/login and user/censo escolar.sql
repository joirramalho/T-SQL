-- 31mai21 SQL05

-- CREATE LOGIN [active.filipe] WITH PASSWORD=N'......', DEFAULT_DATABASE=[master], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF


-- USE dbSigaSEMIbatista;

-- CREATE USER [active.filipe] FOR LOGIN [active.filipe] WITH DEFAULT_SCHEMA=[dbo]

-- ALTER ROLE [db_datareader] ADD MEMBER [active.filipe]
-- GRANT EXECUTE ON OBJECT::FnExtrairNumeroToString TO [active.filipe]

-- EXEC sp_change_users_login 'Update_one', 'active.filipe', 'active.filipe';


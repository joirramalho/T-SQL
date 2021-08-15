-- EXEC dbLogMonitor.dbo.sp_where

-- ALTER LOGIN [active.joir] WITH PASSWORD = '*****' 

-- CREATE LOGIN [active.anderson] WITH PASSWORD=N'******', DEFAULT_DATABASE=[master], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF

SELECT 1
EXEC master..sp_addsrvrolemember @loginame = [active.anderson], @rolename = N'sysadmin';


-- EXEC master..sp_addsrvrolemember @loginame = [active.pinto], @rolename = N'sysadmin';

-- EXEC master..sp_dropsrvrolemember @loginame = [userCELogos], @rolename = N'sysadmin';

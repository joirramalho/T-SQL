-- EXEC dbLogMonitor.dbo.sp_ServerName

CREATE LOGIN [userRestauraBancoVPS] WITH PASSWORD=N'*****', DEFAULT_DATABASE=[master], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF;

CREATE USER [userRestauraBancoVPS] FOR LOGIN [userRestauraBancoVPS] WITH DEFAULT_SCHEMA=[dbo];

EXEC master..sp_addsrvrolemember @loginame = N'userRestauraBancoVPS', @rolename = N'sysadmin';

-- VERSION 1.01 - 18mai21 - dbSigaSalePetrolina_Arquivo0X

-- CREATE LOGIN [userFACHO] WITH PASSWORD=N'****', DEFAULT_DATABASE=[dbSigaFACHO], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF

USE CRM_286342; -- xp_readerorlog

-- CREATE USER [active.ewerton] FOR LOGIN [active.ewerton] WITH DEFAULT_SCHEMA=[dbo]; -- active.wantuilson

-- ALTER LOGIN [active.suelio] WITH  DEFAULT_DATABASE=[dbLogRestore];

-- GRANT CONNECT  TO [sigainternet];


--ALTER ROLE [db_owner] ADD MEMBER [suporte.ewerton];



ALTER ROLE [db_datareader] ADD MEMBER [active.ewerton];
ALTER ROLE [db_datawriter] ADD MEMBER [active.ewerton];
GRANT EXECUTE TO [active.ewerton]; -- wantuilson


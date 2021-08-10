-- VERSION 1.01 - 18mai21 - dbSigaSalePetrolina_Arquivo0X

-- CREATE LOGIN [userFACHO] WITH PASSWORD=N'****', DEFAULT_DATABASE=[dbSigaFACHO], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF

USE CRM_276942_30jun; -- xp_readerorlog

-- CREATE USER [active.suelio] FOR LOGIN [active.suelio] WITH DEFAULT_SCHEMA=[dbo]; -- active.wantuilson

-- ALTER LOGIN [active.suelio] WITH  DEFAULT_DATABASE=[dbLogRestore];

-- GRANT CONNECT  TO [active.suelio];


ALTER ROLE [db_owner] ADD MEMBER [active.suelio];




            -- ALTER ROLE [db_datareader] ADD MEMBER [active.filipe]
            -- ALTER ROLE [db_datawriter] ADD MEMBER [active.filipe]
            -- GRANT EXECUTE TO [active.filipe]; -- wantuilson


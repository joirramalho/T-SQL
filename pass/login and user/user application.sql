-- 18mai21 - dbSigaSalePetrolina_Arquivo0X

-- CREATE LOGIN [userAuxilRecife] WITH PASSWORD=N'Yc28x9WBGp', DEFAULT_DATABASE=[dbSigaAuxilRecife], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF

USE dbBibAuxilRecife; -- xp_readerorlog

SELECT DB_NAME()

-- CREATE USER [userAuxilRecife] FOR LOGIN [userAuxilRecife] WITH DEFAULT_SCHEMA=[dbo]; -- active.wantuilson

-- ALTER LOGIN [userAuxilRecife] WITH  DEFAULT_DATABASE=[dbSigaAuxilRecife];

-- GRANT CONNECT  TO [sigainternet];


--ALTER ROLE [db_owner] ADD MEMBER [userAuxilRecife];



ALTER ROLE [db_datareader] ADD MEMBER [active.ewerton];
ALTER ROLE [db_datawriter] ADD MEMBER [active.ewerton];
GRANT EXECUTE TO [active.ewerton]; -- wantuilson


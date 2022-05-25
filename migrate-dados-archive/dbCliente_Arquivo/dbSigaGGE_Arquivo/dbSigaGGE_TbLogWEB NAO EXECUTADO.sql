--07jan22

-- use dbSigaGGE

-- SELECT YEAR(DAtaHora), COUNT(*) FROM dbSigaGGE.dbo.TbLogWEB    GROUP by YEAR(DAtaHora)
-- SELECT YEAR(DAtaHora), COUNT(*) FROM dbSigaGGE_Arquivo.dbo.TbLogWEB    GROUP by YEAR(DAtaHora)

    -- CREATE DATABASE dbSigaGGE_Arquivo

--
-- CREATE DATABASE dbSigaNeves_Arquivo

USE dbSigaGGE_Arquivo

SELECT DB_NAME()

-- Create a new user and map it with login
CREATE USER [sigainternet] FOR LOGIN [sigainternet];
CREATE USER [userGGE] FOR LOGIN [userGGE];


-- Create User-Role Scrip
EXEC sp_AddRoleMember 'db_datareader', 'userGGE'


-- Database Level Permission
GRANT CONNECT  TO [sigainternet];
GRANT CONNECT  TO [userGGE];

--

USE dbSigaGGE_Arquivo

SELECT DB_NAME()


-- Object Level Permission
GRANT SELECT ON [dbo].[TbLogWEB] TO [sigainternet];



-- CRIA TABELA DESTINO
SELECT * INTO dbSigaGGE_Arquivo.dbo.TbLogWEB
    FROM dbSigaGGE.dbo.TbLogWEB WHERE YEAR(DAtaHora) = 2017


EXEC sp_help 'TbLogWEB'


-- SELECT COLUMN_NAME
-- FROM INFORMATION_SCHEMA.COLUMNS
-- WHERE TABLE_NAME = 'TbLogWEB' --AND TABLE_SCHEMA='YourSchemaName'


DECLARE @sql nvarchar(max) = N'';
 
SELECT @sql += COLUMN_NAME + ', ' 
  FROM INFORMATION_SCHEMA.COLUMNS AS d 
  WHERE TABLE_NAME = 'TbLogWEB'  

SELECT DatabaseCount = @@ROWCOUNT, cmd = @sql;



SET IDENTITY_INSERT dbSigaGGE_Arquivo.dbo.TbLogWEB ON;

INSERT INTO dbSigaGGE_Arquivo.dbo.TbLogWEB ( IdLogWeb, SessionId, DataHora, IPHost, SistemaOperacional, Arquivo, IdUsuario, TitpoUsuario, Acao, ParametroInt_1, ParametroInt_2, ParametroInt_3, ParametroStr  )
        SELECT IdLogWeb, SessionId, DataHora, IPHost, SistemaOperacional, Arquivo, IdUsuario, TitpoUsuario, Acao, ParametroInt_1, ParametroInt_2, ParametroInt_3, ParametroStr    FROM dbSigaGGE.dbo.TbLogWEB WHERE YEAR(DataHora) = 2019



SELECT YEAR(DATAHORA), COUNT(*)
  FROM [dbSigaGGE].[dbo].[TbLogWEB]
  GROUP BY YEAR(DATAHORA)


  SELECT YEAR(DATAHORA), COUNT(*)
  FROM [dbSigaGGE_Arquivo].[dbo].[TbLogWEB]
  GROUP BY YEAR(DATAHORA)



-- DECLARE @BatchSize INT = 10000

-- WHILE 1 = 1
-- BEGIN
-- 	DELETE TOP (@BatchSize)
-- 	FROM [dbSigaGGE].[dbo].[TbLogWEB]
-- 	where YEAR(DAtaHora) = 2020 --AND month( CreatedAt ) = 2 --AND revokedAt IS NOT NULL
 
-- 	IF @@ROWCOUNT < @BatchSize BREAK
-- END

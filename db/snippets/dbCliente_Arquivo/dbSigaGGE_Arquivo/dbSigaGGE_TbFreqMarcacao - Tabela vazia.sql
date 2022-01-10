--07jan22

-- use dbSigaGGE

-- SELECT YEAR(DataMarcacao), COUNT(*) FROM dbSigaGGE.dbo.TbFreqMarcacao    GROUP by YEAR(DAtaHora)
-- SELECT YEAR(DataMarcacao), COUNT(*) FROM dbSigaGGE_Arquivo.dbo.TbFreqMarcacao    GROUP by YEAR(DAtaHora)

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
GRANT SELECT ON [dbo].[TbFreqMarcacao] TO [sigainternet];



-- CRIA TABELA DESTINO
SELECT * INTO dbSigaGGE_Arquivo.dbo.TbFreqMarcacao
    FROM dbSigaGGE.dbo.TbFreqMarcacao WHERE YEAR(DAtaHora) = 2017


EXEC sp_help 'TbFreqMarcacao'


-- SELECT COLUMN_NAME
-- FROM INFORMATION_SCHEMA.COLUMNS
-- WHERE TABLE_NAME = 'TbFreqMarcacao' --AND TABLE_SCHEMA='YourSchemaName'


DECLARE @sql nvarchar(max) = N'';
 
SELECT @sql += COLUMN_NAME + ', ' 
  FROM INFORMATION_SCHEMA.COLUMNS AS d 
  WHERE TABLE_NAME = 'TbFreqMarcacao'  

SELECT DatabaseCount = @@ROWCOUNT, cmd = @sql;



SET IDENTITY_INSERT dbSigaGGE_Arquivo.dbo.TbFreqMarcacao ON;

INSERT INTO dbSigaGGE_Arquivo.dbo.TbFreqMarcacao ( IdMarcacao, DataMarcacao, IdPessoa, IdColetorEntrada, HoraEntrada, ComentarioEntrada, IdColetorSaida, HoraSaida, IdResponsavelSaida, ComentarioSaida, TipoPessoa, StMarcacaoEntrada, StMarcacaoSaida )
        SELECT IdMarcacao, DataMarcacao, IdPessoa, IdColetorEntrada, HoraEntrada, ComentarioEntrada, IdColetorSaida, HoraSaida, IdResponsavelSaida, ComentarioSaida, TipoPessoa, StMarcacaoEntrada, StMarcacaoSaida    FROM dbSigaGGE.dbo.TbFreqMarcacao WHERE YEAR(DataMarcacao) = 2019



SELECT YEAR(DataMarcacao), COUNT(*)
  FROM [dbSigaGGE].[dbo].[TbFreqMarcacao]
  GROUP BY YEAR(DataMarcacao)


  SELECT YEAR(DataMarcacao), COUNT(*)
  FROM [dbSigaGGE_Arquivo].[dbo].[TbFreqMarcacao]
  GROUP BY YEAR(DataMarcacao)



-- DECLARE @BatchSize INT = 10000

-- WHILE 1 = 1
-- BEGIN
-- 	DELETE TOP (@BatchSize)
-- 	FROM [dbSigaGGE].[dbo].[TbFreqMarcacao]
-- 	where YEAR(DAtaHora) = 2020 --AND month( CreatedAt ) = 2 --AND revokedAt IS NOT NULL
 
-- 	IF @@ROWCOUNT < @BatchSize BREAK
-- END

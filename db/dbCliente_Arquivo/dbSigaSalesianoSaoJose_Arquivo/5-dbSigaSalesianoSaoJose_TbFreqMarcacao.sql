SELECT  COUNT(*) FROM dbSigaSalesianoSaoJose_Arquivo05.dbo.TbFreqMarcacao;
--SELECT  COUNT(*) FROM dbSigaSalesianoSaoJose_Arquivo04.dbo.TbFreqMarcacao;
--SELECT  COUNT(*) FROM dbSigaSalesianoSaoJose_Arquivo03.dbo.TbFreqMarcacao;
--SELECT  COUNT(*) FROM dbSigaSalesianoSaoJose_Arquivo02.dbo.TbFreqMarcacao;
--SELECT  COUNT(*) FROM dbSigaSalesianoSaoJose_Arquivo01.dbo.TbFreqMarcacao;


SELECT  COUNT(*) FROM dbSigaSalesianoSaoJose.dbo.TbFreqMarcacao -- 914502


SELECT YEAR(DataMarcacao), COUNT(*)
  FROM [dbSigaSalesianoSaoJose].[dbo].[TbFreqMarcacao]
  GROUP BY YEAR(DataMarcacao)


  SELECT YEAR(DataMarcacao), COUNT(*)
  FROM [dbSigaSalesianoSaoJose_Arquivo].[dbo].[TbFreqMarcacao]
  GROUP BY YEAR(DataMarcacao)


USE dbSigaSalesianoSaoJose_Arquivo;


-- CRIA TABELA DESTINO
SELECT * INTO dbSigaSalesianoSaoJose_Arquivo.dbo.TbFreqMarcacao
    FROM dbSigaSalesianoSaoJose.dbo.TbFreqMarcacao WHERE YEAR(DataMarcacao) <= 2015


EXEC sp_help 'TbFreqMarcacao'


-- SELECT COLUMN_NAME
-- FROM INFORMATION_SCHEMA.COLUMNS
-- WHERE TABLE_NAME = 'TbFreqMarcacao' --AND TABLE_SCHEMA='YourSchemaName'


DECLARE @sql nvarchar(max) = N'';
 
SELECT @sql += COLUMN_NAME + ', ' 
  FROM INFORMATION_SCHEMA.COLUMNS AS d 
  WHERE TABLE_NAME = 'TbFreqMarcacao'  

SELECT DatabaseCount = @@ROWCOUNT, cmd = @sql;


SET IDENTITY_INSERT dbSigaSalesianoSaoJose_Arquivo.dbo.TbFreqMarcacao ON;

INSERT INTO dbSigaSalesianoSaoJose_Arquivo.dbo.TbFreqMarcacao ( IdMarcacao, DataMarcacao, IdPessoa, IdColetorEntrada, HoraEntrada, ComentarioEntrada, IdColetorSaida, HoraSaida, IdResponsavelSaida, ComentarioSaida, TipoPessoa, StMarcacaoEntrada, StMarcacaoSaida )
        SELECT IdMarcacao, DataMarcacao, IdPessoa, IdColetorEntrada, HoraEntrada, ComentarioEntrada, IdColetorSaida, HoraSaida, IdResponsavelSaida, ComentarioSaida, TipoPessoa, StMarcacaoEntrada, StMarcacaoSaida    
        	FROM dbSigaSalesianoSaoJose_Arquivo05.dbo.TbFreqMarcacao



SET IDENTITY_INSERT dbSigaSalesianoSaoJose_Arquivo.dbo.TbFreqMarcacao ON;

INSERT INTO dbSigaSalesianoSaoJose_Arquivo.dbo.TbFreqMarcacao ( IdMarcacao, DataMarcacao, IdPessoa, IdColetorEntrada, HoraEntrada, ComentarioEntrada, IdColetorSaida, HoraSaida, IdResponsavelSaida, ComentarioSaida, TipoPessoa, StMarcacaoEntrada, StMarcacaoSaida )
        SELECT IdMarcacao, DataMarcacao, IdPessoa, IdColetorEntrada, HoraEntrada, ComentarioEntrada, IdColetorSaida, HoraSaida, IdResponsavelSaida, ComentarioSaida, TipoPessoa, StMarcacaoEntrada, StMarcacaoSaida    
        	FROM dbSigaSalesianoSaoJose.dbo.TbFreqMarcacao WHERE YEAR(DataMarcacao) <= 2020

        
        


DECLARE @BatchSize INT = 5000

WHILE 1 = 1
BEGIN
	DELETE TOP (@BatchSize)
	FROM dbSigaSalesianoSaoJose.dbo.TbFreqMarcacao
	where YEAR(DataMarcacao) <= 2020
 
	IF @@ROWCOUNT < @BatchSize BREAK
END
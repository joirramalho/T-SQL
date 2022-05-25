-- SELECT  COUNT(*) FROM dbSigaSalesianoSaoJose_Arquivo05.dbo.TbSituacaoAlunoDisciplina_Auditoria -- 0
-- SELECT  COUNT(*) FROM dbSigaSalesianoSaoJose_Arquivo04.dbo.TbSituacaoAlunoDisciplina_Auditoria -- 0
-- SELECT  COUNT(*) FROM dbSigaSalesianoSaoJose_Arquivo03.dbo.TbSituacaoAlunoDisciplina_Auditoria -- 0
-- SELECT  COUNT(*) FROM dbSigaSalesianoSaoJose_Arquivo02.dbo.TbSituacaoAlunoDisciplina_Auditoria -- 0
-- SELECT  COUNT(*) FROM dbSigaSalesianoSaoJose_Arquivo01.dbo.TbSituacaoAlunoDisciplina_Auditoria -- 0

SELECT  COUNT(*) FROM dbSigaSalesianoSaoJose.dbo.TbSituacaoAlunoDisciplina_Auditoria -- TOTAL 

SELECT  COUNT(*) FROM dbSigaSalesianoSaoJose_Arquivo.dbo.TbSituacaoAlunoDisciplina_Auditoria -- TOTAL

  SELECT YEAR(DataHora), COUNT(*)
  FROM [dbSigaSalesianoSaoJose].[dbo].[TbSituacaoAlunoDisciplina_Auditoria]
  GROUP BY YEAR(DataHora)

  SELECT YEAR(DataHora), COUNT(*)
  FROM [dbSigaSalesianoSaoJose_Arquivo].[dbo].[TbSituacaoAlunoDisciplina_Auditoria]
  GROUP BY YEAR(DataHora)



USE dbSigaSalesianoSaoJose_Arquivo

-- CRIA TABELA DESTINO
SELECT * INTO dbSigaSalesianoSaoJose_Arquivo.dbo.TbSituacaoAlunoDisciplina_Auditoria
    FROM dbSigaSalesianoSaoJose.dbo.TbSituacaoAlunoDisciplina_Auditoria
    WHERE YEAR(DataHora) <= 2020


EXEC sp_help 'TbSituacaoAlunoDisciplina_Auditoria'


-- SET IDENTITY_INSERT TbSituacaoAlunoDisciplina_Auditoria ON;

-- INSERT INTO TbSituacaoAlunoDisciplina_Auditoria ( IdLogWeb, SessionId, DataHora, IPHost, SistemaOperacional, Arquivo, IdUsuario, TitpoUsuario, Acao, ParametroInt_1, ParametroInt_2, ParametroInt_3, ParametroStr )
--         SELECT IdLogWeb, SessionId, DataHora, IPHost, SistemaOperacional, Arquivo, IdUsuario, TitpoUsuario, Acao, ParametroInt_1, ParametroInt_2, ParametroInt_3, ParametroStr  
--             FROM dbSigaSalesianoSaoJose_Arquivo01.dbo.TbSituacaoAlunoDisciplina_Auditoria


DECLARE @BatchSize INT = 5000

WHILE 1 = 1
BEGIN
	DELETE TOP (@BatchSize)
	FROM dbSigaSalesianoSaoJose.dbo.TbSituacaoAlunoDisciplina_Auditoria
	where YEAR(DataHora) <= 2020
 
	IF @@ROWCOUNT < @BatchSize BREAK
END
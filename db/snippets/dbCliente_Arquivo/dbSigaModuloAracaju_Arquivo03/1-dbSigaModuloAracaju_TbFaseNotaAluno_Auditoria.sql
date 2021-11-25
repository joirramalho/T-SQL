-- SELECT  COUNT(*) FROM dbSigaSalesianoSaoJose_Arquivo05.dbo.TbFaseNotaAluno_Auditoria
-- SELECT  COUNT(*) FROM dbSigaSalesianoSaoJose_Arquivo04.dbo.TbFaseNotaAluno_Auditoria
-- SELECT  COUNT(*) FROM dbSigaSalesianoSaoJose_Arquivo03.dbo.TbFaseNotaAluno_Auditoria
-- SELECT  COUNT(*) FROM dbSigaSalesianoSaoJose_Arquivo02.dbo.TbFaseNotaAluno_Auditoria
-- SELECT  COUNT(*) FROM dbSigaSalesianoSaoJose_Arquivo01.dbo.TbFaseNotaAluno_Auditoria
--
  SELECT YEAR(DataHora), COUNT(*)
  FROM [dbSigaModuloAracaju].[dbo].[TbFaseNotaAluno_Auditoria]
  GROUP BY YEAR(DataHora)

  SELECT YEAR(DataHora), COUNT(*)
  FROM [dbSigaModuloAracaju_Arquivo03].[dbo].[TbFaseNotaAluno_Auditoria]
  GROUP BY YEAR(DataHora)


USE dbSigaModuloAracaju_Arquivo03

SELECT DB_NAME()

-- CRIA TABELA DESTINO -- 185413
SELECT * INTO dbSigaModuloAracaju_Arquivo03.dbo.TbFaseNotaAluno_Auditoria
    FROM dbSigaModuloAracaju.dbo.TbFaseNotaAluno_Auditoria
        WHERE YEAR(DataHora) <= 2020



EXEC sp_help 'TbFaseNotaAluno_Auditoria'


-- SET IDENTITY_INSERT TbFaseNotaAluno_Auditoria ON;

-- INSERT INTO TbFaseNotaAluno_Auditoria ( Tabela, IdUsuario, Operacao, DataHora, ValorChave1, ValorChave2, ValorChave3, ValorChave4, ValorChave5, DescricaoOperacao, IdAuditoria )
--         SELECT Tabela, IdUsuario, Operacao, DataHora, ValorChave1, ValorChave2, ValorChave3, ValorChave4, ValorChave5, DescricaoOperacao, IdAuditoria
--             FROM dbSigaSalesianoSaoJose_Arquivo07.dbo.TbFaseNotaAluno_Auditoria


DECLARE @BatchSize INT = 2500

WHILE 1 = 1
BEGIN
	DELETE TOP (@BatchSize)
	FROM dbSigaModuloAracaju.dbo.TbFaseNotaAluno_Auditoria
	where YEAR(DataHora) <= 2020
 
	IF @@ROWCOUNT < @BatchSize BREAK
END
  SELECT YEAR(DataAtualizacao), COUNT(*)
  FROM [dbSigaModuloAracaju].[dbo].[TbAlunoTurmaProcedimentoMatriculaHistorico]
  GROUP BY YEAR(DataAtualizacao)

  SELECT YEAR(DataAtualizacao), COUNT(*)
  FROM [dbSigaModuloAracaju_Arquivo03].[dbo].[TbAlunoTurmaProcedimentoMatriculaHistorico]
  GROUP BY YEAR(DataAtualizacao)


USE dbSigaModuloAracaju_Arquivo03;

SELECT DB_NAME()

-- CRIA TABELA DESTINO -- 185413
SELECT * INTO dbSigaModuloAracaju_Arquivo03.dbo.TbAlunoTurmaProcedimentoMatriculaHistorico
    FROM dbSigaModuloAracaju.dbo.TbAlunoTurmaProcedimentoMatriculaHistorico
        WHERE YEAR(DataAtualizacao) <= 2020



EXEC sp_help 'TbAlunoTurmaProcedimentoMatriculaHistorico'


-- SET IDENTITY_INSERT TbAlunoTurmaProcedimentoMatriculaHistorico ON;

-- INSERT INTO TbAlunoTurmaProcedimentoMatriculaHistorico ( Tabela, IdUsuario, Operacao, DataHora, ValorChave1, ValorChave2, ValorChave3, ValorChave4, ValorChave5, DescricaoOperacao, IdAuditoria )
--         SELECT Tabela, IdUsuario, Operacao, DataHora, ValorChave1, ValorChave2, ValorChave3, ValorChave4, ValorChave5, DescricaoOperacao, IdAuditoria
--             FROM dbSigaSalesianoSaoJose_Arquivo07.dbo.TbAlunoTurmaProcedimentoMatriculaHistorico


DECLARE @BatchSize INT = 2500

WHILE 1 = 1
BEGIN
	DELETE TOP (@BatchSize)
	FROM dbSigaModuloAracaju.dbo.TbAlunoTurmaProcedimentoMatriculaHistorico
	where YEAR(DataAtualizacao) <= 2020
 
	IF @@ROWCOUNT < @BatchSize BREAK
END
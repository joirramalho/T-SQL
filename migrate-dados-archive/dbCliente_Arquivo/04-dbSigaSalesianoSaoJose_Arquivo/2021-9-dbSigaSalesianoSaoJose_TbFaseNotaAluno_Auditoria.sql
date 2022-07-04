-- SELECT  COUNT(*) FROM dbSigaSalesianoSaoJose_Arquivo05.dbo.TbFaseNotaAluno_Auditoria
-- SELECT  COUNT(*) FROM dbSigaSalesianoSaoJose_Arquivo04.dbo.TbFaseNotaAluno_Auditoria
-- SELECT  COUNT(*) FROM dbSigaSalesianoSaoJose_Arquivo03.dbo.TbFaseNotaAluno_Auditoria
-- SELECT  COUNT(*) FROM dbSigaSalesianoSaoJose_Arquivo02.dbo.TbFaseNotaAluno_Auditoria
-- SELECT  COUNT(*) FROM dbSigaSalesianoSaoJose_Arquivo01.dbo.TbFaseNotaAluno_Auditoria
--
  SELECT YEAR(DataHora), COUNT(*)  FROM [dbSigaSalesianoSaoJose].[dbo].[TbFaseNotaAluno_Auditoria]  GROUP BY YEAR(DataHora)

  SELECT YEAR(DataHora), COUNT(*)  FROM [dbSigaSalesianoSaoJose_Arquivo].[dbo].[TbFaseNotaAluno_Auditoria]  GROUP BY YEAR(DataHora)


USE dbSigaSalesianoSaoJose_Arquivo

SELECT DB_NAME()

-- CRIA TABELA DESTINO -- 185413
--SELECT * INTO dbSigaSalesianoSaoJose_Arquivo.dbo.TbFaseNotaAluno_Auditoria
--    FROM dbSigaSalesianoSaoJose.dbo.TbFaseNotaAluno_Auditoria
--        WHERE YEAR(DataHora) <= 2020



EXEC sp_help 'TbFaseNotaAluno_Auditoria'


begin tran

-- SET IDENTITY_INSERT dbSigaSalesianoSaoJose_Arquivo.dbo.TbFaseNotaAluno_Auditoria ON;

 INSERT INTO dbSigaSalesianoSaoJose_Arquivo.dbo.TbFaseNotaAluno_Auditoria (  IdFaseNotaAlunoAuditoria,  DataHora,  Operacao,  IdUsuario,  IdProfessor,  IdDisciplina,  IdTurma,  IdAluno,  IdFaseNota,  Nota01,  Nota02,  Nota03,  Nota04,  Nota05,  Nota06,  Nota07,  Nota08,  Nota09,  Nota10,  IdFormulaComposicao,  StNotaConfirmada,  NotaFase,  Faltas,  QuantAulasDadas,  StNotaFaseExibirDisp  )
         SELECT IdFaseNotaAlunoAuditoria,  DataHora,  Operacao,  IdUsuario,  IdProfessor,  IdDisciplina,  IdTurma,  IdAluno,  IdFaseNota,  Nota01,  Nota02,  Nota03,  Nota04,  Nota05,  Nota06,  Nota07,  Nota08,  Nota09,  Nota10,  IdFormulaComposicao,  StNotaConfirmada,  NotaFase,  Faltas,  QuantAulasDadas,  StNotaFaseExibirDisp
             	FROM dbSigaSalesianoSaoJose.dbo.TbFaseNotaAluno_Auditoria
        		WHERE YEAR(DataHora) <= 2021

        		
      -- ROLLBACK 
        		
--        		COMMIT

DECLARE @BatchSize INT = 5000

WHILE 1 = 1
BEGIN
	DELETE TOP (@BatchSize)
	FROM dbSigaSalesianoSaoJose.dbo.TbFaseNotaAluno_Auditoria
	where YEAR(DataHora) <= 2021
 
	IF @@ROWCOUNT < @BatchSize BREAK
END
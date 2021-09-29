SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER VIEW [dbo].[VwFaseNotaAluno_Auditoria] AS   
    SELECT IdFaseNotaAlunoAuditoria, DataHora, Operacao, IdUsuario, IdDisciplina, IdTurma, IdAluno, IdFaseNota, Nota01, Nota02, Nota03, Nota04, Nota05, Nota06, Nota07, Nota08, Nota09, Nota10, IdFormulaComposicao, StNotaConfirmada, NotaFase, Faltas, QuantAulasDadas, StNotaFaseExibirDisp, IdProfessor  
    FROM TbFaseNotaAluno_Auditoria  
  UNION ALL  
    SELECT IdFaseNotaAlunoAuditoria, DataHora, Operacao, IdUsuario, IdDisciplina, IdTurma, IdAluno, IdFaseNota, Nota01, Nota02, Nota03, Nota04, Nota05, Nota06, Nota07, Nota08, Nota09, Nota10, IdFormulaComposicao, StNotaConfirmada, NotaFase, Faltas, QuantAulasDadas, StNotaFaseExibirDisp, IdProfessor  
    FROM dbSigaNeves_Arquivo.dbo.TbFaseNotaAluno_Auditoria  
  -- SELECT IdFaseNotaAlunoAuditoria, DataHora, Operacao, IdUsuario, IdDisciplina, IdTurma, IdAluno, IdFaseNota, Nota01, Nota02, Nota03, Nota04, Nota05, Nota06, Nota07, Nota08, Nota09, Nota10, IdFormulaComposicao, StNotaConfirmada, NotaFase, Faltas, QuantAulasDadas, StNotaFaseExibirDisp, IdProfessor  
  -- FROM dbSigaNeves_Arquivo01.dbo.TbFaseNotaAluno_Auditoria  
  -- UNION ALL  
  -- SELECT IdFaseNotaAlunoAuditoria, DataHora, Operacao, IdUsuario, IdDisciplina, IdTurma, IdAluno, IdFaseNota, Nota01, Nota02, Nota03, Nota04, Nota05, Nota06, Nota07, Nota08, Nota09, Nota10, IdFormulaComposicao, StNotaConfirmada, NotaFase, Faltas, QuantAulasDadas, StNotaFaseExibirDisp, IdProfessor  
  -- FROM dbSigaNeves_Arquivo02.dbo.TbFaseNotaAluno_Auditoria  
  -- UNION ALL  
  -- SELECT IdFaseNotaAlunoAuditoria, DataHora, Operacao, IdUsuario, IdDisciplina, IdTurma, IdAluno, IdFaseNota, Nota01, Nota02, Nota03, Nota04, Nota05, Nota06, Nota07, Nota08, Nota09, Nota10, IdFormulaComposicao, StNotaConfirmada, NotaFase, Faltas, QuantAulasDadas, StNotaFaseExibirDisp, IdProfessor  
  -- FROM dbSigaNeves_Arquivo03.dbo.TbFaseNotaAluno_Auditoria  
  -- UNION ALL  
  -- SELECT IdFaseNotaAlunoAuditoria, DataHora, Operacao, IdUsuario, IdDisciplina, IdTurma, IdAluno, IdFaseNota, Nota01, Nota02, Nota03, Nota04, Nota05, Nota06, Nota07, Nota08, Nota09, Nota10, IdFormulaComposicao, StNotaConfirmada, NotaFase, Faltas, QuantAulasDadas, StNotaFaseExibirDisp, IdProfessor  
  -- FROM dbSigaNeves_Arquivo04.dbo.TbFaseNotaAluno_Auditoria  
  -- UNION ALL  
  -- SELECT IdFaseNotaAlunoAuditoria, DataHora, Operacao, IdUsuario, IdDisciplina, IdTurma, IdAluno, IdFaseNota, Nota01, Nota02, Nota03, Nota04, Nota05, Nota06, Nota07, Nota08, Nota09, Nota10, IdFormulaComposicao, StNotaConfirmada, NotaFase, Faltas, QuantAulasDadas, StNotaFaseExibirDisp, IdProfessor  
  -- FROM dbSigaNeves_Arquivo05.dbo.TbFaseNotaAluno_Auditoria  
  -- UNION ALL  
  -- SELECT IdFaseNotaAlunoAuditoria, DataHora, Operacao, IdUsuario, IdDisciplina, IdTurma, IdAluno, IdFaseNota, Nota01, Nota02, Nota03, Nota04, Nota05, Nota06, Nota07, Nota08, Nota09, Nota10, IdFormulaComposicao, StNotaConfirmada, NotaFase, Faltas, QuantAulasDadas, StNotaFaseExibirDisp, IdProfessor  
  -- FROM dbSigaNeves_Arquivo06.dbo.TbFaseNotaAluno_Auditoria  
  -- UNION ALL
  -- SELECT IdFaseNotaAlunoAuditoria, DataHora, Operacao, IdUsuario, IdDisciplina, IdTurma, IdAluno, IdFaseNota, Nota01, Nota02, Nota03, Nota04, Nota05, Nota06, Nota07, Nota08, Nota09, Nota10, IdFormulaComposicao, StNotaConfirmada, NotaFase, Faltas, QuantAulasDadas, StNotaFaseExibirDisp, IdProfessor  
  -- FROM dbSigaNeves_Arquivo07.dbo.TbFaseNotaAluno_Auditoria 

GO


SELECT DB_NAME()
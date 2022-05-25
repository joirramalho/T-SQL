SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER VIEW [dbo].[VwSituacaoAlunoDisciplina_Auditoria] AS   
    SELECT IdSituacaoAlunoDisciplinaAuditoria, DataHora, Operacao, IdUsuario, IdDisciplina, IdTurma, IdAluno, IdFaseNotaAtual, SituacaoAtual, StDisciplinaDispensada  
    FROM TbSituacaoAlunoDisciplina_Auditoria  
  UNION ALL  
    SELECT IdSituacaoAlunoDisciplinaAuditoria, DataHora, Operacao, IdUsuario, IdDisciplina, IdTurma, IdAluno, IdFaseNotaAtual, SituacaoAtual, StDisciplinaDispensada  
    FROM dbSigaNeves_Arquivo.dbo.TbSituacaoAlunoDisciplina_Auditoria  
  -- SELECT IdSituacaoAlunoDisciplinaAuditoria, DataHora, Operacao, IdUsuario, IdDisciplina, IdTurma, IdAluno, IdFaseNotaAtual, SituacaoAtual, StDisciplinaDispensada  
  -- FROM dbSigaNeves_Arquivo01.dbo.TbSituacaoAlunoDisciplina_Auditoria  
  -- UNION ALL  
  -- SELECT IdSituacaoAlunoDisciplinaAuditoria, DataHora, Operacao, IdUsuario, IdDisciplina, IdTurma, IdAluno, IdFaseNotaAtual, SituacaoAtual, StDisciplinaDispensada  
  -- FROM dbSigaNeves_Arquivo02.dbo.TbSituacaoAlunoDisciplina_Auditoria  
  -- UNION ALL  
  -- SELECT IdSituacaoAlunoDisciplinaAuditoria, DataHora, Operacao, IdUsuario, IdDisciplina, IdTurma, IdAluno, IdFaseNotaAtual, SituacaoAtual, StDisciplinaDispensada  
  -- FROM dbSigaNeves_Arquivo03.dbo.TbSituacaoAlunoDisciplina_Auditoria  
  -- UNION ALL  
  -- SELECT IdSituacaoAlunoDisciplinaAuditoria, DataHora, Operacao, IdUsuario, IdDisciplina, IdTurma, IdAluno, IdFaseNotaAtual, SituacaoAtual, StDisciplinaDispensada  
  -- FROM dbSigaNeves_Arquivo04.dbo.TbSituacaoAlunoDisciplina_Auditoria  
  -- UNION ALL  
  -- SELECT IdSituacaoAlunoDisciplinaAuditoria, DataHora, Operacao, IdUsuario, IdDisciplina, IdTurma, IdAluno, IdFaseNotaAtual, SituacaoAtual, StDisciplinaDispensada  
  -- FROM dbSigaNeves_Arquivo05.dbo.TbSituacaoAlunoDisciplina_Auditoria  
  -- UNION ALL  
  -- SELECT IdSituacaoAlunoDisciplinaAuditoria, DataHora, Operacao, IdUsuario, IdDisciplina, IdTurma, IdAluno, IdFaseNotaAtual, SituacaoAtual, StDisciplinaDispensada  
  -- FROM dbSigaNeves_Arquivo06.dbo.TbSituacaoAlunoDisciplina_Auditoria  
  -- UNION ALL  
  -- SELECT IdSituacaoAlunoDisciplinaAuditoria, DataHora, Operacao, IdUsuario, IdDisciplina, IdTurma, IdAluno, IdFaseNotaAtual, SituacaoAtual, StDisciplinaDispensada  
  -- FROM dbSigaNeves_Arquivo07.dbo.TbSituacaoAlunoDisciplina_Auditoria  

GO

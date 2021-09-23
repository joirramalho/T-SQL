-- REMOVER FK de TbMetaSituacaoAlunoDisciplina_Auditoria

IF EXISTS( SELECT * FROM sys.indexes WHERE name='IX_TbMetaSituacaoAlunoDisciplinaAudit_AlunoData' AND object_id = OBJECT_ID('dbo.TbMetaSituacaoAlunoDisciplina_Auditoria') )
	BEGIN
		DROP INDEX IX_TbMetaSituacaoAlunoDisciplinaAudit_AlunoData ON [dbo].[TbMetaSituacaoAlunoDisciplina_Auditoria]
	END

-- REMOVER FK de TbSituacaoAlunoDisciplina_Auditoria

IF EXISTS( SELECT * FROM sys.indexes WHERE name='IX_TbSituacaoAlunoDisciplina_Auditoria' AND object_id = OBJECT_ID('dbo.TbSituacaoAlunoDisciplina_Auditoria') )
	BEGIN
		DROP INDEX IX_TbSituacaoAlunoDisciplina_Auditoria ON [dbo].[TbSituacaoAlunoDisciplina_Auditoria]
	END




IF EXISTS( SELECT * FROM sys.indexes WHERE name='IX_TbSituacaoAlunoDisciplina_Auditoria_1' AND object_id = OBJECT_ID('dbo.TbSituacaoAlunoDisciplina_Auditoria') )
	BEGIN
		DROP INDEX IX_TbSituacaoAlunoDisciplina_Auditoria_1 ON [dbo].[TbSituacaoAlunoDisciplina_Auditoria]
	END

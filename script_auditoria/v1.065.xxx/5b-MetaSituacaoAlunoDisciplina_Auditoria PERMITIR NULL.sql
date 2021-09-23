/* To prevent any potential data loss issues, you should review this script in detail before running it outside the context of the database designer.*/
BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.Tmp_TbMetaSituacaoAlunoDisciplina_Auditoria
	(
	IdMetaSituacaoAlunoDisciplinaAuditoria bigint NOT NULL IDENTITY (1, 1),
	DataHora datetime NOT NULL,
	Operacao char(1) NOT NULL,
	IdUsuario int NULL,
	IdDisciplina int NULL,
	IdTurma int NULL,
	IdAluno int NULL,
	StDisciplinaDispensada char(1) NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_TbMetaSituacaoAlunoDisciplina_Auditoria SET (LOCK_ESCALATION = TABLE)
GO
SET IDENTITY_INSERT dbo.Tmp_TbMetaSituacaoAlunoDisciplina_Auditoria ON
GO
IF EXISTS(SELECT * FROM dbo.TbMetaSituacaoAlunoDisciplina_Auditoria)
	 EXEC('INSERT INTO dbo.Tmp_TbMetaSituacaoAlunoDisciplina_Auditoria (IdMetaSituacaoAlunoDisciplinaAuditoria, DataHora, Operacao, IdUsuario, IdDisciplina, IdTurma, IdAluno, StDisciplinaDispensada)
		SELECT IdMetaSituacaoAlunoDisciplinaAuditoria, DataHora, Operacao, IdUsuario, IdDisciplina, IdTurma, IdAluno, StDisciplinaDispensada FROM dbo.TbMetaSituacaoAlunoDisciplina_Auditoria WITH (HOLDLOCK TABLOCKX)')
GO
SET IDENTITY_INSERT dbo.Tmp_TbMetaSituacaoAlunoDisciplina_Auditoria OFF
GO
DROP TABLE dbo.TbMetaSituacaoAlunoDisciplina_Auditoria
GO
EXECUTE sp_rename N'dbo.Tmp_TbMetaSituacaoAlunoDisciplina_Auditoria', N'TbMetaSituacaoAlunoDisciplina_Auditoria', 'OBJECT' 
GO
ALTER TABLE dbo.TbMetaSituacaoAlunoDisciplina_Auditoria ADD CONSTRAINT
	PK_TbMetaSituacaoAlunoDisciplina_Auditoria PRIMARY KEY CLUSTERED 
	(
	IdMetaSituacaoAlunoDisciplinaAuditoria
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
COMMIT

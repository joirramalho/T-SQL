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
CREATE TABLE dbo.Tmp_TbSituacaoAlunoDisciplina_Auditoria
	(
	IdSituacaoAlunoDisciplinaAuditoria bigint NOT NULL IDENTITY (1, 1),
	DataHora datetime NOT NULL,
	Operacao char(1) NOT NULL,
	IdUsuario int NULL,
	IdDisciplina int NULL,
	IdTurma int NULL,
	IdAluno int NULL,
	IdFaseNotaAtual int NULL,
	SituacaoAtual varchar(2) NULL,
	StDisciplinaDispensada char(1) NULL,
	IdAlunoCurso int NULL,
	DataMatricula smalldatetime NULL,
	IdUsuarioMatricula int NULL,
	DataTrancamento smalldatetime NULL,
	IdUsuarioTrancamento int NULL,
	IdMotivoTrancamento int NULL,
	ComentarioTrancamento varchar(200) NULL,
	IdSituacaoAlunoDisciplina int NULL,
	NotaFinal numeric(7, 2) NULL,
	Faltas smallint NULL,
	ProblemaAutorizadoMatricula varchar(6000) NULL,
	IdUsuarioAutorizacaoMatricula int NULL,
	JustificativaAutorizacaoMatricula varchar(255) NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_TbSituacaoAlunoDisciplina_Auditoria SET (LOCK_ESCALATION = TABLE)
GO
SET IDENTITY_INSERT dbo.Tmp_TbSituacaoAlunoDisciplina_Auditoria ON
GO
IF EXISTS(SELECT * FROM dbo.TbSituacaoAlunoDisciplina_Auditoria)
	 EXEC('INSERT INTO dbo.Tmp_TbSituacaoAlunoDisciplina_Auditoria (IdSituacaoAlunoDisciplinaAuditoria, DataHora, Operacao, IdUsuario, IdDisciplina, IdTurma, IdAluno, IdFaseNotaAtual, SituacaoAtual, StDisciplinaDispensada, IdAlunoCurso, DataMatricula, IdUsuarioMatricula, DataTrancamento, IdUsuarioTrancamento, IdMotivoTrancamento, ComentarioTrancamento, IdSituacaoAlunoDisciplina, NotaFinal, Faltas, ProblemaAutorizadoMatricula, IdUsuarioAutorizacaoMatricula, JustificativaAutorizacaoMatricula)
		SELECT IdSituacaoAlunoDisciplinaAuditoria, DataHora, Operacao, IdUsuario, IdDisciplina, IdTurma, IdAluno, IdFaseNotaAtual, SituacaoAtual, StDisciplinaDispensada, IdAlunoCurso, DataMatricula, IdUsuarioMatricula, DataTrancamento, IdUsuarioTrancamento, IdMotivoTrancamento, ComentarioTrancamento, IdSituacaoAlunoDisciplina, NotaFinal, Faltas, ProblemaAutorizadoMatricula, IdUsuarioAutorizacaoMatricula, JustificativaAutorizacaoMatricula FROM dbo.TbSituacaoAlunoDisciplina_Auditoria WITH (HOLDLOCK TABLOCKX)')
GO
SET IDENTITY_INSERT dbo.Tmp_TbSituacaoAlunoDisciplina_Auditoria OFF
GO
DROP TABLE dbo.TbSituacaoAlunoDisciplina_Auditoria
GO
EXECUTE sp_rename N'dbo.Tmp_TbSituacaoAlunoDisciplina_Auditoria', N'TbSituacaoAlunoDisciplina_Auditoria', 'OBJECT' 
GO
ALTER TABLE dbo.TbSituacaoAlunoDisciplina_Auditoria ADD CONSTRAINT
	PK_TbSituacaoAlunoDisciplina_Auditoria PRIMARY KEY CLUSTERED 
	(
	IdSituacaoAlunoDisciplinaAuditoria
	) WITH( PAD_INDEX = OFF, FILLFACTOR = 90, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
COMMIT

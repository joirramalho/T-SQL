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
CREATE TABLE dbo.Tmp_TbFaseNotaDisciplina_Auditoria
	(
	IdFaseNotaDisciplinaAuditoria bigint NOT NULL IDENTITY (1, 1),
	DataHora datetime NOT NULL,
	Operacao char(1) NOT NULL,
	IdUsuario int NULL,
	IdFaseNotaDisciplina int NULL,
	IdFaseNota int NULL,
	IdDisciplina int NULL,
	IdFormulaComposicaoNota int NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_TbFaseNotaDisciplina_Auditoria SET (LOCK_ESCALATION = TABLE)
GO
SET IDENTITY_INSERT dbo.Tmp_TbFaseNotaDisciplina_Auditoria ON
GO
IF EXISTS(SELECT * FROM dbo.TbFaseNotaDisciplina_Auditoria)
	 EXEC('INSERT INTO dbo.Tmp_TbFaseNotaDisciplina_Auditoria (IdFaseNotaDisciplinaAuditoria, DataHora, Operacao, IdUsuario, IdFaseNotaDisciplina, IdFaseNota, IdDisciplina, IdFormulaComposicaoNota)
		SELECT IdFaseNotaDisciplinaAuditoria, DataHora, Operacao, IdUsuario, IdFaseNotaDisciplina, IdFaseNota, IdDisciplina, IdFormulaComposicaoNota FROM dbo.TbFaseNotaDisciplina_Auditoria WITH (HOLDLOCK TABLOCKX)')
GO
SET IDENTITY_INSERT dbo.Tmp_TbFaseNotaDisciplina_Auditoria OFF
GO
DROP TABLE dbo.TbFaseNotaDisciplina_Auditoria
GO
EXECUTE sp_rename N'dbo.Tmp_TbFaseNotaDisciplina_Auditoria', N'TbFaseNotaDisciplina_Auditoria', 'OBJECT' 
GO
ALTER TABLE dbo.TbFaseNotaDisciplina_Auditoria ADD CONSTRAINT
	PK_TbFaseNotaDisciplina_Auditoria PRIMARY KEY CLUSTERED 
	(
	IdFaseNotaDisciplinaAuditoria
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
--
-- Activesoft Consultoria 
-- TRIGGER criada pelo Activesoft Service Pack em 21/01/2020 durante atualização para versão 1.065.xxx.
--

CREATE TRIGGER [dbo].[TgFaseNotaDisciplina_Auditoria_DU] ON dbo.TbFaseNotaDisciplina_Auditoria
--ALTER TRIGGER [dbo].[TgFaseNotaDisciplina_Auditoria_DU] ON [dbo].[TbFaseNotaDisciplina_Auditoria]
FOR UPDATE, DELETE
AS
BEGIN
	SET NOCOUNT ON

	ROLLBACK TRANSACTION 
	RAISERROR ('Dados não podem ser excluídos ou alterados (trigger de auditoria TgFaseNotaDisciplina_Auditoria_DU inválida)', 16, 1) 
	RETURN 
	
END
GO
COMMIT

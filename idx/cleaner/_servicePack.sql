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
ALTER TABLE dbo.TbTituloCobrancaBoleto_Auditoria ADD CONSTRAINT
	PK_TbTituloCobrancaBoleto_Auditoria PRIMARY KEY CLUSTERED 
	(
	IdTituloCobrancaBoletoAuditoria
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.TbTituloCobrancaBoleto_Auditoria SET (LOCK_ESCALATION = TABLE)
GO
COMMIT




---

--CRM, faltando PK pelo IdClienteAuditAnotacoes


/* To prevent any potential data loss issues, you should review this script in detail before running it outside the context of the database designer.*/
BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON888

SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.Tmp_TbClienteAuditAnotacoes
	(
	IdClienteAuditAnotacoes int NOT NULL IDENTITY (1, 1),
	IdCliente int NOT NULL,
	DataHora datetime NOT NULL,
	Anotacoes text NULL
	)  ON [PRIMARY]
	 TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_TbClienteAuditAnotacoes SET (LOCK_ESCALATION = TABLE)
GO
SET IDENTITY_INSERT dbo.Tmp_TbClienteAuditAnotacoes OFF
GO
IF EXISTS(SELECT * FROM dbo.TbClienteAuditAnotacoes)
	 EXEC('INSERT INTO dbo.Tmp_TbClienteAuditAnotacoes (IdCliente, DataHora, Anotacoes)
		SELECT IdCliente, DataHora, Anotacoes FROM dbo.TbClienteAuditAnotacoes WITH (HOLDLOCK TABLOCKX)')
GO
DROP TABLE dbo.TbClienteAuditAnotacoes
GO
EXECUTE sp_rename N'dbo.Tmp_TbClienteAuditAnotacoes', N'TbClienteAuditAnotacoes', 'OBJECT' 
GO
COMMIT

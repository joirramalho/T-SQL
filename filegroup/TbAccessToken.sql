-- dbLogMonitor.dbo.sp_where

-- USE CRM_153800

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
ALTER TABLE dbo.TbAccessToken
	DROP CONSTRAINT TbAccessToken_TbApplication_IdApplication_fk
GO
ALTER TABLE dbo.TbApplication SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.TbAccessToken
	DROP CONSTRAINT TbAccessToken_TbResourceOwner_IdResourceOwner_fk
GO
ALTER TABLE dbo.TbResourceOwner SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.Tmp_TbAccessToken
	(
	IdAccessToken int NOT NULL IDENTITY (1, 1),
	IdResourceOwner int NULL,
	IdSourceRefreshToken int NULL,
	Token varchar(255) NOT NULL,
	IdApplication int NULL,
	Expires datetime NOT NULL,
	Scope varchar(512) NOT NULL,
	CreatedAt smalldatetime NOT NULL,
	UpdatedAt smalldatetime NOT NULL
	)  ON SECONDARY
GO
ALTER TABLE dbo.Tmp_TbAccessToken SET (LOCK_ESCALATION = TABLE)
GO
GRANT DELETE ON dbo.Tmp_TbAccessToken TO userActiveCrmSIGAWeb  AS dbo
GO
GRANT INSERT ON dbo.Tmp_TbAccessToken TO userActiveCrmSIGAWeb  AS dbo
GO
GRANT SELECT ON dbo.Tmp_TbAccessToken TO userActiveCrmSIGAWeb  AS dbo
GO
GRANT UPDATE ON dbo.Tmp_TbAccessToken TO userActiveCrmSIGAWeb  AS dbo
GO
SET IDENTITY_INSERT dbo.Tmp_TbAccessToken ON
GO
IF EXISTS(SELECT * FROM dbo.TbAccessToken)
	 EXEC('INSERT INTO dbo.Tmp_TbAccessToken (IdAccessToken, IdResourceOwner, IdSourceRefreshToken, Token, IdApplication, Expires, Scope, CreatedAt, UpdatedAt)
		SELECT IdAccessToken, IdResourceOwner, IdSourceRefreshToken, Token, IdApplication, Expires, CONVERT(varchar(512), Scope), CreatedAt, UpdatedAt FROM dbo.TbAccessToken WITH (HOLDLOCK TABLOCKX)')
GO
SET IDENTITY_INSERT dbo.Tmp_TbAccessToken OFF
GO
DROP TABLE dbo.TbAccessToken
GO
EXECUTE sp_rename N'dbo.Tmp_TbAccessToken', N'TbAccessToken', 'OBJECT' 
GO
ALTER TABLE dbo.TbAccessToken ADD CONSTRAINT
	TbAccessToken_pk PRIMARY KEY CLUSTERED 
	(
	IdAccessToken
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON SECONDARY

GO
CREATE UNIQUE NONCLUSTERED INDEX TbAccessToken_Token_uindex ON dbo.TbAccessToken
	(
	Token
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [SECONDARY]
GO
ALTER TABLE dbo.TbAccessToken ADD CONSTRAINT
	TbAccessToken_TbResourceOwner_IdResourceOwner_fk FOREIGN KEY
	(
	IdResourceOwner
	) REFERENCES dbo.TbResourceOwner
	(
	IdResourceOwner
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.TbAccessToken ADD CONSTRAINT
	TbAccessToken_TbApplication_IdApplication_fk FOREIGN KEY
	(
	IdApplication
	) REFERENCES dbo.TbApplication
	(
	IdApplication
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
COMMIT



sp_help 'TbAccessToken'
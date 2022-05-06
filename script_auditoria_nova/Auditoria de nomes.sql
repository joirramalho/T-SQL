--06mai22
/*
TRUNCATE TABLE ContasPagar
TRUNCATE TABLE ContasPagar_Auditoria
TRUNCATE TABLE Tabela2
TRUNCATE TABLE Tabela2_Auditoria
*/

--INSERT INTO dbLogMonitor.dbo.Tabela2 ( Nome ) values ('Joir') 
--INSERT INTO dbLogMonitor.dbo.Tabela2 ( Nome ) values ('nailson') 
--INSERT INTO dbLogMonitor.dbo.ContasPagar ( id ) values (1) 
--INSERT INTO dbLogMonitor.dbo.ContasPagar ( id ) values (2) 

--UPDATE ContasPagar SET Id = 1 WHERE IdContasPagar = 2
--UPDATE Tabela2 SET Nome = 'nailson Gomes' WHERE Id = 2
--INSERT INTO dbLogMonitor.dbo.ContasPagar ( id ) values (2)
--UPDATE Tabela2 SET Nome = 'Joir Ramalho' WHERE Id = 1
--INSERT INTO dbLogMonitor.dbo.ContasPagar ( id ) values (1)

--UPDATE ContasPagar SET Id = 2 WHERE IdContasPagar = 1
--INSERT INTO dbLogMonitor.dbo.Tabela2 ( Nome ) values ('Romario') 
--UPDATE ContasPagar SET Id = 3 WHERE IdContasPagar = 2

SELECT * FROM Tabela2
SELECT * FROM Tabela2_Auditoria

SELECT * FROM ContasPagar
SELECT * FROM ContasPagar_Auditoria


SELECT cp.Audit_DataHora, IdContasPagar, cp.Id,
	(SELECT TOP 1 Nome FROM [dbo].[Tabela2_Auditoria] a WHERE a.Id = cp.Id AND a.[Audit_DataHora] < cp.[Audit_DataHora] ORDER BY Audit_DataHora DESC )

FROM ContasPagar_Auditoria cp
ORDER BY Audit_DataHora



   -- UPDATE TbTituloCobrancaBoleto_Auditoria
   -- SET PRIOR_IdTituloCobrancaBoletoAuditoria = 
		 --   (
		 --   SELECT TOP 1 IdTituloCobrancaBoletoAuditoria 
   --      	FROM 	TbTituloCobrancaBoleto_Auditoria
   --  		WHERE 	IdTituloCobrancaBoletoAuditoria < i.IdTituloCobrancaBoletoAuditoria	
			--		AND IdTituloCobranca = i.IdTituloCobranca 
   --  		ORDER 	BY IdTituloCobrancaBoletoAuditoria DESC
			--)
	  --  FROM inserted i 
	  --  INNER JOIN TbTituloCobrancaBoleto_Auditoria ON i.IdTituloCobrancaBoletoAuditoria = TbTituloCobrancaBoleto_Auditoria.IdTituloCobrancaBoletoAuditoria
	  --  WHERE TbTituloCobrancaBoleto_Auditoria.IdTituloCobrancaBoletoAuditoria = i.IdTituloCobrancaBoletoAuditoria


--USE [dbLogMonitor]
--GO

--/****** Object:  Table [dbo].[Tabela2]    Script Date: 05/05/2022 18:28:43 ******/
--SET ANSI_NULLS ON
--GO

--SET QUOTED_IDENTIFIER ON
--GO

--CREATE TABLE [dbo].[ContasPagar](
--	[IdContasPagar] [int] IDENTITY(1,1) NOT NULL,
--	Id int NULL
--) ON [PRIMARY]
--GO

---

--SET ANSI_NULLS ON
--GO

--SET QUOTED_IDENTIFIER ON
--GO

--CREATE TABLE [dbo].[ContasPagar_Auditoria](
--	[IdContasPagar_Auditoria] [bigint] IDENTITY(1,1) NOT NULL,
--	[Audit_DataHora] [datetime] NOT NULL,
--	[Audit_Operacao] [char](1) NOT NULL,
--	[Audit_IdUsuario] [int] NULL,
--	[IdContasPagar] [int] NULL,
--	Id int NULL
--) ON [PRIMARY]
--GO


------
--SET ANSI_NULLS ON
--GO

--SET QUOTED_IDENTIFIER ON
--GO

--	CREATE TRIGGER [dbo].[TgContasPagar_Auditoria] ON [dbo].[ContasPagar]
--	--ALTER TRIGGER [dbo].[TgTituloCobranca_Auditoria] ON [dbo].[TbTituloCobranca]
--	FOR INSERT, UPDATE, DELETE
--	AS
--	BEGIN
--		SET NOCOUNT ON


--		DECLARE @TipoOperacao CHAR(1) = 'I' -- Insert by default.
--		IF EXISTS(SELECT * FROM DELETED)
--		BEGIN
--			SET @TipoOperacao = 
--				CASE
--				WHEN EXISTS(SELECT * FROM INSERTED) THEN 'U' ELSE 'D' 
--				END
--		END
--		ELSE 
--			IF NOT EXISTS(SELECT * FROM INSERTED) RETURN -- Nem updated nem inserted. Pode ter sido um "failed delete".
	

--		IF	NOT EXISTS(	SELECT * FROM inserted
--						EXCEPT
--						SELECT * FROM deleted ) AND  @TipoOperacao <> 'D'
--			RETURN

--		sELECT 111
	
--		IF ( @TipoOperacao = 'D' )
--			INSERT	[ContasPagar_Auditoria] (	Audit_DataHora,	Audit_Operacao,	Audit_IdUsuario,	IdContasPagar, Id )
--			SELECT							GETDATE(),		@TipoOperacao,	1, 		IdContasPagar, Id
--			FROM	deleted
--		ELSE
--			INSERT	[ContasPagar_Auditoria] (	Audit_DataHora,	Audit_Operacao,	Audit_IdUsuario,	IdContasPagar, Id )
--				SELECT							GETDATE(),		@TipoOperacao,	1, 		IdContasPagar, Id
--				FROM	inserted
--			EXCEPT
--				SELECT							GETDATE(),		@TipoOperacao,	1, 		IdContasPagar, Id
--				FROM	deleted

--	END
--GO



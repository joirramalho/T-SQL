--06jun22
--NOVA auditoria


--1 CREATE TABLE  -------------------------------------------

	SET ANSI_NULLS ON
	GO 
	
	SET QUOTED_IDENTIFIER ON
	GO 
	
	CREATE TABLE dbo.TbBlocoAvaliacaoPadrao_Auditoria (
	[IdBlocoAvaliacaoPadraoAuditoria] [bigint] IDENTITY(1,1) NOT NULL,
	[Audit_DataHora] [datetime] NOT NULL,
	[Audit_Operacao] [char](1) NOT NULL,
	[Audit_IdUsuario] [int] NULL,
		
		IdBlocoAvaliacaoPadrao  INT NULL,
		Nome VARCHAR (256) NULL,
		ValorMaximo NUMERIC (7, 2) NULL,

	CONSTRAINT PK_TbBlocoAvaliacaoPadrao_Auditoria PRIMARY KEY CLUSTERED  
	(
		[IdBlocoAvaliacaoPadraoAuditoria] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
	GO
	
	
	
--2 POPULAR TABELA ESPELHO com dados da tabela base (Operação "+" APENAS SE *** NÃO *** EXISTIA TABELA ESPELHADA -------------------------------------------


--3 CREATE TRIGGER ON PK Tabela base -------------------------------------------

	--
-- Activesoft Consultoria 
-- TRIGGER criada pelo Activesoft Service Pack em 06/10/2021 durante atualização para versão 1.065.173.
--


CREATE TRIGGER [dbo].[TgBlocoAvaliacaoPadrao_Auditoria] ON [dbo].[TbBlocoAvaliacaoPadrao]
--ALTER TRIGGER [dbo].[TgBlocoAvaliacaoPadrao_Auditoria] ON [dbo].[TbBlocoAvaliacaoPadrao]
FOR INSERT, UPDATE, DELETE
AS
BEGIN
	IF @@ROWCOUNT = 0
		RETURN

	SET NOCOUNT ON

	DECLARE @TipoOperacao CHAR(1) = 'I' -- Insert by default.
	IF EXISTS(SELECT * FROM DELETED)
	BEGIN
		SET @TipoOperacao = 
		    CASE
			WHEN EXISTS(SELECT * FROM INSERTED) THEN 'U' ELSE 'D' 
		    END
	END
	ELSE 
		IF NOT EXISTS(SELECT * FROM INSERTED) RETURN -- Nem updated nem inserted. Pode ter sido um "failed delete".

		
	IF	NOT EXISTS(	SELECT * FROM inserted
					EXCEPT
					SELECT * FROM deleted ) AND  @TipoOperacao <> 'D'
		RETURN
		
	
	IF ( SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS c WHERE DATA_TYPE NOT IN ( 'text', 'image' ) AND TABLE_NAME = 'TbBlocoAvaliacaoPadrao' AND LEFT(COLUMN_NAME,1) <> '_' ) <> 3
	  BEGIN
		RAISERROR ('Dados não podem ser alterados (trigger de auditoria TgBlocoAvaliacaoPadrao_Auditoria inválida)', 16, 1) 
		ROLLBACK TRANSACTION 
		RETURN 
	  END 
	  
	  
	DECLARE @IdUsuario INTEGER
	IF APP_NAME() = 'SIGAWEB'
		SELECT	@IdUsuario = IdUsuario
		FROM	dbo.FnCriarTabelaTemporaria(HOST_NAME())		
	ELSE IF OBJECT_ID( 'tempdb..#TempTable') IS NULL 
	  BEGIN 
		--RAISERROR ('Dados não podem ser alterados (autenticação)', 16, 1) 
		--ROLLBACK TRANSACTION 
		--RETURN 
		SET @IdUsuario = NULL
	  END
	ELSE
	  SELECT @IdUsuario = IdUsuario FROM #TempTable

	
	IF ( @TipoOperacao = 'D' )
		INSERT	TbBlocoAvaliacaoPadrao_Auditoria (	Audit_DataHora,	Audit_Operacao,		Audit_IdUsuario,IdBlocoAvaliacaoPadrao,  Nome,  ValorMaximo )
			SELECT									GETDATE(),		@TipoOperacao,		@IdUsuario,		IdBlocoAvaliacaoPadrao,  Nome,  ValorMaximo 
			FROM	deleted
	ELSE
		INSERT	TbBlocoAvaliacaoPadrao_Auditoria (	Audit_DataHora,	Audit_Operacao,		Audit_IdUsuario,IdBlocoAvaliacaoPadrao,  Nome,  ValorMaximo )
			SELECT									GETDATE(),		@TipoOperacao,		@IdUsuario,		IdBlocoAvaliacaoPadrao,  Nome,  ValorMaximo 
			FROM	inserted
		EXCEPT
			SELECT									GETDATE(),		@TipoOperacao,		@IdUsuario,		IdBlocoAvaliacaoPadrao,  Nome,  ValorMaximo 
			FROM	deleted
END





--4 DROP TRIGGERs ANTIGA ON PK Tabela base -------------------------------------------
--10mai22
--NOVA auditoria


--1 CREATE TABLE  -------------------------------------------

	SET ANSI_NULLS ON
	GO 
	
	SET QUOTED_IDENTIFIER ON
	GO 
	
	CREATE TABLE dbo.TbContaPagar_Auditoria (
	[IdContaPagarAuditoria] [bigint] IDENTITY(1,1) NOT NULL,
	[Audit_DataHora] [datetime] NOT NULL,
	[Audit_Operacao] [char](1) NOT NULL,
	[Audit_IdUsuario] [int] NULL,
		
	IdContaPagar int  NULL,
	IdFavorecido int  NULL,
	DataVencimento smalldatetime  NULL,
	NumeroDocumento varchar(50)   NULL,
	ComentarioApropriacao varchar(1000)   NULL,
	Situacao varchar(3)   NULL,
	DataBaixa smalldatetime NULL,
	LIQ_IdConta int NULL,
	LIQ_ValorPagamento numeric(12,2) NULL,
	LIQ_ValorMulta numeric(12,2) NULL,
	LIQ_ValorJuros numeric(12,2) NULL,
	LIQ_ValorDesconto numeric(12,2) NULL,
	LIQ_IdLancamentoFinanceiro int NULL,
	DataEmissao smalldatetime NULL,
	IdContaPagar_ParcelaInicial int NULL,
	Parcelamento varchar(10)   NULL,
	ComentarioBaixa varchar(1000)   NULL,
	IdComentarioPadrao int NULL,
	IdComentarioPadraoBaixa int NULL,
	ComentarioAdicional varchar(1000)   NULL,
	StCaixaPagamentoRapido bit NULL,
	IntegAlmox_ValorDesconto numeric(12,2) NULL,
	CONSTRAINT PK_TbContaPagar_Auditoria PRIMARY KEY CLUSTERED  
	(
		[IdContaPagarAuditoria] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
	GO
	
	
	
-- 2 POPULAR TABELA ESPELHO com dados da tabela base (Operação "+" APENAS SE *** NÃO *** EXISTIA TABELA ESPELHADA -------------------------------------------

	INSERT	TbContaPagar_Auditoria (	Audit_DataHora,			Audit_Operacao,	Audit_IdUsuario,	 [IdContaPagar], [IdFavorecido], [DataVencimento], [NumeroDocumento], [ComentarioApropriacao], [Situacao], [DataBaixa], [LIQ_IdConta], [LIQ_ValorPagamento], [LIQ_ValorMulta], [LIQ_ValorJuros], [LIQ_ValorDesconto], [LIQ_IdLancamentoFinanceiro], [DataEmissao], [IdContaPagar_ParcelaInicial], [Parcelamento], [ComentarioBaixa], [IdComentarioPadrao], [IdComentarioPadraoBaixa], [ComentarioAdicional], [StCaixaPagamentoRapido], [IntegAlmox_ValorDesconto] )
		SELECT							'1900-01-01 00:00:00',	'+',			11, 			 	 [IdContaPagar], [IdFavorecido], [DataVencimento], [NumeroDocumento], [ComentarioApropriacao], [Situacao], [DataBaixa], [LIQ_IdConta], [LIQ_ValorPagamento], [LIQ_ValorMulta], [LIQ_ValorJuros], [LIQ_ValorDesconto], [LIQ_IdLancamentoFinanceiro], [DataEmissao], [IdContaPagar_ParcelaInicial], [Parcelamento], [ComentarioBaixa], [IdComentarioPadrao], [IdComentarioPadraoBaixa], [ComentarioAdicional], [StCaixaPagamentoRapido], [IntegAlmox_ValorDesconto] FROM TbContaPagar
	GO 
	
	
	
	
	
--3 CREATE TRIGGER ON PK Tabela base -------------------------------------------

	--
-- Activesoft Consultoria 
-- TRIGGER criada pelo Activesoft Service Pack em 06/10/2021 durante atualização para versão 1.065.173.
--


CREATE TRIGGER [dbo].[TgContaPagar_Auditoria] ON [dbo].[TbContaPagar]
--ALTER TRIGGER [dbo].[TgContaPagar_Auditoria] ON [dbo].[TbContaPagar]
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
		
	
	IF ( SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS c WHERE DATA_TYPE NOT IN ( 'text', 'image' ) AND TABLE_NAME = 'TbContaPagar' AND LEFT(COLUMN_NAME,1) <> '_' ) <> 22 
	  BEGIN
		RAISERROR ('Dados não podem ser alterados (trigger de auditoria TgContaPagar_Auditoria inválida)', 16, 1) 
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
		INSERT	TbContaPagar_Auditoria (	Audit_DataHora,	Audit_Operacao,		Audit_IdUsuario,	[IdContaPagar], [IdFavorecido], [DataVencimento], [NumeroDocumento], [ComentarioApropriacao], [Situacao], [DataBaixa], [LIQ_IdConta], [LIQ_ValorPagamento], [LIQ_ValorMulta], [LIQ_ValorJuros], [LIQ_ValorDesconto], [LIQ_IdLancamentoFinanceiro], [DataEmissao], [IdContaPagar_ParcelaInicial], [Parcelamento], [ComentarioBaixa], [IdComentarioPadrao], [IdComentarioPadraoBaixa], [ComentarioAdicional], [StCaixaPagamentoRapido], [IntegAlmox_ValorDesconto] )
			SELECT							GETDATE(),		@TipoOperacao,		@IdUsuario,			[IdContaPagar], [IdFavorecido], [DataVencimento], [NumeroDocumento], [ComentarioApropriacao], [Situacao], [DataBaixa], [LIQ_IdConta], [LIQ_ValorPagamento], [LIQ_ValorMulta], [LIQ_ValorJuros], [LIQ_ValorDesconto], [LIQ_IdLancamentoFinanceiro], [DataEmissao], [IdContaPagar_ParcelaInicial], [Parcelamento], [ComentarioBaixa], [IdComentarioPadrao], [IdComentarioPadraoBaixa], [ComentarioAdicional], [StCaixaPagamentoRapido], [IntegAlmox_ValorDesconto]
			FROM	deleted
	ELSE
		INSERT	TbContaPagar_Auditoria (	Audit_DataHora,	Audit_Operacao,		Audit_IdUsuario,	[IdContaPagar], [IdFavorecido], [DataVencimento], [NumeroDocumento], [ComentarioApropriacao], [Situacao], [DataBaixa], [LIQ_IdConta], [LIQ_ValorPagamento], [LIQ_ValorMulta], [LIQ_ValorJuros], [LIQ_ValorDesconto], [LIQ_IdLancamentoFinanceiro], [DataEmissao], [IdContaPagar_ParcelaInicial], [Parcelamento], [ComentarioBaixa], [IdComentarioPadrao], [IdComentarioPadraoBaixa], [ComentarioAdicional], [StCaixaPagamentoRapido], [IntegAlmox_ValorDesconto] )
			SELECT							GETDATE(),		@TipoOperacao,		@IdUsuario,			[IdContaPagar], [IdFavorecido], [DataVencimento], [NumeroDocumento], [ComentarioApropriacao], [Situacao], [DataBaixa], [LIQ_IdConta], [LIQ_ValorPagamento], [LIQ_ValorMulta], [LIQ_ValorJuros], [LIQ_ValorDesconto], [LIQ_IdLancamentoFinanceiro], [DataEmissao], [IdContaPagar_ParcelaInicial], [Parcelamento], [ComentarioBaixa], [IdComentarioPadrao], [IdComentarioPadraoBaixa], [ComentarioAdicional], [StCaixaPagamentoRapido], [IntegAlmox_ValorDesconto]
			FROM	inserted
		EXCEPT
			SELECT							GETDATE(),		@TipoOperacao,		@IdUsuario,			[IdContaPagar], [IdFavorecido], [DataVencimento], [NumeroDocumento], [ComentarioApropriacao], [Situacao], [DataBaixa], [LIQ_IdConta], [LIQ_ValorPagamento], [LIQ_ValorMulta], [LIQ_ValorJuros], [LIQ_ValorDesconto], [LIQ_IdLancamentoFinanceiro], [DataEmissao], [IdContaPagar_ParcelaInicial], [Parcelamento], [ComentarioBaixa], [IdComentarioPadrao], [IdComentarioPadraoBaixa], [ComentarioAdicional], [StCaixaPagamentoRapido], [IntegAlmox_ValorDesconto]
			FROM	deleted
END



--4 DROP TRIGGERs ANTIGA ON PK Tabela base -------------------------------------------
	DROP TRIGGER [dbo].[TgAudit_TbContaPagarD]
	GO
	
	DROP TRIGGER [dbo].[TgAudit_TbContaPagarI]
	GO
	
	DROP TRIGGER [dbo].[TgAudit_TbContaPagarU]
	GO
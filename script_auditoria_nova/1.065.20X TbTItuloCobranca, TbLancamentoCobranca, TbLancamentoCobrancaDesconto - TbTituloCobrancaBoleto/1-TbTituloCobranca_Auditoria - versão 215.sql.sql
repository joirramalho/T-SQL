--21fev22
	--NOVA auditoria TbTituloCobranca




--1 CREATE TABLE  -------------------------------------------

	SET ANSI_NULLS ON
	
	SET QUOTED_IDENTIFIER ON
	
	
	CREATE TABLE dbo.TbTituloCobranca_Auditoria  (
		[IdTituloCobrancaAuditoria] [bigint] IDENTITY(1,1) NOT NULL,
		[Audit_DataHora] [datetime] NOT NULL,
		[Audit_Operacao] [char](1) NOT NULL,
		[Audit_IdUsuario] [int] NULL,
	
		IdTituloCobranca int NULL,
		IdResponsavel int NULL,
		IdAluno int NULL,
		DataEmissao smalldatetime NULL,
		DataVencimento smalldatetime NULL,
		StImpresso bit NULL,
	--	[_StVencimentoContraApresentacao] bit NULL,
		IdFormaRecebimento int NULL,
		IdTipoCalculoMultaJuros int NULL,
		SituacaoTituloCobranca char(3) COLLATE SQL_Latin1_General_CP1_CI_AI NULL,
		DataBaixa smalldatetime NULL,
		TipoLiquidacao char(3) COLLATE SQL_Latin1_General_CP1_CI_AI NULL,
		LIQ_ValorRecebidoAMaior numeric(12,2) NULL,
		StPagoPelaSeguradora bit NULL,
		Comentario varchar(8000) COLLATE SQL_Latin1_General_CP1_CI_AI NULL,
		DataPagamento smalldatetime NULL,
		LIQ_DataDevolucaoRecebidoAMaior smalldatetime NULL,
	--	[_DataFaturamento] smalldatetime NULL,
		DataValidade smalldatetime NULL,
		LIQ_IdConta int NULL,
	--	[_IdLoteCobrancaRegistrada] int NULL,
		Audit_IdUsuarioLiquidacao int NULL,
		Audit_DataHoraLiquidacao smalldatetime NULL,
		Audit_ComentarioLiquidacao varchar(1000) COLLATE SQL_Latin1_General_CP1_CI_AI NULL,
		LIQ_IdContaDevolucaoRecebidoAMaior int NULL,
		IdAgenteCobrancaRegistrada int NULL,
		SituacaoCobrancaRegistrada varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AI NULL,
		StEmailEnviado bit  NULL,
		NossoNumeroMigracao varchar(1000) COLLATE SQL_Latin1_General_CP1_CI_AI NULL,
		LIQ_IdChequeDevolucaoRecebidoAMaior int NULL,
		LinkDoBoleto varchar(254) COLLATE SQL_Latin1_General_CP1_CI_AI NULL,
		IdTituloNoAgente varchar(254) COLLATE SQL_Latin1_General_CP1_CS_AS NULL,
		CobRegistrada_StAvisoPendente bit  NULL,
		LIQ_IdContaRecebimentoCaixaOperadoraCartao int NULL,
		DataHoraUltimaAlteracao datetime NULL,
		StPermitePagarRecebOnlineExcecao bit  NULL,
		CONSTRAINT PK_TbTituloCobranca_Auditoria PRIMARY KEY CLUSTERED  
	(
		[IdTituloCobrancaAuditoria] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
	GO 
	
	
	
	
	
-- 2 POPULAR TABELA ESPELHO com dados da tabela base (Operação "+" APENAS SE *** NÃO *** EXISTIA TABELA ESPELHADA -------------------------------------------

	INSERT	TbTituloCobranca_Auditoria (		Audit_DataHora,	Audit_Operacao,	Audit_IdUsuario,[IdTituloCobranca], [IdResponsavel], [IdAluno], [DataEmissao], [DataVencimento], [StImpresso], [IdFormaRecebimento], [IdTipoCalculoMultaJuros], [SituacaoTituloCobranca], [DataBaixa], [TipoLiquidacao], [LIQ_ValorRecebidoAMaior], [StPagoPelaSeguradora], [Comentario], [DataPagamento], [LIQ_DataDevolucaoRecebidoAMaior], [DataValidade], [LIQ_IdConta], [Audit_IdUsuarioLiquidacao], [Audit_DataHoraLiquidacao], [Audit_ComentarioLiquidacao], [LIQ_IdContaDevolucaoRecebidoAMaior], [IdAgenteCobrancaRegistrada], [SituacaoCobrancaRegistrada], [StEmailEnviado], [NossoNumeroMigracao], [LIQ_IdChequeDevolucaoRecebidoAMaior], [LinkDoBoleto], [IdTituloNoAgente], [CobRegistrada_StAvisoPendente], [LIQ_IdContaRecebimentoCaixaOperadoraCartao], [DataHoraUltimaAlteracao], [StPermitePagarRecebOnlineExcecao] )
		SELECT									GETDATE(),		'+',			11, 			[IdTituloCobranca], [IdResponsavel], [IdAluno], [DataEmissao], [DataVencimento], [StImpresso], [IdFormaRecebimento], [IdTipoCalculoMultaJuros], [SituacaoTituloCobranca], [DataBaixa], [TipoLiquidacao], [LIQ_ValorRecebidoAMaior], [StPagoPelaSeguradora], [Comentario], [DataPagamento], [LIQ_DataDevolucaoRecebidoAMaior], [DataValidade], [LIQ_IdConta], [Audit_IdUsuarioLiquidacao], [Audit_DataHoraLiquidacao], [Audit_ComentarioLiquidacao], [LIQ_IdContaDevolucaoRecebidoAMaior], [IdAgenteCobrancaRegistrada], [SituacaoCobrancaRegistrada], [StEmailEnviado], [NossoNumeroMigracao], [LIQ_IdChequeDevolucaoRecebidoAMaior], [LinkDoBoleto], [IdTituloNoAgente], [CobRegistrada_StAvisoPendente], [LIQ_IdContaRecebimentoCaixaOperadoraCartao], [DataHoraUltimaAlteracao], [StPermitePagarRecebOnlineExcecao] FROM TbTituloCobranca 
	GO 

	
	

	
	
	
--3 CREATE TRIGGER na PK Tabela base -------------------------------------------
	SET ANSI_NULLS ON
	GO 
	
	SET QUOTED_IDENTIFIER ON
	GO 
	
	--
	-- Activesoft Consultoria 
	-- TRIGGER criada pelo Activesoft Service Pack em 21/01/2020 durante atualização para versão 1.065.xxx.
	--
	
	
	CREATE TRIGGER [dbo].[TgTituloCobranca_Auditoria] ON [dbo].[TbTituloCobranca]
	--ALTER TRIGGER [dbo].[TgTituloCobranca_Auditoria] ON [dbo].[TbTituloCobranca]
	FOR INSERT, UPDATE, DELETE
	AS
	BEGIN
		SET NOCOUNT ON
	
		IF ( SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS c WHERE DATA_TYPE NOT IN ( 'text', 'image' ) AND TABLE_NAME = 'TbTituloCobranca' AND LEFT(COLUMN_NAME,1) <> '_' ) <> 33 
		  BEGIN
			RAISERROR ('Dados não podem ser alterados (trigger de auditoria TgTituloCobranca_Auditoria inválida -- quantidade de campos)', 16, 1) 
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
	
	
		IF ( @TipoOperacao = 'D' )
			INSERT	TbTituloCobranca_Auditoria (	Audit_DataHora,	Audit_Operacao,	Audit_IdUsuario,	[IdTituloCobranca], [IdResponsavel], [IdAluno], [DataEmissao], [DataVencimento], [StImpresso], [IdFormaRecebimento], [IdTipoCalculoMultaJuros], [SituacaoTituloCobranca], [DataBaixa], [TipoLiquidacao], [LIQ_ValorRecebidoAMaior], [StPagoPelaSeguradora], [Comentario], [DataPagamento], [LIQ_DataDevolucaoRecebidoAMaior], [DataValidade], [LIQ_IdConta], [Audit_IdUsuarioLiquidacao], [Audit_DataHoraLiquidacao], [Audit_ComentarioLiquidacao], [LIQ_IdContaDevolucaoRecebidoAMaior], [IdAgenteCobrancaRegistrada], [SituacaoCobrancaRegistrada], [StEmailEnviado], [NossoNumeroMigracao], [LIQ_IdChequeDevolucaoRecebidoAMaior], [LinkDoBoleto], [IdTituloNoAgente], [CobRegistrada_StAvisoPendente], [LIQ_IdContaRecebimentoCaixaOperadoraCartao], [DataHoraUltimaAlteracao], [StPermitePagarRecebOnlineExcecao] )
			SELECT									GETDATE(),		@TipoOperacao,	@IdUsuario, 		[IdTituloCobranca], [IdResponsavel], [IdAluno], [DataEmissao], [DataVencimento], [StImpresso], [IdFormaRecebimento], [IdTipoCalculoMultaJuros], [SituacaoTituloCobranca], [DataBaixa], [TipoLiquidacao], [LIQ_ValorRecebidoAMaior], [StPagoPelaSeguradora], [Comentario], [DataPagamento], [LIQ_DataDevolucaoRecebidoAMaior], [DataValidade], [LIQ_IdConta], [Audit_IdUsuarioLiquidacao], [Audit_DataHoraLiquidacao], [Audit_ComentarioLiquidacao], [LIQ_IdContaDevolucaoRecebidoAMaior], [IdAgenteCobrancaRegistrada], [SituacaoCobrancaRegistrada], [StEmailEnviado], [NossoNumeroMigracao], [LIQ_IdChequeDevolucaoRecebidoAMaior], [LinkDoBoleto], [IdTituloNoAgente], [CobRegistrada_StAvisoPendente], [LIQ_IdContaRecebimentoCaixaOperadoraCartao], [DataHoraUltimaAlteracao], [StPermitePagarRecebOnlineExcecao]
			FROM	deleted
		ELSE
			INSERT	TbTituloCobranca_Auditoria (	Audit_DataHora,	Audit_Operacao,	Audit_IdUsuario,	[IdTituloCobranca], [IdResponsavel], [IdAluno], [DataEmissao], [DataVencimento], [StImpresso], [IdFormaRecebimento], [IdTipoCalculoMultaJuros], [SituacaoTituloCobranca], [DataBaixa], [TipoLiquidacao], [LIQ_ValorRecebidoAMaior], [StPagoPelaSeguradora], [Comentario], [DataPagamento], [LIQ_DataDevolucaoRecebidoAMaior], [DataValidade], [LIQ_IdConta], [Audit_IdUsuarioLiquidacao], [Audit_DataHoraLiquidacao], [Audit_ComentarioLiquidacao], [LIQ_IdContaDevolucaoRecebidoAMaior], [IdAgenteCobrancaRegistrada], [SituacaoCobrancaRegistrada], [StEmailEnviado], [NossoNumeroMigracao], [LIQ_IdChequeDevolucaoRecebidoAMaior], [LinkDoBoleto], [IdTituloNoAgente], [CobRegistrada_StAvisoPendente], [LIQ_IdContaRecebimentoCaixaOperadoraCartao], [DataHoraUltimaAlteracao], [StPermitePagarRecebOnlineExcecao] )
			SELECT									GETDATE(),		@TipoOperacao,	@IdUsuario, 		[IdTituloCobranca], [IdResponsavel], [IdAluno], [DataEmissao], [DataVencimento], [StImpresso], [IdFormaRecebimento], [IdTipoCalculoMultaJuros], [SituacaoTituloCobranca], [DataBaixa], [TipoLiquidacao], [LIQ_ValorRecebidoAMaior], [StPagoPelaSeguradora], [Comentario], [DataPagamento], [LIQ_DataDevolucaoRecebidoAMaior], [DataValidade], [LIQ_IdConta], [Audit_IdUsuarioLiquidacao], [Audit_DataHoraLiquidacao], [Audit_ComentarioLiquidacao], [LIQ_IdContaDevolucaoRecebidoAMaior], [IdAgenteCobrancaRegistrada], [SituacaoCobrancaRegistrada], [StEmailEnviado], [NossoNumeroMigracao], [LIQ_IdChequeDevolucaoRecebidoAMaior], [LinkDoBoleto], [IdTituloNoAgente], [CobRegistrada_StAvisoPendente], [LIQ_IdContaRecebimentoCaixaOperadoraCartao], [DataHoraUltimaAlteracao], [StPermitePagarRecebOnlineExcecao]
			FROM	inserted
	END
	GO

	
	
	
--4 DROP TRIGGERs ANTIGA ON PK Tabela base -------------------------------------------
	DROP TRIGGER [dbo].[TgAudit_TbTituloCobrancaD]
	GO
	
	DROP TRIGGER [dbo].[TgAudit_TbTituloCobrancaI]
	GO
	
	DROP TRIGGER [dbo].[TgAudit_TbTituloCobrancaU]
	GO

	
	

	
--5 CREATE FUNCTION usadas pela consulta da nova auditoria -------------------------------------------

	CREATE FUNCTION FnAuditoria_Date(
		@CampoTitulo VARCHAR(96),
		@CampoValorAntigo SMALLDATETIME,
		@CampoValorNovo SMALLDATETIME,
	    @StExibirDiff BIT)
	RETURNS VARCHAR(128) AS
	BEGIN
		DECLARE @ValorAntigo VARCHAR(64), @ValorNovo VARCHAR(64)
		SET @ValorAntigo = ISNULL( REPLACE( CONVERT( VARCHAR(20), @CampoValorAntigo, 103 ) + ' ' + CONVERT( VARCHAR, @CampoValorAntigo, 114 ), ' 00:00:00:000', '' ), '<nulo>' )
		SET @ValorNovo = ISNULL( REPLACE( CONVERT( VARCHAR(20), @CampoValorNovo, 103 ) + ' ' + CONVERT( VARCHAR, @CampoValorNovo, 114 ), ' 00:00:00:000', '' ), '<nulo>' )
	
		IF @StExibirDiff = 1 AND @ValorAntigo <> @ValorNovo
			RETURN @CampoTitulo + ': ' + @ValorAntigo + ' --> ' + @ValorNovo + CHAR(13)
	
	    IF @StExibirDiff = 0
	        RETURN @CampoTitulo + ': ' + @ValorNovo + CHAR(13)
	
		RETURN ''
	END
	GO


	CREATE FUNCTION FnAuditoria_String(
		@CampoTitulo VARCHAR(96),
		@CampoValorAntigo VARCHAR(8000),
		@CampoValorNovo VARCHAR(8000),
	    @StExibirDiff BIT)
	RETURNS VARCHAR(8000) AS
	BEGIN
		DECLARE @ValorAntigo VARCHAR(8000), @ValorNovo VARCHAR(8000)
	
		SET @ValorAntigo = ISNULL( CONVERT( VARCHAR(8000), @CampoValorAntigo ), '<nulo>' )
		SET @ValorNovo = ISNULL( CONVERT( VARCHAR(8000), @CampoValorNovo ), '<nulo>' )
	
		IF @StExibirDiff = 1 AND @ValorAntigo <> @ValorNovo
	        RETURN @CampoTitulo + ': ' + @ValorAntigo + ' --> ' + @ValorNovo + CHAR(13)
	
	    IF @StExibirDiff = 0
	        RETURN @CampoTitulo + ': ' + @ValorNovo + CHAR(13)
	
		RETURN ''
	END
	GO
	
	
	CREATE FUNCTION FnAuditoria_Bool(
		@CampoTitulo VARCHAR(96),
		@CampoValorAntigo BIT,
		@CampoValorNovo BIT,
	    @StExibirDiff BIT)
	RETURNS VARCHAR(128) AS
	BEGIN
		DECLARE @ValorAntigo VARCHAR(6), @ValorNovo VARCHAR(6)
	
	    SET @ValorAntigo = (CASE @CampoValorAntigo WHEN 1 THEN 'Sim' WHEN 0 THEN 'Não' ELSE '<nulo>' END)
		SET @ValorNovo = (CASE @CampoValorNovo WHEN 1 THEN 'Sim' WHEN 0 THEN 'Não' ELSE '<nulo>' END)
	
		IF @StExibirDiff = 1 AND @ValorAntigo <> @ValorNovo
	        RETURN @CampoTitulo + ': ' + @ValorAntigo + ' --> ' + @ValorNovo + CHAR(13)
	
	    IF @StExibirDiff = 0
	        RETURN @CampoTitulo + ': ' + @ValorNovo + CHAR(13)
	
		RETURN ''
	END
	GO

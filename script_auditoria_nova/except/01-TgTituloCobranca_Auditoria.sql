
--
-- Activesoft Consultoria 
-- TRIGGER criada pelo Activesoft Service Pack em 22/02/2022 durante atualização para versão 1.065.215.
--


CREATE TRIGGER [dbo].[TgTituloCobranca_Auditoria] ON [dbo].[TbTituloCobranca]
	--ALTER TRIGGER [dbo].[TgTituloCobranca_Auditoria] ON [dbo].[TbTituloCobranca]
FOR INSERT, UPDATE, DELETE
AS
BEGIN
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

	
	IF ( @TipoOperacao = 'D' )
		INSERT	TbTituloCobranca_Auditoria (	Audit_DataHora,	Audit_Operacao,	Audit_IdUsuario,	[IdTituloCobranca], [IdResponsavel], [IdAluno], [DataEmissao], [DataVencimento], [StImpresso], [IdFormaRecebimento], [IdTipoCalculoMultaJuros], [SituacaoTituloCobranca], [DataBaixa], [TipoLiquidacao], [LIQ_ValorRecebidoAMaior], [StPagoPelaSeguradora], [Comentario], [DataPagamento], [LIQ_DataDevolucaoRecebidoAMaior], [DataValidade], [LIQ_IdConta], [Audit_IdUsuarioLiquidacao], [Audit_DataHoraLiquidacao], [Audit_ComentarioLiquidacao], [LIQ_IdContaDevolucaoRecebidoAMaior], [IdAgenteCobrancaRegistrada], [SituacaoCobrancaRegistrada], [StEmailEnviado], [NossoNumeroMigracao], [LIQ_IdChequeDevolucaoRecebidoAMaior], [LinkDoBoleto], [IdTituloNoAgente], [CobRegistrada_StAvisoPendente], [LIQ_IdContaRecebimentoCaixaOperadoraCartao], [DataHoraUltimaAlteracao], [StPermitePagarRecebOnlineExcecao] )
			SELECT								GETDATE(),		@TipoOperacao,	@IdUsuario, 		[IdTituloCobranca], [IdResponsavel], [IdAluno], [DataEmissao], [DataVencimento], [StImpresso], [IdFormaRecebimento], [IdTipoCalculoMultaJuros], [SituacaoTituloCobranca], [DataBaixa], [TipoLiquidacao], [LIQ_ValorRecebidoAMaior], [StPagoPelaSeguradora], [Comentario], [DataPagamento], [LIQ_DataDevolucaoRecebidoAMaior], [DataValidade], [LIQ_IdConta], [Audit_IdUsuarioLiquidacao], [Audit_DataHoraLiquidacao], [Audit_ComentarioLiquidacao], [LIQ_IdContaDevolucaoRecebidoAMaior], [IdAgenteCobrancaRegistrada], [SituacaoCobrancaRegistrada], [StEmailEnviado], [NossoNumeroMigracao], [LIQ_IdChequeDevolucaoRecebidoAMaior], [LinkDoBoleto], [IdTituloNoAgente], [CobRegistrada_StAvisoPendente], [LIQ_IdContaRecebimentoCaixaOperadoraCartao], [DataHoraUltimaAlteracao], [StPermitePagarRecebOnlineExcecao]
			FROM	deleted
	ELSE
		INSERT	TbTituloCobranca_Auditoria (	Audit_DataHora,	Audit_Operacao,	Audit_IdUsuario,	[IdTituloCobranca], [IdResponsavel], [IdAluno], [DataEmissao], [DataVencimento], [StImpresso], [IdFormaRecebimento], [IdTipoCalculoMultaJuros], [SituacaoTituloCobranca], [DataBaixa], [TipoLiquidacao], [LIQ_ValorRecebidoAMaior], [StPagoPelaSeguradora], [Comentario], [DataPagamento], [LIQ_DataDevolucaoRecebidoAMaior], [DataValidade], [LIQ_IdConta], [Audit_IdUsuarioLiquidacao], [Audit_DataHoraLiquidacao], [Audit_ComentarioLiquidacao], [LIQ_IdContaDevolucaoRecebidoAMaior], [IdAgenteCobrancaRegistrada], [SituacaoCobrancaRegistrada], [StEmailEnviado], [NossoNumeroMigracao], [LIQ_IdChequeDevolucaoRecebidoAMaior], [LinkDoBoleto], [IdTituloNoAgente], [CobRegistrada_StAvisoPendente], [LIQ_IdContaRecebimentoCaixaOperadoraCartao], [DataHoraUltimaAlteracao], [StPermitePagarRecebOnlineExcecao] )
			SELECT								GETDATE(),		@TipoOperacao,	@IdUsuario, 		[IdTituloCobranca], [IdResponsavel], [IdAluno], [DataEmissao], [DataVencimento], [StImpresso], [IdFormaRecebimento], [IdTipoCalculoMultaJuros], [SituacaoTituloCobranca], [DataBaixa], [TipoLiquidacao], [LIQ_ValorRecebidoAMaior], [StPagoPelaSeguradora], [Comentario], [DataPagamento], [LIQ_DataDevolucaoRecebidoAMaior], [DataValidade], [LIQ_IdConta], [Audit_IdUsuarioLiquidacao], [Audit_DataHoraLiquidacao], [Audit_ComentarioLiquidacao], [LIQ_IdContaDevolucaoRecebidoAMaior], [IdAgenteCobrancaRegistrada], [SituacaoCobrancaRegistrada], [StEmailEnviado], [NossoNumeroMigracao], [LIQ_IdChequeDevolucaoRecebidoAMaior], [LinkDoBoleto], [IdTituloNoAgente], [CobRegistrada_StAvisoPendente], [LIQ_IdContaRecebimentoCaixaOperadoraCartao], [DataHoraUltimaAlteracao], [StPermitePagarRecebOnlineExcecao]
			FROM	inserted
		EXCEPT
			SELECT								GETDATE(),		@TipoOperacao,	@IdUsuario, 		[IdTituloCobranca], [IdResponsavel], [IdAluno], [DataEmissao], [DataVencimento], [StImpresso], [IdFormaRecebimento], [IdTipoCalculoMultaJuros], [SituacaoTituloCobranca], [DataBaixa], [TipoLiquidacao], [LIQ_ValorRecebidoAMaior], [StPagoPelaSeguradora], [Comentario], [DataPagamento], [LIQ_DataDevolucaoRecebidoAMaior], [DataValidade], [LIQ_IdConta], [Audit_IdUsuarioLiquidacao], [Audit_DataHoraLiquidacao], [Audit_ComentarioLiquidacao], [LIQ_IdContaDevolucaoRecebidoAMaior], [IdAgenteCobrancaRegistrada], [SituacaoCobrancaRegistrada], [StEmailEnviado], [NossoNumeroMigracao], [LIQ_IdChequeDevolucaoRecebidoAMaior], [LinkDoBoleto], [IdTituloNoAgente], [CobRegistrada_StAvisoPendente], [LIQ_IdContaRecebimentoCaixaOperadoraCartao], [DataHoraUltimaAlteracao], [StPermitePagarRecebOnlineExcecao]
			FROM	deleted
END


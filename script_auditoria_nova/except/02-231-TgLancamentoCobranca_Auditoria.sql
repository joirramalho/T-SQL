
--
-- Activesoft Consultoria 
-- TRIGGER criada pelo Activesoft Service Pack em 25/02/2022 durante atualização para versão 1.065.216.
--


ALTER TRIGGER [dbo].[TgLancamentoCobranca_Auditoria] ON [dbo].[TbLancamentoCobranca]
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

		
	IF ( SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS c WHERE DATA_TYPE NOT IN ( 'text', 'image' ) AND TABLE_NAME = 'TbLancamentoCobranca' AND LEFT(COLUMN_NAME,1) <> '_' ) <> 31 
	  BEGIN
		RAISERROR ('Dados não podem ser alterados (trigger de auditoria TgLancamentoCobranca_Auditoria inválida -- quantidade de campos)', 16, 1) 
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
		INSERT	TbLancamentoCobranca_Auditoria (	Audit_DataHora,	Audit_Operacao,	Audit_IdUsuario,	[IdLancamentoCobranca], [IdTituloCobrancaGerado], [IdUnidade], [ParcelaCobranca], [IdLoteCobranca], [IdServico], [ValorServico], [LIQ_ValorDescontoNaoCondicionado], [LIQ_ValorDescontoCondicionado], [LIQ_ValorDescontoConcedido], [LIQ_ValorMultaCalculado], [LIQ_ValorJurosCalculado], [LIQ_ValorRecebidoPrincipal], [LIQ_ValorRecebidoMulta], [LIQ_ValorRecebidoJuros], [LIQ_ValorPendenteAMenor], [IdTurma], [IdAlunoTaxa], [StCobrancaServicoFinanceiro], [StTurmaTaxaRemovido], [LIQ_DataDevolucao], [DataFaturamento], [NFe_NumeroRPS], [NFe_IdEmpresaRPS], [NFe_AnoMesCompetenciaRPS], [IdAlunoTurmaReserva], [LIQ_IdContaDevolucao], [IdAlunoServico], [LIQ_IdChequeDevolucao], [IdDisciplina], [IdNotaFiscal] )
			SELECT									GETDATE(),		@TipoOperacao,	@IdUsuario, 		[IdLancamentoCobranca], [IdTituloCobrancaGerado], [IdUnidade], [ParcelaCobranca], [IdLoteCobranca], [IdServico], [ValorServico], [LIQ_ValorDescontoNaoCondicionado], [LIQ_ValorDescontoCondicionado], [LIQ_ValorDescontoConcedido], [LIQ_ValorMultaCalculado], [LIQ_ValorJurosCalculado], [LIQ_ValorRecebidoPrincipal], [LIQ_ValorRecebidoMulta], [LIQ_ValorRecebidoJuros], [LIQ_ValorPendenteAMenor], [IdTurma], [IdAlunoTaxa], [StCobrancaServicoFinanceiro], [StTurmaTaxaRemovido], [LIQ_DataDevolucao], [DataFaturamento], [NFe_NumeroRPS], [NFe_IdEmpresaRPS], [NFe_AnoMesCompetenciaRPS], [IdAlunoTurmaReserva], [LIQ_IdContaDevolucao], [IdAlunoServico], [LIQ_IdChequeDevolucao], [IdDisciplina], [IdNotaFiscal]
			FROM	deleted
	ELSE
		INSERT	TbLancamentoCobranca_Auditoria (	Audit_DataHora,	Audit_Operacao,	Audit_IdUsuario,	[IdLancamentoCobranca], [IdTituloCobrancaGerado], [IdUnidade], [ParcelaCobranca], [IdLoteCobranca], [IdServico], [ValorServico], [LIQ_ValorDescontoNaoCondicionado], [LIQ_ValorDescontoCondicionado], [LIQ_ValorDescontoConcedido], [LIQ_ValorMultaCalculado], [LIQ_ValorJurosCalculado], [LIQ_ValorRecebidoPrincipal], [LIQ_ValorRecebidoMulta], [LIQ_ValorRecebidoJuros], [LIQ_ValorPendenteAMenor], [IdTurma], [IdAlunoTaxa], [StCobrancaServicoFinanceiro], [StTurmaTaxaRemovido], [LIQ_DataDevolucao], [DataFaturamento], [NFe_NumeroRPS], [NFe_IdEmpresaRPS], [NFe_AnoMesCompetenciaRPS], [IdAlunoTurmaReserva], [LIQ_IdContaDevolucao], [IdAlunoServico], [LIQ_IdChequeDevolucao], [IdDisciplina], [IdNotaFiscal] )
			SELECT									GETDATE(),		@TipoOperacao,	@IdUsuario, 		[IdLancamentoCobranca], [IdTituloCobrancaGerado], [IdUnidade], [ParcelaCobranca], [IdLoteCobranca], [IdServico], [ValorServico], [LIQ_ValorDescontoNaoCondicionado], [LIQ_ValorDescontoCondicionado], [LIQ_ValorDescontoConcedido], [LIQ_ValorMultaCalculado], [LIQ_ValorJurosCalculado], [LIQ_ValorRecebidoPrincipal], [LIQ_ValorRecebidoMulta], [LIQ_ValorRecebidoJuros], [LIQ_ValorPendenteAMenor], [IdTurma], [IdAlunoTaxa], [StCobrancaServicoFinanceiro], [StTurmaTaxaRemovido], [LIQ_DataDevolucao], [DataFaturamento], [NFe_NumeroRPS], [NFe_IdEmpresaRPS], [NFe_AnoMesCompetenciaRPS], [IdAlunoTurmaReserva], [LIQ_IdContaDevolucao], [IdAlunoServico], [LIQ_IdChequeDevolucao], [IdDisciplina], [IdNotaFiscal]
			FROM	inserted
		EXCEPT
			SELECT									GETDATE(),		@TipoOperacao,	@IdUsuario, 		[IdLancamentoCobranca], [IdTituloCobrancaGerado], [IdUnidade], [ParcelaCobranca], [IdLoteCobranca], [IdServico], [ValorServico], [LIQ_ValorDescontoNaoCondicionado], [LIQ_ValorDescontoCondicionado], [LIQ_ValorDescontoConcedido], [LIQ_ValorMultaCalculado], [LIQ_ValorJurosCalculado], [LIQ_ValorRecebidoPrincipal], [LIQ_ValorRecebidoMulta], [LIQ_ValorRecebidoJuros], [LIQ_ValorPendenteAMenor], [IdTurma], [IdAlunoTaxa], [StCobrancaServicoFinanceiro], [StTurmaTaxaRemovido], [LIQ_DataDevolucao], [DataFaturamento], [NFe_NumeroRPS], [NFe_IdEmpresaRPS], [NFe_AnoMesCompetenciaRPS], [IdAlunoTurmaReserva], [LIQ_IdContaDevolucao], [IdAlunoServico], [LIQ_IdChequeDevolucao], [IdDisciplina], [IdNotaFiscal]
			FROM	deleted
END


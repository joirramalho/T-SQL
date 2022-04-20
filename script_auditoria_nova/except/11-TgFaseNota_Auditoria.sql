
--
-- Activesoft Consultoria 
-- TRIGGER criada pelo Activesoft Service Pack em 07/03/2022 durante atualização para versão 1.065.217.
--


CREATE TRIGGER [dbo].[TgFaseNota_Auditoria] ON [dbo].[TbFaseNota]
-- ALTER TRIGGER [dbo].[TgFaseNota_Auditoria] ON [dbo].[TbFaseNota]
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
		

	IF ( SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS c WHERE DATA_TYPE NOT IN ( 'text', 'image' ) AND TABLE_NAME = 'TbFaseNota' AND LEFT(COLUMN_NAME,1) <> '_' ) <> 38
	BEGIN
		RAISERROR ('Dados não podem ser alterados (trigger de auditoria TgFaseNota_Auditoria inválida)', 16, 1) 
		ROLLBACK TRANSACTION 
		RETURN 
	END 


	DECLARE @IdUsuario INTEGER
	IF OBJECT_ID( 'tempdb..#TempTable' ) IS NOT NULL
	BEGIN	
		SELECT @IdUsuario = IdUsuario FROM #TempTable

        IF @IdUsuario IS NULL
          BEGIN
            RAISERROR ('A auditoria não está funcionando corretamente. Entre em contato com o suporte técnico.', 16, 1 )
            ROLLBACK TRANSACTION
            RETURN
          END
	END
	ELSE
	BEGIN
		SET @IdUsuario = NULL
	END


	IF ( @TipoOperacao = 'D' )
		INSERT	TbFaseNota_Auditoria ( 	DataHora, 	Operacao, 		IdUsuario, IdFaseNota, IdPeriodo, IdSerie, NumeroFase, NomeFase, CabecBoletim, ImprimirBoletimNotaParcial, ImprimirBoletimNPNaoConfirmada, ImprimirBoletimNota, ImprimirBoletimFaltas, StFaseInformada, StCalcularDisciplinaComposta, IdFormulaComposicaoNota, IdFormulaNota, MediaMinimaAprovacao, ValorArredondamentoMedia, IdFormulaAprovacao, IdFormulaFalta, IdFaseNotaAprovacao, IdFaseNotaReprovacao, DataInicioExibicao, NumeroOrdemExibicao, NumeroSemanasLetivas, StCalcularSituacaoGeral, IdFormulaAprovacaoFrequencia, ValorNotaMaxima, DataInicialPeriodoAula, DataFinalPeriodoAula, StCalcDiscCompUtilizaFormulaFN, DataLimiteDigitacaoNota, NumeroDiasLetivos, StDispensarNotaAutomatica, TipoDispensaAutomatica, StConfirmarDispensaAutomatica, SituacaoReprovadoFrequencia, SituacaoAprovado, SituacaoReprovado, StFaseNotaSempreCalcular )
			SELECT						GETDATE(), 	@TipoOperacao, @IdUsuario, IdFaseNota, IdPeriodo, IdSerie, NumeroFase, NomeFase, CabecBoletim, ImprimirBoletimNotaParcial, ImprimirBoletimNPNaoConfirmada, ImprimirBoletimNota, ImprimirBoletimFaltas, StFaseInformada, StCalcularDisciplinaComposta, IdFormulaComposicaoNota, IdFormulaNota, MediaMinimaAprovacao, ValorArredondamentoMedia, IdFormulaAprovacao, IdFormulaFalta, IdFaseNotaAprovacao, IdFaseNotaReprovacao, DataInicioExibicao, NumeroOrdemExibicao, NumeroSemanasLetivas, StCalcularSituacaoGeral, IdFormulaAprovacaoFrequencia, ValorNotaMaxima, DataInicialPeriodoAula, DataFinalPeriodoAula, StCalcDiscCompUtilizaFormulaFN, DataLimiteDigitacaoNota, NumeroDiasLetivos, StDispensarNotaAutomatica, TipoDispensaAutomatica, StConfirmarDispensaAutomatica, SituacaoReprovadoFrequencia, SituacaoAprovado, SituacaoReprovado, StFaseNotaSempreCalcular
			FROM	deleted
	ELSE
		INSERT	TbFaseNota_Auditoria ( 	DataHora, 	Operacao, 		IdUsuario, IdFaseNota, IdPeriodo, IdSerie, NumeroFase, NomeFase, CabecBoletim, ImprimirBoletimNotaParcial, ImprimirBoletimNPNaoConfirmada, ImprimirBoletimNota, ImprimirBoletimFaltas, StFaseInformada, StCalcularDisciplinaComposta, IdFormulaComposicaoNota, IdFormulaNota, MediaMinimaAprovacao, ValorArredondamentoMedia, IdFormulaAprovacao, IdFormulaFalta, IdFaseNotaAprovacao, IdFaseNotaReprovacao, DataInicioExibicao, NumeroOrdemExibicao, NumeroSemanasLetivas, StCalcularSituacaoGeral, IdFormulaAprovacaoFrequencia, ValorNotaMaxima, DataInicialPeriodoAula, DataFinalPeriodoAula, StCalcDiscCompUtilizaFormulaFN, DataLimiteDigitacaoNota, NumeroDiasLetivos, StDispensarNotaAutomatica, TipoDispensaAutomatica, StConfirmarDispensaAutomatica, SituacaoReprovadoFrequencia, SituacaoAprovado, SituacaoReprovado, StFaseNotaSempreCalcular )
			SELECT						GETDATE(), 	@TipoOperacao, @IdUsuario, IdFaseNota, IdPeriodo, IdSerie, NumeroFase, NomeFase, CabecBoletim, ImprimirBoletimNotaParcial, ImprimirBoletimNPNaoConfirmada, ImprimirBoletimNota, ImprimirBoletimFaltas, StFaseInformada, StCalcularDisciplinaComposta, IdFormulaComposicaoNota, IdFormulaNota, MediaMinimaAprovacao, ValorArredondamentoMedia, IdFormulaAprovacao, IdFormulaFalta, IdFaseNotaAprovacao, IdFaseNotaReprovacao, DataInicioExibicao, NumeroOrdemExibicao, NumeroSemanasLetivas, StCalcularSituacaoGeral, IdFormulaAprovacaoFrequencia, ValorNotaMaxima, DataInicialPeriodoAula, DataFinalPeriodoAula, StCalcDiscCompUtilizaFormulaFN, DataLimiteDigitacaoNota, NumeroDiasLetivos, StDispensarNotaAutomatica, TipoDispensaAutomatica, StConfirmarDispensaAutomatica, SituacaoReprovadoFrequencia, SituacaoAprovado, SituacaoReprovado, StFaseNotaSempreCalcular
			FROM	inserted
		EXCEPT
			SELECT						GETDATE(), 	@TipoOperacao, @IdUsuario, IdFaseNota, IdPeriodo, IdSerie, NumeroFase, NomeFase, CabecBoletim, ImprimirBoletimNotaParcial, ImprimirBoletimNPNaoConfirmada, ImprimirBoletimNota, ImprimirBoletimFaltas, StFaseInformada, StCalcularDisciplinaComposta, IdFormulaComposicaoNota, IdFormulaNota, MediaMinimaAprovacao, ValorArredondamentoMedia, IdFormulaAprovacao, IdFormulaFalta, IdFaseNotaAprovacao, IdFaseNotaReprovacao, DataInicioExibicao, NumeroOrdemExibicao, NumeroSemanasLetivas, StCalcularSituacaoGeral, IdFormulaAprovacaoFrequencia, ValorNotaMaxima, DataInicialPeriodoAula, DataFinalPeriodoAula, StCalcDiscCompUtilizaFormulaFN, DataLimiteDigitacaoNota, NumeroDiasLetivos, StDispensarNotaAutomatica, TipoDispensaAutomatica, StConfirmarDispensaAutomatica, SituacaoReprovadoFrequencia, SituacaoAprovado, SituacaoReprovado, StFaseNotaSempreCalcular
			FROM	deleted		
END


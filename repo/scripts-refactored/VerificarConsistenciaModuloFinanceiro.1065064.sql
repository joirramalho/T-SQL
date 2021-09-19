--SELECT * FROM TbUnidade

IF ( SELECT AtualizadorVersaoBD FROM TbParametroGlobal ) % 10 <> 0
  GOTO FIM
------------------------------------------------------------------------------
---- Sistema est� bloqueado?

/*
SET DATEFORMAT DMY
select dbo.FnDataBloqueioOperacoesFinanceiras()


SELECT BloqueioOperacoesFinanceiras_Data FROM TbParametroGlobal
ALTER TABLE TbParametroGlobal DISABLE TRIGGER TgParametroGlobal_ValidarDataBloqueio
UPDATE TbParametroGlobal SET BloqueioOperacoesFinanceiras_Data='31/12/2014' WHERE BloqueioOperacoesFinanceiras_Data<'31/12/2014'
ALTER TABLE TbParametroGlobal ENABLE TRIGGER TgParametroGlobal_ValidarDataBloqueio
*/




------------------------------------------------------------------------------
---- Verificar par�metro da liquida��o a menor
/*
N�o vai mais verificar pois os clientes querem manter da forma atual.

IF EXISTS( 
	SELECT	* 
	FROM	TbParametroGlobal 
	WHERE	CobrarDiferencaLiquidadoMenor = 0	
	)
BEGIN
	RAISERROR( 'Par�metro que define o que deve ser feito caso haja uma liquida��o a menor n�o pode estar na op��o "Avisar" (CRM 63894).', 16, 1 )
	GOTO FIM
END
*/




/*
------------------------------------------------------------------------------
---- Verificar par�metro de reabertura do caixa
IF EXISTS( 
	SELECT	* 
	FROM	TbParametroGlobal 
	WHERE	StPermiteReabrirCaixa = 1 
	)
BEGIN
	RAISERROR( 'Par�metro para permitir a reabertura do caixa ATIVO, convencer o cliente para que n�o seja utilizado. Ver CRM 66022', 16, 1 )
	GOTO FIM
END
*/



------------------------------------------------------------------------------
--FNC001 ---- Verificar se os campos LIQ da TbLCTO est�o preenchidos
IF EXISTS(	SELECT	tc.SituacaoTituloCobranca, lc.*
		FROM	TbLancamentoCobranca lc
		INNER	JOIN TbTituloCobranca tc ON tc.IdTituloCobranca = lc.IdTituloCobrancaGerado
		WHERE	   ( SituacaoTituloCobranca = 'ABE' AND LIQ_ValorRecebidoPrincipal IS NOT NULL )
			OR ( SituacaoTituloCobranca = 'LIQ' AND LIQ_ValorRecebidoPrincipal IS     NULL )
			OR ( SituacaoTituloCobranca = 'INT' AND LIQ_ValorRecebidoPrincipal IS     NULL )
			OR ( SituacaoTituloCobranca = 'CAN' AND LIQ_ValorRecebidoPrincipal IS NOT NULL ) AND 1=CASE WHEN EXISTS( SELECT SiglaUnidade FROM TbUnidade WHERE SiglaUnidade IN ('ETER') ) THEN 0 ELSE 1 END
			OR ( SituacaoTituloCobranca = 'NEG' AND LIQ_ValorRecebidoPrincipal IS NOT NULL ) )
  BEGIN
	RAISERROR ( 'Existem lan�amentos inconsistentes com a situa��o do t�tulo de cobran�a.', 16, 1)
	GOTO FIM
  END



------------------------------------------------------------------------------
--FNC002 ---- O lan�amento de cobran�a foi devolvido antes de ter sido recebido?
IF EXISTS(	SELECT	*
		FROM	TbLancamentoCobranca lc
		INNER	JOIN TbTituloCobranca tc ON tc.IdTituloCobranca = lc.IdTituloCobrancaGerado
		WHERE	NOT ( ( lc.LIQ_DataDevolucao IS NOT NULL AND tc.SituacaoTituloCobranca = 'LIQ' AND lc.LIQ_DataDevolucao >= tc.DataBaixa ) OR
			      ( lc.LIQ_DataDevolucao IS     NULL ) ) )
  BEGIN
	RAISERROR ( 'Data de devolu��o deve ser posterior � data da baixa (liquida��o).', 16, 1 )
	GOTO FIM
  END


------------------------------------------------------------------------------
--FNC003 ---- Verificar a FNC-054.1) Um t�tulo n�o pode ser "desconto integral" contendo descontos condicionados ao pagamento
IF EXISTS(	SELECT	*
		FROM	VwTituloCobranca tc
		WHERE	tc.ValorServico <> tc.ValorDescontoNaoCondicionado AND
			tc.SituacaoTituloCobranca <> 'CAN' AND
			tc.ValorServico = ISNULL( (	SELECT	SUM(lcd.ValorDesconto) 
							FROM	TbLancamentoCobrancaDesconto lcd
							INNER	JOIN TbLancamentoCobranca lc ON lc.IdLancamentoCobranca = lcd.IdLancamentoCobranca
							WHERE	lc.IdTituloCobrancaGerado = tc.IdTituloCobranca ), 0 )
			-- Clientes que possuem dados inconsistentes devido a migra��o
			AND 1=CASE WHEN EXISTS( SELECT SiglaUnidade FROM TbUnidade WHERE SiglaUnidade IN ('CPEC','SALE_CNSA','CONTEMP1','CEIZONASUL','PPASSO','ARTCRESCER','IMACOMARIA','CEFRAN','CONFHICSJ','GABARITO', 'FACHO') ) THEN 0 
				   WHEN EXISTS( SELECT SiglaUnidade FROM TbUnidade WHERE SiglaUnidade IN ('FACHO','EDUCAR_SE') ) AND YEAR( tc.DataVencimento ) <= 2015 THEN 0 
			      ELSE 1 END
		)
  BEGIN
	RAISERROR( 'Um t�tulo n�o pode ser "desconto integral" contendo descontos condicionados ao pagamento.', 16, 1)
	GOTO FIM
  END
   


------------------------------------------------------------------------------
--FNC004 ---- Verificar se tem desconto condicionado com data limite nula e vice-versa
IF EXISTS( 
	SELECT	TOP 10 *
	FROM	TbLancamentoCobrancaDesconto lcd
	INNER	JOIN TbAbatimento a ON a.IdAbatimento = lcd.IdAbatimento
	WHERE	( ( lcd.DataLimiteConcessaoDesconto IS     NULL AND a.TipoDesconto <> 'NAOCOND' ) OR
		  ( lcd.DataLimiteConcessaoDesconto IS NOT NULL AND a.TipoDesconto =  'NAOCOND' ) )
	)
BEGIN
	RAISERROR( 'Desconto condicionado com data limite nula e vice-versa', 16, 1)
	GOTO FIM
END




------------------------------------------------------------------------------
---- Inconsist�ncia entre LctoCob e LctoCobDesc

SET NOCOUNT ON

IF object_id('tempdb..#tempInconsistenciaLctoCobLctoCobDesc') is not null
  DROP TABLE #tempInconsistenciaLctoCobLctoCobDesc

SELECT	NomeAluno,
	NomeServico, 
	SituacaoTituloCobranca,
	DataFaturamento,
	ValorServico, 
	SomaDescontoNaoCond, 
	LIQ_ValorDescontoNaoCondicionado, LIQ_ValorDescontoConcedido, LIQ_ValorDescontoCondicionado, 
	IdLancamentoCobranca, IdTituloCobrancaGerado, t.IdUnidade, ParcelaCobranca, IdLoteCobranca, IdServico, LIQ_ValorMultaCalculado, LIQ_ValorJurosCalculado, LIQ_ValorRecebidoPrincipal, LIQ_ValorRecebidoMulta, LIQ_ValorRecebidoJuros, LIQ_ValorPendenteAMenor, LIQ_DataDevolucao, LIQ_IdContaDevolucao, LIQ_NomeContaDevolucao, IdTurma, IdAlunoTaxa, IdAlunoServico, StCobrancaServicoFinanceiro, StTurmaTaxaRemovido, IdAlunoTurmaReserva, NFe_NumeroRPS, NFe_IdEmpresaRPS, NFe_AnoMesCompetenciaRPS, IdTituloCobranca, DataEmissao, DataVencimento, StImpresso, IdFormaRecebimento, IdTipoCalculoMultaJuros, DataBaixa, DataPagamento, TipoLiquidacao, LIQ_ValorRecebidoAMaior, LIQ_DataDevolucaoRecebidoAMaior, StPagoPelaSeguradora, Comentario, TbServicoIdEmpresa, TbServicoIdUnidade, TbServicoCodigoServicoNFe, TipoServico, PagamentoProporcional, AglutinaTituloCobranca, IdFormaRecebimentoPadrao, CodigoServico, CentroCustoParaExportacao, CodigoAtividadeCNAE, AliquotaISS, Descricao, PercentualMulta, ValorMulta, DiasCarenciaCobrancaMulta, TipoDefinicaoCarenciaCobrancaMulta, PercentualJurosAoMes, ValorJurosAoDia, DiasCarenciaCobrancaJuros, TipoDefinicaoCarenciaCobrancaJuros, TipoContagemDiasCobrancaJuros, AnoMesFaturamento, AnoMesBaixa, AnoMesDevolucao, StAberto, StAbertoEmAtraso, ValorDescontoNaoCondicional, LIQ_ValorDevolvido, DataCompetenciaNegociacao, ValorAReceberHoje, IdAgenteCobrancaRegistrada
INTO	#tempInconsistenciaLctoCobLctoCobDesc
FROM	(
	SELECT	SomaDescontoNaoCond = ( SELECT SUM(ValorDesconto) FROM TbLancamentoCobrancaDesconto lcd WHERE lcd.DataLimiteConcessaoDesconto IS NULL AND lcd.IdLancamentoCobranca=lc.IdLancamentoCobranca ),
		*
	FROM	VwLancamentoCobranca lc
	) t
LEFT	JOIN TbAluno a ON a.IdAluno = t.IdAluno
WHERE	SituacaoTituloCobranca NOT IN ( 'CAN', 'NEG' )
	AND ISNULL(LIQ_ValorDescontoNaoCondicionado,0) <> ISNULL(SomaDescontoNaoCond, 0) 

	-- caso esteja aberto, pode ser que tenha um lan�amento com desconto integral e outro sem desconto... n�o h� inconsist�ncia
	-- AND ( NOT ( SituacaoTituloCobranca='ABE' AND ISNULL(SomaDescontoNaoCond,0)<>( SELECT SUM(ValorServico) FROM TbLancamentoCobranca lc2 WHERE lc2.IdTituloCobrancaGerado=t.IdTituloCobrancaGerado ) ) )

	-- AND DataFaturamento >= '01/01/2015'
	-- n�o alterar lan�amentos que envolvem 2014
	-- AND ( DataBaixa IS NULL OR DataBaixa >= '01/01/2015' )
	-- AND ( LIQ_DataDevolucao IS NULL OR LIQ_DataDevolucao >= '01/01/2015' )
		
	-- Caso esteja 'em aberto' e desconto n�o-condicionado for menor que o valor do servi�o, est� OK
	AND NOT ( SituacaoTituloCobranca = 'ABE' AND ISNULL(SomaDescontoNaoCond, 0) < ValorServico )
	
	-- Caso esteja 'em aberto' o desconto n�o-cond pode ser de 100%, desde que existam mais lan�amentos no t�tulo
	AND NOT ( ( SituacaoTituloCobranca = 'ABE') AND 
	          ( (SELECT COUNT(*) FROM TbLancamentoCobranca lc2 WHERE lc2.IdTituloCobrancaGerado = t.IdTituloCobrancaGerado) > 1 ) AND
	          ( (SELECT ValorServico-ValorDescontoNaoCondicionado FROM VwTituloCobranca tc WHERE tc.IdTituloCobranca=t.IdTituloCobrancaGerado) > 0 ) )

SET NOCOUNT OFF

IF EXISTS( 
	SELECT	*
	FROM	#tempInconsistenciaLctoCobLctoCobDesc

	WHERE	1=CASE	WHEN	EXISTS( SELECT SiglaUnidade FROM TbUnidade WHERE SiglaUnidade IN ('SAGCARUARU','GATTORNO','SALE_ARACA','NEVES','SALE_JUVEN','EVOLUCAO','SALE_IPMA1','SALE_INSA','CEFRAN','CEIZONASUL','SANTAROSA','CPEC', 'AUXIL','SALE_CNSA','CONTEMP1','CONTEMP4','CONTEMP5','SALE_MAZZA') ) THEN
				CASE WHEN DataFaturamento >= '01/01/2015' THEN 1 ELSE 0 END
			WHEN	EXISTS( SELECT SiglaUnidade FROM TbUnidade WHERE SiglaUnidade IN ('IMACOMARIA') ) THEN
				CASE WHEN LIQ_DataDevolucao IS NOT NULL AND LIQ_DataDevolucao < '01/01/2015' THEN 0 ELSE 1 END
			WHEN	EXISTS( SELECT SiglaUnidade FROM TbUnidade WHERE SiglaUnidade IN ('CRISTOREI') ) THEN
				CASE WHEN DataFaturamento >= '01/01/2013' THEN 0 ELSE 1 END
			WHEN	EXISTS( SELECT SiglaUnidade FROM TbUnidade WHERE SiglaUnidade IN ('SMIC_IMA','SMIC_BOSCO','MODULO_AJU' ) ) THEN
				CASE WHEN DataFaturamento >= '01/01/2017' THEN 1 ELSE 0 END
			ELSE 1 END
	)
BEGIN
	RAISERROR( 'Inconsist�ncia entre LctoCob e LctoCobDesc', 16, 1)
	GOTO FIM
END





------------------------------------------------------------------------------
---- Inconsist�ncia entre o saldo do caixa e da conta financeira vinculada -- saldo atual diferente
IF EXISTS( SELECT 1 FROM TbUnidade WHERE ( CHARINDEX( '#CPAGAR#', LicencaModulos ) > 0 ) OR LicencaModulos IS NULL )
	IF EXISTS( 
		SELECT	IdCaixa, NomeCaixa, StAtivo,
			SaldoAtualCaixa, SaldoAtualConta, 
			ValorAEntrarConta = SaldoAtualCaixa - SaldoAtualConta,
			'n�o usar!! UPDATE TbConta SET ValorSaldoInicial = ValorSaldoInicial + ('+CONVERT(VARCHAR,SaldoAtualCaixa - SaldoAtualConta) + ') WHERE IdConta = -'+CONVERT(VARCHAR,IdCaixa)+' AND IdConta < 0'
		FROM	(
			SELECT	IdCaixa, NomeCaixa, StAtivo,
				SaldoAtualCaixa = (	SELECT	SUM(SaldoAtual)
							FROM	VwCaixaSaldo cs
							WHERE	cs.IdCaixaAbertura = ( SELECT MAX(ca.IdCaixaAbertura) FROM TbCaixaAbertura ca WHERE ca.IdCaixa=c.IdCaixa ) ),
				SaldoAtualConta = (	dbo.FnLancamentoFinanceiroSaldoInicial( -c.IdCaixa, CONVERT(SMALLDATETIME,'31/12/2039',103) ) )
			FROM	TbCaixa c
			WHERE	c.StAtivo = 1
			) t
		WHERE	SaldoAtualCaixa <> SaldoAtualConta
		)
	BEGIN
		RAISERROR( 'Inconsist�ncia entre o saldo do caixa e da conta financeira vinculada -- saldo atual diferente', 16, 1)
		GOTO FIM
	END





------------------------------------------------------------------------------
---- Lan�amento de cobran�a referente a servi�o de Antecipa��o com desconto n�o-condicionado
	/*
	Verifica��o:
	
	SELECT	IdSerie, TbSerie.nomeserie, TbSerie.IdServicoMensalidade, Reserva_IdServico, s.NomeServico
	FROM	TbSerie
	LEFT	JOIN TbServico s on s.idservico = TbSerie.Reserva_IdServico 
	WHERE	Reserva_IdServico IS NOT NULL
	ORDER	BY 2
	
	-- UPDATE TbSerie SET Reserva_IdServico = NULL WHERE IdSerie=3
	*/

IF EXISTS( 
	SELECT	lcc.NomeServico, a.NomeAluno, 
		LCD_SomaDescontoNaoCond = ( SELECT SUM(ValorDesconto) FROM TbLancamentoCobrancaDesconto lcd WHERE DataLimiteConcessaoDesconto IS NULL AND lcd.IdLancamentoCobranca=lc.IdLancamentoCobranca ),
		lc.*, lcc.SituacaoTituloCobranca, lcc.DataBaixa
	FROM	TbLancamentoCobranca lc
	LEFT	JOIN VwLancamentoCobrancaContabil lcc ON lcc.IdLancamentoCobranca = lc.IdLancamentoCobranca
	LEFT	JOIN TbAluno a ON a.IdAluno = lcc.IdAluno
	WHERE	lc.DataFaturamento >= CONVERT(SMALLDATETIME,'01/01/2014',103) AND --lcc.AnoMesFaturamento >= 201401 AND
		lc.IdServico IN ( SELECT Reserva_IdServico FROM TbSerie ) AND
		lcc.StFaturamento = 1 AND
		
		--lcc.SituacaoTituloCobranca <> 'ABE' AND

		-- N�o pode ter desconto n�o-condicionado!
		( ISNULL(lcc.ValorDescontoNaoCondicionado,0) > 0 OR
		  ISNULL( ( SELECT SUM(ValorDesconto) FROM TbLancamentoCobrancaDesconto lcd WHERE DataLimiteConcessaoDesconto IS NULL AND lcd.IdLancamentoCobranca=lc.IdLancamentoCobranca ), 0 ) > 0 )

		-- Unidades que devem validar de 2015 em diante
		AND 1=CASE	WHEN	EXISTS( SELECT SiglaUnidade FROM TbUnidade WHERE SiglaUnidade IN ('SALE_SAGCO','CEIMAIS','CEA_ARACA','CIC_ARCO','AMBATREC') ) THEN
					CASE WHEN lc.DataFaturamento >= '01/01/2015' THEN 1 ELSE 0 END
				ELSE 1 END
				
		-- Unidades que n�o devem validar nada
		AND 1=CASE	WHEN	EXISTS( SELECT SiglaUnidade FROM TbUnidade WHERE SiglaUnidade IN ('CULTR_ESPI','JARDINS','IMPACTO','IECE','OVERDOSE','CEFRAN','AMBATREC') ) THEN
					0
				ELSE 1 END
		  
	)
BEGIN
	RAISERROR( 'Lan�amento de cobran�a referente a servi�o de Antecipa��o com desconto n�o-condicionado', 16, 1)
	GOTO FIM
END





------------------------------------------------------------------------------
---- Inconsist�ncia no saldo entre operadora de cart�o e conta vinculada

IF EXISTS (SELECT SiglaUnidade FROM TbUnidade WHERE SiglaUnidade NOT IN ('SALE_MAZZA')) AND (dbo.FnTestaPermissaoLicencaModulos('#CPAGAR#') = 1 ) AND EXISTS( 
	SELECT	*,
		Diferenca = SaldoAtualOperadora - SaldoAtualConta
	FROM	(
		SELECT	*,
			SaldoAtualOperadora = (	SELECT	SUM(Valor)
						FROM	TbCartaoMovimentacao cm
						LEFT	JOIN TbCaixaTipoRecebimento ctr ON ctr.CdTipoRecebimento=cm.CdTipoRecebimento 
						WHERE	cm.Situacao = 'PEN' AND
							ctr.IdCartaoOperadora = c.IdCartaoOperadora ),
			SaldoAtualConta = (	dbo.FnLancamentoFinanceiroSaldoInicial( -1000+-1*IdCartaoOperadora, CONVERT(SMALLDATETIME,'31/12/2039',103) ) )
		FROM	TbCartaoOperadora c
	) t
	WHERE	SaldoAtualOperadora <> SaldoAtualConta
) 
BEGIN
	RAISERROR( 'Inconsist�ncia no saldo entre operadora de cart�o e conta vinculada', 16, 1)
	GOTO FIM
END





------------------------------------------------------------------------------
---- Inconsist�ncia em cheques a retirar do caixa
---- Script: svn SIGA\Script_Clientes\M�dulo 2.01 Contas a receber\CRM 84003 - Inconsist�ncia em cheques a retirar do caixa.sql

IF EXISTS( 
	SELECT	*,
		ValorDiferenca = SaldoAtual - TotalCheques
	FROM	(
		SELECT	c.IdCaixa, c.NomeCaixa, ca.DataHoraAbertura, ca.DataHoraFechamento, ca.IdCaixaAbertura,

			SaldoAtual = ISNULL((	
					SELECT	cs.SaldoAtual 
					FROM	VwCaixaSaldo cs 
					WHERE	cs.IdCaixaAbertura = ca.IdCaixaAbertura AND 
						cs.CdTipoRecebimento = 'CHQ' ), 0 ),

			TotalCheques = ISNULL((
					SELECT	SUM(cl.Valor)
					FROM	TbCaixaLancamento cl
					INNER	JOIN TbCaixaMovimentacao cm ON cm.IdCaixaMovimentacao = cl.IdCaixaMovimentacao
					INNER	JOIN TbCaixaAbertura ca ON ca.IdCaixaAbertura = cm.IdCaixaAbertura
					INNER	JOIN TbCaixa c2 ON c.IdCaixa = ca.IdCaixa
					WHERE	cl.CdCaixaTipoLancamento IN ( 'REC', 'TRF' ) AND
						cl.CdTipoRecebimento = 'CHQ' AND
						( cl.IdCheque IS NULL OR cl.StDeveSerRetirado = 1 ) AND
						c2.IdCaixa = c.IdCaixa ), 0 )

		FROM	TbCaixa c
		INNER	JOIN TbCaixaAbertura ca ON ca.IdCaixaAbertura = ( SELECT MAX(ca2.IdCaixaAbertura) FROM TbCaixaAbertura ca2 WHERE ca2.IdCaixa = c.IdCaixa )
		) t
	WHERE	SaldoAtual - TotalCheques <> 0.00
	AND 1=CASE WHEN EXISTS( SELECT SiglaUnidade FROM TbUnidade WHERE SiglaUnidade IN ('POLICHINE') ) THEN 0 ELSE 1 END
	)
BEGIN
	RAISERROR( 'Inconsist�ncia em cheques a retirar do caixa', 16, 1)
	GOTO FIM
END





------------------------------------------------------------------------------
---- Inconsist�ncia no batimento da contabilidade (verificadas no relat�rio "Resumo da inadimpl�ncia")

IF EXISTS( 
	SELECT	*
	FROM	(
		SELECT	AnoMes, lc.IdAluno, lc.IdServico, lc.NomeServico, 

			FaturamentoBruto		= CASE WHEN /*Faturamento*/	( lcc.AnoMesFaturamento = am.AnoMes AND lcc.StFaturamento  = 1 ) 					THEN lcc.ValorServico END,
			DescontoNaoCond			= CASE WHEN /*Faturamento*/	( lcc.AnoMesFaturamento = am.AnoMes AND lcc.StFaturamento  = 1 ) 					THEN lcc.ValorDescontoNaoCondicionado END,
			Cancelamento			= CASE WHEN /*Cancelamento*/	( lcc.AnoMesFaturamento = am.AnoMes AND lcc.StCancelamento = 1 )					THEN lcc.ValorServico - lcc.ValorDescontoNaoCondicionado END,
			DescCondConcServico		= CASE WHEN /*Recebimento*/	( lcc.AnoMesFaturamento = am.AnoMes AND lcc.StFaturamento  = 1 AND lcc.SituacaoTituloCobranca = 'LIQ' )	THEN lc.LIQ_ValorDescontoCondicionado + lcdc.LIQ_ValorDescontoConcedidoPrincipal END,
			RecebServico			= CASE WHEN /*Recebimento*/	( lcc.AnoMesFaturamento = am.AnoMes AND lcc.StFaturamento  = 1 AND lcc.SituacaoTituloCobranca = 'LIQ' )	THEN lc.LIQ_ValorRecebidoPrincipal END,
			RecebPendenteAMenorServico	= CASE WHEN /*Recebimento*/	( lcc.AnoMesFaturamento = am.AnoMes AND lcc.StFaturamento  = 1 AND lcc.SituacaoTituloCobranca = 'LIQ' )	THEN lcdc.LIQ_ValorPendenteAMenorPrincipal END,
			EmAberto			= CASE WHEN /*Em Aberto*/	( lcc.AnoMesFaturamento = am.AnoMes AND lcc.StFaturamento  = 1 AND lcc.AnoMesBaixa IS NULL )		THEN lcc.ValorServico - lcc.ValorDescontoNaoCondicionado END

		FROM	VwAnoMes am,
			VwLancamentoCobrancaContabil lcc,
			VwLancamentoCobranca lc,
			VwLancamentoCobrancaDescontoConcedido lcdc 

		WHERE	lc.IdLancamentoCobranca = lcc.IdLancamentoCobranca AND
			lcdc.IdLancamentoCobranca = lcc.IdLancamentoCobranca AND

			am.AnoMes >= 201401 AND 

			(
			 /*Faturamento*/  ( lcc.StFaturamento  = 1 AND lcc.AnoMesFaturamento 	= am.AnoMes ) OR
			 /*Cancelamento*/ ( lcc.StCancelamento = 1 AND lcc.AnoMesFaturamento    = am.AnoMes ) OR
			 /*Recebimento*/  ( lcc.StFaturamento  = 1 AND lcc.AnoMesFaturamento 	= am.AnoMes AND lcc.SituacaoTituloCobranca = 'LIQ' ) OR
			 /*Em Aberto*/	  ( lcc.StFaturamento  = 1 AND lcc.AnoMesFaturamento 	= am.AnoMes AND lcc.AnoMesBaixa IS NULL )
			)
		) t
	WHERE	FaturamentoBruto - DescontoNaoCond - Cancelamento - DescCondConcServico - RecebServico - EmAberto - RecebPendenteAMenorServico <> 0.00
) 
BEGIN
	RAISERROR( 'Inconsist�ncia no batimento da contabilidade (verificadas no relat�rio "Resumo da inadimpl�ncia")', 16, 1)
	GOTO FIM
END





------------------------------------------------------------------------------
---- Inconsist�ncia em negocia��es
/*
DECLARE	@DataInicialValidacaoNegociacoes SMALLDATETIME
IF EXISTS( SELECT SiglaUnidade FROM TbUnidade WHERE SiglaUnidade IN ('SANTAROSA') )
	SET @DataInicialValidacaoNegociacoes = '01/01/2015'
ELSE
	SET @DataInicialValidacaoNegociacoes = '01/01/2014'

DECLARE	@IdNegociacao INTEGER
DECLARE xNegociacoes CURSOR LOCAL FOR
	SELECT	IdNegociacao 
	FROM	TbNegociacao n
	WHERE	( DataCompetenciaNegociacao>=@DataInicialValidacaoNegociacoes OR 
		  EXISTS( SELECT * FROM TbNegociacaoItem ni, TbLancamentoCobranca lc WHERE ni.IdNegociacao=n.IdNegociacao AND lc.IdTituloCobrancaGerado=ni.IdTituloCobranca AND lc.DataFaturamento>=@DataInicialValidacaoNegociacoes ) )

OPEN xNegociacoes 
FETCH NEXT FROM xNegociacoes INTO @IdNegociacao

WHILE @@FETCH_STATUS = 0
  BEGIN
	EXEC dbo.SpNegociacaoValidar @IdNegociacao = @IdNegociacao, @ValidacaoAposNegociacao = 0
	IF @@ERROR <> 0 BEGIN PRINT 'ERRO NA NEGOCIA��O @IdNegociacao = ' + CONVERT(VARCHAR,@IdNegociacao) GOTO FIM END

	FETCH NEXT FROM xNegociacoes INTO @IdNegociacao
  END

CLOSE		xNegociacoes
DEALLOCATE	xNegociacoes
*/

/*
EXEC dbo.SpNegociacaoValidar @IdNegociacao = 81
select * from TbNegociacao where IdNegociacao = 81
select * from TbAluno where IdAluno=699
*/


/* Retirando valida��o 
IF EXISTS (	SELECT  1 
			FROM 	VwLancamentoCobrancaDesconto
			WHERE	TipoDesconto <> 'NAOCOND'
			AND		ValorServico = ValorDesconto )
BEGIN
	RAISERROR( 'Inconsist�ncia nos descontos concedidos. Existe(m) desconto(s) do tipo condicionado concedido com 100 por cento.', 16, 1)
	GOTO FIM
END         

*/

------------------------------------------------------------------------------
---- Inconsist�ncia no recebimento por tipo de recebimento e nos t�tulos liquidados (CRM 78931)
---- USAR SCRIPT SVN: SIGA\Script_Clientes\CRM 76296 - Corre��o de rateio por tipo de recebimento.sql --- ANTIGO  RECRIA TODA A ESTRUTURA
---- USAR SCRIPT SVN: SIGA\Script_Clientes\ANTIGOS\M�dulo 2.01 Contas a receber\CRM 124972 - Corre��o rateio por tipo de recebimento (Somente registros inconsist�ntes).sql --- NOVO RECRIA SOMENTE OS DADOS INCONSISTENTES.

IF object_id('tempdb..#TempLancamentoCobrancaRateio') IS NOT NULL
	DROP TABLE #TempLancamentoCobrancaRateio

SET NOCOUNT ON

SELECT	*
INTO	#TempLancamentoCobrancaRateio
FROM	(
	SELECT	IdTituloCobrancaGerado, IdLancamentoCobranca, 
		--DataBaixa, TipoLiquidacao,
		LC_Principal = ISNULL(LIQ_ValorRecebidoPrincipal,0),	LCR_Principal = ISNULL( (SELECT SUM(ValorPrincipal) FROM TbLancamentoCobrancaRecebimento lcr WHERE lcr.IdLancamentoCobranca=lc.IdLancamentoCobranca ), 0), 
		LC_Multa     = ISNULL(LIQ_ValorRecebidoMulta,0),	LCR_Multa     = ISNULL( (SELECT SUM(ValorMulta)     FROM TbLancamentoCobrancaRecebimento lcr WHERE lcr.IdLancamentoCobranca=lc.IdLancamentoCobranca ), 0), 
		LC_Juros     = ISNULL(LIQ_ValorRecebidoJuros,0),	LCR_Juros     = ISNULL( (SELECT SUM(ValorJuros)     FROM TbLancamentoCobrancaRecebimento lcr WHERE lcr.IdLancamentoCobranca=lc.IdLancamentoCobranca ), 0)
	FROM	TbLancamentoCobranca lc
	) t
WHERE	LC_Principal <> LCR_Principal OR LC_Multa <> LCR_Multa OR LC_Juros <> LCR_Juros

SET NOCOUNT OFF

IF EXISTS( SELECT * FROM #TempLancamentoCobrancaRateio )
BEGIN
	RAISERROR( 'Inconsist�ncia no batimento dos t�tulos liquidados (TbLancamentoCobrancaRecebimento) com o recebimento por tipo de recebimento.', 16, 1)
	GOTO FIM
END


------------------------------------------------------------------------------
---- Inconsist�ncia no recebimento por tipo de recebimento e nos t�tulos liquidados a maior (CRM 78931)
IF object_id('tempdb..#TempTituloCobrancaAMaior') IS NOT NULL
	DROP TABLE #TempTituloCobrancaAMaior

SET NOCOUNT ON

SELECT	*
INTO	#TempTituloCobrancaAMaior
FROM	(
	SELECT	IdTituloCobranca, DataBaixa, TipoLiquidacao,
		TC_AMaior	= ISNULL(LIQ_ValorRecebidoAMaior,0),	
		TCR_AMaior	= ISNULL( (SELECT SUM(ValorRecebidoAMaior) FROM TbTituloCobrancaRecebimento tcr WHERE tcr.IdTituloCobranca=tc.IdTituloCobranca ), 0 )
	FROM	TbTituloCobranca tc
	) t
WHERE	TC_AMaior <> TCR_AMaior

SET NOCOUNT OFF

IF EXISTS( SELECT * FROM #TempTituloCobrancaAMaior )
BEGIN
	RAISERROR( 'Inconsist�ncia no batimento dos t�tulos liquidados a maior com o recebimento por tipo de recebimento.', 16, 1)
	GOTO FIM
END






------------------------------------------------------------------------------
---- Inconsist�ncia lan�amento financeiro sem rateio (CRM 79105)
---- Todo lan�amento-financeiro, exceto transfer�ncias, precisa ter lan�amentos de rateio para "detalhar" o que est� entrando ou saindo da conta.
---- Executar script de corre��o X:\ActiveSIGA\Script_Clientes\M�dulo 2.01 Contas a receber\Inconsist�ncia em Lancamentos financeiros devido a repasse de cart�o em lote\Script.sql

IF EXISTS( 
	SELECT	*,
		NomeConta = ( SELECT NomeConta FROM TbConta WHERE IdConta = t.IdConta )
	FROM	(
		SELECT	ValorRateio = (		SELECT	SUM(CASE WHEN ValorEntradaSaida='S' THEN -1 ELSE +1 END * ValorAbsoluto)
						FROM	TbLancamentoFinanceiroRateio lfr
						WHERE	lfr.IdLancamentoFinanceiro = lf.IdLancamentoFinanceiro ),
			lf.*
		FROM	TbLancamentoFinanceiro lf
		WHERE	lf.OrigemTipo <> 'Transfer�ncia' 
			AND Data >= '01/01/2015'
		) t
	WHERE	ISNULL(ValorLancamento,0) <> ISNULL(ValorRateio,0) OR
		ValorLancamento IS NULL OR
		ValorRateio IS NULL
		
		-- Ignorando os lan�amentos-financeiros com valor zero devido a liquida��o concedendo desconto total
		AND NOT ( ValorLancamento = 0 AND Comentario LIKE 'Liquida��o do t�tulo de cobran�a %'            AND NOT EXISTS( SELECT * FROM TbLancamentoFinanceiroRateio lfr WHERE lfr.IdLancamentoFinanceiro = t.IdLancamentoFinanceiro ) )
		-- Ignorando os lan�amentos-financeiros com valor zero devido a estorno de liquida��o em que houve desconto total
		AND NOT ( ValorLancamento = 0 AND Comentario LIKE 'Estorno da liquida��o do t�tulo de cobran�a %' AND NOT EXISTS( SELECT * FROM TbLancamentoFinanceiroRateio lfr WHERE lfr.IdLancamentoFinanceiro = t.IdLancamentoFinanceiro ) )
		-- Ignorando os lan�amentos-financeiros com valor zero devido a repasse de cart�o onde tarifa foi zero
		AND NOT ( ValorLancamento = 0 AND Comentario = 'Gerado pelo repasse do recebimento por cart�o.'   AND NOT EXISTS( SELECT * FROM TbLancamentoFinanceiroRateio lfr WHERE lfr.IdLancamentoFinanceiro = t.IdLancamentoFinanceiro ) )
		-- Ignorando os lan�amentos-financeiros com valor zero (problema encontrado no Overdose Cursinho 
		AND NOT ( ValorLancamento = 0 AND EXISTS( SELECT SiglaUnidade FROM TbUnidade WHERE SiglaUnidade IN ('OVERCURSO')) AND NOT EXISTS( SELECT * FROM TbLancamentoFinanceiroRateio lfr WHERE lfr.IdLancamentoFinanceiro = t.IdLancamentoFinanceiro ) )

		
) 
BEGIN
	RAISERROR( 'Inconsist�ncia no lan�amento financeiro - Existe registro sem rateio.', 16, 1)
	GOTO FIM
END




------------------------------------------------------------------------------
---- Inconsist�ncia CK_TbLancamentoCobrancaSomatorioConsistente
---- Foi identificado que em um cliente a CK_TbLancamentoCobrancaSomatorioConsistente estava desabilitada. N�o � permitido.

IF EXISTS( 
	SELECT	Consistencia=((((((((([ValorServico]-[LIQ_ValorDescontoConcedido])-[LIQ_ValorDescontoCondicionado])-[LIQ_ValorDescontoNaoCondicionado])+[LIQ_ValorMultaCalculado])+[LIQ_ValorJurosCalculado])-[LIQ_ValorRecebidoPrincipal])-[LIQ_ValorRecebidoMulta])-[LIQ_ValorRecebidoJuros])-[LIQ_ValorPendenteAMenor]),
		*
	FROM	TbLancamentoCobranca
	WHERE	((((((((([ValorServico]-[LIQ_ValorDescontoConcedido])-[LIQ_ValorDescontoCondicionado])-[LIQ_ValorDescontoNaoCondicionado])+[LIQ_ValorMultaCalculado])+[LIQ_ValorJurosCalculado])-[LIQ_ValorRecebidoPrincipal])-[LIQ_ValorRecebidoMulta])-[LIQ_ValorRecebidoJuros])-[LIQ_ValorPendenteAMenor]) <> 0
	)
BEGIN
	RAISERROR( 'Inconsist�ncia na CK_TbLancamentoCobrancaSomatorioConsistente.', 16, 1)
	GOTO FIM
END



------------------------------------------------------------------------------
---- Inconsist�ncia T�tulos de cobran�a sem lan�amento de cobran�a

IF EXISTS( 
	SELECT	a.NomeAluno, tc.*
	FROM	TbTituloCobranca tc
	LEFT	JOIN TbAluno a ON a.IdAluno = tc.IdAluno
	WHERE	NOT EXISTS( SELECT * FROM TbLancamentoCobranca lc WHERE lc.IdTituloCobrancaGerado = tc.IdTituloCobranca )
		AND SituacaoTituloCobranca <> 'CAN'
	)
BEGIN
	RAISERROR( 'Inconsist�ncia T�tulos de cobran�a sem lan�amento de cobran�a.', 16, 1)
	GOTO FIM
	-- Para corrigir este problema existe um script que foi enviado no ServicePack da vers�o 1.064.490
END
	

------------------------------------------------------------------------------
------------------------------------------------------------------------------
------------------------------------------------------------------------------
FIM:

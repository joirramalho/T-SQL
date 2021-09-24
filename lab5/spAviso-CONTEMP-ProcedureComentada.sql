SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

--
-- Activesoft Consultoria 
-- STOREDPROC criada pelo Activesoft Service Pack em 01/12/2019 durante atualização para versão 1.064.993.
--

SET QUOTED_IDENTIFIER OFF 
SET DATEFORMAT dmy 
SET LANGUAGE Portuguese 
SET CONCAT_NULL_YIELDS_NULL ON 
 
IF OBJECT_ID('TempDB..#TempTable') IS NOT NULL
    DROP TABLE #TempTable

CREATE TABLE #TempTable ( IdUsuario INT, IdUnidade INT, StSistemaEnsinoSuperior BIT, StExecutando_ExcluirDescontoDuplicado BIT NOT NULL DEFAULT (0), StExecutando_LancamentoCobranca_RenumerarRPS BIT NOT NULL DEFAULT (0), StExecutando_LancamentoCobranca_EfetuandoNegociacao BIT NOT NULL DEFAULT (0) )
 
INSERT #TempTable
	SELECT	IdUsuario = ( SELECT IdUsuario FROM TbUsuario WHERE Login='suporte' ),
		IdUnidade = ( SELECT TOP 1 IdUnidade FROM TbUnidade ),
		StSistemaEnsinoSuperior = 0,
		StExecutando_ExcluirDescontoDuplicado = 0,
		StExecutando_LancamentoCobranca_RenumerarRPS = 0,
		StExecutando_LancamentoCobranca_EfetuandoNegociacao = 0


-- ALTER PROCEDURE [dbo].[SpAvisoTelaInicial] 
-- ALTER PROCEDURE dbo.SpAvisoTelaInicial 
	-- (
DECLARE	@StContaPagar BIT =1,
	@StSolicitacao BIT = 1,
        @StAlmoxarifado BIT =1,
	@StMatriculaOnline BIT=1,
	@StDataBloqueio BIT =1,
        @StMensagem BIT=1,
	@StRoteiroVirada BIT=1,
	@StAvisoAgenteCobranca BIT=1,
	@StPagamentoOnlinePendente BIT=1,
        @StCobrancaPendente BIT=1,
        @StMobileMensagem BIT=1,
	@StAniversarianteAluno	BIT=1,
	@StAniversarianteResponsavel BIT=1,
	@StAniversarianteProfessor BIT=1,
        @StCobrancaRegistrada BIT=1,
        @StSistemaAvaliacaoBloqueado BIT=1,
	@StTituloCobrancaVisualizacao BIT=1,
	@StCartaoMovimentacaoRepasse BIT=1,
	@StPortaArquivoUtilizado BIT=1,
	@PortaArquivoEspacoDisponivel INT =1
--     ) AS
-- BEGIN  
--	SET NOCOUNT ON      

	DECLARE @StAlmoxContaPagar BIT,
        	@StFinanceiroFiltroPorUnidade BIT,
		@IdUnidade INT,
		@IdUsuario INT,
                @DataHoje SMALLDATETIME,  
		              
                @StExisteBoletoNaoRegistrado BIT,
		@DataAte_NaoRegistrado SMALLDATETIME,
		@StExisteBoletoNaoVisualizadoPortal BIT,
		@DataAte_NaoVisualizadoPortal SMALLDATETIME,
		@StExisteCartaoMovimentacaoRepasse BIT,
		@DataAte_NaoRepassadoCartaoMovimentacao SMALLDATETIME


	SET 	@StAlmoxContaPagar 	= CAST( CASE WHEN @StContaPagar = 1 AND @StAlmoxarifado = 1 THEN 1 ELSE 0 END AS BIT )
        SET 	@DataHoje 		= dbo.FnDateTrunc( GETDATE() )

	SELECT 	@StFinanceiroFiltroPorUnidade = pg.StFinanceiroFiltroPorUnidade
	FROM	TbParametroGlobal pg

	SELECT 	@IdUnidade = tt.IdUnidade, 
		@IdUsuario = tt.IdUsuario
	FROM	#tempTable tt

	SELECT	@StExisteBoletoNaoRegistrado = CASE WHEN @StCobrancaRegistrada = 0 THEN 0 ELSE StExisteBoletoNaoRegistrado END,
        	@DataAte_NaoRegistrado = DATEADD( DD, QtdeDiasVencimento, @DataHoje ),

		@StExisteBoletoNaoVisualizadoPortal = CASE WHEN @StTituloCobrancaVisualizacao = 0 THEN 0 ELSE StExisteBoletoNaoVisualizadoPortal END,
        	@DataAte_NaoVisualizadoPortal = DATEADD( DD, QtdeDiasVencimento_NaoVisualizadoPortal, @DataHoje ),

		@StExisteCartaoMovimentacaoRepasse = CASE WHEN @StCartaoMovimentacaoRepasse = 0 THEN 0 ELSE StExisteRecebimentoCartaoMovimentacaoNaoRepassado END,
        	@DataAte_NaoRepassadoCartaoMovimentacao = DATEADD( DD, QtdeDias_CartaoMovimentacaoPrevistaRepasse, @DataHoje )
        FROM	TbParametroCReceber                 

	-- Aplicando parametro da internet
	DECLARE @InscrTurma_IdSituacaoAlunoTurmaSemVaga INT,
		@ReservaMatriculaOnline_IdPeriodo INT
	
	SELECT	@InscrTurma_IdSituacaoAlunoTurmaSemVaga = ISNULL( InscrTurma_IdSituacaoAlunoTurmaSemVaga, 0 ),
		@ReservaMatriculaOnline_IdPeriodo = ReservaMatriculaOnline_IdPeriodo
	FROM 	TbParametroInternet

	IF OBJECT_ID('TempDB..#tempAvisoTela') IS NOT NULL
        	DROP TABLE #tempAvisoTela
                
        IF OBJECT_ID('TempDB..#tempTituloCobranca') IS NOT NULL
        	DROP TABLE #tempTituloCobranca

	IF OBJECT_ID('TempDB..#tempReservaMatriculaOnLine') IS NOT NULL
		DROP TABLE #tempReservaMatriculaOnLine
        
	IF OBJECT_ID('TempDB..#tempAlunoTurmaHistorico') IS NOT NULL
		DROP TABLE #tempAlunoTurmaHistorico
        
        CREATE TABLE #tempAvisoTela (
        	Tipo	VARCHAR(50) NULL,
                QtdeReg	INTEGER NULL )
        
	SELECT  tur.IdPeriodo, tur.IdTurma, tur.IdSerie, s.InscrTurma_QtdeDiasUteisSolicitacaoValida 
	INTO	#tempReservaMatriculaOnLine
	FROM 	TbTurma tur 
	LEFT 	JOIN TbSerie s ON s.IdSerie = tur.IdSerie 
	WHERE	@StMatriculaOnline = 1
	AND   	tur.IdPeriodo = @ReservaMatriculaOnline_IdPeriodo

	SELECT 	ath.IdTurma,
		ath.IdAluno,
		ath.IdSituacaoAlunoTurma,
		DataOcorrencia = MAX(DataOcorrencia) 
	INTO	#tempAlunoTurmaHistorico        
	FROM 	TbAlunoTurmaHistorico ath
	WHERE	@StMatriculaOnline = 1
        AND	ath.IdSituacaoAlunoTurma = @InscrTurma_IdSituacaoAlunoTurmaSemVaga
        GROUP	BY ath.IdTurma, ath.IdAluno, ath.IdSituacaoAlunoTurma

	SELECT 	tc.IdTituloCobranca,
        	tc.IdAgenteCobrancaRegistrada
        INTO	#tempTituloCobranca
        FROM	TbTituloCobranca tc
	WHERE	tc.DataBaixa IS NOT NULL
        AND	tc.DataBaixa >= DATEADD( DAY, -90, GETDATE())

	INSERT INTO #tempAvisoTela 
        	SELECT 	Tipo	= 'MENSAGEM',
                	QtdeReg = (	SELECT 	COUNT( mcs.IdMensagem ) 
                    			FROM 	TbMensagemCaixaSaida mcs
                                	WHERE 	@StMensagem = 1
                                	AND	mcs.DataHoraEnvio IS NULL
                                	AND 	DATEDIFF( MINUTE, GETDATE(), ISNULL( mcs.DataHoraAgendamento, mcs.DataHoraInsercao ) ) > 60 )

	INSERT INTO #tempAvisoTela 
        	SELECT 	Tipo	= 'MOBILEMENSAGEM',
                	QtdeReg = (	SELECT  COUNT( mm.IdMobileMensagem ) 
					FROM	TbMobileMensagem mm
					INNER JOIN TbMobileTipoMensagem mtm ON mtm.IdMobileTipoMensagem = mm.IdMobileTipoMensagem
					WHERE	@StMobileMensagem = 1 
					AND (	EXISTS( SELECT  TOP 1 1
							FROM	TbUsuarioGrupo ug 
							LEFT   	JOIN TbFuncionalidadeGrupo fg ON fg.IdGrupo = ug.IdGrupo 
							WHERE  	fg.IdFuncionalidade = 522 -- caMobileTipoMensagemOperadorTotal
							AND    	fg.TipoAcesso > 1 
							AND    	ug.IdUsuario = @IdUsuario ) OR 
							@IdUsuario IN ( SELECT IdUsuario FROM TbMobileTipoMensagemUsuario mtmu
									WHERE mtmu.IdMobileTipoMensagem = mtm.IdMobileTipoMensagem ) 
						    )
					AND	TipoAutor <> 'U'
					AND	DataHoraLeitura IS NULL )

	INSERT INTO #tempAvisoTela 
		SELECT	Tipo    = 'CPAGAR',
			QtdeReg = (	SELECT 	COUNT( cp.IdContaPagar ) 
					FROM 	TbContaPagar cp 
					WHERE 	@StContaPagar = 1
                                	AND	cp.Situacao = 'ABE' 
					AND 	cp.DataVencimento <= GETDATE() 
                                        AND	( ( @StFinanceiroFiltroPorUnidade = 0 ) OR EXISTS( SELECT TOP 1 1 FROM TbFavorecido WHERE IdUnidade = @IdUnidade ) ) )

	INSERT INTO #tempAvisoTela 
		SELECT 	Tipo	= 'SOLICITACAO',
			QtdeReg = (	SELECT 	COUNT( s.IdSolicitacao ) 
					FROM 	TbSolicitacao s
                                        LEFT    JOIN TbAluno a 	     ON a.IdAluno       = s.IdAluno
					LEFT	JOIN TbResponsavel r ON r.IdResponsavel = s.IdResponsavel
					LEFT	JOIN TbProfessor p   ON p.IdProfessor   = s.IdProfessor
					WHERE 	@StSolicitacao = 1
                                        AND	s.DataAnalise IS NULL
                                        AND   ( COALESCE( a.IdUnidade, r.IdUnidade, p.IdUnidade ) IS NULL OR 
                    				COALESCE( a.IdUnidade, r.IdUnidade, p.IdUnidade ) = @IdUnidade ) )

	INSERT INTO #tempAvisoTela 
        	SELECT	Tipo	= 'ALMOXARIFADO',
        		QtdeReg = ISNULL( (  	SELECT 	COUNT(IdMaterial) 
						FROM (	SELECT	DISTINCT me.IdMaterial
                        				FROM	TbAlmoxMaterialEstoque me 
                                                	WHERE	@StAlmoxarifado = 1
                        				GROUP	BY me.IdMaterial
                        				HAVING	( SUM( ISNULL( me.QtdeEstoqueMinimo, 0 ) ) > 0 ) AND SUM( ISNULL( me.QtdeEstoqueMinimo, 0 ) ) > SUM( ISNULL( me.QtdeEstoqueAtual, 0 ) ) ) t ), 0) 

	INSERT INTO #tempAvisoTela 
        	SELECT	Tipo	= 'INTEGRACAO',
                	QtdeReg = (	SELECT 	COUNT( mm.IdMaterialMovimentacao )
					FROM	TbAlmoxMaterialMovimentacao mm 
                                	WHERE	@StAlmoxContaPagar = 1
                                	AND	mm.TipoMovimentacao = 'ENT'
                                	AND	mm.StMovimentacaoConcluida = 1
                                	AND 	mm.StGerarContaPagarPendente = 1 ) 

	INSERT INTO #tempAvisoTela 
		SELECT	Tipo	= 'INSCRTURMA',
			QtdeReg	= (	SELECT COUNT(DISTINCT atur.IdAluno)
					FROM (	SELECT 	atu.IdAluno,
							a.IdUnidade,
							ts.InscrTurma_QtdeDiasUteisSolicitacaoValida,
							ath.DataOcorrencia
						FROM 	#tempReservaMatriculaOnLine ts
						INNER	JOIN TbAlunoTurma atu 			ON atu.IdTurma = ts.IdTurma
						INNER	JOIN TbAluno a   		  	ON a.IdAluno = atu.IdAluno
						INNER	JOIN #tempAlunoTurmaHistorico ath 	ON ath.IdAluno = atu.IdAluno AND ath.IdTurma = atu.IdTurma AND ath.IdSituacaoAlunoTurma = atu.IdSituacaoAlunoTurma
						WHERE	@StMatriculaOnline = 1
						AND     ( ( @StFinanceiroFiltroPorUnidade = 0 ) OR ( a.IdUnidade = @IdUnidade ) )
						AND	ts.InscrTurma_QtdeDiasUteisSolicitacaoValida > 0 )  atur
					WHERE	dbo.FnDiferencaDiaUtil( atur.DataOcorrencia, GETDATE(), atur.IdUnidade ) > atur.InscrTurma_QtdeDiasUteisSolicitacaoValida )

	INSERT INTO #tempAvisoTela 
        	SELECT 	Tipo 	= 'DTABLOQUEIO',
        		QtdeReg = CASE WHEN ISNULL( BloqueioOperacoesFinanceiras_Dias, CAST( GETDATE() - BloqueioOperacoesFinanceiras_Data AS INTEGER) ) > 365 THEN 1 ELSE 0 END
		FROM	TbParametroGlobal pg
        	WHERE	EXISTS( SELECT  TOP 1 1
				FROM	TbUsuarioGrupo ug 
				LEFT   	JOIN TbFuncionalidadeGrupo fg ON fg.IdGrupo = ug.IdGrupo 
				WHERE  	fg.IdFuncionalidade = 191 -- caAlterarDataBloqueioOperacoesFinanceiras
				AND    	fg.TipoAcesso > 1 
				AND    	ug.IdUsuario = @IdUsuario ) 
		AND	@StDataBloqueio = 1

	INSERT INTO #tempAvisoTela 
        	SELECT 	Tipo 	= 'PAGAMENTOONLINEPENDENTE',
			QtdeReg = (	SELECT COUNT(IdPagamentoOnline)
					FROM TbPagamentoOnline
					WHERE StPendente = 1
					AND @StPagamentoOnlinePendente = 1 )

	INSERT INTO #tempAvisoTela 
		-- SELECT 	Tipo = 'COBRANCAATIVA',
		-- 	QtdeReg = COUNT( r.IdResponsavel )
		-- FROM	TbResponsavel r
        -- 	WHERE	@StCobrancaPendente = 1
        -- 	AND	r.CobrancaAtivaDataProximoContato IS NOT NULL
        -- 	AND 	dbo.FnDateTrunc( r.CobrancaAtivaDataProximoContato ) <= dbo.FnDateTrunc( GETDATE() )
		-- AND     EXISTS(SELECT 1 FROM VwTituloCobranca WHERE IdResponsavel = r.IdResponsavel AND StAbertoemAtraso = 1)
		
-- 		UNION ALL
		
		SELECT 	Tipo = 'CADASTROINADIMPLENCIA',
			QtdeReg = COUNT( tc.IdTituloCobranca )
        	FROM	TbTituloCobrancaCadastroInadimplente tcci
                LEFT	JOIN #tempTituloCobranca tc ON tc.IdTituloCobranca = tcci.IdTituloCobranca 
                				AND tcci.IdTituloCobrancaCadastroInadimplente = (	SELECT	MAX( IdTituloCobrancaCadastroInadimplente ) 
										   		  	FROM 	TbTituloCobrancaCadastroInadimplente  
													WHERE 	IdTituloCobranca = tc.IdTituloCobranca )
        	WHERE	@StCobrancaPendente = 1
                AND	tcci.StTituloCadastroInadimplente = 1

	INSERT INTO #tempAvisoTela 
		SELECT 	Tipo = 'MENSAGEMROTEIRO',
			QtdeReg = YEAR( GETDATE() ) + 1
		WHERE ( NOT EXISTS( SELECT	TOP 1 1 
				FROM 	TbPeriodo p
				WHERE	YEAR( p.DataInicial ) = YEAR( GETDATE() ) + 1 ) 
			OR NOT EXISTS(	SELECT 	TOP 1 1 
				FROM 	TbTurma t
				WHERE 	YEAR( DataInicial ) = YEAR( GETDATE() ) + 1 ) 
			OR NOT EXISTS(	SELECT	TOP 1	1
				FROM	TbPlanoPagamento pp
				WHERE 	EXISTS (SELECT 	1 
						FROM 	TbPeriodo 
                                        	WHERE 	IdPeriodo = pp.IdPeriodo 
                                        	AND 	YEAR( DataInicial ) = YEAR( GETDATE() ) + 1 ) ) )
		AND 	MONTH( GETDATE() ) BETWEEN 09 AND 12 	
		AND	@StRoteiroVirada = 1

	INSERT INTO #tempAvisoTela 
		SELECT 	Tipo 	= ac.NomeAgenteCobranca,
			QtdeReg = COUNT( IdTituloCobranca ) 
		FROM	#tempTituloCobranca tc
		RIGHT	JOIN TbAgenteCobranca ac ON ac.IdAgenteCobranca = tc.IdAgenteCobrancaRegistrada
		WHERE 	@StAvisoAgenteCobranca = 1
		AND	tc.IdAgenteCobrancaRegistrada IS NOT NULL
        	AND	( ( @StFinanceiroFiltroPorUnidade = 0 ) OR EXISTS( SELECT 1 FROM TbLancamentoCobranca WHERE IdUnidade = @IdUnidade AND IdTituloCobrancaGerado = tc.IdTituloCobranca ) )
		AND 	ac.StApenasTituloAberto = 1 
		GROUP	BY ac.NomeAgenteCobranca                

	INSERT INTO #tempAvisoTela
		SELECT 	Tipo 	= 'COBRANCAREGISTRADA',
			QtdeReg = COUNT( tc.IdTituloCobranca )
		FROM	TbTituloCobranca tc
                LEFT	JOIN TbFormaRecebimento fr ON fr.IdFormaRecebimento = tc.IdFormaRecebimento
		WHERE 	@StExisteBoletoNaoRegistrado = 1
		AND	tc.DataVencimento >= @DataHoje AND tc.DataVencimento <= @DataAte_NaoRegistrado
                AND	tc.SituacaoTituloCobranca = 'ABE'
                AND	fr.Tipo IN ( 'BOL', 'BOI' )
		AND	( ( @StFinanceiroFiltroPorUnidade = 0 ) OR EXISTS( SELECT 1 FROM   TbLancamentoCobranca WHERE  IdUnidade = @IdUnidade AND    IdTituloCobrancaGerado = tc.IdTituloCobranca ) )
		AND	( ( tc.IdAgenteCobrancaRegistrada IS NOT NULL AND tc.SituacaoCobrancaRegistrada <> 'RegistroConfirmado' ) OR tc.IdAgenteCobrancaRegistrada IS NULL )

	INSERT INTO #tempAvisoTela 
		SELECT	TIPO = 'COBRANCAVISUALIZACAOPORTAL', 
			QtdeReg = COUNT(DISTINCT IdTituloCobranca) 

		FROM	TbTituloCobranca tc
		LEFT	JOIN TbFormaRecebimento fr ON fr.IdFormaRecebimento = tc.IdFormaRecebimento
		WHERE	@StExisteBoletoNaoVisualizadoPortal = 1
		AND	tc.DataVencimento >= @DataHoje AND tc.DataVencimento <= @DataAte_NaoVisualizadoPortal 
		AND	SituacaoTituloCobranca = 'ABE' 	
		AND	fr.Tipo IN ( 'BOL', 'BOI' )
		AND	( ( @StFinanceiroFiltroPorUnidade = 0 ) OR EXISTS( SELECT 1 FROM   TbLancamentoCobranca WHERE  IdUnidade = @IdUnidade AND    IdTituloCobrancaGerado = tc.IdTituloCobranca ) )
		AND	NOT EXISTS( SELECT 1 FROM TbTituloCobrancaVisualizacao tcv WHERE tcv.IdTituloCobranca = tc.IdTituloCobranca )	

	INSERT INTO #tempAvisoTela 
		SELECT	TIPO = 'CARTAOMOVIMENTACAOREPASSE', 
			QtdeReg = COUNT(DISTINCT IdCartaoMovimentacao) 

		FROM	TbCartaoMovimentacao cm	
		WHERE	@StExisteCartaoMovimentacaoRepasse = 1
		AND	cm.DataPrevistaRepasse >= @DataHoje AND cm.DataPrevistaRepasse <= @DataAte_NaoRepassadoCartaoMovimentacao 
		AND	Situacao = 'PEN' 	

	INSERT INTO #tempAvisoTela 
		SELECT	TIPO = 'PROFANIVERSARIANTE', 
			QtdeReg = COUNT(DISTINCT p.IdProfessor) 
		FROM 	VwTurmaDisciplina td			
		INNER 	JOIN TbTurmaProfessor tp on tp.IdTurma = td.IdTurma AND tp.IdDisciplina = td.IdDisciplina
		INNER 	JOIN TbProfessor p ON p.IdProfessor = tp.IdProfessor				
		LEFT 	JOIN TbParametroGlobal pg ON 1 = 1
		WHERE 	@StAniversarianteProfessor = 1
                AND	( p.StAtivo = 1 )
		AND 	( pg.StAniversariantesProfessor = 1 )
		AND	( RIGHT( CONVERT( VARCHAR, p.DataNascimento, 112 ), 4 ) >= RIGHT( CONVERT( VARCHAR, GETDATE(), 112 ), 4 ) )
		AND 	( RIGHT( CONVERT( VARCHAR, p.DataNascimento, 112 ), 4 ) <= RIGHT( CONVERT( VARCHAR, DATEADD(DAY,pg.DiasConsultaAniversariantes, GETDATE()), 112), 4 ) )

	INSERT INTO #tempAvisoTela 
		SELECT	TIPO = 'ALUNOANIVERSARIANTE', 
			QtdeReg = COUNT(DISTINCT a.IdAluno) 
		FROM 	TbAluno a 
                INNER 	JOIN vwAlunoTurmaOficial ato ON ato.IdAluno = a.IdAluno
		LEFT 	JOIN TbParametroGlobal pg ON 1 = 1
		WHERE 	@StAniversarianteAluno = 1
                AND	( pg.StAniversariantesAluno = 1 )
		AND	( RIGHT( CONVERT( VARCHAR, a.DataNascimento, 112 ), 4 ) >= RIGHT( CONVERT( VARCHAR, GETDATE(), 112 ), 4 ) )
		AND 	( RIGHT( CONVERT( VARCHAR, a.DataNascimento, 112 ), 4 ) <= RIGHT( CONVERT( VARCHAR, DATEADD(DAY,pg.DiasConsultaAniversariantes, GETDATE()), 112), 4 ) )

	INSERT INTO #tempAvisoTela 
		SELECT	TIPO = 'RESPANIVERSARIANTE',
			QtdeReg = COUNT(DISTINCT _IdResponsavel) 
		FROM (
			-- Pai
			SELECT 	_IdResponsavel	= pai.IdResponsavel,
                        	Nascimento 	= pai.DataNascimento
			FROM 	TbAluno a 			
			LEFT 	JOIN TbResponsavel pai on pai.IdResponsavel = a.IdPai													

			UNION

			--Mãe
			SELECT 	_IdResponsavel	= mae.IdResponsavel,
                        	Nascimento 	= mae.DataNascimento
			FROM 	TbAluno a 			
			LEFT 	JOIN TbResponsavel mae on mae.IdResponsavel = a.IdMae				

			UNION

			--Financeiro
			SELECT 	_IdResponsavel	= fin.IdResponsavel,
                        	Nascimento 	= fin.DataNascimento
			FROM 	TbAluno a 			
			LEFT 	JOIN TbResponsavel fin on fin.IdResponsavel = a.IdResponsavel
        		WHERE 	NOT EXISTS(SELECT 1 FROM TbAluno WHERE IdPai = a.IdResponsavel OR IdMae = a.IdResponsavel)

		      ) resp
		LEFT 	JOIN TbParametroGlobal pg ON 1 = 1		
		WHERE 	@StAniversarianteResponsavel = 1
                AND	( pg.StAniversariantesResponsavel = 1 )
		AND	( RIGHT( CONVERT( VARCHAR, resp.Nascimento, 112 ), 4 ) >= RIGHT( CONVERT( VARCHAR, GETDATE(), 112 ), 4 ) )
		AND 	( RIGHT( CONVERT( VARCHAR, resp.Nascimento, 112 ), 4 ) <= RIGHT( CONVERT( VARCHAR, DATEADD(DAY,pg.DiasConsultaAniversariantes, GETDATE()), 112), 4 ) )		

	INSERT INTO #tempAvisoTela 
		SELECT	TIPO = 'SISAVALIACAOBLOQ', 
			QtdeReg = COUNT(DISTINCT (cast(t.IdSerie as varchar) + cast(t.IdPeriodo as varchar))) 
		FROM	TbTurma t
		LEFT	JOIN TbPeriodo p ON p.IdPeriodo = t.IdPeriodo
		WHERE	LEFT( p.AnoConclusao, 4 ) >= YEAR( GETDATE() ) 
		AND	EXISTS ( SELECT 1 FROM TbFaseNotaAluno fna WHERE fna.IdTurma = t.IdTurma ) 
		AND	NOT EXISTS ( SELECT 1 FROM TbSeriePeriodo sp WHERE sp.IdSerie = t.IdSerie AND sp.IdPeriodo = t.IdPeriodo AND sp.StSistemaAvaliacaoBloqueado = 1 )	

	INSERT INTO #tempAvisoTela 
		SELECT	TIPO = 'PORTAARQUIVOUTILIZADO', 
			QtdeReg = CAST( CASE WHEN EspacoDisponivel > 0 THEN ( ( EspacoUtilizado / EspacoDisponivel ) * 100 ) END AS INTEGER )
		FROM(
			SELECT 	EspacoDisponivel = ISNULL(CONVERT(NUMERIC(12,2), @PortaArquivoEspacoDisponivel), 0),
				EspacoUtilizado  = ISNULL(CONVERT(NUMERIC(12,2), SUM( CAST( Tamanho AS BIGINT ) ) ) / 1024, 0)
			FROM TbArquivoAnexo 
			WHERE DataHoraExclusaoLogica IS NULL
		) rst
		WHERE @StPortaArquivoUtilizado = 1
		AND   CAST( CASE WHEN EspacoDisponivel > 0 THEN ( ( EspacoUtilizado / EspacoDisponivel ) * 100 ) END AS INTEGER ) >= 75

	SELECT	Tipo,
		Aviso = 	CASE 	WHEN QtdeReg = 1 
        				THEN	CASE 	
							WHEN Tipo = 'CPAGAR'	   			THEN 'Existe 1 conta a pagar com vencimento até hoje.'
		    					WHEN Tipo = 'SOLICITACAO'  			THEN 'Existe 1 solicitação pendente.'
                     					WHEN Tipo = 'ALMOXARIFADO' 			THEN 'Existe 1 material com estoque mínimo atingido.'
                     					WHEN Tipo = 'INTEGRACAO' 			THEN 'Existe 1 entrada concluída sem gerar sua respectiva conta a pagar.'
                     					WHEN Tipo = 'INSCRTURMA' 			THEN 'Existe 1 solicitação vencida para ficha de inscrição on-line.'
                     					WHEN Tipo = 'MENSAGEM'				THEN 'Existe 1 mensagem a ser enviada.'
							WHEN Tipo = 'MOBILEMENSAGEM'			THEN 'Existe 1 mensagem não lida do aplicativo'                     					
							WHEN Tipo = 'MENSAGEMROTEIRO'  			THEN 'O roteiro de virada de ano para ' + CAST( DATEPART(YEAR, GETDATE()) + 1  AS VARCHAR ) + ' ainda não foi concluído.'
                     					WHEN Tipo = 'DTABLOQUEIO' 			THEN 'A data de bloqueio de operações financeiras está definida para uma data muito antiga (' + CONVERT( VARCHAR, dbo.FnDataBloqueioOperacoesFinanceiras(), 103) + ').'-- Para configurar acesse Utilitários > Parâmetros > Parâmetros globais > Financeiro.'
							WHEN Tipo = 'PAGAMENTOONLINEPENDENTE'		THEN 'Existe 1 pagamento online pendente.'							
							WHEN Tipo = 'COBRANCAATIVA'			THEN 'Existe 1 responsável cuja data para próximo contato é igual ou anterior a hoje.'
							WHEN Tipo = 'CADASTROINADIMPLENCIA'		THEN 'Existe 1 título de cobrança que está no cadastro de inadimplência e com situação diferente de "em aberto".'
							WHEN Tipo = 'PROFANIVERSARIANTE'		THEN 'Existe ' + CAST( QtdeReg AS VARCHAR ) + ' professor aniversariando nos próximos dias.'
							WHEN Tipo = 'ALUNOANIVERSARIANTE'		THEN 'Existe ' + CAST( QtdeReg AS VARCHAR ) + ' aluno aniversariando nos próximos dias.'
							WHEN Tipo = 'RESPANIVERSARIANTE'		THEN 'Existe ' + CAST( QtdeReg AS VARCHAR ) + ' responsável aniversariando nos próximos dias.'
                                                        WHEN Tipo = 'COBRANCAREGISTRADA'		THEN 'Existe 1 título "Em aberto" do tipo "Boleto" que não está com registro confirmado junto ao agente de cobrança.'
							WHEN Tipo = 'COBRANCAVISUALIZACAOPORTAL'	THEN 'Existe 1 título com vencimento até ' + CONVERT( VARCHAR, @DataAte_NaoVisualizadoPortal, 103 ) + ' que ainda não foi visualizado pelo responsável no portal'							
							WHEN Tipo = 'CARTAOMOVIMENTACAOREPASSE'		THEN 'Existe 1 movimentação de cartão com data prevista para repasse até ' + CONVERT( VARCHAR, @DataAte_NaoRepassadoCartaoMovimentacao, 103 ) + ' que ainda não foi repassado'							
							WHEN Tipo = 'SISAVALIACAOBLOQ'			THEN 'Existe 1 série/período com sistema de avaliação desbloqueado.'							
							WHEN Tipo = 'PORTAARQUIVOUTILIZADO'		THEN 'Já foi utilizado ' + CAST( QtdeReg AS VARCHAR ) + '% do seu plano atual no porta arquivos, é importante que um novo plano seja adquirido.'
							ELSE 'Existe 1 título com situação diferente de "Aberto" para o agente de cobrança ' + Tipo
		   				END
		     			WHEN QtdeReg > 1 
                     			THEN	CASE 	
							WHEN Tipo = 'CPAGAR'				THEN 'Existem ' + CAST( QtdeReg AS VARCHAR ) + ' contas a pagar com vencimento até hoje.'
		    					WHEN Tipo = 'SOLICITACAO'  			THEN 'Existem ' + CAST( QtdeReg AS VARCHAR ) + ' solicitações pendentes.'
            		 	 			WHEN Tipo = 'ALMOXARIFADO' 			THEN 'Existem ' + CAST( QtdeReg AS VARCHAR ) + ' materiais com estoque mínimo atingido.'
                     					WHEN Tipo = 'INTEGRACAO' 			THEN 'Existem ' + CAST( QtdeReg AS VARCHAR ) + ' entradas concluídas sem gerar sua respectiva conta a pagar.'
                     					WHEN Tipo = 'INSCRTURMA' 			THEN 'Existem ' + CAST( QtdeReg AS VARCHAR ) + ' solicitações vencidas para ficha de inscrição on-line.'
                     					WHEN Tipo = 'MENSAGEM'				THEN 'Existem ' + CAST( QtdeReg AS VARCHAR ) + ' mensagens a serem enviadas.'
							WHEN Tipo = 'MOBILEMENSAGEM'			THEN 'Existem ' + CAST( QtdeReg AS VARCHAR ) + ' mensagens não lidas do aplicativo.'
							WHEN Tipo = 'MENSAGEMROTEIRO'  			THEN 'O roteiro de virada de ano para ' + CAST( DATEPART(YEAR, GETDATE()) + 1 AS VARCHAR ) + ' ainda não foi concluído.'
							WHEN Tipo = 'PAGAMENTOONLINEPENDENTE'		THEN 'Existem ' + CAST( QtdeReg AS VARCHAR ) + ' pagamentos online pendentes.'
							WHEN Tipo = 'COBRANCAATIVA'			THEN 'Existem ' + CAST( QtdeReg AS VARCHAR ) + ' responsáveis cuja data para próximo contato é igual ou anterior a hoje.'
							WHEN Tipo = 'CADASTROINADIMPLENCIA'		THEN 'Existem ' + CAST( QtdeReg AS VARCHAR ) + ' títulos de cobrança que estão no cadastro de inadimplência e com situação diferente de "em aberto".'
							WHEN TIPO = 'PROFANIVERSARIANTE'		THEN 'Existem ' + CAST( QtdeReg AS VARCHAR ) + ' professores aniversariando nos próximos dias.'
							WHEN TIPO = 'ALUNOANIVERSARIANTE'		THEN 'Existem ' + CAST( QtdeReg AS VARCHAR ) + ' alunos aniversariando nos próximos dias.'
							WHEN TIPO = 'RESPANIVERSARIANTE'		THEN 'Existem ' + CAST( QtdeReg AS VARCHAR ) + ' responsáveis aniversariando nos próximos dias.'
                                                        WHEN Tipo = 'COBRANCAREGISTRADA'		THEN 'Existem ' + CAST( QtdeReg AS VARCHAR ) + ' títulos "Em aberto" do tipo "Boleto" que não estão com registro confirmado junto ao agente de cobrança.'
							WHEN Tipo = 'COBRANCAVISUALIZACAOPORTAL'	THEN 'Existem ' + CAST( QtdeReg AS VARCHAR ) + ' títulos com vencimento até ' + CONVERT( VARCHAR, @DataAte_NaoVisualizadoPortal, 103 ) +  ' que ainda não foram visualizados pelo responsável no Portal'
							WHEN Tipo = 'CARTAOMOVIMENTACAOREPASSE'		THEN 'Existem ' + CAST( QtdeReg AS VARCHAR ) + ' movimentações de cartão com data prevista para repasse até ' + CONVERT( VARCHAR, @DataAte_NaoRepassadoCartaoMovimentacao, 103 ) +  ' que ainda não foram repassados'
							WHEN Tipo = 'SISAVALIACAOBLOQ'			THEN 'Existem ' + CAST( QtdeReg AS VARCHAR ) + ' séries/períodos com sistema de avaliação desbloqueado.'						
							WHEN Tipo = 'PORTAARQUIVOUTILIZADO'		THEN 'Já foi utilizado ' + CAST( QtdeReg AS VARCHAR ) + '% do seu plano atual no porta arquivos, é importante que um novo plano seja adquirido.'
							ELSE 'Existem ' + CAST( QtdeReg AS VARCHAR ) + ' títulos com situação diferente de "Aberto" para o agente de cobrança ' + Tipo
		    				END			    			     
					ELSE ''
	            		END
	FROM 	#tempAvisoTela t
	WHERE 	QtdeReg > 0

-- END


GO


-- [5:39:54 PM]	Started executing query at Line 1
	
	ALTER TABLE [dbo].[TbFaseNota] WITH CHECK ADD CONSTRAINT [FK_TbFaseNota_TbFormula_FormulaNota] FOREIGN KEY([IdFormulaNota]) REFERENCES [dbo].[TbFormula] ([IdFormula]) GO 
	
	ALTER TABLE [dbo].[TbContaPagarRateio] WITH CHECK ADD CONSTRAINT [FK_TbContaPagarRateio_TbEmpresa] FOREIGN KEY([IdEmpresa]) REFERENCES [dbo].[TbEmpresa] ([IdEmpresa]) GO 
	
	ALTER TABLE [dbo].[TbOptProva] WITH CHECK ADD CONSTRAINT [FK_TbOptProva_TbSerie] FOREIGN KEY([IdSerie]) REFERENCES [dbo].[TbSerie] ([IdSerie]) GO 
	
	ALTER TABLE [dbo].[TbTurmaProfessor] WITH CHECK ADD CONSTRAINT [FK_TbTurmaProfessor_TbTurma] FOREIGN KEY([IdTurma]) REFERENCES [dbo].[TbTurma] ([IdTurma]) GO 
	
	ALTER TABLE [dbo].[TbFaseNota] WITH CHECK ADD CONSTRAINT [FK_TbFaseNota_TbFaseNota1] FOREIGN KEY([IdFaseNotaReprovacao]) REFERENCES [dbo].[TbFaseNota] ([IdFaseNota]) GO 
	
	ALTER TABLE [dbo].[TbUsuario] WITH CHECK ADD CONSTRAINT [FK_TbUsuario_TbUnidade] FOREIGN KEY([_IdUnidade]) REFERENCES [dbo].[TbUnidade] ([IdUnidade]) GO 
	
	ALTER TABLE [dbo].[TbChequeEmitido] WITH CHECK ADD CONSTRAINT [TbChequeEmitido_FK] FOREIGN KEY([IdConta]) REFERENCES [dbo].[TbConta] ([IdConta]) GO 
	
	ALTER TABLE [dbo].[TbRelatorioFuncionalidade] WITH CHECK ADD CONSTRAINT [FK_TbRelatorioFuncionalidade_TbRelatorio] FOREIGN KEY([IdRelatorio]) REFERENCES [dbo].[TbRelatorio] ([IdRelatorio]) GO 
	
	ALTER TABLE [dbo].[TbFaseNota] WITH CHECK ADD CONSTRAINT [FK_TbFaseNota_TbFormula_FormulaComposicaoNota] FOREIGN KEY([IdFormulaComposicaoNota]) REFERENCES [dbo].[TbFormula] ([IdFormula]) GO 
	
	ALTER TABLE [dbo].[TbFaseNotaAluno] WITH CHECK ADD CONSTRAINT [FK_TbFaseNotaAluno_TbFaseNota1] FOREIGN KEY([IdFaseNota]) REFERENCES [dbo].[TbFaseNota] ([IdFaseNota]) GO 
	
	ALTER TABLE [dbo].[TbRelatorioMatricula] WITH CHECK ADD CONSTRAINT [FK_TbRelatorioMatricula_TbRelatorio] FOREIGN KEY([IdRelatorio]) REFERENCES [dbo].[TbRelatorio] ([IdRelatorio]) GO 
	
	ALTER TABLE [dbo].[TbFaseNota] WITH CHECK ADD CONSTRAINT [FK_TbFaseNota_TbFormula] FOREIGN KEY([IdFormulaAprovacao]) REFERENCES [dbo].[TbFormula] ([IdFormula]) GO 
	
	ALTER TABLE [dbo].[TbFaseNotaDisciplina] WITH CHECK ADD CONSTRAINT [FK_TbFaseNotaDisciplina_TbFaseNota] FOREIGN KEY([IdFaseNota]) REFERENCES [dbo].[TbFaseNota] ([IdFaseNota]) GO 
	
	ALTER TABLE [dbo].[TbAlunoObs] WITH CHECK ADD CONSTRAINT [FK_TbAlunoObs_TbUsuario] FOREIGN KEY([IdUsuarioRegistro]) REFERENCES [dbo].[TbUsuario] ([IdUsuario]) GO 
	
	ALTER TABLE [dbo].[TbPlanoPagamentoParcela] WITH CHECK ADD CONSTRAINT [FK_TbPlanoPagamentoParcela_TbFormaRecebimento] FOREIGN KEY([IdFormaRecebimento]) REFERENCES [dbo].[TbFormaRecebimento] ([IdFormaRecebimento]) GO 
	
	ALTER TABLE [dbo].[TbFavorecidoPlanoConta] WITH CHECK ADD CONSTRAINT [FK_TbFavorecidoPlanoConta_TbFavorecido] FOREIGN KEY([IdFavorecido]) REFERENCES [dbo].[TbFavorecido] ([IdFavorecido]) GO 
	
	ALTER TABLE [dbo].[TbUnidade] WITH CHECK ADD CONSTRAINT [FK__TbUnidade__IdTex__0301381D] FOREIGN KEY([IdTexto_AssinaturaDirecaoWeb]) REFERENCES [dbo].[TbTextoPersonalizado] ([IdTextoPersonalizado]) GO 
	
	ALTER TABLE [dbo].[TbFaseNota] WITH CHECK ADD CONSTRAINT [FK_TbFaseNota_TbFormula_AprovacaoFrequencia] FOREIGN KEY([IdFormulaAprovacaoFrequencia]) REFERENCES [dbo].[TbFormula] ([IdFormula]) GO 
	
	ALTER TABLE [dbo].[TbAlmoxMaterialMovimentacaoItem] WITH CHECK ADD CONSTRAINT [FK_TbAlmoxMaterialMovimentacaoItem_TbAlmoxMaterial] FOREIGN KEY([IdMaterial]) REFERENCES [dbo].[TbAlmoxMaterial] ([IdMaterial]) GO 
	
	ALTER TABLE [dbo].[TbFaseNotaDisciplinaTurma] WITH CHECK ADD CONSTRAINT [FK_TbFaseNotaDisciplinaTurma_TbFaseNota] FOREIGN KEY([IdFaseNota]) REFERENCES [dbo].[TbFaseNota] ([IdFaseNota]) GO 
	
	ALTER TABLE [dbo].[TbAlunoObs] WITH CHECK ADD CONSTRAINT [FK_TbAlunoObs_TbUsuario1] FOREIGN KEY([IdUsuarioLiberacao]) REFERENCES [dbo].[TbUsuario] ([IdUsuario]) GO 
	
	ALTER TABLE [dbo].[TbCaixaMovimentacao] WITH CHECK ADD CONSTRAINT [FK_TbCaixaMovimentacao_TbUsuario] FOREIGN KEY([IdUsuarioAutorizacaoEstorno]) REFERENCES [dbo].[TbUsuario] ([IdUsuario]) GO 
	
	ALTER TABLE [dbo].[TbCaixaMovimentacao] WITH CHECK ADD CONSTRAINT [FK_TbCaixaMovimentacao_TbConta] FOREIGN KEY([IdContaFinanceira]) REFERENCES [dbo].[TbConta] ([IdConta]) GO 
	
	ALTER TABLE [dbo].[TbChequeEmitidoContaPagar] WITH CHECK ADD CONSTRAINT [FK_TbChequeEmitidoContaPagar_ChequeEmitido] FOREIGN KEY([IdChequeEmitido]) REFERENCES [dbo].[TbChequeEmitido] ([IdChequeEmitido]) GO 
	
	ALTER TABLE [dbo].[TbFavorecidoPlanoConta] WITH CHECK ADD CONSTRAINT [FK_TbFavorecidoPlanoConta_TbPlanoContas] FOREIGN KEY([IdPlanoContas]) REFERENCES [dbo].[TbPlanoContas] ([IdPlanoContas]) GO 
	
	ALTER TABLE [dbo].[TbResponsavel] WITH CHECK ADD CONSTRAINT [FK_TbResponsavel_TbResponsavel_Pai] FOREIGN KEY([IdResponsavelPai]) REFERENCES [dbo].[TbResponsavel] ([IdResponsavel]) GO 
	
	ALTER TABLE [dbo].[TbFormaRecebimento] WITH CHECK ADD CONSTRAINT [FK_TbFormaRecebimento_TbConta] FOREIGN KEY([IdConta]) REFERENCES [dbo].[TbConta] ([IdConta]) GO 
	
	ALTER TABLE [dbo].[TbUnidade] WITH CHECK ADD CONSTRAINT [FK__TbUnidade__IdTex__03F55C56] FOREIGN KEY([IdTexto_AssinaturaTesourariaWeb]) REFERENCES [dbo].[TbTextoPersonalizado] ([IdTextoPersonalizado]) GO 
	
	ALTER TABLE [dbo].[TbFaseNotaAluno] WITH CHECK ADD CONSTRAINT [FK_TbFaseNotaAluno_TbFormula] FOREIGN KEY([IdFormulaComposicao]) REFERENCES [dbo].[TbFormula] ([IdFormula]) GO 
	
	ALTER TABLE [dbo].[TbAlunoTurma] WITH CHECK ADD CONSTRAINT [FK_TbAlunoTurma_TbMotivoInativacao] FOREIGN KEY([IdMotivoInativacao]) REFERENCES [dbo].[TbMotivoInativacao] ([IdMotivoInativacao]) GO 
	
	ALTER TABLE [dbo].[TbAlmoxMaterialMovimentacaoItem] WITH CHECK ADD CONSTRAINT [FK_TbAlmoxMaterialMovimentacaoItem_TbAlmoxMaterialMovimentacao] FOREIGN KEY([IdMaterialMovimentacao]) REFERENCES [dbo].[TbAlmoxMaterialMovimentacao] ([IdMaterialMovimentacao]) GO 
	
	ALTER TABLE [dbo].[TbOptProva] WITH CHECK ADD CONSTRAINT [FK_TbOptProva_TbFaseNota] FOREIGN KEY([IdFaseNota]) REFERENCES [dbo].[TbFaseNota] ([IdFaseNota]) GO 
	
	ALTER TABLE [dbo].[TbSolicitacao] WITH CHECK ADD CONSTRAINT [FK_TbSolicitacao_TbSolicitacaoTipo] FOREIGN KEY([IdSolicitacaoTipo]) REFERENCES [dbo].[TbSolicitacaoTipo] ([IdSolicitacaoTipo]) GO 
	
	ALTER TABLE [dbo].[TbChequeEmitidoContaPagar] WITH CHECK ADD CONSTRAINT [FK_TbChequeEmitidoContaPagar_ContaPagar] FOREIGN KEY([IdContaPagar]) REFERENCES [dbo].[TbContaPagar] ([IdContaPagar]) GO 
	
	ALTER TABLE [dbo].[TbResponsavel] WITH CHECK ADD CONSTRAINT [FK_TbResponsavel_TbResponsavel_Mae] FOREIGN KEY([IdResponsavelMae]) REFERENCES [dbo].[TbResponsavel] ([IdResponsavel]) GO 
	
	ALTER TABLE [dbo].[TbTurmaTurmaPrincipal] WITH CHECK ADD CONSTRAINT [FK_TbTurmaTurmaPrincipal_TbTurma] FOREIGN KEY([IdTurmaPrincipal]) REFERENCES [dbo].[TbTurma] ([IdTurma]) GO 
	
	ALTER TABLE [dbo].[TbUnidade] WITH CHECK ADD CONSTRAINT [FK__TbUnidade__IdTex__04E9808F] FOREIGN KEY([IdTexto_AssinaturaSecretariaWeb]) REFERENCES [dbo].[TbTextoPersonalizado] ([IdTextoPersonalizado]) GO 
	
	ALTER TABLE [dbo].[TbFaseNotaDisciplina] WITH CHECK ADD CONSTRAINT [FK_TbFaseNotaDisciplina_TbFormula] FOREIGN KEY([IdFormulaComposicaoNota]) REFERENCES [dbo].[TbFormula] ([IdFormula]) GO 
	
	ALTER TABLE [dbo].[TbCursoTipoCobranca06] WITH CHECK ADD CONSTRAINT [FK_TbCursoTipoCobranca06_TbPeriodo] FOREIGN KEY([Turma_IdPeriodo]) REFERENCES [dbo].[TbPeriodo] ([IdPeriodo]) GO 
	
	ALTER TABLE [dbo].[TbParametroEnsinoSuperior] WITH CHECK ADD CONSTRAINT [FK_TbParametroEnsinoSuperior_TbTipoSituacaoAlunoDisciplina] FOREIGN KEY([SituacaoPadraoMatriculaAlunoDisciplina]) REFERENCES [dbo].[TbTipoSituacaoAlunoDisciplina] ([TipoSituacaoAlunoDisciplina]) GO 
	
	ALTER TABLE [dbo].[TbOptSimuladoEnem] WITH CHECK ADD CONSTRAINT [FK_TbOptSimuladoEnem_TbFaseNota_IdFaseNota] FOREIGN KEY([IdFaseNota]) REFERENCES [dbo].[TbFaseNota] ([IdFaseNota]) GO 
	
	ALTER TABLE [dbo].[TbConfiguracaoEnvioBoleto] WITH CHECK ADD CONSTRAINT [FK_TbConfiguracaoEnvioBoleto_Email] FOREIGN KEY([Email]) REFERENCES [dbo].[TbTextoPersonalizado] ([IdTextoPersonalizado]) GO 
	
	ALTER TABLE [dbo].[TbSolicitacao] WITH CHECK ADD CONSTRAINT [FK_TbSolicitacao_TbUsuario] FOREIGN KEY([IdUsuarioAnalise]) REFERENCES [dbo].[TbUsuario] ([IdUsuario]) GO 
	
	ALTER TABLE [dbo].[TbChequeEmitidoPagamentoAvulso] WITH CHECK ADD CONSTRAINT [FK_TbChequeEmitidoPagamentoAvulso_LancamentoFinanceiro] FOREIGN KEY([IdLancamentoFinanceiro]) REFERENCES [dbo].[TbLancamentoFinanceiro] ([IdLancamentoFinanceiro]) GO 
	
	ALTER TABLE [dbo].[TbAlunoTurma] WITH CHECK ADD CONSTRAINT [FK_TbAlunoTurma_TbResponsavelFinanceiro] FOREIGN KEY([IdResponsavelFinanceiro]) REFERENCES [dbo].[TbResponsavel] ([IdResponsavel]) GO 
	
	ALTER TABLE [dbo].[TbUnidade] WITH CHECK ADD CONSTRAINT [FK_TbUnidade_TbAbatimento] FOREIGN KEY([IdDescontoPadraoNegociacao]) REFERENCES [dbo].[TbAbatimento] ([IdAbatimento]) GO 
	
	ALTER TABLE [dbo].[TbGradeCurricular] WITH CHECK ADD CONSTRAINT [FK_TbGradeCurricular_TbFormula] FOREIGN KEY([IdFormulaComposicao]) REFERENCES [dbo].[TbFormula] ([IdFormula]) GO 
	
	ALTER TABLE [dbo].[TbSituacaoAlunoDisciplina] WITH CHECK ADD CONSTRAINT [FK_TbTurmaDisciplinaAluno_TbFaseNota] FOREIGN KEY([IdFaseNotaAtual]) REFERENCES [dbo].[TbFaseNota] ([IdFaseNota]) GO 
	
	ALTER TABLE [dbo].[TbConfiguracaoEnvioBoleto] WITH CHECK ADD CONSTRAINT [FK_TbConfiguracaoEnvioBoleto_App] FOREIGN KEY([App]) REFERENCES [dbo].[TbTextoPersonalizado] ([IdTextoPersonalizado]) GO 
	
	ALTER TABLE [dbo].[TbFreqAlunoNotificacaoResponsavel] WITH CHECK ADD CONSTRAINT [FK_TbFreqAlunoNotificacaoResponsavel_TbAluno] FOREIGN KEY([IdAluno]) REFERENCES [dbo].[TbAluno] ([IdAluno]) GO 
	
	ALTER TABLE [dbo].[TbLancamentoFinanceiroRateio] WITH CHECK ADD CONSTRAINT [FK_TbLancamentoFinanceiroRateio_TbLancamentoFinanceiro] FOREIGN KEY([IdLancamentoFinanceiro]) REFERENCES [dbo].[TbLancamentoFinanceiro] ([IdLancamentoFinanceiro]) GO 
	
	ALTER TABLE [dbo].[TbAlunoTurma] WITH CHECK ADD CONSTRAINT [FK_TbAlunoTurma_TbResponsavelSecundario] FOREIGN KEY([IdResponsavelSecundario]) REFERENCES [dbo].[TbResponsavel] ([IdResponsavel]) GO 
	
	ALTER TABLE [dbo].[TbFaseNotaAluno] WITH CHECK ADD CONSTRAINT [FK_TbFaseNotaAluno_TbAlunoTurma] FOREIGN KEY([IdTurma], [IdAluno]) REFERENCES [dbo].[TbAlunoTurma] ([IdTurma], [IdAluno]) GO 
	
	ALTER TABLE [dbo].[TbTurmaDisciplinaFaseNota] WITH CHECK ADD CONSTRAINT [FK_TbTurmaDisciplinaFaseNota_TbFaseNota] FOREIGN KEY([IdFaseNota]) REFERENCES [dbo].[TbFaseNota] ([IdFaseNota]) GO 
	
	ALTER TABLE [dbo].[TbConfiguracaoEnvioBoleto] WITH CHECK ADD CONSTRAINT [FK_TbConfiguracaoEnvioBoleto_SMS] FOREIGN KEY([SMS]) REFERENCES [dbo].[TbTextoPersonalizado] ([IdTextoPersonalizado]) GO 
	
	ALTER TABLE [dbo].[TbAlunoTurmaBolsa] WITH CHECK ADD CONSTRAINT [FK_TbAlunoServicoBolsa_TbUsuario] FOREIGN KEY([IdUsuarioAutorizacao]) REFERENCES [dbo].[TbUsuario] ([IdUsuario]) GO 
	
	ALTER TABLE [dbo].[TbFreqAlunoNotificacaoResponsavel] WITH CHECK ADD CONSTRAINT [FK_TbFreqAlunoNotificacaoResponsavel_TbResponsavel] FOREIGN KEY([IdResponsavel]) REFERENCES [dbo].[TbResponsavel] ([IdResponsavel]) GO 
	
	ALTER TABLE [dbo].[TbParametroInternet] WITH CHECK ADD CONSTRAINT [FK_TbParametroInternet_TbSolicitacaoTipo] FOREIGN KEY([AlteracaoCadastro_IdSolicitacaoTipo]) REFERENCES [dbo].[TbSolicitacaoTipo] ([IdSolicitacaoTipo]) GO 
	
	ALTER TABLE [dbo].[TbAluno] WITH CHECK ADD CONSTRAINT [FK_TbAluno_TbResponsavel2] FOREIGN KEY([IdMae]) REFERENCES [dbo].[TbResponsavel] ([IdResponsavel]) GO 
	
	ALTER TABLE [dbo].[TbFormaRecebimentoLiquidacaoImpedimento] WITH CHECK ADD CONSTRAINT [FK_TbFormaRecebimentoLiquidacaoImpedimento_IdFormaRecebimento] FOREIGN KEY([IdFormaRecebimento]) REFERENCES [dbo].[TbFormaRecebimento] ([IdFormaRecebimento]) GO 
	
	ALTER TABLE [dbo].[TbFuncionalidadeGrupo] WITH CHECK ADD CONSTRAINT [FK_TbFuncionalidadeGrupo_TbGrupo] FOREIGN KEY([IdGrupo]) REFERENCES [dbo].[TbGrupo] ([IdGrupo]) GO 
	
	ALTER TABLE [dbo].[TbMobileTipoMensagemUsuario] WITH CHECK ADD CONSTRAINT [FK_TbMobileTipoMensagemUsuario_TbMobileTipoMensagem] FOREIGN KEY([IdMobileTipoMensagem]) REFERENCES [dbo].[TbMobileTipoMensagem] ([IdMobileTipoMensagem]) GO 
	
	ALTER TABLE [dbo].[TbCursoTipoCobranca05] WITH CHECK ADD CONSTRAINT [FK_TbCursoTipoCobranca05_TbPlanoPagamento] FOREIGN KEY([IdPlanoPagamento]) REFERENCES [dbo].[TbPlanoPagamento] ([IdPlanoPagamento]) GO 
	
	ALTER TABLE [dbo].[TbUsuarioUnidade] WITH CHECK ADD CONSTRAINT [FK_TbUsuarioUnidade_TbUsuario] FOREIGN KEY([IdUsuario]) REFERENCES [dbo].[TbUsuario] ([IdUsuario]) GO 
	
	ALTER TABLE [dbo].[TbParametroInternet] WITH CHECK ADD CONSTRAINT [FK_TbParametroInternet_TbSolicitacaoTipo1] FOREIGN KEY([CriticaSugestao_IdSolicitacaoTipo]) REFERENCES [dbo].[TbSolicitacaoTipo] ([IdSolicitacaoTipo]) GO 
	
	ALTER TABLE [dbo].[TbAluno] WITH CHECK ADD CONSTRAINT [FK_TbAluno_TbResponsavel] FOREIGN KEY([IdResponsavel]) REFERENCES [dbo].[TbResponsavel] ([IdResponsavel]) GO 
	
	ALTER TABLE [dbo].[TbTurmaProfessor] WITH CHECK ADD CONSTRAINT [FK_TbTurmaProfessor_TbProfessorDisciplina] FOREIGN KEY([IdProfessor], [IdDisciplina]) REFERENCES [dbo].[TbProfessorDisciplina] ([IdProfessor], [IdDisciplina]) GO 
	
	ALTER TABLE [dbo].[TbFormaRecebimentoLiquidacaoImpedimento] WITH CHECK ADD CONSTRAINT [FK_TbFormaRecebimentoLiquidacaoImpedimento_IdUsuarioLiberacao] FOREIGN KEY([IdUsuarioLiberacao]) REFERENCES [dbo].[TbUsuario] ([IdUsuario]) GO 
	
	ALTER TABLE [dbo].[TbRelatorioGrupo] WITH CHECK ADD CONSTRAINT [FK_TbRelatorioGrupo_TbGrupo] FOREIGN KEY([IdGrupo]) REFERENCES [dbo].[TbGrupo] ([IdGrupo]) GO 
	
	ALTER TABLE [dbo].[TbMobileTipoMensagemUsuario] WITH CHECK ADD CONSTRAINT [FK_TbMobileTipoMensagemUsuario_TbUsuario] FOREIGN KEY([IdUsuario]) REFERENCES [dbo].[TbUsuario] ([IdUsuario]) GO 
	
	ALTER TABLE [dbo].[TbCursoTipoCobranca05] WITH CHECK ADD CONSTRAINT [FK_TbCursoTipoCobranca05_TbTurma] FOREIGN KEY([Turma_IdTurma]) REFERENCES [dbo].[TbTurma] ([IdTurma]) GO 
	
	ALTER TABLE [dbo].[TbAlmoxRequisicao] WITH CHECK ADD CONSTRAINT [FK_TbAlmoxRequisicao_TbUsuario_Requisitante] FOREIGN KEY([IdUsuarioRequisitante]) REFERENCES [dbo].[TbUsuario] ([IdUsuario]) GO 
	
	ALTER TABLE [dbo].[TbEscola] WITH CHECK ADD CONSTRAINT [FK_TbEscola_TbUsuario] FOREIGN KEY([IdUsuarioRespEscola]) REFERENCES [dbo].[TbUsuario] ([IdUsuario]) GO 
	
	ALTER TABLE [dbo].[TbParametroInternet] WITH CHECK ADD CONSTRAINT [FK_TbParametroInternet_TbSolicitacaoTipo2] FOREIGN KEY([_ReservaVaga_IdSolicitacaoTipo]) REFERENCES [dbo].[TbSolicitacaoTipo] ([IdSolicitacaoTipo]) GO 
	
	ALTER TABLE [dbo].[TbAluno] WITH CHECK ADD CONSTRAINT [FK_TbAluno_TbPais] FOREIGN KEY([IdPaisOrigem]) REFERENCES [dbo].[TbPais] ([IdPais]) GO 
	
	ALTER TABLE [dbo].[TbChequeEmitidoPagamentoAvulso] WITH CHECK ADD CONSTRAINT [FK_TbChequeEmitidoPagamentoAvulso_ChequeEmitido] FOREIGN KEY([IdChequeEmitido]) REFERENCES [dbo].[TbChequeEmitido] ([IdChequeEmitido]) GO 
	
	ALTER TABLE [dbo].[TbAluno] WITH CHECK ADD CONSTRAINT [FK_TbAluno_TbResponsavel1] FOREIGN KEY([IdPai]) REFERENCES [dbo].[TbResponsavel] ([IdResponsavel]) GO 
	
	ALTER TABLE [dbo].[TbSerieGrupo] WITH CHECK ADD CONSTRAINT [FK_TbSerieGrupo_TbGrupo] FOREIGN KEY([IdGrupo]) REFERENCES [dbo].[TbGrupo] ([IdGrupo]) GO 
	
	ALTER TABLE [dbo].[TbTipoOcorrencia] WITH CHECK ADD CONSTRAINT [FK_TbTipoOcorrencia_TbTextoPersonalizado2] FOREIGN KEY([IdTextoPersonalizadoOcorrencia]) REFERENCES [dbo].[TbTextoPersonalizado] ([IdTextoPersonalizado]) GO 
	
	ALTER TABLE [dbo].[TbAlmoxRequisicao] WITH CHECK ADD CONSTRAINT [FK_TbAlmoxRequisicao_TbUsuario_Recebimento] FOREIGN KEY([IdUsuarioRecebimento]) REFERENCES [dbo].[TbUsuario] ([IdUsuario]) GO 
	
	ALTER TABLE [dbo].[TbChequeEmitidoPagamentoAvulso] WITH CHECK ADD CONSTRAINT [FK_TbChequeEmitidoPagamentoAvulso_Empresa] FOREIGN KEY([IdEmpresa]) REFERENCES [dbo].[TbEmpresa] ([IdEmpresa]) GO 
	
	ALTER TABLE [dbo].[TbResponsavelFoto] WITH CHECK ADD CONSTRAINT [FK_TbResponsavelFoto_TbResponsavel] FOREIGN KEY([IdResponsavel]) REFERENCES [dbo].[TbResponsavel] ([IdResponsavel]) GO 
	
	ALTER TABLE [dbo].[TbUsuarioGrupo] WITH CHECK ADD CONSTRAINT [FK_TbUsuarioGrupo_TbGrupo] FOREIGN KEY([IdGrupo]) REFERENCES [dbo].[TbGrupo] ([IdGrupo]) GO 
	
	ALTER TABLE [dbo].[TbCurriculoOptativa] WITH CHECK ADD CONSTRAINT [FK_TbCurriculoOptativa_TbCurriculo] FOREIGN KEY([IdCurriculo]) REFERENCES [dbo].[TbCurriculo] ([IdCurriculo]) GO 
	
	ALTER TABLE [dbo].[TbAlmoxRequisicao] WITH CHECK ADD CONSTRAINT [FK_TbAlmoxRequisicao_TbCentroResultado] FOREIGN KEY([IdSetorRequisitante]) REFERENCES [dbo].[TbCentroResultado] ([IdCentroResultado]) GO 
	
	ALTER TABLE [dbo].[TbParametroInternet] WITH CHECK ADD CONSTRAINT [FK_TbParametroInternet_TbPeriodo_ReservaMatriculaOnline] FOREIGN KEY([ReservaMatriculaOnline_IdPeriodo]) REFERENCES [dbo].[TbPeriodo] ([IdPeriodo]) GO 
	
	ALTER TABLE [dbo].[TbProfessor] WITH CHECK ADD CONSTRAINT [FK_TbProfessor_TbPais] FOREIGN KEY([IdPaisOrigem]) REFERENCES [dbo].[TbPais] ([IdPais]) GO 
	
	ALTER TABLE [dbo].[TbChequeEmitidoPagamentoAvulso] WITH CHECK ADD CONSTRAINT [FK_TbChequeEmitidoPagamentoAvulso_PlanoContas] FOREIGN KEY([IdPlanoContas]) REFERENCES [dbo].[TbPlanoContas] ([IdPlanoContas]) GO 
	
	ALTER TABLE [dbo].[TbFreqMarcacao] WITH CHECK ADD CONSTRAINT [FK_TbFreqMarcacao_TbResponsavel] FOREIGN KEY([IdResponsavelSaida]) REFERENCES [dbo].[TbResponsavel] ([IdResponsavel]) GO 
	
	ALTER TABLE [dbo].[TbArqArquivo] WITH CHECK ADD CONSTRAINT [FK_TbArqArquivo_TbProfessor] FOREIGN KEY([IdProfessor]) REFERENCES [dbo].[TbProfessor] ([IdProfessor]) GO 
	
	ALTER TABLE [dbo].[TbSolicitacao] WITH CHECK ADD CONSTRAINT [FK_TbSolicitacao_TbTurma_IdTurma] FOREIGN KEY([IdTurma]) REFERENCES [dbo].[TbTurma] ([IdTurma]) GO 
	
	ALTER TABLE [dbo].[TbAlmoxRequisicao] WITH CHECK ADD CONSTRAINT [FK_TbAlmoxRequisicao_TbUsuario_Conclusao] FOREIGN KEY([IdUsuario_ConclusaoRequisicao]) REFERENCES [dbo].[TbUsuario] ([IdUsuario]) GO 
	
	ALTER TABLE [dbo].[TbTurma] WITH CHECK ADD CONSTRAINT [FK_TbTurma_TbCursoSuperior] FOREIGN KEY([ES_IdCursoSuperiorPreferencial]) REFERENCES [dbo].[TbCursoSuperior] ([IdCursoSuperior]) GO 
	
	ALTER TABLE [dbo].[TbResponsavel] WITH CHECK ADD CONSTRAINT [FK_TbResponsavel_TbUnidade] FOREIGN KEY([IdUnidade]) REFERENCES [dbo].[TbUnidade] ([IdUnidade]) GO 
	
	ALTER TABLE [dbo].[TbLancamentoCobranca] WITH CHECK ADD CONSTRAINT [FK_TbLancamentoCobranca_TbLoteCobranca] FOREIGN KEY([IdLoteCobranca]) REFERENCES [dbo].[TbLoteCobranca] ([IdLoteCobranca]) GO 
	
	ALTER TABLE [dbo].[TbSolicitacao] WITH CHECK ADD CONSTRAINT [FK_TbSolicitacao_TbTituloCobranca_IdTituloCobranca] FOREIGN KEY([IdTituloCobranca]) REFERENCES [dbo].[TbTituloCobranca] ([IdTituloCobranca]) GO 
	
	ALTER TABLE [dbo].[TbTituloCobrancaVisualizacao] WITH CHECK ADD CONSTRAINT [FK_TbTituloCobrancaVisualizacao_TbTituloCobranca] FOREIGN KEY([IdTituloCobranca]) REFERENCES [dbo].[TbTituloCobranca] ([IdTituloCobranca]) GO 
	
	ALTER TABLE [dbo].[TbUsuarioGrupo] WITH CHECK ADD CONSTRAINT [FK_TbUsuarioGrupo_TbUsuario] FOREIGN KEY([IdUsuario]) REFERENCES [dbo].[TbUsuario] ([IdUsuario]) GO 
	
	ALTER TABLE [dbo].[TbProfessor] WITH CHECK ADD CONSTRAINT [FK_TbProfessor_TbResponsavel_Pai] FOREIGN KEY([IdPai]) REFERENCES [dbo].[TbResponsavel] ([IdResponsavel]) GO 
	
	ALTER TABLE [dbo].[TbLoteCobrancaServico] WITH CHECK ADD CONSTRAINT [FK_TbLoteCobrancaServico_TbLoteCobranca] FOREIGN KEY([IdLoteCobranca]) REFERENCES [dbo].[TbLoteCobranca] ([IdLoteCobranca]) GO 
	
	ALTER TABLE [dbo].[TbCurriculoOptativaDisciplina] WITH CHECK ADD CONSTRAINT [FK_TbCurriculoOptativaDisciplina_TbCurriculoOptativa] FOREIGN KEY([IdCurriculoOptativa]) REFERENCES [dbo].[TbCurriculoOptativa] ([IdCurriculoOptativa]) GO 
	
	ALTER TABLE [dbo].[TbHistoricoEnsinoSuperior] WITH CHECK ADD CONSTRAINT [FK_TbHistoricoEnsinoSuperior_TbDisciplina] FOREIGN KEY([IdDisciplina]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina]) GO 
	
	ALTER TABLE [dbo].[TbSolicitacaoDescontoTipo] WITH CHECK ADD CONSTRAINT [FK_TbSolicitacaoDescontoTipo_TbTextoPersonalizado] FOREIGN KEY([IdTextoPersonalizadoEmail]) REFERENCES [dbo].[TbTextoPersonalizado] ([IdTextoPersonalizado]) GO 
	
	ALTER TABLE [dbo].[TbProfessor] WITH CHECK ADD CONSTRAINT [FK_TbProfessor_TbResponsavel_Mae] FOREIGN KEY([IdMae]) REFERENCES [dbo].[TbResponsavel] ([IdResponsavel]) GO 
	
	ALTER TABLE [dbo].[TbEducacensoUnidade] WITH CHECK ADD CONSTRAINT [FK_TbEducacensoUnidade_TbUnidade] FOREIGN KEY([IdUnidade]) REFERENCES [dbo].[TbUnidade] ([IdUnidade]) GO 
	
	ALTER TABLE [dbo].[TbArqArquivoTurmaPublicacao] WITH CHECK ADD CONSTRAINT [FK_TbArqArquivoTurmaPublicacao_TbArqArquivo] FOREIGN KEY([IdArquivo]) REFERENCES [dbo].[TbArqArquivo] ([IdArquivo]) GO 
	
	ALTER TABLE [dbo].[TbMobileMensagem] WITH CHECK ADD CONSTRAINT [FK_TbMobileMensagem_TbMobileTipoMensagem] FOREIGN KEY([IdMobileTipoMensagem]) REFERENCES [dbo].[TbMobileTipoMensagem] ([IdMobileTipoMensagem]) GO 
	
	ALTER TABLE [dbo].[TbCurriculoOptativaDisciplina] WITH CHECK ADD CONSTRAINT [FK_TbCurriculoOptativaDisciplina_TbDisciplina] FOREIGN KEY([IdDisciplina]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina]) GO 
	
	ALTER TABLE [dbo].[TbCaixaMovimentacao] WITH CHECK ADD CONSTRAINT [FK_TbCaixaMovimentacao_TbUsuario_Autorizacao] FOREIGN KEY([IdUsuarioAutorizacao]) REFERENCES [dbo].[TbUsuario] ([IdUsuario]) GO 
	
	ALTER TABLE [dbo].[TbHistoricoEnsinoSuperior] WITH CHECK ADD CONSTRAINT [FK_TbHistoricoEnsinoSuperior_TbAlunoCursoSuperior] FOREIGN KEY([IdAlunoCursoSuperior]) REFERENCES [dbo].[TbAlunoCursoSuperior] ([IdAlunoCursoSuperior]) GO 
	
	ALTER TABLE [dbo].[TbChequeEmitidoTransferencia] WITH CHECK ADD CONSTRAINT [FK_TbChequeEmitidoTransferencia_ChequeEmitido] FOREIGN KEY([IdChequeEmitido]) REFERENCES [dbo].[TbChequeEmitido] ([IdChequeEmitido]) GO 
	
	ALTER TABLE [dbo].[TbTituloCobranca] WITH CHECK ADD CONSTRAINT [FK_TbTituloCobranca_TbResponsavel] FOREIGN KEY([IdResponsavel]) REFERENCES [dbo].[TbResponsavel] ([IdResponsavel]) GO 
	
	ALTER TABLE [dbo].[TbEducacensoUnidade] WITH CHECK ADD CONSTRAINT [FK_TbEducacensoUnidade_TbEducacensoCampo] FOREIGN KEY([IdEducacensoCampo]) REFERENCES [dbo].[TbEducacensoCampo] ([IdEducacensoCampo]) GO 
	
	ALTER TABLE [dbo].[TbArqArquivoTurmaPublicacao] WITH CHECK ADD CONSTRAINT [FK_TbArqArquivoTurmaPublicacao_TbTurma] FOREIGN KEY([IdTurma]) REFERENCES [dbo].[TbTurma] ([IdTurma]) GO 
	
	ALTER TABLE [dbo].[TbPagamento] WITH CHECK ADD CONSTRAINT [FK_TbPagamento_TbPagamentoLote] FOREIGN KEY([IdPagamentoLote]) REFERENCES [dbo].[TbPagamentoLote] ([IdPagamentoLote]) GO 
	
	ALTER TABLE [dbo].[TbAlunoCurso] WITH CHECK ADD CONSTRAINT [FK_TbAlunoCurso_OrientadorMonografia] FOREIGN KEY([IdOrientadorMonografia]) REFERENCES [dbo].[TbProfessor] ([IdProfessor]) GO 
	
	ALTER TABLE [dbo].[TbAlunoTurma] WITH CHECK ADD CONSTRAINT [FK_TbAlunoTurma_TbCurriculoOptativa] FOREIGN KEY([ES_IdCurriculoOptativa]) REFERENCES [dbo].[TbCurriculoOptativa] ([IdCurriculoOptativa]) GO 
	
	ALTER TABLE [dbo].[TbUnidade] WITH CHECK ADD CONSTRAINT [FK_TbUnidade_TbTipoImpedimentoRecebimentoCaixa] FOREIGN KEY([IdTipoImpedimentoRecebimentoCaixa]) REFERENCES [dbo].[TbTipoImpedimento] ([IdTipoImpedimento]) GO 
	
	ALTER TABLE [dbo].[TbHistoricoEnsinoSuperior] WITH CHECK ADD CONSTRAINT [FK_TbHistoricoEnsinoSuperior_TbPeriodo] FOREIGN KEY([IdPeriodo]) REFERENCES [dbo].[TbPeriodo] ([IdPeriodo]) GO 
	
	ALTER TABLE [dbo].[TbFormaRecebimento] WITH CHECK ADD CONSTRAINT [FK_TbFormaRecebimento_TbFavorecidoPagamento] FOREIGN KEY([IdFavorecidoPagamento]) REFERENCES [dbo].[TbFavorecido] ([IdFavorecido]) GO 
	
	ALTER TABLE [dbo].[TbChequeEmitidoTransferencia] WITH CHECK ADD CONSTRAINT [FK_TbChequeEmitidoTransferencia_Conta] FOREIGN KEY([IdContaDestino]) REFERENCES [dbo].[TbConta] ([IdConta]) GO 
	
	ALTER TABLE [dbo].[TbUnidade] WITH CHECK ADD CONSTRAINT [FK_TbUnidade_TbResponsavelNaoCadastrado] FOREIGN KEY([IdResponsavelNaoCadastrado]) REFERENCES [dbo].[TbResponsavel] ([IdResponsavel]) GO 
	
	ALTER TABLE [dbo].[TbSolicitacaoDesconto] WITH CHECK ADD CONSTRAINT [FK_TbSolicitacaoDesconto_TbSolicitacaoDescontoTipo] FOREIGN KEY([IdSolicitacaoDescontoTipo]) REFERENCES [dbo].[TbSolicitacaoDescontoTipo] ([IdSolicitacaoDescontoTipo]) GO 
	
	ALTER TABLE [dbo].[TbFaseNota] WITH CHECK ADD CONSTRAINT [FK_TbFaseNota_TbSerie] FOREIGN KEY([IdSerie]) REFERENCES [dbo].[TbSerie] ([IdSerie]) GO 
	
	ALTER TABLE [dbo].[TbChequeEmitidoTransferencia] WITH CHECK ADD CONSTRAINT [FK_TbChequeEmitidoTransferencia_LancamentoFinanceiroTransferencia] FOREIGN KEY([IdLancamentoFinanceiroTransferencia]) REFERENCES [dbo].[TbLancamentoFinanceiroTransferencia] ([IdLancamentoFinanceiroTransferencia]) GO 
	
	ALTER TABLE [dbo].[TbDiarioAulaChamadaOnline] WITH CHECK ADD CONSTRAINT [FK_TbDiarioAulaChamadaOnline_TbDiarioAula] FOREIGN KEY([IdDiarioAula]) REFERENCES [dbo].[TbDiarioAula] ([IdDiarioAula]) GO 
	
	ALTER TABLE [dbo].[TbRateioLancamentoCobranca] WITH CHECK ADD CONSTRAINT [FK_TbRateioLancamentoCobranca_TbRateioPessoa] FOREIGN KEY([IdRateioPessoa]) REFERENCES [dbo].[TbRateioPessoa] ([IdRateioPessoa]) GO 
	
	ALTER TABLE [dbo].[TbOptProvaGabarito] WITH CHECK ADD CONSTRAINT [FK__TbOptProv__IdPro__043C47BD] FOREIGN KEY([IdProva]) REFERENCES [dbo].[TbOptProva] ([IdProva]) GO 
	
	ALTER TABLE [dbo].[TbAlmoxRequisicaoItem] WITH CHECK ADD CONSTRAINT [FK_TbAlmoxRequisicaoItem_TbAlmoxAlmoxarifado] FOREIGN KEY([IdAlmoxarifado]) REFERENCES [dbo].[TbAlmoxAlmoxarifado] ([IdAlmoxarifado]) GO 
	
	ALTER TABLE [dbo].[TbParametroGlobal] WITH CHECK ADD CONSTRAINT [FK_TbParametroGlobal_TbFormaRecebimento] FOREIGN KEY([IdFormaRecebimento_NovoTitCobAMenor]) REFERENCES [dbo].[TbFormaRecebimento] ([IdFormaRecebimento]) GO 
	
	ALTER TABLE [dbo].[TbSolicitacaoDesconto] WITH CHECK ADD CONSTRAINT [FK_TbSolicitacaoDesconto_TbAluno] FOREIGN KEY([IdAluno]) REFERENCES [dbo].[TbAluno] ([IdAluno]) GO 
	
	ALTER TABLE [dbo].[TbDiarioAulaChamadaOnline] WITH CHECK ADD CONSTRAINT [FK_TbDiarioAulaChamadaOnline_TbAluno] FOREIGN KEY([IdAluno]) REFERENCES [dbo].[TbAluno] ([IdAluno]) GO 
	
	ALTER TABLE [dbo].[TbUnidade] WITH CHECK ADD CONSTRAINT [FK_TbUnidade_TbTipoImpedimentoAgendamento] FOREIGN KEY([IdTipoImpedimentoAgendamento]) REFERENCES [dbo].[TbTipoImpedimento] ([IdTipoImpedimento]) GO 
	
	ALTER TABLE [dbo].[TbOptProvaAlunoTurma] WITH CHECK ADD CONSTRAINT [FK_TbOptProvaAlunoTurma_TbOptProva] FOREIGN KEY([IdProva]) REFERENCES [dbo].[TbOptProva] ([IdProva]) GO 
	
	ALTER TABLE [dbo].[TbParametroCPR] WITH CHECK ADD CONSTRAINT [FK_TbParametroCPR_TbConta_EstornoManualLiquidacao] FOREIGN KEY([IdContaEstornoManualLiquidacao]) REFERENCES [dbo].[TbConta] ([IdConta]) GO 
	
	ALTER TABLE [dbo].[TbAlmoxRequisicaoItem] WITH CHECK ADD CONSTRAINT [FK_TbAlmoxRequisicaoItem_TbAlmoxMaterial] FOREIGN KEY([IdMaterial]) REFERENCES [dbo].[TbAlmoxMaterial] ([IdMaterial]) GO 
	
	ALTER TABLE [dbo].[TbSolicitacaoDesconto] WITH CHECK ADD CONSTRAINT [FK_TbSolicitacaoDesconto_TbResponsavel] FOREIGN KEY([IdResponsavel]) REFERENCES [dbo].[TbResponsavel] ([IdResponsavel]) GO 
	
	ALTER TABLE [dbo].[TbOrcOrcamento] WITH CHECK ADD CONSTRAINT [FK_TbOrcOrcamento_TbCentroResultado] FOREIGN KEY([IdCentroResultado]) REFERENCES [dbo].[TbCentroResultado] ([IdCentroResultado]) GO 
	
	ALTER TABLE [dbo].[TbArqArquivoAlunoVisualizacao] WITH CHECK ADD CONSTRAINT [FK_TbArqArquivoAlunoVisualizacao_IdArquivo] FOREIGN KEY([IdArquivo]) REFERENCES [dbo].[TbArqArquivo] ([IdArquivo]) GO 
	
	ALTER TABLE [dbo].[TbOptSimuladoEnem] WITH CHECK ADD CONSTRAINT [FK_TbOptSimuladoEnem_TbOptProva_IdProvaCHumanas] FOREIGN KEY([IdProvaCHumanas]) REFERENCES [dbo].[TbOptProva] ([IdProva]) GO 
	
	ALTER TABLE [dbo].[TbFaseNotaDisciplinaTurma] WITH CHECK ADD CONSTRAINT [FK_TbFaseNotaDisciplinaTurma_TbDisciplina] FOREIGN KEY([IdDisciplina]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina]) GO 
	
	ALTER TABLE [dbo].[TbAlmoxRequisicaoItem] WITH CHECK ADD CONSTRAINT [FK_TbAlmoxRequisicaoItem_TbRequisicao] FOREIGN KEY([IdRequisicao]) REFERENCES [dbo].[TbAlmoxRequisicao] ([IdRequisicao]) GO 
	
	ALTER TABLE [dbo].[TbSolicitacaoDesconto] WITH CHECK ADD CONSTRAINT [FK_TbSolicitacaoDesconto_TbUsuario] FOREIGN KEY([Analise_IdUsuario]) REFERENCES [dbo].[TbUsuario] ([IdUsuario]) GO 
	
	ALTER TABLE [dbo].[TbCartaoMovimentacao] WITH CHECK ADD CONSTRAINT [FK_TbCartaoMovimentacao_TbPagamentoOnline] FOREIGN KEY([IdPagamentoOnline]) REFERENCES [dbo].[TbPagamentoOnline] ([IdPagamentoOnline]) GO 
	
	ALTER TABLE [dbo].[TbOrcOrcamento] WITH CHECK ADD CONSTRAINT [FK_TbOrcOrcamento_TbEmpresa] FOREIGN KEY([IdEmpresa]) REFERENCES [dbo].[TbEmpresa] ([IdEmpresa]) GO 
	
	ALTER TABLE [dbo].[TbArqArquivoAlunoVisualizacao] WITH CHECK ADD CONSTRAINT [FK_TbArqArquivoAlunoVisualizacao_IdAluno] FOREIGN KEY([IdAluno]) REFERENCES [dbo].[TbAluno] ([IdAluno]) GO 
	
	ALTER TABLE [dbo].[TbOptSimuladoEnem] WITH CHECK ADD CONSTRAINT [FK_TbOptSimuladoEnem_TbOptProva_IdProvaCBiomedicas] FOREIGN KEY([IdProvaCBiomedicas]) REFERENCES [dbo].[TbOptProva] ([IdProva]) GO 
	
	ALTER TABLE [dbo].[TbTituloCobrancaVencimento] WITH CHECK ADD CONSTRAINT [FK_TbTituloCobrancaVencimento_TbTituloCobranca] FOREIGN KEY([IdTituloCobranca]) REFERENCES [dbo].[TbTituloCobranca] ([IdTituloCobranca]) GO 
	
	ALTER TABLE [dbo].[TbMetaConceito] WITH CHECK ADD CONSTRAINT [FK_TbMetaConceito_Periodo] FOREIGN KEY([IdPeriodo]) REFERENCES [dbo].[TbPeriodo] ([IdPeriodo]) GO 
	
	ALTER TABLE [dbo].[TbDiarioAula] WITH CHECK ADD CONSTRAINT [FK_TbDiarioAula_TbDiario] FOREIGN KEY([IdDiario]) REFERENCES [dbo].[TbDiario] ([IdDiario]) GO 
	
	ALTER TABLE [dbo].[TbSolicitacaoDespesa] WITH CHECK ADD CONSTRAINT [FK_TbSolicitacaoDespesa_TbCentroResultado] FOREIGN KEY([IdCentroResultado]) REFERENCES [dbo].[TbCentroResultado] ([IdCentroResultado]) GO 
	
	ALTER TABLE [dbo].[TbOptSimuladoEnem] WITH CHECK ADD CONSTRAINT [FK_TbOptSimuladoEnem_TbOptProva_IdProvaLinguagens] FOREIGN KEY([IdProvaLinguagens]) REFERENCES [dbo].[TbOptProva] ([IdProva]) GO 
	
	ALTER TABLE [dbo].[TbChequeTituloCobranca] WITH CHECK ADD CONSTRAINT [FK_TbChequeTituloCobranca_TbTituloCobranca] FOREIGN KEY([IdTituloCobranca]) REFERENCES [dbo].[TbTituloCobranca] ([IdTituloCobranca]) GO 
	
	ALTER TABLE [dbo].[TbFaseNotaDisciplinaTurma] WITH CHECK ADD CONSTRAINT [FK_TbFaseNotaDisciplinaTurma_TbTurma] FOREIGN KEY([IdTurma]) REFERENCES [dbo].[TbTurma] ([IdTurma]) GO 
	
	ALTER TABLE [dbo].[TbAlunoObs] WITH CHECK ADD CONSTRAINT [FK_TbAlunoObs_TbTipoOcorrencia] FOREIGN KEY([IdTipoOcorrencia]) REFERENCES [dbo].[TbTipoOcorrencia] ([IdTipoOcorrencia]) GO 
	
	ALTER TABLE [dbo].[TbMetaConceito] WITH CHECK ADD CONSTRAINT [FK_TbMetaConceito_Serie] FOREIGN KEY([IdSerie]) REFERENCES [dbo].[TbSerie] ([IdSerie]) GO 
	
	ALTER TABLE [dbo].[TbSolicitacaoDespesa] WITH CHECK ADD CONSTRAINT [FK_TbSolicitacaoDespesa_TbEmpresa] FOREIGN KEY([IdEmpresa]) REFERENCES [dbo].[TbEmpresa] ([IdEmpresa]) GO 
	
	ALTER TABLE [dbo].[TbOptSimuladoEnem] WITH CHECK ADD CONSTRAINT [FK_TbOptSimuladoEnem_TbOptProva_IdProvaMatematica] FOREIGN KEY([IdProvaMatematica]) REFERENCES [dbo].[TbOptProva] ([IdProva]) GO 
	
	ALTER TABLE [dbo].[TbCaixaRecebimento] WITH CHECK ADD CONSTRAINT [FK_TbCaixaRecebimento_TbTituloCobranca] FOREIGN KEY([IdTituloCobranca]) REFERENCES [dbo].[TbTituloCobranca] ([IdTituloCobranca]) GO 
	
	ALTER TABLE [dbo].[TbOptProvaGabarito] WITH CHECK ADD CONSTRAINT [FK_TbOptProvaGabarito_TbDisciplina02] FOREIGN KEY([IdDisciplina02]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina]) GO 
	
	ALTER TABLE [dbo].[TbUnidade] WITH CHECK ADD CONSTRAINT [FK_TbUnidade_TbTipoImpedimentoBoletoWEB] FOREIGN KEY([IdTipoImpedimentoImprimirBoletoWeb]) REFERENCES [dbo].[TbTipoImpedimento] ([IdTipoImpedimento]) GO 
	
	ALTER TABLE [dbo].[TbContaPagar] WITH CHECK ADD CONSTRAINT [FK_TbContaPagar_TbContaPagar] FOREIGN KEY([IdContaPagar_ParcelaInicial]) REFERENCES [dbo].[TbContaPagar] ([IdContaPagar]) GO 
	
	ALTER TABLE [dbo].[TbPagamentoTituloRelacionado] WITH CHECK ADD CONSTRAINT [FK_TbPagamentoTituloRelacionado_TbTituloCobranca] FOREIGN KEY([IdTituloCobranca]) REFERENCES [dbo].[TbTituloCobranca] ([IdTituloCobranca]) GO 
	
	ALTER TABLE [dbo].[TbPagamentoOnline] WITH CHECK ADD CONSTRAINT [FK_TbPagamentoOnline_TbTituloCobranca] FOREIGN KEY([IdTituloCobranca]) REFERENCES [dbo].[TbTituloCobranca] ([IdTituloCobranca]) GO 
	
	ALTER TABLE [dbo].[TbTurma] WITH CHECK ADD CONSTRAINT [FK_TbTurma_TbDisciplina] FOREIGN KEY([IdDisciplina]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina]) GO 
	
	ALTER TABLE [dbo].[TbOptProvaGabarito] WITH CHECK ADD CONSTRAINT [FK_TbOptProvaGabarito_TbDisciplina03] FOREIGN KEY([IdDisciplina03]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina]) GO 
	
	ALTER TABLE [dbo].[TbMetaFaseNotaAluno] WITH CHECK ADD CONSTRAINT [FK_TbMetaFaseNotaAluno_TbMetaConceito] FOREIGN KEY([IdMetaConceito]) REFERENCES [dbo].[TbMetaConceito] ([IdMetaConceito]) GO 
	
	ALTER TABLE [dbo].[TbPosTransacao] WITH CHECK ADD CONSTRAINT [FK_TbPosTransacao_TbUnidade] FOREIGN KEY([IdUnidade]) REFERENCES [dbo].[TbUnidade] ([IdUnidade]) GO 
	
	ALTER TABLE [dbo].[TbDiarioFrequencia] WITH CHECK ADD CONSTRAINT [FK_TbDiarioFrequencia_TbDiarioAula] FOREIGN KEY([IdDiarioAula]) REFERENCES [dbo].[TbDiarioAula] ([IdDiarioAula]) GO 
	
	ALTER TABLE [dbo].[TbContaPagar] WITH CHECK ADD CONSTRAINT [FK_TbContaPagar_TbHistoricoPadrao_IdComentarioPadrao] FOREIGN KEY([IdComentarioPadrao]) REFERENCES [dbo].[TbHistoricoPadrao] ([IdHistoricoPadrao]) GO 
	
	ALTER TABLE [dbo].[TbProcedimentoMatricula] WITH CHECK ADD CONSTRAINT [FK_TbProcedimentoMatricula_TbPeriodo] FOREIGN KEY([IdPeriodo]) REFERENCES [dbo].[TbPeriodo] ([IdPeriodo]) GO 
	
	ALTER TABLE [dbo].[TbOptProvaResposta] WITH CHECK ADD CONSTRAINT [FK_TbOptProvaResposta_TbOptProvaGabarito] FOREIGN KEY([IdProva], [NumeroQuestao]) REFERENCES [dbo].[TbOptProvaGabarito] ([IdProva], [NumeroQuestao]) GO 
	
	ALTER TABLE [dbo].[TbNegociacaoItem] WITH CHECK ADD CONSTRAINT [FK_TbNegociacaoItem_TbTituloCobranca] FOREIGN KEY([IdTituloCobranca]) REFERENCES [dbo].[TbTituloCobranca] ([IdTituloCobranca]) GO 
	
	ALTER TABLE [dbo].[TbAlunoTurmaProcedimentoMatriculaHistorico] WITH CHECK ADD CONSTRAINT [FK_TbAlunoTurmaProcedimentoMatriculaHistorico_TbAlunoTurma] FOREIGN KEY([IdTurma], [IdAluno]) REFERENCES [dbo].[TbAlunoTurma] ([IdTurma], [IdAluno]) GO 
	
	ALTER TABLE [dbo].[TbProfessorVinculoInstituicao] WITH CHECK ADD CONSTRAINT [FK_TbProfessorVinculoInstituicao_TbProfessor] FOREIGN KEY([IdProfessor]) REFERENCES [dbo].[TbProfessor] ([IdProfessor]) GO 
	
	ALTER TABLE [dbo].[TbOptProvaGabarito] WITH CHECK ADD CONSTRAINT [FK_TbOptProvaGabarito_TbDisciplina04] FOREIGN KEY([IdDisciplina04]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina]) GO 
	
	ALTER TABLE [dbo].[TbContaPagar] WITH CHECK ADD CONSTRAINT [FK_TbContaPagar_TbHistoricoPadrao_IdComentarioPadraoBaixa] FOREIGN KEY([IdComentarioPadraoBaixa]) REFERENCES [dbo].[TbHistoricoPadrao] ([IdHistoricoPadrao]) GO 
	
	ALTER TABLE [dbo].[TbProcedimentoMatricula] WITH CHECK ADD CONSTRAINT [FK_TbProcedimentoMatricula_TbSerie] FOREIGN KEY([IdSerie]) REFERENCES [dbo].[TbSerie] ([IdSerie]) GO 
	
	ALTER TABLE [dbo].[TbCursoTipoCobranca06] WITH CHECK ADD CONSTRAINT [FK_TbCursoTipoCobranca06_TbPlanoPagamento] FOREIGN KEY([IdPlanoPagamento]) REFERENCES [dbo].[TbPlanoPagamento] ([IdPlanoPagamento]) GO 
	
	ALTER TABLE [dbo].[TbSeriePeriodo] WITH CHECK ADD CONSTRAINT [FK_TbSeriePeriodo_TbTextoPersonalizado_AssinaturaDirecaoBoletimWeb] FOREIGN KEY([IdTexto_AssinaturaDirecaoBoletimWeb]) REFERENCES [dbo].[TbTextoPersonalizado] ([IdTextoPersonalizado]) GO 
	
	ALTER TABLE [dbo].[TbProfessorVinculoInstituicao] WITH CHECK ADD CONSTRAINT [FK_TbProfessorVinculoInstituicao_TbSituacaoProfessorInstituicao] FOREIGN KEY([IdSituacaoProfessorInstituicao]) REFERENCES [dbo].[TbSituacaoProfessorInstituicao] ([IdSituacaoProfessorInstituicao]) GO 
	
	ALTER TABLE [dbo].[TbOptProvaGabarito] WITH CHECK ADD CONSTRAINT [FK_TbOptProvaGabarito_TbDisciplina05] FOREIGN KEY([IdDisciplina05]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina]) GO 
	
	ALTER TABLE [dbo].[TbLancamentoFinanceiro] WITH CHECK ADD CONSTRAINT [FK_TbLancamentoFinanceiro_TbHistoricoPadrao_IdComentarioPadrao] FOREIGN KEY([IdComentarioPadrao]) REFERENCES [dbo].[TbHistoricoPadrao] ([IdHistoricoPadrao]) GO 
	
	ALTER TABLE [dbo].[TbExcecaoCobranca] WITH CHECK ADD CONSTRAINT [FK_TbExcecaoCobranca_TbParcelaCobranca] FOREIGN KEY([IdUnidade], [ParcelaCobranca]) REFERENCES [dbo].[TbParcelaCobranca] ([IdUnidade], [ParcelaCobranca]) GO 
	
	ALTER TABLE [dbo].[TbAlunoProprioResponsavel] WITH CHECK ADD CONSTRAINT [FK_TbAlunoProprioResponsavel_TbAluno] FOREIGN KEY([IdAluno]) REFERENCES [dbo].[TbAluno] ([IdAluno]) GO 
	
	ALTER TABLE [dbo].[TbCursoTipoCobranca06] WITH CHECK ADD CONSTRAINT [FK_TbCursoTipoCobranca06_TbTurno] FOREIGN KEY([Turma_IdTurno]) REFERENCES [dbo].[TbTurno] ([IdTurno]) GO 
	
	ALTER TABLE [dbo].[TbProfessorDisciplina] WITH CHECK ADD CONSTRAINT [FK_TbProfessorDisciplina_TbDisciplina] FOREIGN KEY([IdDisciplina]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina]) GO 
	
	ALTER TABLE [dbo].[TbSeriePeriodo] WITH CHECK ADD CONSTRAINT [FK_TbSeriePeriodo_TbTextoPersonalizado_AssinaturaSecretariaBoletimWeb] FOREIGN KEY([IdTexto_AssinaturaSecretariaBoletimWeb]) REFERENCES [dbo].[TbTextoPersonalizado] ([IdTextoPersonalizado]) GO 
	
	ALTER TABLE [dbo].[TbOptProvaGabarito] WITH CHECK ADD CONSTRAINT [FK_TbOptProvaGabarito_TbDisciplina06] FOREIGN KEY([IdDisciplina06]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina]) GO 
	
	ALTER TABLE [dbo].[TbFavorecido] WITH CHECK ADD CONSTRAINT [FK_TbFavorecido_TbHistoricoPadrao_IdComentarioPadrao] FOREIGN KEY([IdComentarioPadrao]) REFERENCES [dbo].[TbHistoricoPadrao] ([IdHistoricoPadrao]) GO 
	
	ALTER TABLE [dbo].[TbLoteCobranca] WITH CHECK ADD CONSTRAINT [FK_TbLoteCobranca_TbParcelaCobranca] FOREIGN KEY([IdUnidade], [ParcelaCobranca]) REFERENCES [dbo].[TbParcelaCobranca] ([IdUnidade], [ParcelaCobranca]) GO 
	
	ALTER TABLE [dbo].[TbAlunoProprioResponsavel] WITH CHECK ADD CONSTRAINT [FK_TbAlunoProprioResponsavel_TbResponsavel] FOREIGN KEY([IdResponsavel]) REFERENCES [dbo].[TbResponsavel] ([IdResponsavel]) GO 
	
	ALTER TABLE [dbo].[TbAlunoCursoDesconto] WITH CHECK ADD CONSTRAINT [FK_TbAlunoCursoDesconto_TbAlunoCurso] FOREIGN KEY([IdAlunoCurso]) REFERENCES [dbo].[TbAlunoCurso] ([IdAlunoCurso]) GO 
	
	ALTER TABLE [dbo].[TbDisciplinaRequisito] WITH CHECK ADD CONSTRAINT [FK_TbDisciplinaRequisito_TbDisciplina1] FOREIGN KEY([IdDisciplinaRequerida]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina]) GO 
	
	ALTER TABLE [dbo].[TbSeriePeriodo] WITH CHECK ADD CONSTRAINT [FK_TbSeriePeriodo_TbTextoPersonalizado_AssinaturaCoordenacaoBoletimWeb] FOREIGN KEY([IdTexto_AssinaturaCoordenacaoBoletimWeb]) REFERENCES [dbo].[TbTextoPersonalizado] ([IdTextoPersonalizado]) GO 
	
	ALTER TABLE [dbo].[TbOptProvaGabarito] WITH CHECK ADD CONSTRAINT [FK_TbOptProvaGabarito_TbDisciplina07] FOREIGN KEY([IdDisciplina07]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina]) GO 
	
	ALTER TABLE [dbo].[TbAutoAtendimentoTerminal] WITH CHECK ADD CONSTRAINT [FK_TbAutoAtendimentoTerminal_TbCartaoOperadora] FOREIGN KEY([IdCartaoOperadora]) REFERENCES [dbo].[TbCartaoOperadora] ([IdCartaoOperadora]) GO 
	
	ALTER TABLE [dbo].[TbAlunoCursoDesconto] WITH CHECK ADD CONSTRAINT [FK_TbAlunoCursoDesconto_TbPeriodo] FOREIGN KEY([IdPeriodo]) REFERENCES [dbo].[TbPeriodo] ([IdPeriodo]) GO 
	
	ALTER TABLE [dbo].[TbDisciplinaRequisito] WITH CHECK ADD CONSTRAINT [FK_TbDisciplinaRequisito_TbDisciplina] FOREIGN KEY([IdDisciplina]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina]) GO 
	
	ALTER TABLE [dbo].[TbSeriePeriodo] WITH CHECK ADD CONSTRAINT [FK_TbSeriePeriodo_TbTextoPersonalizado_AssinaturaTesourariaBoletimWeb] FOREIGN KEY([IdTexto_AssinaturaTesourariaBoletimWeb]) REFERENCES [dbo].[TbTextoPersonalizado] ([IdTextoPersonalizado]) GO 
	
	ALTER TABLE [dbo].[TbOptProvaGabarito] WITH CHECK ADD CONSTRAINT [FK_TbOptProvaGabarito_TbDisciplina08] FOREIGN KEY([IdDisciplina08]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina]) GO 
	
	ALTER TABLE [dbo].[TbCurso] WITH CHECK ADD CONSTRAINT [FK_TbCurso_TbVerificacaoMatricula] FOREIGN KEY([IdVerificacaoMatricula]) REFERENCES [dbo].[TbVerificacaoMatricula] ([IdVerificacaoMatricula]) GO 
	
	ALTER TABLE [dbo].[TbAlunoCursoDesconto] WITH CHECK ADD CONSTRAINT [FK_TbAlunoCursoDesconto_TbAbatimento] FOREIGN KEY([IdDesconto]) REFERENCES [dbo].[TbAbatimento] ([IdAbatimento]) GO 
	
	ALTER TABLE [dbo].[TbCurso] WITH CHECK ADD CONSTRAINT [FK_TbCurso_TbServico] FOREIGN KEY([IdServico]) REFERENCES [dbo].[TbServico] ([IdServico]) GO 
	
	ALTER TABLE [dbo].[TbGradeCurricular] WITH CHECK ADD CONSTRAINT [FK_TbGradeCurricular_TbDisciplina] FOREIGN KEY([IdDisciplina]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina]) GO 
	
	ALTER TABLE [dbo].[TbOptProvaGabarito] WITH CHECK ADD CONSTRAINT [FK_TbOptProvaGabarito_TbDisciplina09] FOREIGN KEY([IdDisciplina09]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina]) GO 
	
	ALTER TABLE [dbo].[TbTurma] WITH CHECK ADD CONSTRAINT [FK_TbTurma_Evento_IdTextoPersonalizadoCertificado] FOREIGN KEY([Evento_IdTextoPersonalizadoCertificado]) REFERENCES [dbo].[TbTextoPersonalizado] ([IdTextoPersonalizado]) GO 
	
	ALTER TABLE [dbo].[TbCurso] WITH CHECK ADD CONSTRAINT [FK_TbCurso_TbPlanoPagamento] FOREIGN KEY([IdPlanoPagamento]) REFERENCES [dbo].[TbPlanoPagamento] ([IdPlanoPagamento]) GO 
	
	ALTER TABLE [dbo].[TbFaseNotaAluno] WITH CHECK ADD CONSTRAINT [FK_TbFaseNotaAluno_TbDisciplina] FOREIGN KEY([IdDisciplina]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina]) GO 
	
	ALTER TABLE [dbo].[TbOptProvaGabarito] WITH CHECK ADD CONSTRAINT [FK_TbOptProvaGabarito_TbDisciplina10] FOREIGN KEY([IdDisciplina10]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina]) GO 
	
	ALTER TABLE [dbo].[TbPosTransacaoTituloCobranca] WITH CHECK ADD CONSTRAINT [FK_TbPosTransacaoTituloCobranca_TbPosTransacao] FOREIGN KEY([IdPosTransacao]) REFERENCES [dbo].[TbPosTransacao] ([IdPosTransacao]) GO 
	
	ALTER TABLE [dbo].[TbAlunoTurmaProcedimentoMatriculaHistorico] WITH CHECK ADD CONSTRAINT [FK_TbAlunoTurmaProcedimentoMatriculaHistorico_TbUsuario] FOREIGN KEY([IdUsuario]) REFERENCES [dbo].[TbUsuario] ([IdUsuario]) GO 
	
	ALTER TABLE [dbo].[TbResponsavel] WITH CHECK ADD CONSTRAINT [FK_TbResponsavel_TbProfissao] FOREIGN KEY([IdProfissao]) REFERENCES [dbo].[TbProfissao] ([IdProfissao]) GO 
	
	ALTER TABLE [dbo].[TbParametroInternet] WITH CHECK ADD CONSTRAINT [FK_TbParametroInternet_InscrEvento_IdSituacaoAlunoTurmaParticipante] FOREIGN KEY([InscrEvento_IdSituacaoAlunoTurmaParticipante]) REFERENCES [dbo].[TbSituacaoAlunoTurma] ([IdSituacaoAlunoTurma]) GO 
	
	ALTER TABLE [dbo].[TbOptProvaGabarito] WITH CHECK ADD CONSTRAINT [FK__TbOptProv__IdDis__03482384] FOREIGN KEY([IdDisciplina]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina]) GO 
	
	ALTER TABLE [dbo].[TbDiario] WITH CHECK ADD CONSTRAINT [FK_TbDiario_TbTurma] FOREIGN KEY([IdTurma]) REFERENCES [dbo].[TbTurma] ([IdTurma]) GO 
	
	ALTER TABLE [dbo].[TbUsuarioSituacaoSolicitacaoDesconto] WITH CHECK ADD CONSTRAINT [FK_TbUsuarioSituacaoSolicitacaoDesconto_TbUsuario] FOREIGN KEY([IdUsuario]) REFERENCES [dbo].[TbUsuario] ([IdUsuario]) GO 
	
	ALTER TABLE [dbo].[TbOptProvaGabarito] WITH CHECK ADD CONSTRAINT [FK_TbOptProvaGabarito_TbDisciplina11] FOREIGN KEY([IdDisciplina11]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina]) GO 
	
	ALTER TABLE [dbo].[TbPosTransacaoTituloCobranca] WITH CHECK ADD CONSTRAINT [FK_TbPosTransacaoTituloCobranca_TbTituloCobranca] FOREIGN KEY([IdTituloCobranca]) REFERENCES [dbo].[TbTituloCobranca] ([IdTituloCobranca]) GO 
	
	ALTER TABLE [dbo].[TbSolicitacao] WITH CHECK ADD CONSTRAINT [FK_TbSolicitacao_TbResponsavel_IdProfissao] FOREIGN KEY([IdProfissao]) REFERENCES [dbo].[TbProfissao] ([IdProfissao]) GO 
	
	ALTER TABLE [dbo].[TbTituloCobranca] WITH CHECK ADD CONSTRAINT [FK_TbTituloCobranca_TbAgenteCobranca] FOREIGN KEY([IdAgenteCobrancaRegistrada]) REFERENCES [dbo].[TbAgenteCobranca] ([IdAgenteCobranca]) GO 
	
	ALTER TABLE [dbo].[TbProfessorHorario] WITH CHECK ADD CONSTRAINT [FK_TbProfessorHorario_TbProfessor] FOREIGN KEY([IdProfessor]) REFERENCES [dbo].[TbProfessor] ([IdProfessor]) GO 
	
	ALTER TABLE [dbo].[TbDiario] WITH CHECK ADD CONSTRAINT [FK_TbDiaro_TbDisciplina] FOREIGN KEY([IdDisciplina]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina]) GO 
	
	ALTER TABLE [dbo].[TbUsuarioSituacaoSolicitacaoDesconto] WITH CHECK ADD CONSTRAINT [FK_TbUsuarioSituacaoSolicitacaoDesconto_TbSituacaoSolicitacaoDesconto] FOREIGN KEY([IdSituacaoSolicitacaoDesconto]) REFERENCES [dbo].[TbSituacaoSolicitacaoDesconto] ([IdSituacaoSolicitacaoDesconto]) GO 
	
	ALTER TABLE [dbo].[TbOptProvaGabarito] WITH CHECK ADD CONSTRAINT [FK_TbOptProvaGabarito_TbDisciplina12] FOREIGN KEY([IdDisciplina12]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina]) GO 
	
	ALTER TABLE [dbo].[TbUnidade] WITH CHECK ADD CONSTRAINT [FK_TbUnidade_TbTipoImpedimento] FOREIGN KEY([IdTipoImpedimentoMatricula]) REFERENCES [dbo].[TbTipoImpedimento] ([IdTipoImpedimento]) GO 
	
	ALTER TABLE [dbo].[TbAvaliacaoParametro] WITH CHECK ADD CONSTRAINT [FK_TbAvaliacaoParametro_TbUnidade] FOREIGN KEY([IdUnidade]) REFERENCES [dbo].[TbUnidade] ([IdUnidade]) GO 
	
	ALTER TABLE [dbo].[TbProfessorHorario] WITH CHECK ADD CONSTRAINT [FK_TbProfessorHorario_TbPeriodo] FOREIGN KEY([IdPeriodo]) REFERENCES [dbo].[TbPeriodo] ([IdPeriodo]) GO 
	
	ALTER TABLE [dbo].[TbOptProvaGabarito] WITH CHECK ADD CONSTRAINT [FK_TbOptProvaGabarito_TbDisciplina13] FOREIGN KEY([IdDisciplina13]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina]) GO 
	
	ALTER TABLE [dbo].[TbOptProvaAlunoTurma] WITH CHECK ADD CONSTRAINT [FK_TbOptProvaAlunoTurma_TbAluno] FOREIGN KEY([IdAluno]) REFERENCES [dbo].[TbAluno] ([IdAluno]) GO 
	
	ALTER TABLE [dbo].[TbAluno] WITH CHECK ADD CONSTRAINT [FK_TbAluno_TbReligiao] FOREIGN KEY([IdReligiao]) REFERENCES [dbo].[TbReligiao] ([IdReligiao]) GO 
	
	ALTER TABLE [dbo].[TbAlunoCursoSuperior] WITH CHECK ADD CONSTRAINT [FK_TbAlunoCursoSuperior_TbFormaIngresso] FOREIGN KEY([IdFormaIngresso]) REFERENCES [dbo].[TbFormaIngresso] ([IdFormaIngresso]) GO 
	
	ALTER TABLE [dbo].[TbParametroInternet] WITH CHECK ADD CONSTRAINT [FK_TbParametroInternet_TbSituacaoSolicitacaoDesconto_AguardandoDocumento] FOREIGN KEY([SolicitacaoDesconto_IdSituacaoAguardandoDocumento]) REFERENCES [dbo].[TbSituacaoSolicitacaoDesconto] ([IdSituacaoSolicitacaoDesconto]) GO 
	
	ALTER TABLE [dbo].[TbOptProvaGabarito] WITH CHECK ADD CONSTRAINT [FK_TbOptProvaGabarito_TbDisciplina14] FOREIGN KEY([IdDisciplina14]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina]) GO 
	
	ALTER TABLE [dbo].[TbOptProvaAlunoTurma] WITH CHECK ADD CONSTRAINT [FK_TbOptProvaAlunoTurma_TbTurma] FOREIGN KEY([IdTurma]) REFERENCES [dbo].[TbTurma] ([IdTurma]) GO 
	
	ALTER TABLE [dbo].[TbFaseNotaDisciplina] WITH CHECK ADD CONSTRAINT [FK_TbFaseNotaDisciplina_TbDisciplina] FOREIGN KEY([IdDisciplina]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina]) GO 
	
	ALTER TABLE [dbo].[TbProfessor] WITH CHECK ADD CONSTRAINT [FK_TbProfessor_TbReligiao] FOREIGN KEY([IdReligiao]) REFERENCES [dbo].[TbReligiao] ([IdReligiao]) GO 
	
	ALTER TABLE [dbo].[TbTurma] WITH CHECK ADD CONSTRAINT [FK_TbTurma_TbTextoPersonalizado] FOREIGN KEY([RMOnLine_IdTextoPersonalizado_Confirmacao]) REFERENCES [dbo].[TbTextoPersonalizado] ([IdTextoPersonalizado]) GO 
	
	ALTER TABLE [dbo].[TbCaixaMovimentacao] WITH CHECK ADD CONSTRAINT [FK_TbCaixaMovimentacao_TbChequeMovimentacao] FOREIGN KEY([IdChequeMovimentacao]) REFERENCES [dbo].[TbChequeMovimentacao] ([IdChequeMovimentacao]) GO 
	
	ALTER TABLE [dbo].[TbParametroNotaFiscal] WITH CHECK ADD CONSTRAINT [FK_TbParametroNotaFiscal_TbEmpresa] FOREIGN KEY([IdEmpresa]) REFERENCES [dbo].[TbEmpresa] ([IdEmpresa]) GO 
	
	ALTER TABLE [dbo].[TbParametroInternet] WITH CHECK ADD CONSTRAINT [FK_TbParametroInternet_TbSituacaoSolicitacaoDesconto_AnalisePedente] FOREIGN KEY([SolicitacaoDesconto_IdSituacaoAnalisePedente]) REFERENCES [dbo].[TbSituacaoSolicitacaoDesconto] ([IdSituacaoSolicitacaoDesconto]) GO 
	
	ALTER TABLE [dbo].[TbOptProvaGabarito] WITH CHECK ADD CONSTRAINT [FK_TbOptProvaGabarito_TbDisciplina15] FOREIGN KEY([IdDisciplina15]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina]) GO 
	
	ALTER TABLE [dbo].[TbOptProvaResposta] WITH CHECK ADD CONSTRAINT [FK_TbOptProvaResposta_TbOptProvaAlunoTurma] FOREIGN KEY([IdProva], [IdAluno], [IdTurma]) REFERENCES [dbo].[TbOptProvaAlunoTurma] ([IdProva], [IdAluno], [IdTurma]) GO 
	
	ALTER TABLE [dbo].[TbResponsavel] WITH CHECK ADD CONSTRAINT [FK_TbResponsavel_TbReligiao] FOREIGN KEY([IdReligiao]) REFERENCES [dbo].[TbReligiao] ([IdReligiao]) GO 
	
	ALTER TABLE [dbo].[TbLancamentoCobranca] WITH CHECK ADD CONSTRAINT [FK_TbLancamentoCobranca_TbNotaFiscal] FOREIGN KEY([IdNotaFiscal]) REFERENCES [dbo].[TbNotaFiscal] ([IdNotaFiscal]) GO 
	
	ALTER TABLE [dbo].[TbAvaliacao] WITH CHECK ADD CONSTRAINT [FK_TbAvaliacao_TbUnidade] FOREIGN KEY([IdUnidade]) REFERENCES [dbo].[TbUnidade] ([IdUnidade]) GO 
	
	ALTER TABLE [dbo].[TbSolicitacao] WITH CHECK ADD CONSTRAINT [FK_TbSolicitacao_TbResponsavel_IdReligiao] FOREIGN KEY([IdReligiao]) REFERENCES [dbo].[TbReligiao] ([IdReligiao]) GO 
	
	ALTER TABLE [dbo].[TbCursoTipoCobranca02] WITH CHECK ADD CONSTRAINT [FK_TbCursoTipoCobranca02_TbTurno] FOREIGN KEY([Turma_IdTurno]) REFERENCES [dbo].[TbTurno] ([IdTurno]) GO 
	
	ALTER TABLE [dbo].[TbParametroRCartao] WITH CHECK ADD CONSTRAINT [FK_TbParametroRCartao_TbPlanoContas] FOREIGN KEY([IdPlanoContasMovimentacao]) REFERENCES [dbo].[TbPlanoContas] ([IdPlanoContas]) GO 
	
	ALTER TABLE [dbo].[TbTituloCobrancaRegistrada] WITH CHECK ADD CONSTRAINT [FK_TbTituloCobrancaRegistrada_TbTituloCobranca] FOREIGN KEY([IdTituloCobranca]) REFERENCES [dbo].[TbTituloCobranca] ([IdTituloCobranca]) GO 
	
	ALTER TABLE [dbo].[TbCursoTipoCobranca02] WITH CHECK ADD CONSTRAINT [FK_TbCursoTipoCobranca02_TbPlanoPagamento] FOREIGN KEY([IdPlanoPagamento]) REFERENCES [dbo].[TbPlanoPagamento] ([IdPlanoPagamento]) GO 
	
	ALTER TABLE [dbo].[TbUnidade] WITH CHECK ADD CONSTRAINT [FK_TbUnidade_TbTipoImpedimentoWeb] FOREIGN KEY([IdTipoImpedimentoWeb]) REFERENCES [dbo].[TbTipoImpedimento] ([IdTipoImpedimento]) GO 
	
	ALTER TABLE [dbo].[TbSolicitacaoDespesa] WITH CHECK ADD CONSTRAINT [FK_TbSolicitacaoDespesa_TbUsuario_Solicitante] FOREIGN KEY([IdUsuarioSolicitante]) REFERENCES [dbo].[TbUsuario] ([IdUsuario]) GO 
	
	ALTER TABLE [dbo].[TbTituloCobrancaRegistrada] WITH CHECK ADD CONSTRAINT [FK_TbTituloCobrancaRegistrada_TbUsuario] FOREIGN KEY([IdUsuario]) REFERENCES [dbo].[TbUsuario] ([IdUsuario]) GO 
	
	ALTER TABLE [dbo].[TbMeta] WITH CHECK ADD CONSTRAINT [FK_TbMeta_TbMetaFaseNota] FOREIGN KEY([IdFaseNota]) REFERENCES [dbo].[TbMetaFaseNota] ([IdFaseNota]) GO 
	
	ALTER TABLE [dbo].[TbAlunoTurmaHistorico] WITH CHECK ADD CONSTRAINT [FK_TbAlunoTurmaHistorico_TbTurma] FOREIGN KEY([IdTurma]) REFERENCES [dbo].[TbTurma] ([IdTurma]) GO 
	
	ALTER TABLE [dbo].[TbAvaliacaoFormulario] WITH CHECK ADD CONSTRAINT [FK_TbAvaliacaoFormulario_TbAvaliacao] FOREIGN KEY([IdAvaliacao]) REFERENCES [dbo].[TbAvaliacao] ([IdAvaliacao]) GO 
	
	ALTER TABLE [dbo].[TbProfessorObs] WITH CHECK ADD CONSTRAINT [FK_TbProfessorObs_TbProfessor] FOREIGN KEY([IdProfessor]) REFERENCES [dbo].[TbProfessor] ([IdProfessor]) GO 
	
	ALTER TABLE [dbo].[TbSolicitacaoDespesa] WITH CHECK ADD CONSTRAINT [FK_TbSolicitacaoDespesa_TbUsuario_Autorizacao] FOREIGN KEY([IdUsuarioAutorizacao]) REFERENCES [dbo].[TbUsuario] ([IdUsuario]) GO 
	
	ALTER TABLE [dbo].[TbIntegracaoComercialItens] WITH CHECK ADD CONSTRAINT [FK_TbIntegracaoComercialItens_TbIntegracaoComercial] FOREIGN KEY([idIntegracaoComercial]) REFERENCES [dbo].[TbIntegracaoComercial] ([IdIntegracaoComercial]) GO 
	
	ALTER TABLE [dbo].[TbTituloCobrancaRegistrada] WITH CHECK ADD CONSTRAINT [FK_TbTituloCobrancaRegistrada_TbAgenteCobranca] FOREIGN KEY([IdAgenteCobranca]) REFERENCES [dbo].[TbAgenteCobranca] ([IdAgenteCobranca]) GO 
	
	ALTER TABLE [dbo].[TbMeta] WITH CHECK ADD CONSTRAINT [FK_TbMeta_TbDisciplina] FOREIGN KEY([IdDisciplina]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina]) GO 
	
	ALTER TABLE [dbo].[TbAlmoxUsuarioAlmoxarifado] WITH CHECK ADD CONSTRAINT [FK_TbAlmoxUsuarioAlmoxarifado_TbUsuario] FOREIGN KEY([IdUsuario]) REFERENCES [dbo].[TbUsuario] ([IdUsuario]) GO 
	
	ALTER TABLE [dbo].[TbSolicitacaoDesconto] WITH CHECK ADD CONSTRAINT [FK_TbSolicitacaoDesconto_TbSituacaoSolicitacaoDesconto] FOREIGN KEY([IdSituacaoSolicitacaoDesconto]) REFERENCES [dbo].[TbSituacaoSolicitacaoDesconto] ([IdSituacaoSolicitacaoDesconto]) GO 
	
	ALTER TABLE [dbo].[TbFaseNotaOrigemDestino] WITH CHECK ADD CONSTRAINT [FK_TbFaseNotaOrigemDestino_TbPeriodo] FOREIGN KEY([IdPeriodo]) REFERENCES [dbo].[TbPeriodo] ([IdPeriodo]) GO 
	
	ALTER TABLE [dbo].[TbProfessorObs] WITH CHECK ADD CONSTRAINT [FK_TbProfessorObs_TbTipoOcorrencia] FOREIGN KEY([IdTipoOcorrencia]) REFERENCES [dbo].[TbTipoOcorrencia] ([IdTipoOcorrencia]) GO 
	
	ALTER TABLE [dbo].[TbSolicitacaoDespesa] WITH CHECK ADD CONSTRAINT [FK_TbSolicitacaoDespesa_TbPlanoContas] FOREIGN KEY([IdPlanoContas]) REFERENCES [dbo].[TbPlanoContas] ([IdPlanoContas]) GO 
	
	ALTER TABLE [dbo].[TbParametroInternet] WITH CHECK ADD CONSTRAINT [FK_TbParametroInternet_InscrTurma_IdTextoPersonalizadoComVaga] FOREIGN KEY([InscrTurma_IdTextoPersonalizadoComVaga]) REFERENCES [dbo].[TbTextoPersonalizado] ([IdTextoPersonalizado]) GO 
	
	ALTER TABLE [dbo].[TbAlmoxUsuarioAlmoxarifado] WITH CHECK ADD CONSTRAINT [FK_TbAlmoxUsuarioAlmoxarifado_TbAlmoxAlmoxarifado] FOREIGN KEY([IdAlmoxarifado]) REFERENCES [dbo].[TbAlmoxAlmoxarifado] ([IdAlmoxarifado]) GO 
	
	ALTER TABLE [dbo].[TbSolicitacaoDescontoTipo] WITH CHECK ADD CONSTRAINT [FK_TbSolicitacaoDescontoTipo_TbTipoImpedimento] FOREIGN KEY([IdTipoImpedimento]) REFERENCES [dbo].[TbTipoImpedimento] ([IdTipoImpedimento]) GO 
	
	ALTER TABLE [dbo].[TbCurriculoDisciplinaEquivalente] WITH CHECK ADD CONSTRAINT [FK_TbCurriculoDisciplinaEquivalente_TbDisciplina1] FOREIGN KEY([IdDisciplinaCursada]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina]) GO 
	
	ALTER TABLE [dbo].[TbAtividadeComplementar] WITH CHECK ADD CONSTRAINT [FK_TbAtividadeComplementar_TbAlunoCurso] FOREIGN KEY([IdAlunoCurso]) REFERENCES [dbo].[TbAlunoCurso] ([IdAlunoCurso]) GO 
	
	ALTER TABLE [dbo].[TbCartaoMovimentacao] WITH CHECK ADD CONSTRAINT [FK_TbCartaoMovimentacao_TbPosTransacao] FOREIGN KEY([IdPosTransacao]) REFERENCES [dbo].[TbPosTransacao] ([IdPosTransacao]) GO 
	
	ALTER TABLE [dbo].[TbFaseNotaOrigemDestino] WITH CHECK ADD CONSTRAINT [FK_TbFaseNotaOrigemDestino_TbSerie_Origem] FOREIGN KEY([IdSerieOrigem]) REFERENCES [dbo].[TbSerie] ([IdSerie]) GO 
	
	ALTER TABLE [dbo].[TbProfessorObs] WITH CHECK ADD CONSTRAINT [FK_TbProfessorObs_TbUsuario] FOREIGN KEY([IdUsuarioRegistro]) REFERENCES [dbo].[TbUsuario] ([IdUsuario]) GO 
	
	ALTER TABLE [dbo].[TbParametroInternet] WITH CHECK ADD CONSTRAINT [FK_TbParametroInternet_InscrTurma_IdTextoPersonalizadoSemVaga] FOREIGN KEY([InscrTurma_IdTextoPersonalizadoSemVaga]) REFERENCES [dbo].[TbTextoPersonalizado] ([IdTextoPersonalizado]) GO 
	
	ALTER TABLE [dbo].[TbUnidade] WITH CHECK ADD CONSTRAINT [FK_TbUnidade_TbTipoOcorrencia] FOREIGN KEY([IdTipoOcorrenciaAlteracaoResponsavelTitulo]) REFERENCES [dbo].[TbTipoOcorrencia] ([IdTipoOcorrencia]) GO 
	
	ALTER TABLE [dbo].[TbMetaFaseNotaAluno] WITH CHECK ADD CONSTRAINT [FK_TbMetaFaseNotaAluno_TbMeta] FOREIGN KEY([IdMeta]) REFERENCES [dbo].[TbMeta] ([IdMeta]) GO 
	
	ALTER TABLE [dbo].[TbCurriculoDisciplinaEquivalente] WITH CHECK ADD CONSTRAINT [FK_TbCurriculoDisciplinaEquivalente_TbDisciplina2] FOREIGN KEY([IdDisciplinaEquivalente]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina]) GO 
	
	ALTER TABLE [dbo].[TbFaseNotaOrigemDestino] WITH CHECK ADD CONSTRAINT [FK_TbFaseNotaOrigemDestino_TbSerie_Destino] FOREIGN KEY([IdSerieDestino]) REFERENCES [dbo].[TbSerie] ([IdSerie]) GO 
	
	ALTER TABLE [dbo].[tbIntegracaoComercialFaturas] WITH CHECK ADD CONSTRAINT [FK_TbIntegracaoComercialFaturas_TbIntegracaoComercial] FOREIGN KEY([idIntegracaoComercial]) REFERENCES [dbo].[TbIntegracaoComercial] ([IdIntegracaoComercial]) GO 
	
	ALTER TABLE [dbo].[TbLoteCobrancaRegistradaArquivoRemessa] WITH CHECK ADD CONSTRAINT [FK_TbLoteCobrancaRegistradaArquivoRemessa_TbUsuario] FOREIGN KEY([IdUsuario]) REFERENCES [dbo].[TbUsuario] ([IdUsuario]) GO 
	
	ALTER TABLE [dbo].[TbLoteCobrancaRegistradaTitulo] WITH CHECK ADD CONSTRAINT [FK_TbLoteCobrancaRegistradaTitulo_TbTituloCobranca] FOREIGN KEY([IdTituloCobranca]) REFERENCES [dbo].[TbTituloCobranca] ([IdTituloCobranca]) GO 
	
	ALTER TABLE [dbo].[TbMetaFaseNotaAluno] WITH CHECK ADD CONSTRAINT [FK_TbMetaFaseNotaAluno_TbAlunoTurma] FOREIGN KEY([IdTurma], [IdAluno]) REFERENCES [dbo].[TbAlunoTurma] ([IdTurma], [IdAluno]) GO 
	
	ALTER TABLE [dbo].[TbParametroCPR] WITH CHECK ADD CONSTRAINT [FK_TbParametroCPR_TbChequeCustodia] FOREIGN KEY([IdChequeCustodiaFornecedor]) REFERENCES [dbo].[TbChequeCustodia] ([IdChequeCustodia]) GO 
	
	ALTER TABLE [dbo].[TbFreqProfessorPermissao] WITH CHECK ADD CONSTRAINT [FK_TbFreqProfessorPermissao_TbProfessor] FOREIGN KEY([IdProfessor]) REFERENCES [dbo].[TbProfessor] ([IdProfessor]) GO 
	
	ALTER TABLE [dbo].[TbAlunoPeriodo] WITH CHECK ADD CONSTRAINT [FK_TbCursoPeriodo_TbTurma] FOREIGN KEY([IdTurmaReferencia]) REFERENCES [dbo].[TbTurma] ([IdTurma]) GO 
	
	ALTER TABLE [dbo].[TbLoteCobrancaRegistradaTitulo] WITH CHECK ADD CONSTRAINT [FK_TbLoteCobrancaRegistradaTitulo_TbLoteCobrancaRegistrada] FOREIGN KEY([IdLoteCobrancaRegistrada]) REFERENCES [dbo].[TbLoteCobrancaRegistrada] ([IdLoteCobrancaRegistrada]) GO 
	
	ALTER TABLE [dbo].[TbParametroGlobal] WITH CHECK ADD CONSTRAINT [FK_TbParametroGlobal_IdContaTesourariaCaixaPagamentoRapido] FOREIGN KEY([IdContaTesourariaCaixaPagamentoRapido]) REFERENCES [dbo].[TbConta] ([IdConta]) GO 
	
	ALTER TABLE [dbo].[TbParametroInternet] WITH CHECK ADD CONSTRAINT [FK_TbParametroInternet_TbPeriodo_InscrTurma] FOREIGN KEY([InscrTurma_IdPeriodo]) REFERENCES [dbo].[TbPeriodo] ([IdPeriodo]) GO 
	
	ALTER TABLE [dbo].[TbAlunoPeriodo] WITH CHECK ADD CONSTRAINT [FK_TbAlunoPeriodo_TbAlunoCurso] FOREIGN KEY([IdAlunoCurso]) REFERENCES [dbo].[TbAlunoCurso] ([IdAlunoCurso]) GO 
	
	ALTER TABLE [dbo].[TbFormula] WITH CHECK ADD CONSTRAINT [FK_TbFormula_TbPeriodo] FOREIGN KEY([IdPeriodo]) REFERENCES [dbo].[TbPeriodo] ([IdPeriodo]) GO 
	
	ALTER TABLE [dbo].[TbAlunoTurmaBolsa] WITH CHECK ADD CONSTRAINT [FK_TbAlunoTurmaBolsa_TbSolicitacaoDesconto] FOREIGN KEY([IdSolicitacaoDescontoOrigem]) REFERENCES [dbo].[TbSolicitacaoDesconto] ([IdSolicitacaoDesconto]) GO 
	
	ALTER TABLE [dbo].[TbParametroInternet] WITH CHECK ADD CONSTRAINT [FK_TbParametroInternet_InscrTurma_IdTipoImpedimento] FOREIGN KEY([InscrTurma_IdTipoImpedimento]) REFERENCES [dbo].[TbTipoImpedimento] ([IdTipoImpedimento]) GO 
	
	ALTER TABLE [dbo].[TbMetaFaseNota] WITH CHECK ADD CONSTRAINT [FK_TbMetaFaseNota_TbSerie] FOREIGN KEY([IdSerie]) REFERENCES [dbo].[TbSerie] ([IdSerie]) GO 
	
	ALTER TABLE [dbo].[TbParametroGlobal] WITH CHECK ADD CONSTRAINT [FK_TbParametroGlobal_IdConta_RetiradaAutomatica] FOREIGN KEY([IdConta_RetiradaAutomatica]) REFERENCES [dbo].[TbConta] ([IdConta]) GO 
	
	ALTER TABLE [dbo].[TbTipoRetencaoPagamento] WITH CHECK ADD CONSTRAINT [FK_TbTipoRetencaoPagamento_TbFavorecido] FOREIGN KEY([IdFavorecido]) REFERENCES [dbo].[TbFavorecido] ([IdFavorecido]) GO 
	
	ALTER TABLE [dbo].[TbCurriculoDisciplinaEletiva] WITH CHECK ADD CONSTRAINT [FK_TbCurriculoDisciplinaEletiva_TbDisciplina1] FOREIGN KEY([IdDisciplinaCursada]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina]) GO 
	
	ALTER TABLE [dbo].[TbNotaConceito] WITH CHECK ADD CONSTRAINT [FK_TbNotaConceito_TbUnidade] FOREIGN KEY([IdUnidade]) REFERENCES [dbo].[TbUnidade] ([IdUnidade]) GO 
	
	ALTER TABLE [dbo].[TbMetaFaseNota] WITH CHECK ADD CONSTRAINT [FK_TbMetaFaseNota_TbPeriodo] FOREIGN KEY([IdPeriodo]) REFERENCES [dbo].[TbPeriodo] ([IdPeriodo]) GO 
	
	ALTER TABLE [dbo].[TbParametroGlobal] WITH CHECK ADD CONSTRAINT [FK_TbParametroGlobal_IdChequeCustodia_RetiradaAutomatica] FOREIGN KEY([IdChequeCustodia_RetiradaAutomatica]) REFERENCES [dbo].[TbChequeCustodia] ([IdChequeCustodia]) GO 
	
	ALTER TABLE [dbo].[TbParametroInternet] WITH CHECK ADD CONSTRAINT [FK_TbParametroInternet_TbPeriodo1] FOREIGN KEY([ExibirAlunosTurma_IdPeriodo]) REFERENCES [dbo].[TbPeriodo] ([IdPeriodo]) GO 
	
	ALTER TABLE [dbo].[TbCurriculoDisciplinaEletiva] WITH CHECK ADD CONSTRAINT [FK_TbCurriculoDisciplinaEletiva_TbDisciplina2] FOREIGN KEY([IdDisciplinaEletiva]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina]) GO 
	
	ALTER TABLE [dbo].[TbAlunoTurma] WITH CHECK ADD CONSTRAINT [FK_TbAlunoTurma_TbAlunoCurso] FOREIGN KEY([IdAlunoCurso]) REFERENCES [dbo].[TbAlunoCurso] ([IdAlunoCurso]) GO 
	
	ALTER TABLE [dbo].[TbUsuarioUnidade] WITH CHECK ADD CONSTRAINT [FK_TbUsuarioUnidade_TbUnidade] FOREIGN KEY([IdUnidade]) REFERENCES [dbo].[TbUnidade] ([IdUnidade]) GO 
	
	ALTER TABLE [dbo].[TbMeta] WITH CHECK ADD CONSTRAINT [FK_TbMeta_TbTipoMeta] FOREIGN KEY([IdTipoMeta]) REFERENCES [dbo].[TbTipoMeta] ([IdTipoMeta]) GO 
	
	ALTER TABLE [dbo].[TbTurmaProfessor] WITH CHECK ADD CONSTRAINT [FK_TbTurmaProfessor_TbPlanoPagamento] FOREIGN KEY([IdPlanoPagamento]) REFERENCES [dbo].[TbPlanoPagamento] ([IdPlanoPagamento]) GO 
	
	ALTER TABLE [dbo].[TbSala] WITH CHECK ADD CONSTRAINT [FK_TbSala_TbUnidade] FOREIGN KEY([IdUnidade]) REFERENCES [dbo].[TbUnidade] ([IdUnidade]) GO 
	
	ALTER TABLE [dbo].[TbUnidade] WITH CHECK ADD CONSTRAINT [FK_TbUnidade_TbFormaRecebimento] FOREIGN KEY([IdFormaRecebimentoPadrao]) REFERENCES [dbo].[TbFormaRecebimento] ([IdFormaRecebimento]) GO 
	
	ALTER TABLE [dbo].[TbCaixaUsuario] WITH CHECK ADD CONSTRAINT [FK_TbCaixaUsuario_TbUsuario] FOREIGN KEY([IdUsuario]) REFERENCES [dbo].[TbUsuario] ([IdUsuario]) GO 
	
	ALTER TABLE [dbo].[TbCurso] WITH CHECK ADD CONSTRAINT [FK_TbCurso_TbUsuario] FOREIGN KEY([IdUsuarioCoordenadorResponsavel]) REFERENCES [dbo].[TbUsuario] ([IdUsuario]) GO 
	
	ALTER TABLE [dbo].[TbTituloCobranca] WITH CHECK ADD CONSTRAINT [FK_TbTituloCobranca_TbConta] FOREIGN KEY([LIQ_IdConta]) REFERENCES [dbo].[TbConta] ([IdConta]) GO 
	
	ALTER TABLE [dbo].[TbUnidade] WITH CHECK ADD CONSTRAINT [FK_TbUnidade_TbTipoCalculoMultaJuros] FOREIGN KEY([IdTipoCalculoMultaJurosPadrao]) REFERENCES [dbo].[TbTipoCalculoMultaJuros] ([IdTipoCalculoMultaJuros]) GO 
	
	ALTER TABLE [dbo].[TbSolicitacaoComplemento] WITH CHECK ADD CONSTRAINT [FK_TbSolicitacaoComplemento_TbSolicitacao] FOREIGN KEY([IdSolicitacao]) REFERENCES [dbo].[TbSolicitacao] ([IdSolicitacao]) GO 
	
	ALTER TABLE [dbo].[TbArqArquivo] WITH CHECK ADD CONSTRAINT [FK_TbArqArquivo_TbDisciplina] FOREIGN KEY([IdDisciplina]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina]) GO 
	
	ALTER TABLE [dbo].[TbCursoSuperior] WITH CHECK ADD CONSTRAINT [FK_TbCursoSuperior_TbUnidade] FOREIGN KEY([IdUnidade]) REFERENCES [dbo].[TbUnidade] ([IdUnidade]) GO 
	
	ALTER TABLE [dbo].[TbOrcOrcamento] WITH CHECK ADD CONSTRAINT [FK_TbOrcOrcamento_TbOrcCenario] FOREIGN KEY([IdCenario]) REFERENCES [dbo].[TbOrcCenario] ([IdCenario]) GO 
	
	ALTER TABLE [dbo].[TbResponsavel] WITH CHECK ADD CONSTRAINT [FK_TbResponsavel_TbFormaEntregaDocumento] FOREIGN KEY([IdFormaEntregaDocumento]) REFERENCES [dbo].[TbFormaEntregaDocumento] ([IdFormaEntregaDocumento]) GO 
	
	ALTER TABLE [dbo].[TbServico] WITH CHECK ADD CONSTRAINT [FK_TbServico_TbFormaRecebimento] FOREIGN KEY([IdFormaRecebimentoPadrao]) REFERENCES [dbo].[TbFormaRecebimento] ([IdFormaRecebimento]) GO 
	
	ALTER TABLE [dbo].[TbPlanoPagamento] WITH CHECK ADD CONSTRAINT [FK_TbPlanoPagamento_TbPeriodo] FOREIGN KEY([IdPeriodo]) REFERENCES [dbo].[TbPeriodo] ([IdPeriodo]) GO 
	
	ALTER TABLE [dbo].[TbHistoricoAproveitamento] WITH CHECK ADD CONSTRAINT [FK_TbHistoricoAproveitamento_TbAluno] FOREIGN KEY([IdAluno]) REFERENCES [dbo].[TbAluno] ([IdAluno]) GO 
	
	ALTER TABLE [dbo].[TbTurma] WITH CHECK ADD CONSTRAINT [FK_TbTurma_TbTurno] FOREIGN KEY([IdTurno]) REFERENCES [dbo].[TbTurno] ([IdTurno]) GO 
	
	ALTER TABLE [dbo].[TbCaptacaoCursoInteresse] WITH CHECK ADD CONSTRAINT [FK_TbCaptacaoCursoInteresse_TbUnidade] FOREIGN KEY([IdUnidade]) REFERENCES [dbo].[TbUnidade] ([IdUnidade]) GO 
	
	ALTER TABLE [dbo].[TbOrcOrcamento] WITH CHECK ADD CONSTRAINT [FK_TbOrcOrcamento_TbPlanoContas] FOREIGN KEY([IdPlanoContas]) REFERENCES [dbo].[TbPlanoContas] ([IdPlanoContas]) GO 
	
	ALTER TABLE [dbo].[TbResponsavel] WITH CHECK ADD CONSTRAINT [FK_TbResponsavel_TbFormaRecebimento] FOREIGN KEY([IdFormaRecebimento]) REFERENCES [dbo].[TbFormaRecebimento] ([IdFormaRecebimento]) GO 
	
	ALTER TABLE [dbo].[TbHistoricoAproveitamento] WITH CHECK ADD CONSTRAINT [FK_TbHistoricoAproveitamento_TbPeriodo] FOREIGN KEY([IdPeriodo]) REFERENCES [dbo].[TbPeriodo] ([IdPeriodo]) GO 
	
	ALTER TABLE [dbo].[TbCaptacaoAlunoInteressado] WITH CHECK ADD CONSTRAINT [FK_TbCaptacaoAlunoInteressado_TbCaptacaoCursoInteresse] FOREIGN KEY([IdCaptacaoCursoInteresse]) REFERENCES [dbo].[TbCaptacaoCursoInteresse] ([IdCaptacaoCursoInteresse]) GO 
	
	ALTER TABLE [dbo].[TbTurmaDisciplina_GoogleForEducation] WITH CHECK ADD CONSTRAINT [FK_TbTurmaDisciplina_GoogleForEducation_TbTurma] FOREIGN KEY([IdTurma]) REFERENCES [dbo].[TbTurma] ([IdTurma]) GO 
	
	ALTER TABLE [dbo].[TbAlunoPeriodo] WITH CHECK ADD CONSTRAINT [FK_TbAlunoPeriodo_TbUsuario] FOREIGN KEY([IdUsuario_AditamentoFies]) REFERENCES [dbo].[TbUsuario] ([IdUsuario]) GO 
	
	ALTER TABLE [dbo].[TbAluno] WITH CHECK ADD CONSTRAINT [FK_TbAluno_TbFormaEntregaDocumento] FOREIGN KEY([IdFormaEntregaDocumento]) REFERENCES [dbo].[TbFormaEntregaDocumento] ([IdFormaEntregaDocumento]) GO 
	
	ALTER TABLE [dbo].[TbCampoDinamicoConjuntoElemento] WITH CHECK ADD CONSTRAINT [FK_TbCampoDinamicoConjuntoElemento_TbCampoDinamicoConjunto] FOREIGN KEY([IdConjunto]) REFERENCES [dbo].[TbCampoDinamicoConjunto] ([IdConjunto]) GO 
	
	ALTER TABLE [dbo].[TbHistoricoAproveitamento] WITH CHECK ADD CONSTRAINT [FK_TbHistoricoAproveitamento_TbDisciplina] FOREIGN KEY([IdDisciplinaCursada]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina]) GO 
	
	ALTER TABLE [dbo].[TbSituacaoAlunoTurmaPagamento] WITH CHECK ADD CONSTRAINT [FK_TbSituacaoAlunoTurmaPagamento_TbTurma] FOREIGN KEY([IdTurma]) REFERENCES [dbo].[TbTurma] ([IdTurma]) GO 
	
	ALTER TABLE [dbo].[TbHabilitacao] WITH CHECK ADD CONSTRAINT [FK_TbHabilitacao_TbCursoSuperior] FOREIGN KEY([IdCursoSuperior]) REFERENCES [dbo].[TbCursoSuperior] ([IdCursoSuperior]) GO 
	
	ALTER TABLE [dbo].[TbTurmaDisciplina_GoogleForEducation] WITH CHECK ADD CONSTRAINT [FK_TbTurmaDisciplina_GoogleForEducation_TbDisciplina] FOREIGN KEY([IdDisciplina]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina]) GO 
	
	ALTER TABLE [dbo].[TbParametroInternet] WITH CHECK ADD CONSTRAINT [FK_TbParametroInternet_FInscr_TbSituacaoAlunoTurma] FOREIGN KEY([FInscr_IdSituacaoAlunoTurma]) REFERENCES [dbo].[TbSituacaoAlunoTurma] ([IdSituacaoAlunoTurma]) GO 
	
	ALTER TABLE [dbo].[TbParametroInternet] WITH CHECK ADD CONSTRAINT [FK_TbParametroInternet_TbPeriodo] FOREIGN KEY([_SolicitacaoDesconto_IdPeriodo]) REFERENCES [dbo].[TbPeriodo] ([IdPeriodo]) GO 
	
	ALTER TABLE [dbo].[TbTituloCobranca_Persistido] WITH CHECK ADD CONSTRAINT [FK_TbTituloCobranca_Persistido_TbTituloCobranca] FOREIGN KEY([IdTituloCobranca]) REFERENCES [dbo].[TbTituloCobranca] ([IdTituloCobranca]) GO 
	
	ALTER TABLE [dbo].[TbPlanoPagamentoParcela] WITH CHECK ADD CONSTRAINT [FK_TbPlanoPagamentoParcela_TbPlanoPagamento] FOREIGN KEY([IdPlanoPagamento]) REFERENCES [dbo].[TbPlanoPagamento] ([IdPlanoPagamento]) GO 
	
	ALTER TABLE [dbo].[TbSituacaoAlunoDisciplina] WITH CHECK ADD CONSTRAINT [FK_TbSituacaoAlunoDisciplina_TbAlunoCurso] FOREIGN KEY([IdAlunoCurso]) REFERENCES [dbo].[TbAlunoCurso] ([IdAlunoCurso]) GO 
	
	ALTER TABLE [dbo].[TbSolicitacaoDesconto] WITH CHECK ADD CONSTRAINT [FK_TbSolicitacaoDesconto_TbPeriodo] FOREIGN KEY([IdPeriodo]) REFERENCES [dbo].[TbPeriodo] ([IdPeriodo]) GO 
	
	ALTER TABLE [dbo].[TbSituacaoAlunoDisciplina] WITH CHECK ADD CONSTRAINT [FK_TbSituacaoAlunoDisciplina_TbUsuarioMatricula] FOREIGN KEY([IdUsuarioMatricula]) REFERENCES [dbo].[TbUsuario] ([IdUsuario]) GO 
	
	ALTER TABLE [dbo].[TbSolicitacaoDesconto] WITH CHECK ADD CONSTRAINT [FK_TbSolicitacaoDesconto_TbSerie] FOREIGN KEY([IdSerie]) REFERENCES [dbo].[TbSerie] ([IdSerie]) GO 
	
	ALTER TABLE [dbo].[TbSituacaoAlunoDisciplina] WITH CHECK ADD CONSTRAINT [FK_TbSituacaoAlunoDisciplina_TbUsuarioTrancamento] FOREIGN KEY([IdUsuarioTrancamento]) REFERENCES [dbo].[TbUsuario] ([IdUsuario]) GO 
	
	ALTER TABLE [dbo].[TbCurriculo] WITH CHECK ADD CONSTRAINT [FK_TbCurriculo_TbHabilitacao] FOREIGN KEY([IdHabilitacao]) REFERENCES [dbo].[TbHabilitacao] ([IdHabilitacao]) GO 
	
	ALTER TABLE [dbo].[TbAlunoTurma] WITH CHECK ADD CONSTRAINT [FK_TbAlunoTurma_TbSituacaoAlunoTurma] FOREIGN KEY([IdSituacaoAlunoTurma]) REFERENCES [dbo].[TbSituacaoAlunoTurma] ([IdSituacaoAlunoTurma]) GO 
	
	ALTER TABLE [dbo].[TbLancamentoCobranca_Persistido] WITH CHECK ADD CONSTRAINT [FK_TbLancamentoCobranca_Persistido_TbLancamentoCobranca] FOREIGN KEY([IdLancamentoCobranca]) REFERENCES [dbo].[TbLancamentoCobranca] ([IdLancamentoCobranca]) GO 
	
	ALTER TABLE [dbo].[TbCampoDinamico] WITH CHECK ADD CONSTRAINT [FK_TbCampoDinamico_TbCampoDinamicoConjunto] FOREIGN KEY([IdConjunto]) REFERENCES [dbo].[TbCampoDinamicoConjunto] ([IdConjunto]) GO 
	
	ALTER TABLE [dbo].[TbSituacaoAlunoDisciplina] WITH CHECK ADD CONSTRAINT [FK_TbTurmaDisciplinaAluno_TbDisciplina] FOREIGN KEY([IdDisciplina]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina]) GO 
	
	ALTER TABLE [dbo].[TbSituacaoAlunoDisciplina] WITH CHECK ADD CONSTRAINT [FK_TbSituacaoAlunoDisciplina_TbMotivoInativacao] FOREIGN KEY([IdMotivoTrancamento]) REFERENCES [dbo].[TbMotivoInativacao] ([IdMotivoInativacao]) GO 
	
	ALTER TABLE [dbo].[TbPagamentoLote] WITH CHECK ADD CONSTRAINT [FK_TbPagamentoArquivoRetorno_TbUsuario] FOREIGN KEY([IdUsuarioImportacao]) REFERENCES [dbo].[TbUsuario] ([IdUsuario]) GO 
	
	ALTER TABLE [dbo].[TbFaseNotaAluno_FilaProcessamento] WITH CHECK ADD CONSTRAINT [FK_TbFaseNotaAluno_FilaProcessamento_TbDisciplina] FOREIGN KEY([IdDisciplina]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina]) GO 
	
	ALTER TABLE [dbo].[TbSituacaoAlunoDisciplina] WITH CHECK ADD CONSTRAINT [FK_TbTurmaDisciplinaAluno_TbAlunoTurma] FOREIGN KEY([IdTurma], [IdAluno]) REFERENCES [dbo].[TbAlunoTurma] ([IdTurma], [IdAluno]) GO 
	
	ALTER TABLE [dbo].[TbPlanoPagamentoParcelaLancamento] WITH CHECK ADD CONSTRAINT [FK_TbPlanoPagamentoParcelaLancamento_TbPlanoPagamentoParcela] FOREIGN KEY([IdPlanoPagamentoParcela]) REFERENCES [dbo].[TbPlanoPagamentoParcela] ([IdPlanoPagamentoParcela]) GO 
	
	ALTER TABLE [dbo].[TbAuditoria] WITH CHECK ADD CONSTRAINT [FK_TbAuditoria_TbUsuario] FOREIGN KEY([IdUsuario]) REFERENCES [dbo].[TbUsuario] ([IdUsuario]) GO 
	
	ALTER TABLE [dbo].[TbPagamentoLote] WITH CHECK ADD CONSTRAINT [FK_TbPagamentoLote_TbFormaRecebimento] FOREIGN KEY([IdFormaRecebimento]) REFERENCES [dbo].[TbFormaRecebimento] ([IdFormaRecebimento]) GO 
	
	ALTER TABLE [dbo].[TbAlunoTurmaDocumento] WITH CHECK ADD CONSTRAINT [FK__TbAlunoTu__IdAlu__39B24E89] FOREIGN KEY([IdAluno]) REFERENCES [dbo].[TbAluno] ([IdAluno]) GO 
	
	ALTER TABLE [dbo].[TbFaseNotaAluno_FilaProcessamento] WITH CHECK ADD CONSTRAINT [FK_TbFaseNotaAluno_FilaProcessamento_TbTurma] FOREIGN KEY([IdTurma]) REFERENCES [dbo].[TbTurma] ([IdTurma]) GO 
	
	ALTER TABLE [dbo].[TbFaseNotaAluno] WITH CHECK ADD CONSTRAINT [FK_TbFaseNotaAluno_TbTurmaDisciplinaAluno] FOREIGN KEY([IdDisciplina], [IdTurma], [IdAluno]) REFERENCES [dbo].[TbSituacaoAlunoDisciplina] ([IdDisciplina], [IdTurma], [IdAluno]) GO 
	
	ALTER TABLE [dbo].[TbTurmaDisciplinaFaseNota] WITH CHECK ADD CONSTRAINT [FK_TbTurmaDisciplinaFaseNota_TbTurma] FOREIGN KEY([IdTurma]) REFERENCES [dbo].[TbTurma] ([IdTurma]) GO 
	
	ALTER TABLE [dbo].[TbRateioServico] WITH CHECK ADD CONSTRAINT [FK_TbRateioServico_TbRateioPessoa] FOREIGN KEY([IdRateioPessoa]) REFERENCES [dbo].[TbRateioPessoa] ([IdRateioPessoa]) GO 
	
	ALTER TABLE [dbo].[TbCampoDinamicoValor] WITH CHECK ADD CONSTRAINT [FK_TbCampoDinamicoValor_TbCampoDinamico] FOREIGN KEY([IdCampo]) REFERENCES [dbo].[TbCampoDinamico] ([IdCampo]) GO 
	
	ALTER TABLE [dbo].[TbFaseNotaAluno_FilaProcessamento] WITH CHECK ADD CONSTRAINT [FK_TbFaseNotaAluno_FilaProcessamento_TbAluno] FOREIGN KEY([IdAluno]) REFERENCES [dbo].[TbAluno] ([IdAluno]) GO 
	
	ALTER TABLE [dbo].[TbTurmaDisciplinaFaseNota] WITH CHECK ADD CONSTRAINT [FK_TbTurmaDisciplinaFaseNota_TbDisciplina] FOREIGN KEY([IdDisciplina]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina]) GO 
	
	ALTER TABLE [dbo].[TbMetaFaseNotaAlunoRegistro] WITH CHECK ADD CONSTRAINT [FK_TbMetaFaseNotaAlunoRegistro_TbAluno] FOREIGN KEY([IdAluno]) REFERENCES [dbo].[TbAluno] ([IdAluno]) GO 
	
	ALTER TABLE [dbo].[TbConta] WITH CHECK ADD CONSTRAINT [FK_TbConta_TbEmpresa] FOREIGN KEY([IdEmpresa]) REFERENCES [dbo].[TbEmpresa] ([IdEmpresa]) GO 
	
	ALTER TABLE [dbo].[TbFaseNotaAluno_FilaProcessamento] WITH CHECK ADD CONSTRAINT [FK_TbFaseNotaAluno_FilaProcessamento_TbUnidade] FOREIGN KEY([IdUnidade]) REFERENCES [dbo].[TbUnidade] ([IdUnidade]) GO 
	
	ALTER TABLE [dbo].[TbPlanoPagamentoParcelaLancamentoDesconto] WITH CHECK ADD CONSTRAINT [FK_TbPlanoPagamentoParcelaLancamentoDesconto_TbAbatimento] FOREIGN KEY([IdDesconto]) REFERENCES [dbo].[TbAbatimento] ([IdAbatimento]) GO 
	
	ALTER TABLE [dbo].[TbMetaFaseNotaAlunoRegistro] WITH CHECK ADD CONSTRAINT [FK_TbMetaFaseNotaAlunoRegistro_TbTurma] FOREIGN KEY([IdTurma]) REFERENCES [dbo].[TbTurma] ([IdTurma]) GO 
	
	ALTER TABLE [dbo].[TbParametroEnsinoSuperior] WITH CHECK ADD CONSTRAINT [FK_TbParametroEnsinoSuperior_TbSituacaoAlunoCurso_Cursando] FOREIGN KEY([IdSituacaoAlunoCursoCursando]) REFERENCES [dbo].[TbSituacaoAlunoCurso] ([IdSituacaoAlunoCurso]) GO 
	
	ALTER TABLE [dbo].[TbCaixa] WITH CHECK ADD CONSTRAINT [FK_TbCaixa_TbEmpresa] FOREIGN KEY([IdEmpresa]) REFERENCES [dbo].[TbEmpresa] ([IdEmpresa]) GO 
	
	ALTER TABLE [dbo].[TbAlunoTurmaProcedimentoMatricula] WITH CHECK ADD CONSTRAINT [FK_TbAlunoTurmaProcedimentoMatricula_TbUsuario] FOREIGN KEY([IdUsuario]) REFERENCES [dbo].[TbUsuario] ([IdUsuario]) GO 
	
	ALTER TABLE [dbo].[TbFaseNotaAluno_FilaProcessamento] WITH CHECK ADD CONSTRAINT [FK_TbFaseNotaAluno_FilaProcessamento_TbUsuario] FOREIGN KEY([IdUsuario]) REFERENCES [dbo].[TbUsuario] ([IdUsuario]) GO 
	
	ALTER TABLE [dbo].[TbPlanoPagamentoParcelaLancamentoDesconto] WITH CHECK ADD CONSTRAINT [FK_TbPlanoPagamentoParcelaLancamentoDesconto_TbPlanoPagamentoParcelaLancamento] FOREIGN KEY([IdPlanoPagamentoParcelaLancamento]) REFERENCES [dbo].[TbPlanoPagamentoParcelaLancamento] ([IdPlanoPagamentoParcelaLancamento]) GO 
	
	ALTER TABLE [dbo].[TbMetaFaseNotaAlunoRegistro] WITH CHECK ADD CONSTRAINT [FK_TbMetaFaseNotaAlunoRegistro_TbMetaFaseNota] FOREIGN KEY([IdFaseNota]) REFERENCES [dbo].[TbMetaFaseNota] ([IdFaseNota]) GO 
	
	ALTER TABLE [dbo].[TbCartaoOperadora] WITH CHECK ADD CONSTRAINT [FK_TbCartaoOperadora_TbEmpresa] FOREIGN KEY([IdEmpresa]) REFERENCES [dbo].[TbEmpresa] ([IdEmpresa]) GO 
	
	ALTER TABLE [dbo].[TbRateioPagamento] WITH CHECK ADD CONSTRAINT [FK_TbRateioPagamento_TbUsuario] FOREIGN KEY([IdUsuario]) REFERENCES [dbo].[TbUsuario] ([IdUsuario]) GO 
	
	ALTER TABLE [dbo].[TbNotaFiscalLote] WITH CHECK ADD CONSTRAINT [FK_TbNotaFiscalLote_TbNotaFiscalLote_OrigemDivisao] FOREIGN KEY([IdNotaFiscalLote_OrigemDivisao]) REFERENCES [dbo].[TbNotaFiscalLote] ([IdNotaFiscalLote]) GO 
	
	ALTER TABLE [dbo].[TbAlunoTurmaProcedimentoMatricula] WITH CHECK ADD CONSTRAINT [FK_TbAlunoTurmaProcedimentoMatricula_TbAlunoTurma] FOREIGN KEY([IdTurma], [IdAluno]) REFERENCES [dbo].[TbAlunoTurma] ([IdTurma], [IdAluno]) GO 
	
	ALTER TABLE [dbo].[TbFavorecido] WITH CHECK ADD CONSTRAINT [FK_TbFavorecido_TbUnidade] FOREIGN KEY([IdUnidade]) REFERENCES [dbo].[TbUnidade] ([IdUnidade]) GO 
	
	ALTER TABLE [dbo].[TbNegociacao] WITH CHECK ADD CONSTRAINT [FK_TbNegociacao_TbAluno] FOREIGN KEY([IdAluno]) REFERENCES [dbo].[TbAluno] ([IdAluno]) GO 
	
	ALTER TABLE [dbo].[TbFaseNotaAluno_FilaProcessamento] WITH CHECK ADD CONSTRAINT [FK_TbFaseNotaAluno_FilaProcessamento_TbProfessor] FOREIGN KEY([IdProfessor]) REFERENCES [dbo].[TbProfessor] ([IdProfessor]) GO 
	
	ALTER TABLE [dbo].[TbDocumento] WITH CHECK ADD CONSTRAINT [FK_TbDocumento_TbUnidade] FOREIGN KEY([IdUnidade]) REFERENCES [dbo].[TbUnidade] ([IdUnidade]) GO 
	
	ALTER TABLE [dbo].[TbAlunoCursoSuperior] WITH CHECK ADD CONSTRAINT [FK_TbAlunoCursoSuperior_TbAluno] FOREIGN KEY([IdAluno]) REFERENCES [dbo].[TbAluno] ([IdAluno]) GO 
	
	ALTER TABLE [dbo].[TbRateioPagamento] WITH CHECK ADD CONSTRAINT [FK_TbRateioPagamento_TbRateioPessoa] FOREIGN KEY([IdRateioPessoa]) REFERENCES [dbo].[TbRateioPessoa] ([IdRateioPessoa]) GO 
	
	ALTER TABLE [dbo].[TbConta] WITH CHECK ADD CONSTRAINT [FK_TbConta_TbUnidade] FOREIGN KEY([IdUnidade]) REFERENCES [dbo].[TbUnidade] ([IdUnidade]) GO 
	
	ALTER TABLE [dbo].[TbPlanoPagamentoParcela] WITH CHECK ADD CONSTRAINT [FK_TbPlanoPagamentoParcela_TbTipoCalculoMultaJuros] FOREIGN KEY([IdTipoCalculoMultaJuros]) REFERENCES [dbo].[TbTipoCalculoMultaJuros] ([IdTipoCalculoMultaJuros]) GO 
	
	ALTER TABLE [dbo].[TbNegociacao] WITH CHECK ADD CONSTRAINT [FK_TbNegociacao_TbUsuario] FOREIGN KEY([IdUsuario]) REFERENCES [dbo].[TbUsuario] ([IdUsuario]) GO 
	
	ALTER TABLE [dbo].[TbDisciplinaPlano] WITH CHECK ADD CONSTRAINT [FK_TbDisciplinaPlano_TbDisciplina] FOREIGN KEY([IdDisciplina]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina]) GO 
	
	ALTER TABLE [dbo].[TbAlunoCursoSuperior] WITH CHECK ADD CONSTRAINT [FK_TbAlunoCursoSuperior_TbCurriculo] FOREIGN KEY([IdCurriculo]) REFERENCES [dbo].[TbCurriculo] ([IdCurriculo]) GO 
	
	ALTER TABLE [dbo].[TbAtividade] WITH CHECK ADD CONSTRAINT [FK_TbAtividade_TbPeriodo] FOREIGN KEY([IdPeriodo]) REFERENCES [dbo].[TbPeriodo] ([IdPeriodo]) GO 
	
	ALTER TABLE [dbo].[TbAlunoCursoSuperior] WITH CHECK ADD CONSTRAINT [FK_TbAlunoCursoSuperior_TbTurno] FOREIGN KEY([IdTurnoPrincipal]) REFERENCES [dbo].[TbTurno] ([IdTurno]) GO 
	
	ALTER TABLE [dbo].[TbPlanoPagamentoServico] WITH CHECK ADD CONSTRAINT [FK_TbPlanoPagamentoServico_TbPlanoPagamento1] FOREIGN KEY([IdPlanoPagamento]) REFERENCES [dbo].[TbPlanoPagamento] ([IdPlanoPagamento]) GO 
	
	ALTER TABLE [dbo].[TbTituloCobranca] WITH CHECK ADD CONSTRAINT [FK_TbTituloCobranca_TbContaRecebimentoCaixaOperadoraCartao] FOREIGN KEY([LIQ_IdContaRecebimentoCaixaOperadoraCartao]) REFERENCES [dbo].[TbConta] ([IdConta]) GO 
	
	ALTER TABLE [dbo].[TbPagamentoLote] WITH CHECK ADD CONSTRAINT [FK_TbPagamentoLote_TbConta] FOREIGN KEY([IdConta]) REFERENCES [dbo].[TbConta] ([IdConta]) GO 
	
	ALTER TABLE [dbo].[TbTituloCobranca] WITH CHECK ADD CONSTRAINT [FK_TbTituloCobranca_TbTipoCalculoMultaJuros] FOREIGN KEY([IdTipoCalculoMultaJuros]) REFERENCES [dbo].[TbTipoCalculoMultaJuros] ([IdTipoCalculoMultaJuros]) GO 
	
	ALTER TABLE [dbo].[TbNegociacaoItem] WITH CHECK ADD CONSTRAINT [FK_TbNegociacaoItem_TbNegociacao] FOREIGN KEY([IdNegociacao]) REFERENCES [dbo].[TbNegociacao] ([IdNegociacao]) GO 
	
	ALTER TABLE [dbo].[TbPlanoPagamentoServico] WITH CHECK ADD CONSTRAINT [FK_TbPlanoPagamentoServico_TbServico] FOREIGN KEY([IdServico]) REFERENCES [dbo].[TbServico] ([IdServico]) GO 
	
	ALTER TABLE [dbo].[TbDocumentoHistorico] WITH CHECK ADD CONSTRAINT [FK_TbDocumentoHistorico_TbDocumento] FOREIGN KEY([IdDocumento]) REFERENCES [dbo].[TbDocumento] ([IdDocumento]) GO 
	
	ALTER TABLE [dbo].[TbGradeHorario] WITH CHECK ADD CONSTRAINT [FK_TbGradeHorario_TbSala] FOREIGN KEY([IdSala]) REFERENCES [dbo].[TbSala] ([IdSala]) GO 
	
	ALTER TABLE [dbo].[TbTurmaProfessor] WITH CHECK ADD CONSTRAINT [FK_TbAlunoProfessor_TbProfessor_IdProfessorAlteracao] FOREIGN KEY([IdProfessorAlteracao]) REFERENCES [dbo].[TbProfessor] ([IdProfessor]) GO 
	
	ALTER TABLE [dbo].[TbRateioLancamento] WITH CHECK ADD CONSTRAINT [FK_TbRateioLancamento_TbRateioPagamento] FOREIGN KEY([IdRateioPagamento]) REFERENCES [dbo].[TbRateioPagamento] ([IdRateioPagamento]) GO 
	
	ALTER TABLE [dbo].[TbTituloCobranca] WITH CHECK ADD CONSTRAINT [FK_TbTituloCobranca_TbAluno] FOREIGN KEY([IdAluno]) REFERENCES [dbo].[TbAluno] ([IdAluno]) GO 
	
	ALTER TABLE [dbo].[TbDocumentoHistorico] WITH CHECK ADD CONSTRAINT [FK_TbDocumentoHistorico_TbUsuario] FOREIGN KEY([IdUsuario]) REFERENCES [dbo].[TbUsuario] ([IdUsuario]) GO 
	
	ALTER TABLE [dbo].[TbTurmaProfessor] WITH CHECK ADD CONSTRAINT [FK_TbAlunoProfessor_TbUsuario_IdUsuarioConfirmacao] FOREIGN KEY([IdUsuarioConfirmacao]) REFERENCES [dbo].[TbUsuario] ([IdUsuario]) GO 
	
	ALTER TABLE [dbo].[TbTituloCobranca] WITH CHECK ADD CONSTRAINT [FK_TbTituloCobranca_TbFormaRecebimento] FOREIGN KEY([IdFormaRecebimento]) REFERENCES [dbo].[TbFormaRecebimento] ([IdFormaRecebimento]) GO 
	
	ALTER TABLE [dbo].[TbAlunoTurmaAlternativa] WITH CHECK ADD CONSTRAINT [FK_TbAlunoTurmaAlternativa_TbAlunoTurma_Principal] FOREIGN KEY([IdTurmaPrincipal], [IdAluno]) REFERENCES [dbo].[TbAlunoTurma] ([IdTurma], [IdAluno]) GO 
	
	ALTER TABLE [dbo].[TbAtividadeSala] WITH CHECK ADD CONSTRAINT [FK_TbAtividadeSala_TbAtividade] FOREIGN KEY([IdAtividade]) REFERENCES [dbo].[TbAtividade] ([IdAtividade]) GO 
	
	ALTER TABLE [dbo].[TbFreqQuadroHorario] WITH CHECK ADD CONSTRAINT [FK_TbFreqQuadroHorario_TbFreqQuadroHorario] FOREIGN KEY([IdTurmaHorario]) REFERENCES [dbo].[TbFreqQuadroHorario] ([IdTurmaHorario]) GO 
	
	ALTER TABLE [dbo].[TbDisciplinaPlanoAula] WITH CHECK ADD CONSTRAINT [FK_TbDisciplinaPlanoAula_TbDisciplinaPlano] FOREIGN KEY([IdDisciplinaPlano]) REFERENCES [dbo].[TbDisciplinaPlano] ([IdDisciplinaPlano]) GO 
	
	ALTER TABLE [dbo].[TbChequeEmitidoPagamentoAvulso] WITH CHECK ADD CONSTRAINT [FK_TbChequeEmitidoPagamentoAvulso_TbFavorecido] FOREIGN KEY([IdFavorecido]) REFERENCES [dbo].[TbFavorecido] ([IdFavorecido]) GO 
	
	ALTER TABLE [dbo].[TbRateioLancamento] WITH CHECK ADD CONSTRAINT [FK_TbRateioLancamento_TbRateioPessoa] FOREIGN KEY([IdRateioPessoa]) REFERENCES [dbo].[TbRateioPessoa] ([IdRateioPessoa]) GO 
	
	ALTER TABLE [dbo].[TbNotaFiscalLote] WITH CHECK ADD CONSTRAINT [FK_TbNotaFiscalLote_TbEmpresa] FOREIGN KEY([IdEmpresa]) REFERENCES [dbo].[TbEmpresa] ([IdEmpresa]) GO 
	
	ALTER TABLE [dbo].[TbAlunoTurmaAlternativa] WITH CHECK ADD CONSTRAINT [FK_TbAlunoTurmaAlternativa_TbAlunoTurma_Alternativa] FOREIGN KEY([IdTurmaAlternativa], [IdAluno]) REFERENCES [dbo].[TbAlunoTurma] ([IdTurma], [IdAluno]) GO 
	
	ALTER TABLE [dbo].[TbAtividadeSala] WITH CHECK ADD CONSTRAINT [FK_TbAtividadeSala_TbSala] FOREIGN KEY([IdSala]) REFERENCES [dbo].[TbSala] ([IdSala]) GO 
	
	ALTER TABLE [dbo].[TbFreqQuadroHorario] WITH CHECK ADD CONSTRAINT [FK_TbFreqQuadroHorario_TbTurma] FOREIGN KEY([IdTurma]) REFERENCES [dbo].[TbTurma] ([IdTurma]) GO 
	
	ALTER TABLE [dbo].[TbNotaFiscalLote] WITH CHECK ADD CONSTRAINT [FK_TbNotaFiscalLote_TbUsuario] FOREIGN KEY([IdUsuarioFechamento]) REFERENCES [dbo].[TbUsuario] ([IdUsuario]) GO 
	
	ALTER TABLE [dbo].[TbAluno] WITH CHECK ADD CONSTRAINT [FK_TbAluno_TbUnidade] FOREIGN KEY([IdUnidade]) REFERENCES [dbo].[TbUnidade] ([IdUnidade]) GO 
	
	ALTER TABLE [dbo].[TbFreqQuadroHorario] WITH CHECK ADD CONSTRAINT [FK_TbFreqQuadroHorario_TbDisciplina] FOREIGN KEY([IdDisciplina]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina]) GO 
	
	ALTER TABLE [dbo].[TbSolicitacaoTipo] WITH CHECK ADD CONSTRAINT [FK_TbSolicitacaoTipo_TbTipoCalculoMultaJuros] FOREIGN KEY([IdTipoCalculoMultaJuros]) REFERENCES [dbo].[TbTipoCalculoMultaJuros] ([IdTipoCalculoMultaJuros]) GO 
	
	ALTER TABLE [dbo].[TbAlunoRotinaEducacaoInfantil] WITH CHECK ADD CONSTRAINT [FK_TbAlunoRotinaEducacaoInfantil_TbAluno] FOREIGN KEY([IdAluno]) REFERENCES [dbo].[TbAluno] ([IdAluno]) GO 
	
	ALTER TABLE [dbo].[TbAluno] WITH CHECK ADD CONSTRAINT [FK_TbAluno_TbTipoResponsavel] FOREIGN KEY([IdTipoResponsavel]) REFERENCES [dbo].[TbTipoResponsavel] ([IdTipoResponsavel]) GO 
	
	ALTER TABLE [dbo].[TbDocumentoSignatario] WITH CHECK ADD CONSTRAINT [FK_TbDocumentoSignatario_TbDocumento] FOREIGN KEY([IdDocumento]) REFERENCES [dbo].[TbDocumento] ([IdDocumento]) GO 
	
	ALTER TABLE [dbo].[TbTurma] WITH CHECK ADD CONSTRAINT [FK_TbTurma_TbFreqTipoHorario] FOREIGN KEY([IdFreqTipoHorario]) REFERENCES [dbo].[TbFreqTipoHorario] ([IdFreqTipoHorario]) GO 
	
	ALTER TABLE [dbo].[TbAgenteCobranca] WITH CHECK ADD CONSTRAINT [FK_TbAgenteCobranca_TbFormaRecebimento] FOREIGN KEY([IdFormaRecebimentoVinculada]) REFERENCES [dbo].[TbFormaRecebimento] ([IdFormaRecebimento]) GO 
	
	ALTER TABLE [dbo].[TbHistorico] WITH CHECK ADD CONSTRAINT [FK_TbHistorico_TbAluno] FOREIGN KEY([IdAluno]) REFERENCES [dbo].[TbAluno] ([IdAluno]) GO 
	
	ALTER TABLE [dbo].[TbAlunoRotinaEducacaoInfantil] WITH CHECK ADD CONSTRAINT [FK_TbAlunoRotinaEducacaoInfantil_TbTurma] FOREIGN KEY([IdTurma]) REFERENCES [dbo].[TbTurma] ([IdTurma]) GO 
	
	ALTER TABLE [dbo].[TbAlunoServico] WITH CHECK ADD CONSTRAINT [FK_TbAlunoServico_TbAluno] FOREIGN KEY([IdAluno]) REFERENCES [dbo].[TbAluno] ([IdAluno]) GO 
	
	ALTER TABLE [dbo].[TbParametroInternet] WITH CHECK ADD CONSTRAINT [FK_TbParametroInternet_FInscr_TbTextoPersonalizado] FOREIGN KEY([FInscr_IdTextoPersonalizado]) REFERENCES [dbo].[TbTextoPersonalizado] ([IdTextoPersonalizado]) GO 
	
	ALTER TABLE [dbo].[TbAlunoRotinaEducacaoInfantil] WITH CHECK ADD CONSTRAINT [FK_TbAlunoRotinaEducacaoInfantil_TbProfessor] FOREIGN KEY([IdProfessorResponsavel]) REFERENCES [dbo].[TbProfessor] ([IdProfessor]) GO 
	
	ALTER TABLE [dbo].[TbAlunoServico] WITH CHECK ADD CONSTRAINT [FK_TbAlunoServico_TbServico] FOREIGN KEY([IdServico]) REFERENCES [dbo].[TbServico] ([IdServico]) GO 
	
	ALTER TABLE [dbo].[TbTurmaDisciplinaPlanoAula] WITH CHECK ADD CONSTRAINT [FK_TbTurmaDisciplinaPlanoAula_TbTurma] FOREIGN KEY([IdTurma]) REFERENCES [dbo].[TbTurma] ([IdTurma]) GO 
	
	ALTER TABLE [dbo].[TbAlunoCurso] WITH CHECK ADD CONSTRAINT [FK_TbAlunoCurso_TbAluno] FOREIGN KEY([IdAluno]) REFERENCES [dbo].[TbAluno] ([IdAluno]) GO 
	
	ALTER TABLE [dbo].[TbAlunoRotinaEducacaoInfantil] WITH CHECK ADD CONSTRAINT [FK_TbAlunoRotinaEducacaoInfantil_TbUsuario] FOREIGN KEY([IdUsuarioResponsavel]) REFERENCES [dbo].[TbUsuario] ([IdUsuario]) GO 
	
	ALTER TABLE [dbo].[TbNotaFiscal] WITH CHECK ADD CONSTRAINT [FK_TbNotaFiscal_TbNotaFiscalLote] FOREIGN KEY([IdNotaFiscalLote]) REFERENCES [dbo].[TbNotaFiscalLote] ([IdNotaFiscalLote]) GO 
	
	ALTER TABLE [dbo].[TbAtividadeDistribuicaoAluno] WITH CHECK ADD CONSTRAINT [FK_TbAtividadeDistribuicaoAluno_TbAtividade] FOREIGN KEY([IdAtividade]) REFERENCES [dbo].[TbAtividade] ([IdAtividade]) GO 
	
	ALTER TABLE [dbo].[TbTurmaDisciplinaPlanoAula] WITH CHECK ADD CONSTRAINT [FK_TbTurmaDisciplinaPlanoAula_TbDisciplina] FOREIGN KEY([IdDisciplina]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina]) GO 
	
	ALTER TABLE [dbo].[TbLancamentoCobranca] WITH CHECK ADD CONSTRAINT [FK_TbLancamentoCobranca_LIQ_IdContaDevolucao] FOREIGN KEY([LIQ_IdContaDevolucao]) REFERENCES [dbo].[TbConta] ([IdConta]) GO 
	
	ALTER TABLE [dbo].[TbDiarioAluno] WITH CHECK ADD CONSTRAINT [FK_TbDiarioAluno_TbDiario] FOREIGN KEY([IdDiario]) REFERENCES [dbo].[TbDiario] ([IdDiario]) GO 
	
	ALTER TABLE [dbo].[TbModeloContrato] WITH CHECK ADD CONSTRAINT [FK_TbModeloContrato_TbProfessor] FOREIGN KEY([IdColaboradorContratado]) REFERENCES [dbo].[TbProfessor] ([IdProfessor]) GO 
	
	ALTER TABLE [dbo].[TbAtividadeDistribuicaoAluno] WITH CHECK ADD CONSTRAINT [FK_TbAtividadeDistribuicaoAluno_TbTurma] FOREIGN KEY([IdTurma]) REFERENCES [dbo].[TbTurma] ([IdTurma]) GO 
	
	ALTER TABLE [dbo].[TbLoteCobrancaRegistrada] WITH CHECK ADD CONSTRAINT [FK_TbLoteCobrancaRegistrada_TbAgenteCobranca] FOREIGN KEY([IdAgenteCobranca]) REFERENCES [dbo].[TbAgenteCobranca] ([IdAgenteCobranca]) GO 
	
	ALTER TABLE [dbo].[TbAlunoCurso] WITH CHECK ADD CONSTRAINT [FK_TbAlunoCurso_TbFormaIngresso] FOREIGN KEY([IdFormaIngresso]) REFERENCES [dbo].[TbFormaIngresso] ([IdFormaIngresso]) GO 
	
	ALTER TABLE [dbo].[TbTituloCobranca] WITH CHECK ADD CONSTRAINT [FK_TbTituloCobranca_LIQ_IdContaDevolucaoRecebidoAMaior] FOREIGN KEY([LIQ_IdContaDevolucaoRecebidoAMaior]) REFERENCES [dbo].[TbConta] ([IdConta]) GO 
	
	ALTER TABLE [dbo].[TbSala] WITH CHECK ADD CONSTRAINT [FK_TbSala_TbMensagemConfiguracaoContaSMTP] FOREIGN KEY([Agendamento_IdContaSMTP]) REFERENCES [dbo].[TbMensagemConfiguracaoContaSMTP] ([IdContaSMTP]) GO 
	
	ALTER TABLE [dbo].[TbDiarioAluno] WITH CHECK ADD CONSTRAINT [FK_TbDiarioAluno_TbAluno] FOREIGN KEY([IdAluno]) REFERENCES [dbo].[TbAluno] ([IdAluno]) GO 
	
	ALTER TABLE [dbo].[TbTurma] WITH CHECK ADD CONSTRAINT [FK_TbTurma_TbSituacaoAlunoTurma] FOREIGN KEY([FInscr_IdSituacaoAlunoTurma]) REFERENCES [dbo].[TbSituacaoAlunoTurma] ([IdSituacaoAlunoTurma]) GO 
	
	ALTER TABLE [dbo].[TbTituloCobrancaBoleto_Auditoria] WITH CHECK ADD CONSTRAINT [FK_TbTituloCobrancaBoleto_Auditoria_TbTituloCobranca] FOREIGN KEY([IdTituloCobranca]) REFERENCES [dbo].[TbTituloCobranca] ([IdTituloCobranca]) GO 
	
	ALTER TABLE [dbo].[TbTurma] WITH CHECK ADD CONSTRAINT [FK_TbTurma_TbSala] FOREIGN KEY([IdSala]) REFERENCES [dbo].[TbSala] ([IdSala]) GO 
	
	ALTER TABLE [dbo].[TbAlunoTurmaReserva] WITH CHECK ADD CONSTRAINT [FK_TbAlunoTurmaReserva_TbAluno] FOREIGN KEY([IdAluno]) REFERENCES [dbo].[TbAluno] ([IdAluno]) GO 
	
	ALTER TABLE [dbo].[TbModeloContrato] WITH CHECK ADD CONSTRAINT [FK_TbModeloContrato_TbProfessor1] FOREIGN KEY([IdColaboradorTestemunha1]) REFERENCES [dbo].[TbProfessor] ([IdProfessor]) GO 
	
	ALTER TABLE [dbo].[TbAtividadeDistribuicaoAluno] WITH CHECK ADD CONSTRAINT [FK_TbAtividadeDistribuicaoAluno_TbAluno] FOREIGN KEY([IdAluno]) REFERENCES [dbo].[TbAluno] ([IdAluno]) GO 
	
	ALTER TABLE [dbo].[TbLoteCobrancaRegistrada] WITH CHECK ADD CONSTRAINT [FK_TbLoteCobrancaRegistrada_TbUsuario] FOREIGN KEY([IdUsuarioFechamento]) REFERENCES [dbo].[TbUsuario] ([IdUsuario]) GO 
	
	ALTER TABLE [dbo].[TbAlunoCurso] WITH CHECK ADD CONSTRAINT [FK_TbAlunoCurso_TbCurriculo] FOREIGN KEY([IdCurriculo]) REFERENCES [dbo].[TbCurriculo] ([IdCurriculo]) GO 
	
	ALTER TABLE [dbo].[TbArquivoRetorno_FilaProcessamento] WITH CHECK ADD CONSTRAINT [FK_TbArquivoRetorno_FilaProcessamento_TbUsuario] FOREIGN KEY([IdUsuario]) REFERENCES [dbo].[TbUsuario] ([IdUsuario]) GO 
	
	ALTER TABLE [dbo].[TbParametroCPR] WITH CHECK ADD CONSTRAINT [FK_TbParametroCPR_TbConta_TransitoriaRecebimentoAMaior] FOREIGN KEY([IdContaTransitoriaRecebimentoAMaior]) REFERENCES [dbo].[TbConta] ([IdConta]) GO 
	
	ALTER TABLE [dbo].[TbAlunoTurmaReserva] WITH CHECK ADD CONSTRAINT [FK_TbAlunoTurmaReserva_TbMotivoInativacao] FOREIGN KEY([IdMotivoCancelamentoReserva]) REFERENCES [dbo].[TbMotivoInativacao] ([IdMotivoInativacao]) GO 
	
	ALTER TABLE [dbo].[TbModeloContrato] WITH CHECK ADD CONSTRAINT [FK_TbModeloContrato_TbProfessor2] FOREIGN KEY([IdColaboradorTestemunha2]) REFERENCES [dbo].[TbProfessor] ([IdProfessor]) GO 
	
	ALTER TABLE [dbo].[TbAtividadeDistribuicaoAluno] WITH CHECK ADD CONSTRAINT [FK_TbAtividadeDistribuicaoAluno_TbSala] FOREIGN KEY([IdSala]) REFERENCES [dbo].[TbSala] ([IdSala]) GO 
	
	ALTER TABLE [dbo].[TbFreqApuracao] WITH CHECK ADD CONSTRAINT [FK_TbFreqApuracao_TbAluno] FOREIGN KEY([IdAluno]) REFERENCES [dbo].[TbAluno] ([IdAluno]) GO 
	
	ALTER TABLE [dbo].[TbAlunoCurso] WITH CHECK ADD CONSTRAINT [FK_TbAlunoCurso_TbTurno] FOREIGN KEY([IdTurno]) REFERENCES [dbo].[TbTurno] ([IdTurno]) GO 
	
	ALTER TABLE [dbo].[TbSerie] WITH CHECK ADD CONSTRAINT [FK_TbSerie_TbSituacaoAlunoTurma1] FOREIGN KEY([IdSituacaoAlunoTurmaCursando]) REFERENCES [dbo].[TbSituacaoAlunoTurma] ([IdSituacaoAlunoTurma]) GO 
	
	ALTER TABLE [dbo].[TbParametroControleAcessoCartaoMestre] WITH CHECK ADD CONSTRAINT [FK_TbParametroControleAcessoCartaoMestre_TbResponsavel] FOREIGN KEY([IdResponsavel]) REFERENCES [dbo].[TbResponsavel] ([IdResponsavel]) GO 
	
	ALTER TABLE [dbo].[TbCaptacaoAlunoInteressado] WITH CHECK ADD CONSTRAINT [FK_TbCaptacaoAlunoInteressado_TbUnidade] FOREIGN KEY([IdUnidade]) REFERENCES [dbo].[TbUnidade] ([IdUnidade]) GO 
	
	ALTER TABLE [dbo].[TbAlunoTurmaReserva] WITH CHECK ADD CONSTRAINT [FK_TbAlunoTurmaReserva_TbTurma] FOREIGN KEY([IdTurma]) REFERENCES [dbo].[TbTurma] ([IdTurma]) GO 
	
	ALTER TABLE [dbo].[TbModeloContrato] WITH CHECK ADD CONSTRAINT [FK_TbModeloContrato_TbPeriodo] FOREIGN KEY([IdPeriodo]) REFERENCES [dbo].[TbPeriodo] ([IdPeriodo]) GO 
	
	ALTER TABLE [dbo].[TbFreqApuracao] WITH CHECK ADD CONSTRAINT [FK_TbFreqApuracao_TbTurma] FOREIGN KEY([IdTurma]) REFERENCES [dbo].[TbTurma] ([IdTurma]) GO 
	
	ALTER TABLE [dbo].[TbEmpresa] WITH CHECK ADD CONSTRAINT [FK_TbEmpresa_TbUnidade1] FOREIGN KEY([IdUnidade]) REFERENCES [dbo].[TbUnidade] ([IdUnidade]) GO 
	
	ALTER TABLE [dbo].[TbRelatorioMatriculaCursoSuperior] WITH CHECK ADD CONSTRAINT [FK_TbRelatorioMatriculaCursoSuperior_TbPeriodo] FOREIGN KEY([IdPeriodo]) REFERENCES [dbo].[TbPeriodo] ([IdPeriodo]) GO 
	
	ALTER TABLE [dbo].[TbPagamentoTituloRelacionado] WITH CHECK ADD CONSTRAINT [FK_TbPagamentoTituloRelacionado_TbPagamento] FOREIGN KEY([IdPagamento]) REFERENCES [dbo].[TbPagamento] ([IdPagamento]) GO 
	
	ALTER TABLE [dbo].[TbAlunoCurso] WITH CHECK ADD CONSTRAINT [FK_TbAlunoCurso_TbSituacaoAlunoCurso] FOREIGN KEY([IdSituacaoAlunoCurso]) REFERENCES [dbo].[TbSituacaoAlunoCurso] ([IdSituacaoAlunoCurso]) GO 
	
	ALTER TABLE [dbo].[TbSerie] WITH CHECK ADD CONSTRAINT [FK_TbSerie_TbSituacaoAlunoTurma2] FOREIGN KEY([IdSituacaoAlunoTurmaAprovado]) REFERENCES [dbo].[TbSituacaoAlunoTurma] ([IdSituacaoAlunoTurma]) GO 
	
	ALTER TABLE [dbo].[TbParametroInternet] WITH CHECK ADD CONSTRAINT [FK_TbParametroInternet_InscrTurma_IdSituacaoAlunoTurmaComVaga] FOREIGN KEY([InscrTurma_IdSituacaoAlunoTurmaComVaga]) REFERENCES [dbo].[TbSituacaoAlunoTurma] ([IdSituacaoAlunoTurma]) GO 
	
	ALTER TABLE [dbo].[TbAlunoFichaMedica] WITH CHECK ADD CONSTRAINT [FK_TbAlunoFichaMedica_TbAluno] FOREIGN KEY([IdAluno]) REFERENCES [dbo].[TbAluno] ([IdAluno]) GO 
	
	ALTER TABLE [dbo].[TbRelatorioMatricula] WITH CHECK ADD CONSTRAINT [FK_TbRelatorioMatricula_TbPeriodo] FOREIGN KEY([IdPeriodo]) REFERENCES [dbo].[TbPeriodo] ([IdPeriodo]) GO 
	
	ALTER TABLE [dbo].[TbAlunoCursoDesconto] WITH CHECK ADD CONSTRAINT [FK_TbAlunoCursoDesconto_TbSolicitacaoDesconto] FOREIGN KEY([IdSolicitacaoDescontoOrigem]) REFERENCES [dbo].[TbSolicitacaoDesconto] ([IdSolicitacaoDesconto]) GO 
	
	ALTER TABLE [dbo].[TbFreqApuracao] WITH CHECK ADD CONSTRAINT [FK_TbFreqApuracao_TbDisciplina] FOREIGN KEY([IdDisciplina]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina]) GO 
	
	ALTER TABLE [dbo].[TbServico] WITH CHECK ADD CONSTRAINT [FK_TbServico_TbEmpresa] FOREIGN KEY([IdEmpresa]) REFERENCES [dbo].[TbEmpresa] ([IdEmpresa]) GO 
	
	ALTER TABLE [dbo].[TbRelatorioMatriculaCursoSuperior] WITH CHECK ADD CONSTRAINT [FK_TbRelatorioMatriculaCursoSuperior_TbRelatorio] FOREIGN KEY([IdRelatorio]) REFERENCES [dbo].[TbRelatorio] ([IdRelatorio]) GO 
	
	ALTER TABLE [dbo].[TbSerie] WITH CHECK ADD CONSTRAINT [FK_TbSerie_TbSituacaoAlunoTurma3] FOREIGN KEY([IdSituacaoAlunoTurmaPParcial]) REFERENCES [dbo].[TbSituacaoAlunoTurma] ([IdSituacaoAlunoTurma]) GO 
	
	ALTER TABLE [dbo].[TbParametroInternet] WITH CHECK ADD CONSTRAINT [FK_TbParametroInternet_InscrTurma_IdSituacaoAlunoTurmaSemVaga] FOREIGN KEY([InscrTurma_IdSituacaoAlunoTurmaSemVaga]) REFERENCES [dbo].[TbSituacaoAlunoTurma] ([IdSituacaoAlunoTurma]) GO 
	
	ALTER TABLE [dbo].[TbCaptacaoAlunoInteressado] WITH CHECK ADD CONSTRAINT [FK_TbCaptacaoAlunoInteressado_TbAluno] FOREIGN KEY([IdAlunoConvertido]) REFERENCES [dbo].[TbAluno] ([IdAluno]) GO 
	
	ALTER TABLE [dbo].[TbRelatorioMatricula] WITH CHECK ADD CONSTRAINT [FK_TbRelatorioMatricula_TbSerie] FOREIGN KEY([IdSerie]) REFERENCES [dbo].[TbSerie] ([IdSerie]) GO 
	
	ALTER TABLE [dbo].[TbProfessor] WITH CHECK ADD CONSTRAINT [FK_TbProfessor_TbUnidade] FOREIGN KEY([IdUnidade]) REFERENCES [dbo].[TbUnidade] ([IdUnidade]) GO 
	
	ALTER TABLE [dbo].[TbSerie] WITH CHECK ADD CONSTRAINT [FK_TbSerie_TbSituacaoAlunoTurma4] FOREIGN KEY([IdSituacaoAlunoTurmaReprovado]) REFERENCES [dbo].[TbSituacaoAlunoTurma] ([IdSituacaoAlunoTurma]) GO 
	
	ALTER TABLE [dbo].[TbFormaRecebimento] WITH CHECK ADD CONSTRAINT [FK_TbFormaRecebimento_TbFavorecido] FOREIGN KEY([IdFavorecidoTarifaBancaria]) REFERENCES [dbo].[TbFavorecido] ([IdFavorecido]) GO 
	
	ALTER TABLE [dbo].[TbCaptacaoAlunoInteressado] WITH CHECK ADD CONSTRAINT [FK_TbCaptacaoAlunoInteressado_TbCaptacaoMotivoDesistencia] FOREIGN KEY([IdCaptacaoMotivoDesistencia]) REFERENCES [dbo].[TbCaptacaoMotivoDesistencia] ([IdCaptacaoMotivoDesistencia]) GO 
	
	ALTER TABLE [dbo].[TbProfessorDisciplina] WITH CHECK ADD CONSTRAINT [FK_TbProfessorDisciplina_TbProfessor] FOREIGN KEY([IdProfessor]) REFERENCES [dbo].[TbProfessor] ([IdProfessor]) GO 
	
	ALTER TABLE [dbo].[TbCurso] WITH CHECK ADD CONSTRAINT [FK_TbCurso_TbUnidade] FOREIGN KEY([IdUnidade]) REFERENCES [dbo].[TbUnidade] ([IdUnidade]) GO 
	
	ALTER TABLE [dbo].[TbCaptacaoAlunoInteressado] WITH CHECK ADD CONSTRAINT [FK_TbCaptacaoAlunoInteressado_TbUsuario] FOREIGN KEY([IdUsuarioResponsavel]) REFERENCES [dbo].[TbUsuario] ([IdUsuario]) GO 
	
	ALTER TABLE [dbo].[TbAlunoImpressaoDigital] WITH CHECK ADD CONSTRAINT [FK_TbAlunoImpressaoDigital_TbAluno] FOREIGN KEY([IdAluno]) REFERENCES [dbo].[TbAluno] ([IdAluno]) GO 
	
	ALTER TABLE [dbo].[TbChequeCustodia] WITH CHECK ADD CONSTRAINT [FK_TbChequeCustodia_TbConta] FOREIGN KEY([IdConta]) REFERENCES [dbo].[TbConta] ([IdConta]) GO 
	
	ALTER TABLE [dbo].[TbLancamentoCobranca] WITH CHECK ADD CONSTRAINT [FK_TbLancamnetoCobranca_TbDisciplina] FOREIGN KEY([IdDisciplina]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina]) GO 
	
	ALTER TABLE [dbo].[TbAlunoPeriodo] WITH CHECK ADD CONSTRAINT [FK_TbAlunoPeriodo_TbPeriodo] FOREIGN KEY([IdPeriodo]) REFERENCES [dbo].[TbPeriodo] ([IdPeriodo]) GO 
	
	ALTER TABLE [dbo].[TbContaUsuario] WITH CHECK ADD CONSTRAINT [FK_TbContaUsuario_TbConta] FOREIGN KEY([IdConta]) REFERENCES [dbo].[TbConta] ([IdConta]) GO 
	
	ALTER TABLE [dbo].[TbCaptacaoAlunoInteressado] WITH CHECK ADD CONSTRAINT [FK_TbCaptacaoAlunoInteressado_TbCaptacaoSituacaoLead] FOREIGN KEY([IdCaptacaoSituacaoLeadAtual]) REFERENCES [dbo].[TbCaptacaoSituacaoLead] ([IdCaptacaoSituacaoLead]) GO 
	
	ALTER TABLE [dbo].[TbAlunoTurma] WITH CHECK ADD CONSTRAINT [FK_TbAlunoTurma_TbAluno] FOREIGN KEY([IdAluno]) REFERENCES [dbo].[TbAluno] ([IdAluno]) GO 
	
	ALTER TABLE [dbo].[TbParametroAssinaturaEletronica] WITH CHECK ADD CONSTRAINT [FK_TbDocumentoSignatario_TbUnidade] FOREIGN KEY([IdUnidade]) REFERENCES [dbo].[TbUnidade] ([IdUnidade]) GO 
	
	ALTER TABLE [dbo].[TbAlunoPeriodo] WITH CHECK ADD CONSTRAINT [FK_TbAlunoPeriodo_TbSituacaoAlunoCurso] FOREIGN KEY([IdSituacaoAlunoCurso]) REFERENCES [dbo].[TbSituacaoAlunoCurso] ([IdSituacaoAlunoCurso]) GO 
	
	ALTER TABLE [dbo].[TbContaUsuario] WITH CHECK ADD CONSTRAINT [FK_TbContaUsuario_TbUsuario] FOREIGN KEY([IdUsuario]) REFERENCES [dbo].[TbUsuario] ([IdUsuario]) GO 
	
	ALTER TABLE [dbo].[TbCaptacaoAlunoInteressado] WITH CHECK ADD CONSTRAINT [FK_TbCaptacaoAlunoInteressado_TbCaptacaoOrigemLead] FOREIGN KEY([IdCaptacaoOrigemLead]) REFERENCES [dbo].[TbCaptacaoOrigemLead] ([IdCaptacaoOrigemLead]) GO 
	
	ALTER TABLE [dbo].[TbAlunoFoto] WITH CHECK ADD CONSTRAINT [FK_TbAlunoFoto_TbAluno] FOREIGN KEY([IdAluno]) REFERENCES [dbo].[TbAluno] ([IdAluno]) GO 
	
	ALTER TABLE [dbo].[TbAlunoCurso] WITH CHECK ADD CONSTRAINT [FK_TbAlunoCurso_TbMotivoDispensaENAD] FOREIGN KEY([IdMotivoDispensaENAD]) REFERENCES [dbo].[TbMotivoDispensaENAD] ([IdMotivoDispensaENAD]) GO 
	
	ALTER TABLE [dbo].[TbParametroAssinaturaEletronica] WITH CHECK ADD CONSTRAINT [FK_TbModeloContrato_TbSituacaoAlunoTurma] FOREIGN KEY([IdSituacaoAlunoTurmaDestino]) REFERENCES [dbo].[TbSituacaoAlunoTurma] ([IdSituacaoAlunoTurma]) GO 
	
	ALTER TABLE [dbo].[TbParametroCPR] WITH CHECK ADD CONSTRAINT [FK_TbParametroCPR_TbFavorecido] FOREIGN KEY([IdFavorecidoClienteGenerico]) REFERENCES [dbo].[TbFavorecido] ([IdFavorecido]) GO 
	
	ALTER TABLE [dbo].[TbFaseNotaNotaNecessaria] WITH CHECK ADD CONSTRAINT [FK_TbFaseNotaNotaNecessaria_TbPeriodo] FOREIGN KEY([IdPeriodo]) REFERENCES [dbo].[TbPeriodo] ([IdPeriodo]) GO 
	
	ALTER TABLE [dbo].[TbAlunoTurmaHistorico] WITH CHECK ADD CONSTRAINT [FK_TbAlunoTurmaHistorico_TbAluno] FOREIGN KEY([IdAluno]) REFERENCES [dbo].[TbAluno] ([IdAluno]) GO 
	
	ALTER TABLE [dbo].[TbFreqQuadroHorario] WITH CHECK ADD CONSTRAINT [FK_TbFreqQuadroHorario_TbSala] FOREIGN KEY([IdSala]) REFERENCES [dbo].[TbSala] ([IdSala]) GO 
	
	ALTER TABLE [dbo].[TbTurma] WITH CHECK ADD CONSTRAINT [FK_TbTurma_IdModeloContrato] FOREIGN KEY([IdModeloContrato]) REFERENCES [dbo].[TbModeloContrato] ([IdModeloContrato]) GO 
	
	ALTER TABLE [dbo].[TbAlunoObs] WITH CHECK ADD CONSTRAINT [FK_TbAlunoObs_TbAluno] FOREIGN KEY([IdAluno]) REFERENCES [dbo].[TbAluno] ([IdAluno]) GO 
	
	ALTER TABLE [dbo].[TbAlunoTurma] WITH CHECK ADD CONSTRAINT [FK_TbAlunoTurma_TbPlanoPagamento_PreMatricula] FOREIGN KEY([IdPlanoPagamento_PreMatricula]) REFERENCES [dbo].[TbPlanoPagamento] ([IdPlanoPagamento]) GO 
	
	ALTER TABLE [dbo].[TbTituloCobrancaBoleto] WITH CHECK ADD CONSTRAINT [FK_TbTituloCobrancaBOL_TbTituloCobranca] FOREIGN KEY([IdTituloCobranca]) REFERENCES [dbo].[TbTituloCobranca] ([IdTituloCobranca]) GO 
	
	ALTER TABLE [dbo].[TbSolicitacaoDescontoTipoDocumento] WITH CHECK ADD CONSTRAINT [FK_TbSolicitacaoDescontoTipoDocumento_TbSolicitacaoDescontoTipo] FOREIGN KEY([IdSolicitacaoDescontoTipo]) REFERENCES [dbo].[TbSolicitacaoDescontoTipo] ([IdSolicitacaoDescontoTipo]) GO 
	
	ALTER TABLE [dbo].[TbParametroEnsinoSuperiorFIES] WITH CHECK ADD CONSTRAINT [FK_TbParametroEnsinoSuperiorFIES_TbAbatimento] FOREIGN KEY([IdParametroFIES]) REFERENCES [dbo].[TbAbatimento] ([IdAbatimento]) GO 
	
	ALTER TABLE [dbo].[TbFormaRecebimento] WITH CHECK ADD CONSTRAINT [FK_TbFormaRecebimento_TbBanco] FOREIGN KEY([DEB_NumeroBanco]) REFERENCES [dbo].[TbBanco] ([CodigoBanco]) GO 
	
	ALTER TABLE [dbo].[TbFidUsuarioPontuacao] WITH CHECK ADD CONSTRAINT [FK_TbFidUsuarioPontuacao_TbFidUsuario] FOREIGN KEY([IdFidUsuario]) REFERENCES [dbo].[TbFidUsuario] ([IdFidUsuario]) GO 
	
	ALTER TABLE [dbo].[TbFreqAlunoPermissaoSaida] WITH CHECK ADD CONSTRAINT [FK_TbFreqAlunoPermissaoSaida_TbAluno] FOREIGN KEY([IdAluno]) REFERENCES [dbo].[TbAluno] ([IdAluno]) GO 
	
	ALTER TABLE [dbo].[TbCaptacaoInteracao] WITH CHECK ADD CONSTRAINT [FK_TbCaptacaoInteracao_TbCaptacaoAluno] FOREIGN KEY([IdCaptacaoAlunoInteressado]) REFERENCES [dbo].[TbCaptacaoAlunoInteressado] ([IdCaptacaoAlunoInteressado]) GO 
	
	ALTER TABLE [dbo].[TbAlunoTaxa] WITH CHECK ADD CONSTRAINT [FK_TbAlunoTaxa_TbAluno] FOREIGN KEY([IdAluno]) REFERENCES [dbo].[TbAluno] ([IdAluno]) GO 
	
	ALTER TABLE [dbo].[TbAlunoTurma] WITH CHECK ADD CONSTRAINT [FK_TbAlunoTurma_TbPlanoPagamento_Matricula] FOREIGN KEY([IdPlanoPagamento_Matricula]) REFERENCES [dbo].[TbPlanoPagamento] ([IdPlanoPagamento]) GO 
	
	ALTER TABLE [dbo].[TbServicoAdicional] WITH CHECK ADD CONSTRAINT [FK_TbServicoAdicional_TbPeriodo] FOREIGN KEY([IdPeriodo]) REFERENCES [dbo].[TbPeriodo] ([IdPeriodo]) GO 
	
	ALTER TABLE [dbo].[TbAlunoTurmaBolsaHistorico] WITH CHECK ADD CONSTRAINT [FK_TbAlunoTurmaBolsaHistorico_TbUsuario] FOREIGN KEY([IdUsuario]) REFERENCES [dbo].[TbUsuario] ([IdUsuario]) GO 
	
	ALTER TABLE [dbo].[TbAlunoTurmaReservaDesconto] WITH CHECK ADD CONSTRAINT [FK_TbAlunoTurmaReservaDesconto_TbAlunoTurmaReserva] FOREIGN KEY([IdAlunoTurmaReserva]) REFERENCES [dbo].[TbAlunoTurmaReserva] ([IdAlunoTurmaReserva]) GO 
	
	ALTER TABLE [dbo].[TbLancamentoCobranca] WITH CHECK ADD CONSTRAINT [FK_TbLancamentoCobranca_TbAlunoServico] FOREIGN KEY([IdAlunoServico]) REFERENCES [dbo].[TbAlunoServico] ([IdAlunoServico]) GO 
	
	ALTER TABLE [dbo].[TbParametroEnsinoSuperiorFIES] WITH CHECK ADD CONSTRAINT [FK_TbParametroEnsinoSuperiorFIES_TbConta] FOREIGN KEY([IdContaFinanceira_RepasseFIES]) REFERENCES [dbo].[TbConta] ([IdConta]) GO 
	
	ALTER TABLE [dbo].[TbFaseNotaNotaNecessariaExibicao] WITH CHECK ADD CONSTRAINT [FK_TbFaseNotaNotaNecessariaExibicao_TbFaseNotaNotaNecessaria] FOREIGN KEY([IdFaseNotaNotaNecessaria]) REFERENCES [dbo].[TbFaseNotaNotaNecessaria] ([IdFaseNotaNotaNecessaria]) GO 
	
	ALTER TABLE [dbo].[TbResponsavel] WITH CHECK ADD CONSTRAINT [FK_TbResponsavel_TbBanco] FOREIGN KEY([DEB_CodigoBanco]) REFERENCES [dbo].[TbBanco] ([CodigoBanco]) GO 
	
	ALTER TABLE [dbo].[TbFidUsuarioPontuacao] WITH CHECK ADD CONSTRAINT [FK_TbFidUsuarioPontuacao_TbFidTipoLancamento] FOREIGN KEY([IdFidTipoLancamento]) REFERENCES [dbo].[TbFidTipoLancamento] ([IdFidTipoLancamento]) GO 
	
	ALTER TABLE [dbo].[TbCaptacaoInteracao] WITH CHECK ADD CONSTRAINT [FK_TbCaptacaoInteracao_TbUsuario] FOREIGN KEY([IdUsuario]) REFERENCES [dbo].[TbUsuario] ([IdUsuario]) GO 
	
	ALTER TABLE [dbo].[TbBoletoIntegrado_FilaProcessamento] WITH CHECK ADD CONSTRAINT [FK_TbBoletoIntegrado_FilaProcessamento_TbUsuario] FOREIGN KEY([IdUsuario]) REFERENCES [dbo].[TbUsuario] ([IdUsuario]) GO 
	
	ALTER TABLE [dbo].[TbSituacaoAlunoDisciplina] WITH CHECK ADD CONSTRAINT [FK_TbSituacaoAlunoDisciplina_TbTipoSituacaoAlunoDisciplina] FOREIGN KEY([SituacaoAtual]) REFERENCES [dbo].[TbTipoSituacaoAlunoDisciplina] ([TipoSituacaoAlunoDisciplina]) GO 
	
	ALTER TABLE [dbo].[TbServicoAdicional] WITH CHECK ADD CONSTRAINT [FK_TbServicoAdicional_TbServico] FOREIGN KEY([IdServico]) REFERENCES [dbo].[TbServico] ([IdServico]) GO 
	
	ALTER TABLE [dbo].[TbAlunoTurmaReservaDesconto] WITH CHECK ADD CONSTRAINT [FK_TbAlunoTurmaReservaDesconto_TbDesconto] FOREIGN KEY([IdDesconto]) REFERENCES [dbo].[TbAbatimento] ([IdAbatimento]) GO 
	
	ALTER TABLE [dbo].[TbParametroEnsinoSuperiorFIES] WITH CHECK ADD CONSTRAINT [FK_TbParametroEnsinoSuperiorFIES_TbEmpresa] FOREIGN KEY([IdEmpresa_RepasseFIES]) REFERENCES [dbo].[TbEmpresa] ([IdEmpresa]) GO 
	
	ALTER TABLE [dbo].[TbFidUsuarioPontuacao] WITH CHECK ADD CONSTRAINT [FK_TbFidUsuarioPontuacao_TbUsuario] FOREIGN KEY([IdUsuarioLancamento]) REFERENCES [dbo].[TbUsuario] ([IdUsuario]) GO 
	
	ALTER TABLE [dbo].[TbAlunoTurmaBolsaHistorico] WITH CHECK ADD CONSTRAINT [FK_TbAlunoTurmaBolsaHistorico_TbAluno] FOREIGN KEY([IdAluno]) REFERENCES [dbo].[TbAluno] ([IdAluno]) GO 
	
	ALTER TABLE [dbo].[TbCentroResultado] WITH CHECK ADD CONSTRAINT [FK_TbCentroResultado_TbUnidade] FOREIGN KEY([IdUnidade]) REFERENCES [dbo].[TbUnidade] ([IdUnidade]) GO 
	
	ALTER TABLE [dbo].[TbRelatorioGrupo] WITH CHECK ADD CONSTRAINT [FK_TbRelatorioGrupo_TbRelatorio] FOREIGN KEY([IdRelatorio]) REFERENCES [dbo].[TbRelatorio] ([IdRelatorio]) GO 
	
	ALTER TABLE [dbo].[TbParametroEnsinoSuperiorFIES] WITH CHECK ADD CONSTRAINT [FK_TbParametroEnsinoSuperiorFIES_TbFavorecido] FOREIGN KEY([IdFavorecido_RepasseFIES]) REFERENCES [dbo].[TbFavorecido] ([IdFavorecido]) GO 
	
	ALTER TABLE [dbo].[TbCaixaAbertura] WITH CHECK ADD CONSTRAINT [FK_TbCaixaAbertura_TbCaixa] FOREIGN KEY([IdCaixa]) REFERENCES [dbo].[TbCaixa] ([IdCaixa]) GO 
	
	ALTER TABLE [dbo].[TbServico] WITH CHECK ADD CONSTRAINT [FK_TbServico_TbCentroResultado] FOREIGN KEY([IdCentroResultado]) REFERENCES [dbo].[TbCentroResultado] ([IdCentroResultado]) GO 
	
	ALTER TABLE [dbo].[TbSolicitacaoDescontoDocumento] WITH CHECK ADD CONSTRAINT [FK_TbSolicitacaoDescontoDocumento_TbSolicitacaoDesconto] FOREIGN KEY([IdSolicitacaoDesconto]) REFERENCES [dbo].[TbSolicitacaoDesconto] ([IdSolicitacaoDesconto]) GO 
	
	ALTER TABLE [dbo].[TbParametroEnsinoSuperiorFIES] WITH CHECK ADD CONSTRAINT [FK_TbParametroEnsinoSuperiorFIES_TbPlanoContasFGEduc] FOREIGN KEY([IdPlanoContas_RetidoFGEduc]) REFERENCES [dbo].[TbPlanoContas] ([IdPlanoContas]) GO 
	
	ALTER TABLE [dbo].[TbCaixaUsuario] WITH CHECK ADD CONSTRAINT [FK_TbCaixaUsuario_TbCaixa] FOREIGN KEY([IdCaixa]) REFERENCES [dbo].[TbCaixa] ([IdCaixa]) GO 
	
	ALTER TABLE [dbo].[TbServicoAdicionalPlanoPagamento] WITH CHECK ADD CONSTRAINT [FK_TbServicoAdicionalPlanoPagamento_TbServicoAdicional] FOREIGN KEY([IdServicoAdicional]) REFERENCES [dbo].[TbServicoAdicional] ([IdServicoAdicional]) GO 
	
	ALTER TABLE [dbo].[TbSerie] WITH CHECK ADD CONSTRAINT [FK_TbSerie_TbServico_Reserva] FOREIGN KEY([Reserva_IdServico]) REFERENCES [dbo].[TbServico] ([IdServico]) GO 
	
	ALTER TABLE [dbo].[TbAlunoTurmaDocumento] WITH CHECK ADD CONSTRAINT [FK_TbAlunoTurma] FOREIGN KEY([IdAlunoTurma]) REFERENCES [dbo].[TbAlunoTurma] ([IdAlunoTurma]) GO 
	
	ALTER TABLE [dbo].[TbPosTransacao] WITH CHECK ADD CONSTRAINT [FK_TbPosTransacao_TbAutoAtendimentoTerminal] FOREIGN KEY([IdAutoAtendimentoTerminal]) REFERENCES [dbo].[TbAutoAtendimentoTerminal] ([IdAutoAtendimentoTerminal]) GO 
	
	ALTER TABLE [dbo].[TbAlunoTurmaBolsa] WITH CHECK ADD CONSTRAINT [FK_TbAlunoTurmaBolsa_TbAluno] FOREIGN KEY([IdAluno]) REFERENCES [dbo].[TbAluno] ([IdAluno]) GO 
	
	ALTER TABLE [dbo].[TbSolicitacaoDescontoDocumento] WITH CHECK ADD CONSTRAINT [FK_TbSolicitacaoDescontoDocumento_TbSolicitacaoDescontoTipoDocumento] FOREIGN KEY([IdSolicitacaoDescontoTipoDocumento]) REFERENCES [dbo].[TbSolicitacaoDescontoTipoDocumento] ([IdSolicitacaoDescontoTipoDocumento]) GO 
	
	ALTER TABLE [dbo].[TbParametroEnsinoSuperiorFIES] WITH CHECK ADD CONSTRAINT [FK_TbParametroEnsinoSuperiorFIES_TbPlanoContasFIES] FOREIGN KEY([IdPlanoContas_RepasseFIES]) REFERENCES [dbo].[TbPlanoContas] ([IdPlanoContas]) GO 
	
	ALTER TABLE [dbo].[TbCaixa] WITH CHECK ADD CONSTRAINT [FK_TbCaixa_TbUnidade] FOREIGN KEY([IdUnidade]) REFERENCES [dbo].[TbUnidade] ([IdUnidade]) GO 
	
	ALTER TABLE [dbo].[TbLancamentoFinanceiroTransferencia] WITH CHECK ADD CONSTRAINT [FK_TbLancamentoFinanceiroTransferencia_TbConta_Saida] FOREIGN KEY([IdContaSaida]) REFERENCES [dbo].[TbConta] ([IdConta]) GO 
	
	ALTER TABLE [dbo].[TbAlunoAproveitamentoDisciplina] WITH CHECK ADD CONSTRAINT [FK_TbAlunoAproveitamentoDisciplina_TbAlunoCurso] FOREIGN KEY([IdAlunoCurso]) REFERENCES [dbo].[TbAlunoCurso] ([IdAlunoCurso]) GO 
	
	ALTER TABLE [dbo].[TbServicoAdicionalPlanoPagamento] WITH CHECK ADD CONSTRAINT [FK_TbServicoAdicionalPlanoPagamento_TbPlanoPagamento] FOREIGN KEY([IdPlanoPagamento]) REFERENCES [dbo].[TbPlanoPagamento] ([IdPlanoPagamento]) GO 
	
	ALTER TABLE [dbo].[TbTurma] WITH CHECK ADD CONSTRAINT [FK_TbTurma_TbServico_Reserva] FOREIGN KEY([Reserva_IdServico]) REFERENCES [dbo].[TbServico] ([IdServico]) GO 
	
	ALTER TABLE [dbo].[TbAlunoTurmaDocumento] WITH CHECK ADD CONSTRAINT [FK_TbDocumento] FOREIGN KEY([IdDocumento]) REFERENCES [dbo].[TbDocumento] ([IdDocumento]) GO 
	
	ALTER TABLE [dbo].[TbAlunoTurmaBolsa] WITH CHECK ADD CONSTRAINT [FK_TbAlunoTurmaBolsa_TbTurma] FOREIGN KEY([IdTurma]) REFERENCES [dbo].[TbTurma] ([IdTurma]) GO 
	
	ALTER TABLE [dbo].[TbPeriodo] WITH CHECK ADD CONSTRAINT [FK_TbPeriodo_TbPeriodo] FOREIGN KEY([IdProximoPeriodo]) REFERENCES [dbo].[TbPeriodo] ([IdPeriodo]) GO 
	
	ALTER TABLE [dbo].[TbSolicitacaoDescontoDocumento] WITH CHECK ADD CONSTRAINT [FK_TbSolicitacaoDescontoDocumento_TbUsuario] FOREIGN KEY([IdUsuario]) REFERENCES [dbo].[TbUsuario] ([IdUsuario]) GO 
	
	ALTER TABLE [dbo].[TbResponsavelMobile] WITH CHECK ADD CONSTRAINT [FK_TbResponsavelMobile_TbResponsavel] FOREIGN KEY([IdResponsavel]) REFERENCES [dbo].[TbResponsavel] ([IdResponsavel]) GO 
	
	ALTER TABLE [dbo].[TbFiesRepasse] WITH CHECK ADD CONSTRAINT [FK_TbFiesRepasse_TbParametroEnsinoSuperiorFIES] FOREIGN KEY([IdParametroFIES]) REFERENCES [dbo].[TbParametroEnsinoSuperiorFIES] ([IdParametroFIES]) GO 
	
	ALTER TABLE [dbo].[TbUnidade] WITH CHECK ADD CONSTRAINT [FK_TbUnidade_TbTipoImpedimentoRMOnline] FOREIGN KEY([IdTipoImpedimentoRMOnline]) REFERENCES [dbo].[TbTipoImpedimento] ([IdTipoImpedimento]) GO 
	
	ALTER TABLE [dbo].[TbTextoPersonalizadoSerie] WITH CHECK ADD CONSTRAINT [FK_TbTextoPersonalizadoSerie_TbTextoPersonalizado] FOREIGN KEY([IdTextoPersonalizado]) REFERENCES [dbo].[TbTextoPersonalizado] ([IdTextoPersonalizado]) GO 
	
	ALTER TABLE [dbo].[TbCaixaAberturaSaldo] WITH CHECK ADD CONSTRAINT [FK_TbCaixaAberturaSaldo_TbCaixaAbertura] FOREIGN KEY([IdCaixaAbertura]) REFERENCES [dbo].[TbCaixaAbertura] ([IdCaixaAbertura]) GO 
	
	ALTER TABLE [dbo].[TbFreqMarcacao] WITH CHECK ADD CONSTRAINT [FK_TbFreqMarcacao_TbFreqColetor] FOREIGN KEY([IdColetorEntrada]) REFERENCES [dbo].[TbFreqColetor] ([IdColetor]) GO 
	
	ALTER TABLE [dbo].[TbLancamentoFinanceiroTransferencia] WITH CHECK ADD CONSTRAINT [FK_TbLancamentoFinanceiroTransferencia_TbConta_Entrada] FOREIGN KEY([IdContaEntrada]) REFERENCES [dbo].[TbConta] ([IdConta]) GO 
	
	ALTER TABLE [dbo].[TbAlunoAproveitamentoDisciplina] WITH CHECK ADD CONSTRAINT [FK_TbAlunoAproveitamentoDisciplina_TbDisciplina] FOREIGN KEY([IdDisciplina]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina]) GO 
	
	ALTER TABLE [dbo].[TbProfessorFoto] WITH CHECK ADD CONSTRAINT [FK_TbProfessorFoto_TbProfessor] FOREIGN KEY([IdProfessor]) REFERENCES [dbo].[TbProfessor] ([IdProfessor]) GO 
	
	ALTER TABLE [dbo].[TbTurma] WITH CHECK ADD CONSTRAINT [FK_TbTurma_TbPeriodo] FOREIGN KEY([IdPeriodo]) REFERENCES [dbo].[TbPeriodo] ([IdPeriodo]) GO 
	
	ALTER TABLE [dbo].[TbTituloCobrancaCadastroInadimplente] WITH CHECK ADD CONSTRAINT [FK_TbTituloCobrancaCadastroInadimplente_TbTituloCobranca] FOREIGN KEY([IdTituloCobranca]) REFERENCES [dbo].[TbTituloCobranca] ([IdTituloCobranca]) GO 
	
	ALTER TABLE [dbo].[TbPlanoContas] WITH CHECK ADD CONSTRAINT [FK_TbPlanoContas_TbPlanoContas] FOREIGN KEY([IdPlanoContasPai]) REFERENCES [dbo].[TbPlanoContas] ([IdPlanoContas]) GO 
	
	ALTER TABLE [dbo].[TbTextoPersonalizadoSerie] WITH CHECK ADD CONSTRAINT [FK_TbTextoPersonalizadoSerie_TbSerie] FOREIGN KEY([IdSerie]) REFERENCES [dbo].[TbSerie] ([IdSerie]) GO 
	
	ALTER TABLE [dbo].[TbCaixaMovimentacao] WITH CHECK ADD CONSTRAINT [FK_TbCaixaMovimentacao_TbCaixaAbertura] FOREIGN KEY([IdCaixaAbertura]) REFERENCES [dbo].[TbCaixaAbertura] ([IdCaixaAbertura]) GO 
	
	ALTER TABLE [dbo].[TbFreqMarcacao] WITH CHECK ADD CONSTRAINT [FK_TbFreqMarcacao_TbFreqColetor1] FOREIGN KEY([IdColetorSaida]) REFERENCES [dbo].[TbFreqColetor] ([IdColetor]) GO 
	
	ALTER TABLE [dbo].[TbFormula] WITH CHECK ADD CONSTRAINT [FK_TbFormula_TbUnidade] FOREIGN KEY([IdUnidade]) REFERENCES [dbo].[TbUnidade] ([IdUnidade]) GO 
	
	ALTER TABLE [dbo].[TbLancamentoCobranca] WITH CHECK ADD CONSTRAINT [FK_TbLancamentoCobranca_TbAlunoTurmaReserva] FOREIGN KEY([IdAlunoTurmaReserva]) REFERENCES [dbo].[TbAlunoTurmaReserva] ([IdAlunoTurmaReserva]) GO 
	
	ALTER TABLE [dbo].[TbOptProva] WITH CHECK ADD CONSTRAINT [FK_TbOptProva_TbPeriodo] FOREIGN KEY([IdPeriodo]) REFERENCES [dbo].[TbPeriodo] ([IdPeriodo]) GO 
	
	ALTER TABLE [dbo].[TbTituloCobrancaCadastroInadimplente] WITH CHECK ADD CONSTRAINT [FK_TbTituloCobrancaCadastroInadimplente_TbUsuario] FOREIGN KEY([IdUsuario]) REFERENCES [dbo].[TbUsuario] ([IdUsuario]) GO 
	
	ALTER TABLE [dbo].[TbPlanoContas] WITH CHECK ADD CONSTRAINT [FK_TbPlanoContas_TbUnidade] FOREIGN KEY([IdUnidade]) REFERENCES [dbo].[TbUnidade] ([IdUnidade]) GO 
	
	ALTER TABLE [dbo].[TbAlunoAproveitamentoDisciplina] WITH CHECK ADD CONSTRAINT [FK_TbAlunoAproveitamentoDisciplina_TbTipoSituacaoAlunoDisciplina] FOREIGN KEY([TipoSituacaoAlunoDisciplina]) REFERENCES [dbo].[TbTipoSituacaoAlunoDisciplina] ([TipoSituacaoAlunoDisciplina]) GO 
	
	ALTER TABLE [dbo].[TbUnidade] WITH CHECK ADD CONSTRAINT [FK_TbUnidade_TbTextoPersonalizado1] FOREIGN KEY([IdTexto_AssinaturaDirecao]) REFERENCES [dbo].[TbTextoPersonalizado] ([IdTextoPersonalizado]) GO 
	
	ALTER TABLE [dbo].[TbServicoAdicionalTurma] WITH CHECK ADD CONSTRAINT [FK_TbServicoAdicionalTurma_TbServicoAdicional] FOREIGN KEY([IdServicoAdicional]) REFERENCES [dbo].[TbServicoAdicional] ([IdServicoAdicional]) GO 
	
	ALTER TABLE [dbo].[TbGradeCurricular] WITH CHECK ADD CONSTRAINT [FK_TbGradeCurricular_TbPeriodo] FOREIGN KEY([IdPeriodo]) REFERENCES [dbo].[TbPeriodo] ([IdPeriodo]) GO 
	
	ALTER TABLE [dbo].[TbAbatimento] WITH CHECK ADD CONSTRAINT [FK_TbAbatimento_TbAbatimentoTipo] FOREIGN KEY([CdTipoAbatimento]) REFERENCES [dbo].[TbAbatimentoTipo] ([CdTipoAbatimento]) GO 
	
	ALTER TABLE [dbo].[TbContaPagarRateio] WITH CHECK ADD CONSTRAINT [FK_TbContaPagarRateio_TbPlanoContas] FOREIGN KEY([IdPlanoContas]) REFERENCES [dbo].[TbPlanoContas] ([IdPlanoContas]) GO 
	
	ALTER TABLE [dbo].[TbFaseNota] WITH CHECK ADD CONSTRAINT [FK_TbFaseNota_TbTipoSituacaoAlunoDisciplina] FOREIGN KEY([SituacaoReprovadoFrequencia]) REFERENCES [dbo].[TbTipoSituacaoAlunoDisciplina] ([TipoSituacaoAlunoDisciplina]) GO 
	
	ALTER TABLE [dbo].[TbUnidade] WITH CHECK ADD CONSTRAINT [FK_TbUnidade_TbTextoPersonalizado2] FOREIGN KEY([IdTexto_AssinaturaTesouraria]) REFERENCES [dbo].[TbTextoPersonalizado] ([IdTextoPersonalizado]) GO 
	
	ALTER TABLE [dbo].[TbServicoAdicionalTurma] WITH CHECK ADD CONSTRAINT [FK_TbServicoAdicionalTurma_TbTurma] FOREIGN KEY([IdTurma]) REFERENCES [dbo].[TbTurma] ([IdTurma]) GO 
	
	ALTER TABLE [dbo].[TbCaptacaoParametro] WITH CHECK ADD CONSTRAINT [FK_TbCaptacaoParametro_TbUnidade] FOREIGN KEY([IdUnidade]) REFERENCES [dbo].[TbUnidade] ([IdUnidade]) GO 
	
	ALTER TABLE [dbo].[TbCaixaAberturaSaldo] WITH CHECK ADD CONSTRAINT [FK_TbCaixaAberturaSaldo_TbCaixaTipoRecebimento] FOREIGN KEY([CdTipoRecebimento]) REFERENCES [dbo].[TbCaixaTipoRecebimento] ([CdTipoRecebimento]) GO 
	
	ALTER TABLE [dbo].[TbFaseNota] WITH CHECK ADD CONSTRAINT [FK_TbFaseNota_TbTipoSituacaoAlunoDisciplina_SituacaoAprovado] FOREIGN KEY([SituacaoAprovado]) REFERENCES [dbo].[TbTipoSituacaoAlunoDisciplina] ([TipoSituacaoAlunoDisciplina]) GO 
	
	ALTER TABLE [dbo].[TbUnidade] WITH CHECK ADD CONSTRAINT [FK_TbUnidade_TbTextoPersonalizado3] FOREIGN KEY([IdTexto_AssinaturaSecretaria]) REFERENCES [dbo].[TbTextoPersonalizado] ([IdTextoPersonalizado]) GO 
	
	ALTER TABLE [dbo].[TbInformativo] WITH CHECK ADD CONSTRAINT [FK_TbInformativo_TbUnidade] FOREIGN KEY([IdUnidade]) REFERENCES [dbo].[TbUnidade] ([IdUnidade]) GO 
	
	ALTER TABLE [dbo].[TbSeriePeriodo] WITH CHECK ADD CONSTRAINT [FK_TbSeriePeriodo_TbPeriodo] FOREIGN KEY([IdPeriodo]) REFERENCES [dbo].[TbPeriodo] ([IdPeriodo]) GO 
	
	ALTER TABLE [dbo].[TbFaseNota] WITH CHECK ADD CONSTRAINT [FK_TbFaseNota_TbPeriodo] FOREIGN KEY([IdPeriodo]) REFERENCES [dbo].[TbPeriodo] ([IdPeriodo]) GO 
	
	ALTER TABLE [dbo].[TbTextoPersonalizado] WITH CHECK ADD CONSTRAINT [FK_TbTextoPersonalizado_TbUnidade] FOREIGN KEY([IdUnidade]) REFERENCES [dbo].[TbUnidade] ([IdUnidade]) GO 
	
	ALTER TABLE [dbo].[TbLancamentoFinanceiroRateio] WITH CHECK ADD CONSTRAINT [FK_TbLancamentoFinanceiroRateio_TbPlanoContas] FOREIGN KEY([IdPlanoContas]) REFERENCES [dbo].[TbPlanoContas] ([IdPlanoContas]) GO 
	
	ALTER TABLE [dbo].[TbCaixaLancamento] WITH CHECK ADD CONSTRAINT [FK_TbCaixaLancamento_TbCaixaTipoRecebimento] FOREIGN KEY([CdTipoRecebimento]) REFERENCES [dbo].[TbCaixaTipoRecebimento] ([CdTipoRecebimento]) GO 
	
	ALTER TABLE [dbo].[TbFaseNota] WITH CHECK ADD CONSTRAINT [FK_TbFaseNota_TbTipoSituacaoAlunoDisciplina_SituacaoReprovado] FOREIGN KEY([SituacaoReprovado]) REFERENCES [dbo].[TbTipoSituacaoAlunoDisciplina] ([TipoSituacaoAlunoDisciplina]) GO 
	
	ALTER TABLE [dbo].[TbDisponibilidade] WITH CHECK ADD CONSTRAINT [FK_TbDisponibilidade_TbSala] FOREIGN KEY([IdSala]) REFERENCES [dbo].[TbSala] ([IdSala]) GO 
	
	ALTER TABLE [dbo].[TbAlmoxUsuarioCentroResultado] WITH CHECK ADD CONSTRAINT [FK_TbAlmoxUsuarioCentroResultado_TbCentroResultado] FOREIGN KEY([IdCentroResultado]) REFERENCES [dbo].[TbCentroResultado] ([IdCentroResultado]) GO 
	
	ALTER TABLE [dbo].[TbSeriePeriodo] WITH CHECK ADD CONSTRAINT [FK_TbSeriePeriodo_TbSerie] FOREIGN KEY([IdSerie]) REFERENCES [dbo].[TbSerie] ([IdSerie]) GO 
	
	ALTER TABLE [dbo].[TbLancamentoCobrancaDesconto] WITH CHECK ADD CONSTRAINT [FK_TbLancamentoCobrancaDesconto_TbLancamentoCobranca] FOREIGN KEY([IdLancamentoCobranca]) REFERENCES [dbo].[TbLancamentoCobranca] ([IdLancamentoCobranca]) GO 
	
	ALTER TABLE [dbo].[TbNotaFiscalCodigoVerificacaoRPS] WITH CHECK ADD CONSTRAINT [FK_TbNotaFiscalCodigoVerificacaoRPS_TbNotaFiscal] FOREIGN KEY([IdNotaFiscal]) REFERENCES [dbo].[TbNotaFiscal] ([IdNotaFiscal]) GO 
	
	ALTER TABLE [dbo].[TbCartaoMovimentacao] WITH CHECK ADD CONSTRAINT [FK_TbCartaoMovimentacao_TbCaixaTipoRecebimento] FOREIGN KEY([CdTipoRecebimento]) REFERENCES [dbo].[TbCaixaTipoRecebimento] ([CdTipoRecebimento]) GO 
	
	ALTER TABLE [dbo].[TbFeriado] WITH CHECK ADD CONSTRAINT [FK_TbFeriado_TbUnidade] FOREIGN KEY([IdUnidade]) REFERENCES [dbo].[TbUnidade] ([IdUnidade]) GO 
	
	ALTER TABLE [dbo].[TbLancamentoFinanceiro] WITH CHECK ADD CONSTRAINT [FK_TbLancamentoFinanceiro_TbConta] FOREIGN KEY([IdConta]) REFERENCES [dbo].[TbConta] ([IdConta]) GO 
	
	ALTER TABLE [dbo].[TbTituloCobranca_CobrarValorPagoAMenor] WITH CHECK ADD CONSTRAINT [FK_TbTituloCobranca_CobrarValorPagoAMenor_TbTituloCobrancaDestino] FOREIGN KEY([IdTituloCobrancaDestino]) REFERENCES [dbo].[TbTituloCobranca] ([IdTituloCobranca]) GO 
	
	ALTER TABLE [dbo].[TbAlmoxUsuarioCentroResultado] WITH CHECK ADD CONSTRAINT [FK_TbAlmoxUsuarioCentroResultado_TbUsuario] FOREIGN KEY([IdUsuario]) REFERENCES [dbo].[TbUsuario] ([IdUsuario]) GO 
	
	ALTER TABLE [dbo].[TbCaixaRecebimentoServico] WITH CHECK ADD CONSTRAINT [FK_TbCaixaRecebimentoServico_TbLancamentoCobranca] FOREIGN KEY([IdLancamentoCobranca]) REFERENCES [dbo].[TbLancamentoCobranca] ([IdLancamentoCobranca]) GO 
	
	ALTER TABLE [dbo].[TbLancamentoCobrancaRecebimento] WITH CHECK ADD CONSTRAINT [FK_TbLancamentoCobrancaRecebimento_TbCaixaTipoRecebimento] FOREIGN KEY([CdTipoRecebimento]) REFERENCES [dbo].[TbCaixaTipoRecebimento] ([CdTipoRecebimento]) GO 
	
	ALTER TABLE [dbo].[TbLancamentoFinanceiro] WITH CHECK ADD CONSTRAINT [FK_TbLancamentoFinanceiro_TbFavorecido] FOREIGN KEY([IdFavorecido]) REFERENCES [dbo].[TbFavorecido] ([IdFavorecido]) GO 
	
	ALTER TABLE [dbo].[TbTituloCobranca_CobrarValorPagoAMenor] WITH CHECK ADD CONSTRAINT [FK_TbTituloCobranca_CobrarValorPagoAMenor_TbUsuarioConferido] FOREIGN KEY([IdUsuarioConferido]) REFERENCES [dbo].[TbUsuario] ([IdUsuario]) GO 
	
	ALTER TABLE [dbo].[TbInformativoTurma] WITH CHECK ADD CONSTRAINT [FK_TbInformativoTurma_TbTurma] FOREIGN KEY([IdTurma]) REFERENCES [dbo].[TbTurma] ([IdTurma]) GO 
	
	ALTER TABLE [dbo].[TbAluno] WITH CHECK ADD CONSTRAINT [FK_TbAluno_TbAluno_Vinculado] FOREIGN KEY([IdAluno_CadastroVinculadoOrigem]) REFERENCES [dbo].[TbAluno] ([IdAluno]) GO 
	
	ALTER TABLE [dbo].[TbRateioLancamento] WITH CHECK ADD CONSTRAINT [FK_TbRateioLancamento_TbLancamentoCobranca] FOREIGN KEY([IdLancamentoCobranca]) REFERENCES [dbo].[TbLancamentoCobranca] ([IdLancamentoCobranca]) GO 
	
	ALTER TABLE [dbo].[TbTituloCobrancaRecebimento] WITH CHECK ADD CONSTRAINT [FK_TbTituloCobrancaRecebimento_TbCaixaTipoRecebimento] FOREIGN KEY([CdTipoRecebimento]) REFERENCES [dbo].[TbCaixaTipoRecebimento] ([CdTipoRecebimento]) GO 
	
	ALTER TABLE [dbo].[TbLancamentoFinanceiro] WITH CHECK ADD CONSTRAINT [FK_TbLancamentoFinanceiro_TbLancamentoFinanceiroTransferencia] FOREIGN KEY([IdLancamentoFinanceiroTransferencia]) REFERENCES [dbo].[TbLancamentoFinanceiroTransferencia] ([IdLancamentoFinanceiroTransferencia]) GO 
	
	ALTER TABLE [dbo].[TbAlmoxUsuarioGrupoMaterial] WITH CHECK ADD CONSTRAINT [FK_TbAlmoxUsuarioGrupoMaterial_TbAlmoxMaterialGrupo] FOREIGN KEY([IdMaterialGrupo]) REFERENCES [dbo].[TbAlmoxMaterialGrupo] ([IdMaterialGrupo]) GO 
	
	ALTER TABLE [dbo].[TbParametroCPR] WITH CHECK ADD CONSTRAINT [FK_TbParametroCPR_TbCentroResultado] FOREIGN KEY([IdCentroResultadoRECeDESP]) REFERENCES [dbo].[TbCentroResultado] ([IdCentroResultado]) GO 
	
	ALTER TABLE [dbo].[TbInformativoTurma] WITH CHECK ADD CONSTRAINT [FK_TbInformativoTurma_TbInformativo] FOREIGN KEY([IdInformativo]) REFERENCES [dbo].[TbInformativo] ([IdInformativo]) GO 
	
	ALTER TABLE [dbo].[TbRateioLancamentoCobranca] WITH CHECK ADD CONSTRAINT [FK_TbRateioLancamentoCobranca_TbLancamentoCobranca] FOREIGN KEY([IdLancamentoCobranca]) REFERENCES [dbo].[TbLancamentoCobranca] ([IdLancamentoCobranca]) GO 
	
	ALTER TABLE [dbo].[TbPagamentoOnlineSituacao] WITH CHECK ADD CONSTRAINT [FK_TbPagamentoOnlineSituacao_TbPagamentoOnline] FOREIGN KEY([IdPagamentoOnline]) REFERENCES [dbo].[TbPagamentoOnline] ([IdPagamentoOnline]) GO 
	
	ALTER TABLE [dbo].[TbAlmoxUsuarioGrupoMaterial] WITH CHECK ADD CONSTRAINT [FK_TbAlmoxUsuarioGrupoMaterial_TbUsuario] FOREIGN KEY([IdUsuario]) REFERENCES [dbo].[TbUsuario] ([IdUsuario]) GO 
	
	ALTER TABLE [dbo].[TbAlmoxMaterialGrupo] WITH CHECK ADD CONSTRAINT [FK_TbAlmoxMaterialGrupo_TbPlanoContas] FOREIGN KEY([IdPlanoContas]) REFERENCES [dbo].[TbPlanoContas] ([IdPlanoContas]) GO 
	
	ALTER TABLE [dbo].[TbParametroEnsinoSuperior] WITH CHECK ADD CONSTRAINT [FK_TbParametroEnsinoSuperior_TbTipoSituacaoAlunoDisciplina_Ativacao] FOREIGN KEY([SituacaoPadraoAposAtivacao]) REFERENCES [dbo].[TbTipoSituacaoAlunoDisciplina] ([TipoSituacaoAlunoDisciplina]) GO 
	
	ALTER TABLE [dbo].[TbOptSimuladoEnem] WITH CHECK ADD CONSTRAINT [FK_TbOptSimuladoEnem_TbDisciplina_IdDisciplinaRedacao] FOREIGN KEY([IdDisciplinaRedacao]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina]) GO 
	
	ALTER TABLE [dbo].[TbCurriculoDisciplina] WITH CHECK ADD CONSTRAINT [FK_TbCurriculoDisciplina_TbCurriculo] FOREIGN KEY([IdCurriculo]) REFERENCES [dbo].[TbCurriculo] ([IdCurriculo]) GO 
	
	ALTER TABLE [dbo].[TbParametroInternet] WITH CHECK ADD CONSTRAINT [FK_TbParametroInternet_InscrTurma_Remover] FOREIGN KEY([InscrTurma_IdTextoPersonalizadoRemover]) REFERENCES [dbo].[TbTextoPersonalizado] ([IdTextoPersonalizado]) GO 
	
	ALTER TABLE [dbo].[TbParametroInternet] WITH CHECK ADD CONSTRAINT [FK_TbParametroInternet_TbPeriodo_Agendamento] FOREIGN KEY([Agendamento_IdPeriodo]) REFERENCES [dbo].[TbPeriodo] ([IdPeriodo]) GO 
	
	ALTER TABLE [dbo].[TbAlunoCurso] WITH CHECK ADD CONSTRAINT [FK_TbAlunoCurso_TbCurso] FOREIGN KEY([IdCurso]) REFERENCES [dbo].[TbCurso] ([IdCurso]) GO 
	
	ALTER TABLE [dbo].[TbCaixaRecebimento] WITH CHECK ADD CONSTRAINT [FK_TbCaixaRecebimento_TbUsuario] FOREIGN KEY([IdUsuarioEstornoRecebimento]) REFERENCES [dbo].[TbUsuario] ([IdUsuario]) GO 
	
	ALTER TABLE [dbo].[TbParametroInternet] WITH CHECK ADD CONSTRAINT [FK_TbParametroInternet_RMOnLine_TbSituacaoAlunoTurma] FOREIGN KEY([RMOnLine_IdSituacaoAlunoTurma]) REFERENCES [dbo].[TbSituacaoAlunoTurma] ([IdSituacaoAlunoTurma]) GO 
	
	ALTER TABLE [dbo].[TbAgendamento] WITH CHECK ADD CONSTRAINT [FK_TbAgendamento_TbDisponibilidade] FOREIGN KEY([IdDisponibilidade]) REFERENCES [dbo].[TbDisponibilidade] ([IdDisponibilidade]) GO 
	
	ALTER TABLE [dbo].[TbLancamentoFinanceiroRateio] WITH CHECK ADD CONSTRAINT [FK_TbLancamentoFinanceiroRateio_TbCentroResultado] FOREIGN KEY([IdCentroResultado]) REFERENCES [dbo].[TbCentroResultado] ([IdCentroResultado]) GO 
	
	ALTER TABLE [dbo].[TbCurriculoDisciplina] WITH CHECK ADD CONSTRAINT [FK_TbCurriculoDisciplina_TbDisciplina] FOREIGN KEY([IdDisciplina]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina]) GO 
	
	ALTER TABLE [dbo].[TbLancamentoCobranca] WITH CHECK ADD CONSTRAINT [FK_TbLancamentoCobranca_TbLoteCobrancaServico] FOREIGN KEY([IdLoteCobranca], [IdServico]) REFERENCES [dbo].[TbLoteCobrancaServico] ([IdLoteCobranca], [IdServico]) GO 
	
	ALTER TABLE [dbo].[TbServico] WITH CHECK ADD CONSTRAINT [FK_TbServico_TbPlanoContas] FOREIGN KEY([IdPlanoContas]) REFERENCES [dbo].[TbPlanoContas] ([IdPlanoContas]) GO 
	
	ALTER TABLE [dbo].[TbAlunoCurso] WITH CHECK ADD CONSTRAINT [FK_TbAlunoCurso_TbCurso_Origem] FOREIGN KEY([IdCurso_Origem]) REFERENCES [dbo].[TbCurso] ([IdCurso]) GO 
	
	ALTER TABLE [dbo].[TbParametroInternet] WITH CHECK ADD CONSTRAINT [FK_TbParametroInternet_RMOnLine_TbTextoPersonalizado] FOREIGN KEY([RMOnLine_IdTextoPersonalizado]) REFERENCES [dbo].[TbTextoPersonalizado] ([IdTextoPersonalizado]) GO 
	
	ALTER TABLE [dbo].[TbAgendamento] WITH CHECK ADD CONSTRAINT [FK_TbAgendamento_TbResponsavel] FOREIGN KEY([IdResponsavel]) REFERENCES [dbo].[TbResponsavel] ([IdResponsavel]) GO 
	
	ALTER TABLE [dbo].[TbChequeEmitidoPagamentoAvulso] WITH CHECK ADD CONSTRAINT [FK_TbChequeEmitidoPagamentoAvulso_TbCentroResultado] FOREIGN KEY([IdCentroResultado]) REFERENCES [dbo].[TbCentroResultado] ([IdCentroResultado]) GO 
	
	ALTER TABLE [dbo].[TbCurriculo] WITH CHECK ADD CONSTRAINT [FK_TbCurriculo_TbCurso] FOREIGN KEY([IdCurso]) REFERENCES [dbo].[TbCurso] ([IdCurso]) GO 
	
	ALTER TABLE [dbo].[TbLancamentoFinanceiroRateio] WITH CHECK ADD CONSTRAINT [FK_TbLancamentoFinanceiroRateio_TbEmpresa] FOREIGN KEY([IdEmpresa]) REFERENCES [dbo].[TbEmpresa] ([IdEmpresa]) GO 
	
	ALTER TABLE [dbo].[TbAlmoxMaterial] WITH CHECK ADD CONSTRAINT [FK_TbAlmoxMaterial_TbAlmoxMaterialGrupo] FOREIGN KEY([IdMaterialGrupo]) REFERENCES [dbo].[TbAlmoxMaterialGrupo] ([IdMaterialGrupo]) GO 
	
	ALTER TABLE [dbo].[TbContaPagarRateio] WITH CHECK ADD CONSTRAINT [FK_TbContaPagarRateio_TbCentroResultado] FOREIGN KEY([IdCentroResultado]) REFERENCES [dbo].[TbCentroResultado] ([IdCentroResultado]) GO 
	
	ALTER TABLE [dbo].[TbHistoricoNotas] WITH CHECK ADD CONSTRAINT [FK_TbHistoricoNotas_TbDisciplina] FOREIGN KEY([IdDisciplina]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina]) GO 
	
	ALTER TABLE [dbo].[TbParametroCPR] WITH CHECK ADD CONSTRAINT [FK_TbParametroCPR_TbPlanoContasReceberMulta] FOREIGN KEY([IdPlanoContasReceberMulta]) REFERENCES [dbo].[TbPlanoContas] ([IdPlanoContas]) GO 
	
	ALTER TABLE [dbo].[TbCursoTipoCobranca02] WITH CHECK ADD CONSTRAINT [FK_TbCursoTipoCobranca02_TbCurso] FOREIGN KEY([Aluno_IdCurso]) REFERENCES [dbo].[TbCurso] ([IdCurso]) GO 
	
	ALTER TABLE [dbo].[TbAlmoxMaterial] WITH CHECK ADD CONSTRAINT [FK_TbAlmoxMaterial_TbFavorecido] FOREIGN KEY([IdFavorecido]) REFERENCES [dbo].[TbFavorecido] ([IdFavorecido]) GO 
	
	ALTER TABLE [dbo].[TbSolicitacaoProcedimentoMatricula] WITH CHECK ADD CONSTRAINT [FK_TbSolicitacaoProcedimentoMatricula_TbSolicitacao] FOREIGN KEY([IdSolicitacao]) REFERENCES [dbo].[TbSolicitacao] ([IdSolicitacao]) GO 
	
	ALTER TABLE [dbo].[TbFavorecido] WITH CHECK ADD CONSTRAINT [FK_TbFavorecido_TbCentroResultado] FOREIGN KEY([IdCentroResultado]) REFERENCES [dbo].[TbCentroResultado] ([IdCentroResultado]) GO 
	
	ALTER TABLE [dbo].[TbCursoTipoCobranca02] WITH CHECK ADD CONSTRAINT [FK_TbCursoTipoCobranca02_TbPeriodo] FOREIGN KEY([Turma_IdPeriodo]) REFERENCES [dbo].[TbPeriodo] ([IdPeriodo]) GO 
	
	ALTER TABLE [dbo].[TbLancamentoCobranca] WITH CHECK ADD CONSTRAINT [FK_TbLancamentoCobranca_TbServico] FOREIGN KEY([IdServico]) REFERENCES [dbo].[TbServico] ([IdServico]) GO 
	
	ALTER TABLE [dbo].[TbParametroCPR] WITH CHECK ADD CONSTRAINT [FK_TbParametroCPR_TbPlanoContasReceberJuros] FOREIGN KEY([IdPlanoContasReceberJuros]) REFERENCES [dbo].[TbPlanoContas] ([IdPlanoContas]) GO 
	
	ALTER TABLE [dbo].[TbCursoTipoCobranca06] WITH CHECK ADD CONSTRAINT [FK_TbCursoTipoCobranca06_TbCurso] FOREIGN KEY([Aluno_IdCurso]) REFERENCES [dbo].[TbCurso] ([IdCurso]) GO 
	
	ALTER TABLE [dbo].[TbAlmoxMaterial] WITH CHECK ADD CONSTRAINT [FK_TbAlmoxMaterial_TbPlanoContas] FOREIGN KEY([IdPlanoContas]) REFERENCES [dbo].[TbPlanoContas] ([IdPlanoContas]) GO 
	
	ALTER TABLE [dbo].[TbSolicitacaoProcedimentoMatricula] WITH CHECK ADD CONSTRAINT [FK_TbSolicitacaoProcedimentoMatricula_TbProcedimentoMatricula] FOREIGN KEY([IdProcedimentoMatricula]) REFERENCES [dbo].[TbProcedimentoMatricula] ([IdProcedimentoMatricula]) GO 
	
	ALTER TABLE [dbo].[TbParcelaCobranca] WITH CHECK ADD CONSTRAINT [FK_TbParcelaCobranca_TbUnidade] FOREIGN KEY([IdUnidade]) REFERENCES [dbo].[TbUnidade] ([IdUnidade]) GO 
	
	ALTER TABLE [dbo].[TbCaixaRecebimentoServico] WITH CHECK ADD CONSTRAINT [FK_TbCaixaRecebimentoServico_TbServico] FOREIGN KEY([IdServico]) REFERENCES [dbo].[TbServico] ([IdServico]) GO 
	
	ALTER TABLE [dbo].[TbParametroCPR] WITH CHECK ADD CONSTRAINT [FK_TbParametroCPR_TbPlanoContasReceberDesconto] FOREIGN KEY([IdPlanoContasReceberDesconto]) REFERENCES [dbo].[TbPlanoContas] ([IdPlanoContas]) GO 
	
	ALTER TABLE [dbo].[TbRelatorioMatriculaCursoSuperior] WITH CHECK ADD CONSTRAINT [FK_TbRelatorioMatriculaCursoSuperior_TbCurso] FOREIGN KEY([IdCurso]) REFERENCES [dbo].[TbCurso] ([IdCurso]) GO 
	
	ALTER TABLE [dbo].[TbSolicitacaoProcedimentoMatricula] WITH CHECK ADD CONSTRAINT [FK_TbSolicitacaoProcedimentoMatricula_TbUsuario] FOREIGN KEY([IdUsuario]) REFERENCES [dbo].[TbUsuario] ([IdUsuario]) GO 
	
	ALTER TABLE [dbo].[TbRateioServico] WITH CHECK ADD CONSTRAINT [FK_TbRateioServico_TbServico] FOREIGN KEY([IdServico]) REFERENCES [dbo].[TbServico] ([IdServico]) GO 
	
	ALTER TABLE [dbo].[TbPesquisaNPS] WITH CHECK ADD CONSTRAINT [FK_TbPesquisaNPS_TbUsuario] FOREIGN KEY([IdUsuario]) REFERENCES [dbo].[TbUsuario] ([IdUsuario]) GO 
	
	ALTER TABLE [dbo].[TbEventoTipoInscricao] WITH CHECK ADD CONSTRAINT [FK_TbEventoTipoInscricao_TbTurma_Evento] FOREIGN KEY([IdTurma_Evento]) REFERENCES [dbo].[TbTurma] ([IdTurma]) GO 
	
	ALTER TABLE [dbo].[TbLancamentoCobranca] WITH CHECK ADD CONSTRAINT [FK_TbLancamentoCobranca_TbTurma] FOREIGN KEY([IdTurma]) REFERENCES [dbo].[TbTurma] ([IdTurma]) GO 
	
	ALTER TABLE [dbo].[TbParametroCPR] WITH CHECK ADD CONSTRAINT [FK_TbParametroCPR_TbPlanoContasReceberAMaior] FOREIGN KEY([IdPlanoContasReceberAMaior]) REFERENCES [dbo].[TbPlanoContas] ([IdPlanoContas]) GO 
	
	ALTER TABLE [dbo].[TbSerie] WITH CHECK ADD CONSTRAINT [FK_TbSerie_TbCurso] FOREIGN KEY([IdCurso]) REFERENCES [dbo].[TbCurso] ([IdCurso]) GO 
	
	ALTER TABLE [dbo].[TbFormaRecebimento] WITH CHECK ADD CONSTRAINT [FK_TbFormaRecebimento_TbServico] FOREIGN KEY([IdServicoTaxaRecebimento]) REFERENCES [dbo].[TbServico] ([IdServico]) GO 
	
	ALTER TABLE [dbo].[TbEventoTipoInscricao] WITH CHECK ADD CONSTRAINT [FK_TbEventoTipoInscricao_TbServico] FOREIGN KEY([IdServico]) REFERENCES [dbo].[TbServico] ([IdServico]) GO 
	
	ALTER TABLE [dbo].[TbLancamentoCobranca] WITH CHECK ADD CONSTRAINT [FK_TbLancamentoCobranca_TbTituloCobranca] FOREIGN KEY([IdTituloCobrancaGerado]) REFERENCES [dbo].[TbTituloCobranca] ([IdTituloCobranca]) GO 
	
	ALTER TABLE [dbo].[TbParametroCPR] WITH CHECK ADD CONSTRAINT [FK_TbParametroCPR_TbPlanoContasReceberNaoIdentificado] FOREIGN KEY([IdPlanoContasReceberNaoIdentificado]) REFERENCES [dbo].[TbPlanoContas] ([IdPlanoContas]) GO 
	
	ALTER TABLE [dbo].[TbTurmaProfessorCursoAdicional] WITH CHECK ADD CONSTRAINT [FK_TbTurmaProfessorCursoAdicional_TbCurso] FOREIGN KEY([IdCursoQueDevePermitirMatricula]) REFERENCES [dbo].[TbCurso] ([IdCurso]) GO 
	
	ALTER TABLE [dbo].[TbTurma] WITH CHECK ADD CONSTRAINT [FK_TbTurma_TbServico] FOREIGN KEY([IdServicoMensalidade]) REFERENCES [dbo].[TbServico] ([IdServico]) GO 
	
	ALTER TABLE [dbo].[TbEventoTipoInscricao] WITH CHECK ADD CONSTRAINT [FK_TbEventoTipoInscricao_TbPlanoPagamento] FOREIGN KEY([IdPlanoPagamento]) REFERENCES [dbo].[TbPlanoPagamento] ([IdPlanoPagamento]) GO 
	
	ALTER TABLE [dbo].[TbArquivoAnexo] WITH CHECK ADD CONSTRAINT [FK_IdUsuarioUpload_TbUsuario] FOREIGN KEY([IdUsuarioUpload]) REFERENCES [dbo].[TbUsuario] ([IdUsuario]) GO 
	
	ALTER TABLE [dbo].[TbParametroCPR] WITH CHECK ADD CONSTRAINT [FK_TbParametroCPR_TbPlanoContasReceberTarifaCobrancaBoleto] FOREIGN KEY([IdPlanoContasReceberTarifaCobrancaBoleto]) REFERENCES [dbo].[TbPlanoContas] ([IdPlanoContas]) GO 
	
	ALTER TABLE [dbo].[TbTituloCobranca_CobrarValorPagoAMenor] WITH CHECK ADD CONSTRAINT [FK_TbTituloCobranca_CobrarValorPagoAMenor_TbTituloCobranca] FOREIGN KEY([IdTituloCobranca]) REFERENCES [dbo].[TbTituloCobranca] ([IdTituloCobranca]) GO 
	
	ALTER TABLE [dbo].[TbAlmoxMaterialEstoque] WITH CHECK ADD CONSTRAINT [FK_TbAlmoxMaterialEstoque_TbAlmoxAlmoxarifado] FOREIGN KEY([IdAlmoxarifado]) REFERENCES [dbo].[TbAlmoxAlmoxarifado] ([IdAlmoxarifado]) GO 
	
	ALTER TABLE [dbo].[TbLoteCobrancaServico] WITH CHECK ADD CONSTRAINT [FK_TbLoteCobrancaServico_TbServico] FOREIGN KEY([IdServico]) REFERENCES [dbo].[TbServico] ([IdServico]) GO 
	
	ALTER TABLE [dbo].[TbResponsavelObs] WITH CHECK ADD CONSTRAINT [FK_TbResponsavelObs_TbAluno] FOREIGN KEY([IdResponsavel]) REFERENCES [dbo].[TbResponsavel] ([IdResponsavel]) GO 
	
	ALTER TABLE [dbo].[TbTurma] WITH CHECK ADD CONSTRAINT [FK_TbTurma_TbEventoTipo] FOREIGN KEY([IdEventoTipo]) REFERENCES [dbo].[TbEventoTipo] ([IdEventoTipo]) GO 
	
	ALTER TABLE [dbo].[TbOptProva] WITH CHECK ADD CONSTRAINT [FK_TbOptProva_TbUsuario] FOREIGN KEY([IdUsuarioUltimaAlteracaoGabarito]) REFERENCES [dbo].[TbUsuario] ([IdUsuario]) GO 
	
	ALTER TABLE [dbo].[TbArquivoAnexo] WITH CHECK ADD CONSTRAINT [FK_IdUsuarioExclusaoLogica_TbUsuario] FOREIGN KEY([IdUsuarioExclusaoLogica]) REFERENCES [dbo].[TbUsuario] ([IdUsuario]) GO 
	
	ALTER TABLE [dbo].[TbChequeMovimentacao] WITH CHECK ADD CONSTRAINT [FK_TbChequeMovimentacao_TbUsuario] FOREIGN KEY([IdUsuario]) REFERENCES [dbo].[TbUsuario] ([IdUsuario]) GO 
	
	ALTER TABLE [dbo].[TbParametroCPR] WITH CHECK ADD CONSTRAINT [FK_TbParametroCPR_TbPlanoContasPagarMulta] FOREIGN KEY([IdPlanoContasPagarMulta]) REFERENCES [dbo].[TbPlanoContas] ([IdPlanoContas]) GO 
	
	ALTER TABLE [dbo].[TbTituloCobranca_CobrarValorPagoAMenor] WITH CHECK ADD CONSTRAINT [FK_TbTituloCobranca_CobrarValorPagoAMenor_TbUsuario] FOREIGN KEY([IdUsuario]) REFERENCES [dbo].[TbUsuario] ([IdUsuario]) GO 
	
	ALTER TABLE [dbo].[TbAluno] WITH CHECK ADD CONSTRAINT [FK_TbAluno_TbEndereco] FOREIGN KEY([IdEndereco]) REFERENCES [dbo].[TbEndereco] ([IdEndereco]) GO 
	
	ALTER TABLE [dbo].[TbAlmoxMaterialEstoque] WITH CHECK ADD CONSTRAINT [FK_TbAlmoxMaterialEstoque_TbAlmoxMaterial] FOREIGN KEY([IdMaterial]) REFERENCES [dbo].[TbAlmoxMaterial] ([IdMaterial]) GO 
	
	ALTER TABLE [dbo].[TbExcecaoCobranca] WITH CHECK ADD CONSTRAINT [FK_TbExcecaoCobranca_TbServico] FOREIGN KEY([IdServico]) REFERENCES [dbo].[TbServico] ([IdServico]) GO 
	
	ALTER TABLE [dbo].[TbResponsavelObs] WITH CHECK ADD CONSTRAINT [FK_TbResponsavelObs_TbTipoOcorrencia] FOREIGN KEY([IdTipoOcorrencia]) REFERENCES [dbo].[TbTipoOcorrencia] ([IdTipoOcorrencia]) GO 
	
	ALTER TABLE [dbo].[TbAlunoTurma] WITH CHECK ADD CONSTRAINT [FK_TbAlunoTurma_TbEventoTipoInscricao] FOREIGN KEY([IdEventoTipoInscricao]) REFERENCES [dbo].[TbEventoTipoInscricao] ([IdEventoTipoInscricao]) GO 
	
	ALTER TABLE [dbo].[TbAlunoCursoSuperior] WITH CHECK ADD CONSTRAINT [FK_TbAlunoCursoSuperior_TbPeriodo] FOREIGN KEY([IdPeriodoIngresso]) REFERENCES [dbo].[TbPeriodo] ([IdPeriodo]) GO 
	
	ALTER TABLE [dbo].[TbTipoOcorrencia] WITH CHECK ADD CONSTRAINT [FK_TbTipoOcorrencia_TbTextoPersonalizado] FOREIGN KEY([IdTextoPersonalizado]) REFERENCES [dbo].[TbTextoPersonalizado] ([IdTextoPersonalizado]) GO 
	
	ALTER TABLE [dbo].[TbChequeMovimentacao] WITH CHECK ADD CONSTRAINT [FK_TbChequeMovimentacao_TbChequeCustodia] FOREIGN KEY([IdChequeCustodia]) REFERENCES [dbo].[TbChequeCustodia] ([IdChequeCustodia]) GO 
	
	ALTER TABLE [dbo].[TbParametroCPR] WITH CHECK ADD CONSTRAINT [FK_TbParametroCPR_TbPlanoContasPagarJuros] FOREIGN KEY([IdPlanoContasPagarJuros]) REFERENCES [dbo].[TbPlanoContas] ([IdPlanoContas]) GO 
	
	ALTER TABLE [dbo].[TbProfessor] WITH CHECK ADD CONSTRAINT [FK_TbProfessor_TbEndereco] FOREIGN KEY([IdEndereco]) REFERENCES [dbo].[TbEndereco] ([IdEndereco]) GO 
	
	ALTER TABLE [dbo].[TbSerie] WITH CHECK ADD CONSTRAINT [FK_TbSerie_TbServico] FOREIGN KEY([IdServicoMensalidade]) REFERENCES [dbo].[TbServico] ([IdServico]) GO 
	
	ALTER TABLE [dbo].[TbResponsavelObs] WITH CHECK ADD CONSTRAINT [FK_TbResponsavelObs_TbUsuario_Registro] FOREIGN KEY([IdUsuarioRegistro]) REFERENCES [dbo].[TbUsuario] ([IdUsuario]) GO 
	
	ALTER TABLE [dbo].[TbAlunoCursoSuperior] WITH CHECK ADD CONSTRAINT [FK_TbAlunoCursoSuperior_TbPeriodo1] FOREIGN KEY([IdPeriodoSaida]) REFERENCES [dbo].[TbPeriodo] ([IdPeriodo]) GO 
	
	ALTER TABLE [dbo].[TbParametroCPR] WITH CHECK ADD CONSTRAINT [FK_TbParametroCPR_TbPlanoContasPagarDesconto] FOREIGN KEY([IdPlanoContasPagarDesconto]) REFERENCES [dbo].[TbPlanoContas] ([IdPlanoContas]) GO 
	
	ALTER TABLE [dbo].[TbResponsavel] WITH CHECK ADD CONSTRAINT [FK_TbResponsavel_TbEndereco] FOREIGN KEY([IdEndereco]) REFERENCES [dbo].[TbEndereco] ([IdEndereco]) GO 
	
	ALTER TABLE [dbo].[TbLancamentoCobrancaRecebimento] WITH CHECK ADD CONSTRAINT [FK_TbLancamentoCobrancaRecebimento_TbLancamentoCobranca] FOREIGN KEY([IdLancamentoCobranca]) REFERENCES [dbo].[TbLancamentoCobranca] ([IdLancamentoCobranca]) GO 
	
	ALTER TABLE [dbo].[TbAlunoTaxa] WITH CHECK ADD CONSTRAINT [FK_TbAlunoTaxa_TbServico] FOREIGN KEY([IdServico]) REFERENCES [dbo].[TbServico] ([IdServico]) GO 
	
	ALTER TABLE [dbo].[TbResponsavelObs] WITH CHECK ADD CONSTRAINT [FK_TbResponsavelObs_TbUsuario_Liberacao] FOREIGN KEY([IdUsuarioLiberacao]) REFERENCES [dbo].[TbUsuario] ([IdUsuario]) GO 
	
	ALTER TABLE [dbo].[TbAlunoTurma] WITH CHECK ADD CONSTRAINT [FK_TbAlunoTurma_TbAlunoCursoSuperior] FOREIGN KEY([IdAlunoCursoSuperior]) REFERENCES [dbo].[TbAlunoCursoSuperior] ([IdAlunoCursoSuperior]) GO 
	
	ALTER TABLE [dbo].[TbHistoricoNotas] WITH CHECK ADD CONSTRAINT [FK_TbHistoricoNotas_TbHistorico] FOREIGN KEY([IdAluno], [CodigoSerie], [AnoConclusao]) REFERENCES [dbo].[TbHistorico] ([IdAluno], [CodigoSerie], [AnoConclusao]) GO 
	
	ALTER TABLE [dbo].[TbFreqVerificacao] WITH CHECK ADD CONSTRAINT [FK_TbFreqVerificacao_TbTipoImpedimento] FOREIGN KEY([IdTipoImpedimento]) REFERENCES [dbo].[TbTipoImpedimento] ([IdTipoImpedimento]) GO 
	
	ALTER TABLE [dbo].[TbUnidadeTermoConsentimento] WITH CHECK ADD CONSTRAINT [FK__TbUnidade__IdUni__70436964] FOREIGN KEY([IdUnidade]) REFERENCES [dbo].[TbUnidade] ([IdUnidade]) GO 
	
	ALTER TABLE [dbo].[TbLoteCobranca] WITH CHECK ADD CONSTRAINT [FK_TbLoteCobranca_TbServico] FOREIGN KEY([_IdServico]) REFERENCES [dbo].[TbServico] ([IdServico]) GO 
	
	ALTER TABLE [dbo].[TbTipoRetencaoPagamento] WITH CHECK ADD CONSTRAINT [FK_TbTipoRetencaoPagamento_TbPlanoContas] FOREIGN KEY([IdPlanoContas]) REFERENCES [dbo].[TbPlanoContas] ([IdPlanoContas]) GO 
	
	ALTER TABLE [dbo].[TbUnidade] WITH CHECK ADD CONSTRAINT [FK_TbUnidade_TbEscola] FOREIGN KEY([IdEscola]) REFERENCES [dbo].[TbEscola] ([IdEscola]) GO 
	
	ALTER TABLE [dbo].[TbAlmoxHistoricoDiarioQuantidade] WITH CHECK ADD CONSTRAINT [FK_TbAlmoxHistoricoDiario_TbAlmoxAlmoxarifado] FOREIGN KEY([IdAlmoxarifado]) REFERENCES [dbo].[TbAlmoxAlmoxarifado] ([IdAlmoxarifado]) GO 
	
	ALTER TABLE [dbo].[TbServicoPreco] WITH CHECK ADD CONSTRAINT [FK_TbServicoPreco_TbServico] FOREIGN KEY([IdServico]) REFERENCES [dbo].[TbServico] ([IdServico]) GO 
	
	ALTER TABLE [dbo].[TbCartaoOperadora] WITH CHECK ADD CONSTRAINT [FK_TbCartaoOperadora_TbConta_Repasse] FOREIGN KEY([IdConta_Repasse]) REFERENCES [dbo].[TbConta] ([IdConta]) GO 
	
	ALTER TABLE [dbo].[TbSolicitacaoTipo] WITH CHECK ADD CONSTRAINT [FK_TbSolicitacaoTipo_TbServico] FOREIGN KEY([IdServico]) REFERENCES [dbo].[TbServico] ([IdServico]) GO 
	
	ALTER TABLE [dbo].[TbAlmoxHistoricoDiarioQuantidade] WITH CHECK ADD CONSTRAINT [FK_TbAlmoxHistoricoDiario_TbAlmoxMaterial] FOREIGN KEY([IdMaterial]) REFERENCES [dbo].[TbAlmoxMaterial] ([IdMaterial]) GO 
	
	ALTER TABLE [dbo].[TbCartaoOperadora] WITH CHECK ADD CONSTRAINT [FK_CartaoOperadora_TbPlanoContas_Despesa] FOREIGN KEY([IdPlanoContas_Despesa]) REFERENCES [dbo].[TbPlanoContas] ([IdPlanoContas]) GO 
	
	ALTER TABLE [dbo].[TbMetaSituacaoAlunoDisciplina] WITH CHECK ADD CONSTRAINT [FK_TbMetaSituacaoAlunoDisciplina_TbDisciplina] FOREIGN KEY([IdDisciplina]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina]) GO 
	
	ALTER TABLE [dbo].[TbTituloCobrancaRegistrada] WITH CHECK ADD CONSTRAINT [FK_TbTituloCobrancaRegistrada_IdFormaRecebimento] FOREIGN KEY([IdFormaRecebimento]) REFERENCES [dbo].[TbFormaRecebimento] ([IdFormaRecebimento]) GO 
	
	ALTER TABLE [dbo].[TbChequeMovimentacaoItem] WITH CHECK ADD CONSTRAINT [FK_TbChequeMovimentacaoItem_TbChequeMovimentacao] FOREIGN KEY([IdChequeMovimentacao]) REFERENCES [dbo].[TbChequeMovimentacao] ([IdChequeMovimentacao]) GO 
	
	ALTER TABLE [dbo].[TbSolicitacaoTipo] WITH CHECK ADD CONSTRAINT [FK_TbSolicitacaoTipo_TbFormaRecebimento] FOREIGN KEY([IdFormaRecebimento]) REFERENCES [dbo].[TbFormaRecebimento] ([IdFormaRecebimento]) GO 
	
	ALTER TABLE [dbo].[TbAlunoCurso] WITH CHECK ADD CONSTRAINT [FK_TbAlunoCurso_TbEstabelecimentoEnsino] FOREIGN KEY([IdEstabelecimentoEnsinoAnterior]) REFERENCES [dbo].[TbEstabelecimentoEnsino] ([IdEstabelecimentoEnsino]) GO 
	
	ALTER TABLE [dbo].[TbAlunoTipoAvaliacao] WITH CHECK ADD CONSTRAINT [FK_TbAlunoTipoAvaliacao_TbAluno] FOREIGN KEY([IdAluno]) REFERENCES [dbo].[TbAluno] ([IdAluno]) GO 
	
	ALTER TABLE [dbo].[TbTituloCobrancaRecebimento] WITH CHECK ADD CONSTRAINT [FK_TbTituloCobrancaRecebimento_TbTituloCobranca] FOREIGN KEY([IdTituloCobranca]) REFERENCES [dbo].[TbTituloCobranca] ([IdTituloCobranca]) GO 
	
	ALTER TABLE [dbo].[TbCurso] WITH CHECK ADD CONSTRAINT [FK_TbCurso_TbTextoPersonalizado] FOREIGN KEY([RMOnLine_IdTextoPersonalizado_Confirmacao]) REFERENCES [dbo].[TbTextoPersonalizado] ([IdTextoPersonalizado]) GO 
	
	ALTER TABLE [dbo].[TbChequeMovimentacaoItem] WITH CHECK ADD CONSTRAINT [FK_TbChequeMovimentacaoItem_TbCheque] FOREIGN KEY([IdCheque]) REFERENCES [dbo].[TbCheque] ([IdCheque]) GO 
	
	ALTER TABLE [dbo].[TbTurmaProfessorCursoAdicional] WITH CHECK ADD CONSTRAINT [FK_TbTurmaProfessorCursoAdicional_TbTurma] FOREIGN KEY([IdTurma]) REFERENCES [dbo].[TbTurma] ([IdTurma]) GO 
	
	ALTER TABLE [dbo].[TbAluno] WITH CHECK ADD CONSTRAINT [FK_TbAluno_TbEstabelecimentoEnsino] FOREIGN KEY([IdEstabelecimentoEnsinoAnterior]) REFERENCES [dbo].[TbEstabelecimentoEnsino] ([IdEstabelecimentoEnsino]) GO 
	
	ALTER TABLE [dbo].[TbAlunoTipoAvaliacao] WITH CHECK ADD CONSTRAINT [FK_TbAlunoTipoAvaliacao_TbTurma] FOREIGN KEY([IdTurma]) REFERENCES [dbo].[TbTurma] ([IdTurma]) GO 
	
	ALTER TABLE [dbo].[TbPlanoPagamentoParcelaLancamento] WITH CHECK ADD CONSTRAINT [FK_TbPlanoPagamentoParcelaLancamento_TbServico] FOREIGN KEY([IdServicoAdicional]) REFERENCES [dbo].[TbServico] ([IdServico]) GO 
	
	ALTER TABLE [dbo].[TbCaixaTipoRecebimento] WITH CHECK ADD CONSTRAINT [FK_TbCaixaTipoRecebimento_TbCartaoOperadora] FOREIGN KEY([IdCartaoOperadora]) REFERENCES [dbo].[TbCartaoOperadora] ([IdCartaoOperadora]) GO 
	
	ALTER TABLE [dbo].[TbTurmaProfessorCursoAdicional] WITH CHECK ADD CONSTRAINT [FK_TbTurmaProfessorCursoAdicional_TbDisciplina] FOREIGN KEY([IdDisciplina]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina]) GO 
	
	ALTER TABLE [dbo].[TbAluno] WITH CHECK ADD CONSTRAINT [FK_TbAluno_TbEstabelecimentoEnsino_ES] FOREIGN KEY([EnsinoMedio_IdEstabelecimentoEnsino]) REFERENCES [dbo].[TbEstabelecimentoEnsino] ([IdEstabelecimentoEnsino]) GO 
	
	ALTER TABLE [dbo].[TbAlunoTipoAvaliacao] WITH CHECK ADD CONSTRAINT [FK_TbAlunoTipoAvaliacao_TbDisciplina] FOREIGN KEY([IdDisciplina]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina]) GO 
	
	ALTER TABLE [dbo].[TbLancamentoCobranca] WITH CHECK ADD CONSTRAINT [FK_TbLancamentoCobranca_TbAlunoTaxa] FOREIGN KEY([IdAlunoTaxa]) REFERENCES [dbo].[TbAlunoTaxa] ([IdAlunoTaxa]) GO 
	
	ALTER TABLE [dbo].[TbAbatimento] WITH CHECK ADD CONSTRAINT [FK_TbAbatimento_TbUnidade] FOREIGN KEY([IdUnidade]) REFERENCES [dbo].[TbUnidade] ([IdUnidade]) GO 
	
	ALTER TABLE [dbo].[TbAlunoAproveitamentoDisciplina] WITH CHECK ADD CONSTRAINT [FK_TbAlunoAproveitamentoDisciplina_TbEstabelecimentoEnsino] FOREIGN KEY([IdEstabelecimentoEnsino]) REFERENCES [dbo].[TbEstabelecimentoEnsino] ([IdEstabelecimentoEnsino]) GO 
	
	ALTER TABLE [dbo].[TbAlunoTurma] WITH CHECK ADD CONSTRAINT [FK_TbAlunoTurma_TbUsuario] FOREIGN KEY([IdUsuarioEfetivacaoMatricula]) REFERENCES [dbo].[TbUsuario] ([IdUsuario]) GO 
	
	ALTER TABLE [dbo].[TbAlunoTipoAvaliacao] WITH CHECK ADD CONSTRAINT [FK_TbAlunoTipoAvaliacao_TbTipoAvaliacao] FOREIGN KEY([IdTipoAvaliacao]) REFERENCES [dbo].[TbTipoAvaliacao] ([IdTipoAvaliacao]) GO 
	
	ALTER TABLE [dbo].[TbAlmoxHistoricoDiarioPreco] WITH CHECK ADD CONSTRAINT [FK_TbAlmoxHistoricoDiarioPreco_TbAlmoxMaterial] FOREIGN KEY([IdMaterial]) REFERENCES [dbo].[TbAlmoxMaterial] ([IdMaterial]) GO 
	
	ALTER TABLE [dbo].[TbSerieGrupo] WITH CHECK ADD CONSTRAINT [FK_TbSerieGrupo_TbSerie] FOREIGN KEY([IdSerie]) REFERENCES [dbo].[TbSerie] ([IdSerie]) GO 
	
	ALTER TABLE [dbo].[TbAlunoTurmaBolsa] WITH CHECK ADD CONSTRAINT [FK_TbAlunoTurmaBolsa_TbAbatimento] FOREIGN KEY([IdBolsa]) REFERENCES [dbo].[TbAbatimento] ([IdAbatimento]) GO 
	
	ALTER TABLE [dbo].[TbChequeTituloCobranca] WITH CHECK ADD CONSTRAINT [FK_TbChequeTituloCobranca_TbCheque] FOREIGN KEY([IdCheque]) REFERENCES [dbo].[TbCheque] ([IdCheque]) GO 
	
	ALTER TABLE [dbo].[TbAlunoTurma] WITH CHECK ADD CONSTRAINT [FK_TbAlunoTurma_TbEstabelecimentoEnsino] FOREIGN KEY([IdEstabEnsinoInativacao]) REFERENCES [dbo].[TbEstabelecimentoEnsino] ([IdEstabelecimentoEnsino]) GO 
	
	ALTER TABLE [dbo].[TbAlunoTipoAvaliacao] WITH CHECK ADD CONSTRAINT [FK_TbAlunoTipoAvaliacao_TbProfessor] FOREIGN KEY([IdProfessor]) REFERENCES [dbo].[TbProfessor] ([IdProfessor]) GO 
	
	ALTER TABLE [dbo].[TbLancamentoCobranca] WITH CHECK ADD CONSTRAINT [FK_TbLancamentoCobranca_TbEmpresa] FOREIGN KEY([NFe_IdEmpresaRPS]) REFERENCES [dbo].[TbEmpresa] ([IdEmpresa]) GO 
	
	ALTER TABLE [dbo].[TbLancamentoCobrancaDesconto] WITH CHECK ADD CONSTRAINT [FK_TbLancamentoCobrancaDesconto_TbAbatimento] FOREIGN KEY([IdAbatimento]) REFERENCES [dbo].[TbAbatimento] ([IdAbatimento]) GO 
	
	ALTER TABLE [dbo].[TbHistorico] WITH CHECK ADD CONSTRAINT [FK_TbHistorico_TbEstabelecimentoEnsino] FOREIGN KEY([IdEstabelecimentoEnsino]) REFERENCES [dbo].[TbEstabelecimentoEnsino] ([IdEstabelecimentoEnsino]) GO 
	
	ALTER TABLE [dbo].[TbAlunoTurmaHistorico] WITH CHECK ADD CONSTRAINT [FK_TbAlunoTurmaHistorico_TbUsuario] FOREIGN KEY([IdUsuario]) REFERENCES [dbo].[TbUsuario] ([IdUsuario]) GO 
	
	ALTER TABLE [dbo].[TbCartaoMovimentacao] WITH CHECK ADD CONSTRAINT [FK_TbCartaoMovimentacao_TbCaixaLancamento] FOREIGN KEY([IdCaixaLancamento]) REFERENCES [dbo].[TbCaixaLancamento] ([IdCaixaLancamento]) GO 
	
	ALTER TABLE [dbo].[TbCaixaLancamento] WITH CHECK ADD CONSTRAINT [FK_TbCaixaLancamento_TbCheque] FOREIGN KEY([IdCheque]) REFERENCES [dbo].[TbCheque] ([IdCheque]) GO 
	
	ALTER TABLE [dbo].[TbSituacaoAlunoTurmaPagamento] WITH CHECK ADD CONSTRAINT [FK_TbSituacaoAlunoTurmaPagamento_TbPeriodo] FOREIGN KEY([IdPeriodo]) REFERENCES [dbo].[TbPeriodo] ([IdPeriodo]) GO 
	
	ALTER TABLE [dbo].[TbFreqAlunoPermissaoSaidaResponsavel] WITH CHECK ADD CONSTRAINT [FK_TbFreqAlunoPermissaoSaidaResponsavel_TbFreqAlunoPermissaoSaida] FOREIGN KEY([IdAlunoPermissaoSaida]) REFERENCES [dbo].[TbFreqAlunoPermissaoSaida] ([IdAlunoPermissaoSaida]) GO 
	
	ALTER TABLE [dbo].[TbHistoricoAproveitamento] WITH CHECK ADD CONSTRAINT [FK_TbHistoricoAproveitamento_TbEEnsino] FOREIGN KEY([IdEstabelecimentoEnsino]) REFERENCES [dbo].[TbEstabelecimentoEnsino] ([IdEstabelecimentoEnsino]) GO 
	
	ALTER TABLE [dbo].[TbSolicitacao] WITH CHECK ADD CONSTRAINT [FK_TbSolicitacao_TbResponsavel_IdResponsavelFinanceiro] FOREIGN KEY([IdResponsavelFinanceiro]) REFERENCES [dbo].[TbResponsavel] ([IdResponsavel]) GO 
	
	ALTER TABLE [dbo].[TbContaPagar] WITH CHECK ADD CONSTRAINT [FK_TbContaPagar_TbFavorecido] FOREIGN KEY([IdFavorecido]) REFERENCES [dbo].[TbFavorecido] ([IdFavorecido]) GO 
	
	ALTER TABLE [dbo].[TbSolicitacaoDesconto] WITH CHECK ADD CONSTRAINT [FK_TbSolicitacaoDesconto_TbResponsavel_Entrevista] FOREIGN KEY([_IdResponsavelEntrevista]) REFERENCES [dbo].[TbResponsavel] ([IdResponsavel]) GO 
	
	ALTER TABLE [dbo].[TbCartaoMovimentacao] WITH CHECK ADD CONSTRAINT [FK_TbCartaoMovimentacao_TbCaixaLancamentoRetirada] FOREIGN KEY([IdCaixaLancamento_Retirada]) REFERENCES [dbo].[TbCaixaLancamento] ([IdCaixaLancamento]) GO 
	
	ALTER TABLE [dbo].[TbSituacaoAlunoTurmaPagamento] WITH CHECK ADD CONSTRAINT [FK_TbSituacaoAlunoTurmaPagamento_TbPlanoPagamento] FOREIGN KEY([IdPlanoPagamento]) REFERENCES [dbo].[TbPlanoPagamento] ([IdPlanoPagamento]) GO 
	
	ALTER TABLE [dbo].[TbFreqAlunoPermissaoSaidaResponsavel] WITH CHECK ADD CONSTRAINT [FK_TbFreqAlunoPermissaoSaidaResponsavel_TbResponsavel] FOREIGN KEY([IdResponsavel]) REFERENCES [dbo].[TbResponsavel] ([IdResponsavel]) GO 
	
	ALTER TABLE [dbo].[TbHistoricoEnsinoSuperior] WITH CHECK ADD CONSTRAINT [FK_TbHistoricoEnsinoSuperior_TbEstabelecimentoEnsino] FOREIGN KEY([IdEstabelecimentoEnsino]) REFERENCES [dbo].[TbEstabelecimentoEnsino] ([IdEstabelecimentoEnsino]) GO 
	
	ALTER TABLE [dbo].[TbSolicitacao] WITH CHECK ADD CONSTRAINT [FK_TbSolicitacao_TbTipoResponsavel_IdTipoResponsavel] FOREIGN KEY([IdTipoResponsavel]) REFERENCES [dbo].[TbTipoResponsavel] ([IdTipoResponsavel]) GO 
	
	ALTER TABLE [dbo].[TbSolicitacaoDesconto] WITH CHECK ADD CONSTRAINT [FK_TbSolicitacaoDesconto_TbAbatimento] FOREIGN KEY([IdDesconto]) REFERENCES [dbo].[TbAbatimento] ([IdAbatimento]) GO 
	
	ALTER TABLE [dbo].[TbAlunoTurmaAvaliacaoRelatorio] WITH CHECK ADD CONSTRAINT [FK_TbAlunoTurmaAvaliacaoRelatorio_TbAlunoTurma] FOREIGN KEY([IdTurma], [IdAluno]) REFERENCES [dbo].[TbAlunoTurma] ([IdTurma], [IdAluno]) GO 
	
	ALTER TABLE [dbo].[TbCartaoMovimentacao] WITH CHECK ADD CONSTRAINT [FK_TbCartaoMovimentacao_TbConta] FOREIGN KEY([IdContaFinanceiraRepasse]) REFERENCES [dbo].[TbConta] ([IdConta]) GO 
	
	ALTER TABLE [dbo].[TbSituacaoAlunoTurmaPagamento] WITH CHECK ADD CONSTRAINT [FK_TbSituacaoAlunoTurmaPagamento_TbSerie] FOREIGN KEY([IdSerie]) REFERENCES [dbo].[TbSerie] ([IdSerie]) GO 
	
	ALTER TABLE [dbo].[TbProfessorEscolaridade] WITH CHECK ADD CONSTRAINT [FK_TbProfessorEscolaridade_TbEstabelecimentoEnsino] FOREIGN KEY([IdEstabelecimentoEnsino]) REFERENCES [dbo].[TbEstabelecimentoEnsino] ([IdEstabelecimentoEnsino]) GO 
	
	ALTER TABLE [dbo].[TbSolicitacao] WITH CHECK ADD CONSTRAINT [FK_TbSolicitacao_TbResponsavel_IdPai] FOREIGN KEY([IdPai]) REFERENCES [dbo].[TbResponsavel] ([IdResponsavel]) GO 
	
	ALTER TABLE [dbo].[TbContaPagar] WITH CHECK ADD CONSTRAINT [FK_TbContaPagar_TbConta_LIQ] FOREIGN KEY([LIQ_IdConta]) REFERENCES [dbo].[TbConta] ([IdConta]) GO 
	
	ALTER TABLE [dbo].[TbAlunoTurmaAvaliacaoRelatorio] WITH CHECK ADD CONSTRAINT [FK_TbAlunoTurmaAvaliacaoRelatorio_TbDisciplina] FOREIGN KEY([IdDisciplina]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina]) GO 
	
	ALTER TABLE [dbo].[TbFormularioRotinaEducacaoInfantilCampoDinamico] WITH CHECK ADD CONSTRAINT [FK_TbFormularioRotinaEducacaoInfantilCampoDinamico_TbFormularioRotinaEducacaoInfantil] FOREIGN KEY([IdFormularioRotinaEducacaoInfantil]) REFERENCES [dbo].[TbFormularioRotinaEducacaoInfantil] ([IdFormularioRotinaEducacaoInfantil]) GO 
	
	ALTER TABLE [dbo].[TbCaixaMovimentacao] WITH CHECK ADD CONSTRAINT [FK_TbCaixaMovimentacao_TbCaixaMovimentacao] FOREIGN KEY([IdCaixaMovimentacaoEstornada]) REFERENCES [dbo].[TbCaixaMovimentacao] ([IdCaixaMovimentacao]) GO 
	
	ALTER TABLE [dbo].[TbServicoPrecoDesconto] WITH CHECK ADD CONSTRAINT [FK_TbServicoPrecoDesconto_TbServicoPreco] FOREIGN KEY([IdServicoPreco]) REFERENCES [dbo].[TbServicoPreco] ([IdServicoPreco]) GO 
	
	ALTER TABLE [dbo].[TbResponsavelImpressaoDigital] WITH CHECK ADD CONSTRAINT [FK_TbResponsavelImpressaoDigital_TbResponsavel] FOREIGN KEY([IdResponsavel]) REFERENCES [dbo].[TbResponsavel] ([IdResponsavel]) GO 
	
	ALTER TABLE [dbo].[TbSituacaoAlunoTurmaPagamento] WITH CHECK ADD CONSTRAINT [FK_TbSituacaoAlunoTurmaPagamento_TbSituacaoAlunoTurmaDestino] FOREIGN KEY([IdSituacaoAlunoTurmaDestino]) REFERENCES [dbo].[TbSituacaoAlunoTurma] ([IdSituacaoAlunoTurma]) GO 
	
	ALTER TABLE [dbo].[TbSerie] WITH CHECK ADD CONSTRAINT [FK_TbSerie_TbEstabelecimentoEnsino] FOREIGN KEY([IdEstabelecimentoEnsino]) REFERENCES [dbo].[TbEstabelecimentoEnsino] ([IdEstabelecimentoEnsino]) GO 
	
	ALTER TABLE [dbo].[TbAlunoTurma] WITH CHECK ADD CONSTRAINT [FK_TbAlunoTurma_TbTipoResponsavelFinanceiro] FOREIGN KEY([IdTipoResponsavelFinanceiro]) REFERENCES [dbo].[TbTipoResponsavel] ([IdTipoResponsavel]) GO 
	
	ALTER TABLE [dbo].[TbSolicitacao] WITH CHECK ADD CONSTRAINT [FK_TbSolicitacao_TbResponsavel_IdMae] FOREIGN KEY([IdMae]) REFERENCES [dbo].[TbResponsavel] ([IdResponsavel]) GO 
	
	ALTER TABLE [dbo].[TbSerie] WITH CHECK ADD CONSTRAINT [FK_TbSerie_TbSerie] FOREIGN KEY([IdProximaSerie]) REFERENCES [dbo].[TbSerie] ([IdSerie]) GO 
	
	ALTER TABLE [dbo].[TbAlmoxMaterialMovimentacao] WITH CHECK ADD CONSTRAINT [FK_TbAlmoxMaterialMovimentacao_TbCaixaMovimentacao] FOREIGN KEY([IdCaixaMovimentacao]) REFERENCES [dbo].[TbCaixaMovimentacao] ([IdCaixaMovimentacao]) GO 
	
	ALTER TABLE [dbo].[TbTurma] WITH CHECK ADD CONSTRAINT [FK_TbTurma_TbUsuario] FOREIGN KEY([IdUsuarioCoordenador]) REFERENCES [dbo].[TbUsuario] ([IdUsuario]) GO 
	
	ALTER TABLE [dbo].[TbFormularioRotinaEducacaoInfantilCampoDinamico] WITH CHECK ADD CONSTRAINT [FK_TbFormularioRotinaEducacaoInfantilCampoDinamico_TbCampoDinamico] FOREIGN KEY([IdCampo]) REFERENCES [dbo].[TbCampoDinamico] ([IdCampo]) GO 
	
	ALTER TABLE [dbo].[TbCaixaRecebimento] WITH CHECK ADD CONSTRAINT [FK_TbCaixaPagamento_TbCaixaMovimentacao] FOREIGN KEY([IdCaixaMovimentacao]) REFERENCES [dbo].[TbCaixaMovimentacao] ([IdCaixaMovimentacao]) GO 
	
	ALTER TABLE [dbo].[TbServicoPrecoDesconto] WITH CHECK ADD CONSTRAINT [FK_TbServicoPrecoDesconto_TbAbatimento] FOREIGN KEY([IdAbatimento]) REFERENCES [dbo].[TbAbatimento] ([IdAbatimento]) GO 
	
	ALTER TABLE [dbo].[TbSituacaoAlunoTurmaPagamento] WITH CHECK ADD CONSTRAINT [FK_TbSituacaoAlunoTurmaPagamento_TbSituacaoAlunoTurmaOrigem] FOREIGN KEY([IdSituacaoAlunoTurmaOrigem]) REFERENCES [dbo].[TbSituacaoAlunoTurma] ([IdSituacaoAlunoTurma]) GO 
	
	ALTER TABLE [dbo].[TbAlunoTurmaObservacao] WITH CHECK ADD CONSTRAINT [FK_TbAlunoTurmaObservacao_TbAlunoTurma] FOREIGN KEY([IdTurma], [IdAluno]) REFERENCES [dbo].[TbAlunoTurma] ([IdTurma], [IdAluno]) GO 
	
	ALTER TABLE [dbo].[TbUnidade] WITH CHECK ADD CONSTRAINT [FK_TbUnidade_TbEstabelecimentoEnsino] FOREIGN KEY([IdEstabelecimentoEnsino]) REFERENCES [dbo].[TbEstabelecimentoEnsino] ([IdEstabelecimentoEnsino]) GO 
	
	ALTER TABLE [dbo].[TbSolicitacao] WITH CHECK ADD CONSTRAINT [FK_TbSolicitacao_TbResponsavel_IdResponsavelSecundario] FOREIGN KEY([IdResponsavelSecundario]) REFERENCES [dbo].[TbResponsavel] ([IdResponsavel]) GO 
	
	ALTER TABLE [dbo].[TbAlmoxMaterialMovimentacao] WITH CHECK ADD CONSTRAINT [FK_TbAlmoxMaterialMovimentacao_TbAlmoxAlmoxarifado] FOREIGN KEY([IdAlmoxarifado]) REFERENCES [dbo].[TbAlmoxAlmoxarifado] ([IdAlmoxarifado]) GO 
	
	ALTER TABLE [dbo].[TbAlunoTurma] WITH CHECK ADD CONSTRAINT [FK_TbAlunoTurma_TbFaseNota] FOREIGN KEY([IdFaseNotaInicial]) REFERENCES [dbo].[TbFaseNota] ([IdFaseNota]) GO 
	
	ALTER TABLE [dbo].[TbMensagemCaixaSaida] WITH CHECK ADD CONSTRAINT [FK_TbMensagemCaixaSaida_TbUsuario] FOREIGN KEY([IdUsuarioInsercao]) REFERENCES [dbo].[TbUsuario] ([IdUsuario]) GO 
	
	ALTER TABLE [dbo].[TbFiesRepasse] WITH CHECK ADD CONSTRAINT [FK_TbFiesRepasse_TbAluno] FOREIGN KEY([IdAluno]) REFERENCES [dbo].[TbAluno] ([IdAluno]) GO 
	
	ALTER TABLE [dbo].[TbAlmoxRequisicao] WITH CHECK ADD CONSTRAINT [FK_TbAlmoxRequisicao_TbAlmoxNaturezaRequisicao] FOREIGN KEY([IdNaturezaRequisicao]) REFERENCES [dbo].[TbAlmoxNaturezaRequisicao] ([IdNaturezaRequisicao]) GO 
	
	ALTER TABLE [dbo].[TbSerie] WITH CHECK ADD CONSTRAINT [FK_TbSerie_TbFormularioRotinaEducacaoInfantil] FOREIGN KEY([IdFormularioRotinaEducacaoInfantil]) REFERENCES [dbo].[TbFormularioRotinaEducacaoInfantil] ([IdFormularioRotinaEducacaoInfantil]) GO 
	
	ALTER TABLE [dbo].[TbPeriodo] WITH CHECK ADD CONSTRAINT [FK_TbPeriodo_TbSerie] FOREIGN KEY([ES_IdSerieRelacionada]) REFERENCES [dbo].[TbSerie] ([IdSerie]) GO 
	
	ALTER TABLE [dbo].[TbCaixaLancamento] WITH CHECK ADD CONSTRAINT [FK_TbCaixaLancamento_TbCaixaMovimentacao] FOREIGN KEY([IdCaixaMovimentacao]) REFERENCES [dbo].[TbCaixaMovimentacao] ([IdCaixaMovimentacao]) GO 
	
	ALTER TABLE [dbo].[TbAlunoTurma] WITH CHECK ADD CONSTRAINT [FK_TbAlunoTurma_TbTipoResponsavelSecundario] FOREIGN KEY([IdTipoResponsavelSecundario]) REFERENCES [dbo].[TbTipoResponsavel] ([IdTipoResponsavel]) GO 
	
	ALTER TABLE [dbo].[TbSolicitacao] WITH CHECK ADD CONSTRAINT [FK_TbSolicitacao_TbResponsavel_IdTipoResponsavelSecundario] FOREIGN KEY([IdTipoResponsavelSecundario]) REFERENCES [dbo].[TbTipoResponsavel] ([IdTipoResponsavel]) GO 
	
	ALTER TABLE [dbo].[TbAlmoxMaterialMovimentacao] WITH CHECK ADD CONSTRAINT [FK_TbAlmoxMaterialMovimentacao_TbAlmoxAlmoxarifado_Transf] FOREIGN KEY([Transf_IdAlmoxarifadoDestino]) REFERENCES [dbo].[TbAlmoxAlmoxarifado] ([IdAlmoxarifado]) GO 
	
	ALTER TABLE [dbo].[TbDadosUso] WITH CHECK ADD CONSTRAINT [FK_TbDadosUso_TbUsuario] FOREIGN KEY([IdUsuario]) REFERENCES [dbo].[TbUsuario] ([IdUsuario]) GO 
	
	ALTER TABLE [dbo].[TbProfessorEscolaridade] WITH CHECK ADD CONSTRAINT [FK_TbProfessorEscolaridade_TbProfessor] FOREIGN KEY([IdProfessor]) REFERENCES [dbo].[TbProfessor] ([IdProfessor]) GO 
	
	ALTER TABLE [dbo].[TbAlunoTurmaAvaliacaoRelatorio] WITH CHECK ADD CONSTRAINT [FK_TbAlunoTurmaAvaliacaoRelatorio_TbFaseNota] FOREIGN KEY([IdFaseNota]) REFERENCES [dbo].[TbFaseNota] ([IdFaseNota]) GO 
	
	ALTER TABLE [dbo].[TbUnidade] WITH CHECK ADD CONSTRAINT [FK_TbUnidade_TbUsuario1] FOREIGN KEY([IdUsuarioRespSecretaria]) REFERENCES [dbo].[TbUsuario] ([IdUsuario]) GO 
	
	ALTER TABLE [dbo].[TbFiesRepasse] WITH CHECK ADD CONSTRAINT [FK_TbFiesRepasse_TbConta] FOREIGN KEY([IdContaRepasse]) REFERENCES [dbo].[TbConta] ([IdConta]) GO 
	
	ALTER TABLE [dbo].[TbAlunoRotinaEducacaoInfantil] WITH CHECK ADD CONSTRAINT [FK_TbAlunoRotinaEducacaoInfantil_TbFormularioRotinaEducacaoInfantil] FOREIGN KEY([IdFormularioRotinaEducacaoInfantil]) REFERENCES [dbo].[TbFormularioRotinaEducacaoInfantil] ([IdFormularioRotinaEducacaoInfantil]) GO 
	
	ALTER TABLE [dbo].[TbProfessorImpressaoDigital] WITH CHECK ADD CONSTRAINT [FK_TbProfessorImpressaoDigital_TbProfessor] FOREIGN KEY([IdProfessor]) REFERENCES [dbo].[TbProfessor] ([IdProfessor]) GO 
	
	ALTER TABLE [dbo].[TbNotaConceito] WITH CHECK ADD CONSTRAINT [FK_TbNotaConceito_TbPeriodo] FOREIGN KEY([IdPeriodo]) REFERENCES [dbo].[TbPeriodo] ([IdPeriodo]) GO 
	
	ALTER TABLE [dbo].[TbTurma] WITH CHECK ADD CONSTRAINT [FK_TbTurma_TbSerie] FOREIGN KEY([IdSerie]) REFERENCES [dbo].[TbSerie] ([IdSerie]) GO 
	
	ALTER TABLE [dbo].[TbAlmoxMaterialMovimentacao] WITH CHECK ADD CONSTRAINT [FK_TbAlmoxMaterialMovimentacao_TbFavorecido] FOREIGN KEY([Entrada_IdFavorecido]) REFERENCES [dbo].[TbFavorecido] ([IdFavorecido]) GO 
	
	ALTER TABLE [dbo].[TbDadosUso] WITH CHECK ADD CONSTRAINT [FK_TbDadosUso_TbUnidade] FOREIGN KEY([IdUnidade]) REFERENCES [dbo].[TbUnidade] ([IdUnidade]) GO 
	
	ALTER TABLE [dbo].[TbDiario] WITH CHECK ADD CONSTRAINT [FK_TbDiario_TbFaseNota] FOREIGN KEY([IdFaseNota]) REFERENCES [dbo].[TbFaseNota] ([IdFaseNota]) GO 
	
	ALTER TABLE [dbo].[TbUnidade] WITH CHECK ADD CONSTRAINT [FK_TbUnidade_TbUsuario] FOREIGN KEY([IdUsuarioRespUnidade]) REFERENCES [dbo].[TbUsuario] ([IdUsuario]) GO 
	
	ALTER TABLE [dbo].[TbCaixaRecebimentoServico] WITH CHECK ADD CONSTRAINT [FK_TbCaixaRecebimentoServico_TbCaixaRecebimento] FOREIGN KEY([IdCaixaRecebimento]) REFERENCES [dbo].[TbCaixaRecebimento] ([IdCaixaRecebimento]) GO 
	
	ALTER TABLE [dbo].[TbFaseNota] WITH CHECK ADD CONSTRAINT [FK_TbFaseNota_TbFormula_FormulaFalta] FOREIGN KEY([IdFormulaFalta]) REFERENCES [dbo].[TbFormula] ([IdFormula]) GO 
	
	ALTER TABLE [dbo].[TbContaPagarRateio] WITH CHECK ADD CONSTRAINT [FK_TbContaPagarRateio_TbContaPagar] FOREIGN KEY([IdContaPagar]) REFERENCES [dbo].[TbContaPagar] ([IdContaPagar]) GO 
	
	ALTER TABLE [dbo].[TbNotaConceito] WITH CHECK ADD CONSTRAINT [FK_TbNotaConceito_TbSerie] FOREIGN KEY([IdSerie]) REFERENCES [dbo].[TbSerie] ([IdSerie]) GO 
	
	ALTER TABLE [dbo].[TbGradeCurricular] WITH CHECK ADD CONSTRAINT [FK_TbGradeCurricular_TbSerie] FOREIGN KEY([IdSerie]) REFERENCES [dbo].[TbSerie] ([IdSerie]) GO 
	
	ALTER TABLE [dbo].[TbAlmoxMaterialMovimentacao] WITH CHECK ADD CONSTRAINT [FK_TbAlmoxMaterialMovimentacao_TbUsuario] FOREIGN KEY([IdUsuario]) REFERENCES [dbo].[TbUsuario] ([IdUsuario]) GO 
	
	ALTER TABLE [dbo].[TbAlunoTurma] WITH CHECK ADD CONSTRAINT [FK_TbAlunoTurma_TbTurma] FOREIGN KEY([IdTurma]) REFERENCES [dbo].[TbTurma] ([IdTurma]) GO 
	
	ALTER TABLE [dbo].[TbFaseNota] WITH CHECK ADD CONSTRAINT [FK_TbFaseNota_TbFaseNota] FOREIGN KEY([IdFaseNotaAprovacao]) REFERENCES [dbo].[TbFaseNota] ([IdFaseNota]) GO 
	
	-- Total execution time: 00:00:01.275	



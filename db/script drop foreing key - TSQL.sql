
-- [5:33:10 PM]	Started executing query at Line 1
	
	ALTER TABLE [FK_TbAbatimento_TbAbatimentoTipo].[TbAbatimentoTipo] DROP CONSTRAINT [TbAbatimento] GO 
	
	ALTER TABLE [FK_TbAbatimento_TbUnidade].[TbUnidade] DROP CONSTRAINT [TbAbatimento] GO 
	
	ALTER TABLE [FK_TbAgendamento_TbDisponibilidade].[TbDisponibilidade] DROP CONSTRAINT [TbAgendamento] GO 
	
	ALTER TABLE [FK_TbAgendamento_TbResponsavel].[TbResponsavel] DROP CONSTRAINT [TbAgendamento] GO 
	
	ALTER TABLE [FK_TbAgenteCobranca_TbFormaRecebimento].[TbFormaRecebimento] DROP CONSTRAINT [TbAgenteCobranca] GO 
	
	ALTER TABLE [FK_TbAlmoxHistoricoDiarioPreco_TbAlmoxMaterial].[TbAlmoxMaterial] DROP CONSTRAINT [TbAlmoxHistoricoDiarioPreco] GO 
	
	ALTER TABLE [FK_TbAlmoxHistoricoDiario_TbAlmoxAlmoxarifado].[TbAlmoxAlmoxarifado] DROP CONSTRAINT [TbAlmoxHistoricoDiarioQuantidade] GO 
	
	ALTER TABLE [FK_TbAlmoxHistoricoDiario_TbAlmoxMaterial].[TbAlmoxMaterial] DROP CONSTRAINT [TbAlmoxHistoricoDiarioQuantidade] GO 
	
	ALTER TABLE [FK_TbAlmoxMaterial_TbAlmoxMaterialGrupo].[TbAlmoxMaterialGrupo] DROP CONSTRAINT [TbAlmoxMaterial] GO 
	
	ALTER TABLE [FK_TbAlmoxMaterial_TbFavorecido].[TbFavorecido] DROP CONSTRAINT [TbAlmoxMaterial] GO 
	
	ALTER TABLE [FK_TbAlmoxMaterial_TbPlanoContas].[TbPlanoContas] DROP CONSTRAINT [TbAlmoxMaterial] GO 
	
	ALTER TABLE [FK_TbAlmoxMaterialEstoque_TbAlmoxAlmoxarifado].[TbAlmoxAlmoxarifado] DROP CONSTRAINT [TbAlmoxMaterialEstoque] GO 
	
	ALTER TABLE [FK_TbAlmoxMaterialEstoque_TbAlmoxMaterial].[TbAlmoxMaterial] DROP CONSTRAINT [TbAlmoxMaterialEstoque] GO 
	
	ALTER TABLE [FK_TbAlmoxMaterialGrupo_TbPlanoContas].[TbPlanoContas] DROP CONSTRAINT [TbAlmoxMaterialGrupo] GO 
	
	ALTER TABLE [FK_TbAlmoxMaterialMovimentacao_TbCaixaMovimentacao].[TbCaixaMovimentacao] DROP CONSTRAINT [TbAlmoxMaterialMovimentacao] GO 
	
	ALTER TABLE [FK_TbAlmoxMaterialMovimentacao_TbAlmoxAlmoxarifado].[TbAlmoxAlmoxarifado] DROP CONSTRAINT [TbAlmoxMaterialMovimentacao] GO 
	
	ALTER TABLE [FK_TbAlmoxMaterialMovimentacao_TbAlmoxAlmoxarifado_Transf].[TbAlmoxAlmoxarifado] DROP CONSTRAINT [TbAlmoxMaterialMovimentacao] GO 
	
	ALTER TABLE [FK_TbAlmoxMaterialMovimentacao_TbFavorecido].[TbFavorecido] DROP CONSTRAINT [TbAlmoxMaterialMovimentacao] GO 
	
	ALTER TABLE [FK_TbAlmoxMaterialMovimentacao_TbUsuario].[TbUsuario] DROP CONSTRAINT [TbAlmoxMaterialMovimentacao] GO 
	
	ALTER TABLE [FK_TbAlmoxMaterialMovimentacaoItem_TbAlmoxMaterial].[TbAlmoxMaterial] DROP CONSTRAINT [TbAlmoxMaterialMovimentacaoItem] GO 
	
	ALTER TABLE [FK_TbAlmoxMaterialMovimentacaoItem_TbAlmoxMaterialMovimentacao].[TbAlmoxMaterialMovimentacao] DROP CONSTRAINT [TbAlmoxMaterialMovimentacaoItem] GO 
	
	ALTER TABLE [FK_TbAlmoxRequisicao_TbUsuario_Requisitante].[TbUsuario] DROP CONSTRAINT [TbAlmoxRequisicao] GO 
	
	ALTER TABLE [FK_TbAlmoxRequisicao_TbUsuario_Recebimento].[TbUsuario] DROP CONSTRAINT [TbAlmoxRequisicao] GO 
	
	ALTER TABLE [FK_TbAlmoxRequisicao_TbCentroResultado].[TbCentroResultado] DROP CONSTRAINT [TbAlmoxRequisicao] GO 
	
	ALTER TABLE [FK_TbAlmoxRequisicao_TbUsuario_Conclusao].[TbUsuario] DROP CONSTRAINT [TbAlmoxRequisicao] GO 
	
	ALTER TABLE [FK_TbAlmoxRequisicao_TbAlmoxNaturezaRequisicao].[TbAlmoxNaturezaRequisicao] DROP CONSTRAINT [TbAlmoxRequisicao] GO 
	
	ALTER TABLE [FK_TbAlmoxRequisicaoItem_TbAlmoxAlmoxarifado].[TbAlmoxAlmoxarifado] DROP CONSTRAINT [TbAlmoxRequisicaoItem] GO 
	
	ALTER TABLE [FK_TbAlmoxRequisicaoItem_TbAlmoxMaterial].[TbAlmoxMaterial] DROP CONSTRAINT [TbAlmoxRequisicaoItem] GO 
	
	ALTER TABLE [FK_TbAlmoxRequisicaoItem_TbRequisicao].[TbAlmoxRequisicao] DROP CONSTRAINT [TbAlmoxRequisicaoItem] GO 
	
	ALTER TABLE [FK_TbAlmoxUsuarioAlmoxarifado_TbUsuario].[TbUsuario] DROP CONSTRAINT [TbAlmoxUsuarioAlmoxarifado] GO 
	
	ALTER TABLE [FK_TbAlmoxUsuarioAlmoxarifado_TbAlmoxAlmoxarifado].[TbAlmoxAlmoxarifado] DROP CONSTRAINT [TbAlmoxUsuarioAlmoxarifado] GO 
	
	ALTER TABLE [FK_TbAlmoxUsuarioCentroResultado_TbCentroResultado].[TbCentroResultado] DROP CONSTRAINT [TbAlmoxUsuarioCentroResultado] GO 
	
	ALTER TABLE [FK_TbAlmoxUsuarioCentroResultado_TbUsuario].[TbUsuario] DROP CONSTRAINT [TbAlmoxUsuarioCentroResultado] GO 
	
	ALTER TABLE [FK_TbAlmoxUsuarioGrupoMaterial_TbAlmoxMaterialGrupo].[TbAlmoxMaterialGrupo] DROP CONSTRAINT [TbAlmoxUsuarioGrupoMaterial] GO 
	
	ALTER TABLE [FK_TbAlmoxUsuarioGrupoMaterial_TbUsuario].[TbUsuario] DROP CONSTRAINT [TbAlmoxUsuarioGrupoMaterial] GO 
	
	ALTER TABLE [FK_TbAluno_TbResponsavel2].[TbResponsavel] DROP CONSTRAINT [TbAluno] GO 
	
	ALTER TABLE [FK_TbAluno_TbResponsavel].[TbResponsavel] DROP CONSTRAINT [TbAluno] GO 
	
	ALTER TABLE [FK_TbAluno_TbPais].[TbPais] DROP CONSTRAINT [TbAluno] GO 
	
	ALTER TABLE [FK_TbAluno_TbResponsavel1].[TbResponsavel] DROP CONSTRAINT [TbAluno] GO 
	
	ALTER TABLE [FK_TbAluno_TbReligiao].[TbReligiao] DROP CONSTRAINT [TbAluno] GO 
	
	ALTER TABLE [FK_TbAluno_TbFormaEntregaDocumento].[TbFormaEntregaDocumento] DROP CONSTRAINT [TbAluno] GO 
	
	ALTER TABLE [FK_TbAluno_TbUnidade].[TbUnidade] DROP CONSTRAINT [TbAluno] GO 
	
	ALTER TABLE [FK_TbAluno_TbTipoResponsavel].[TbTipoResponsavel] DROP CONSTRAINT [TbAluno] GO 
	
	ALTER TABLE [FK_TbAluno_TbAluno_Vinculado].[TbAluno] DROP CONSTRAINT [TbAluno] GO 
	
	ALTER TABLE [FK_TbAluno_TbEndereco].[TbEndereco] DROP CONSTRAINT [TbAluno] GO 
	
	ALTER TABLE [FK_TbAluno_TbEstabelecimentoEnsino].[TbEstabelecimentoEnsino] DROP CONSTRAINT [TbAluno] GO 
	
	ALTER TABLE [FK_TbAluno_TbEstabelecimentoEnsino_ES].[TbEstabelecimentoEnsino] DROP CONSTRAINT [TbAluno] GO 
	
	ALTER TABLE [FK_TbAlunoAproveitamentoDisciplina_TbAlunoCurso].[TbAlunoCurso] DROP CONSTRAINT [TbAlunoAproveitamentoDisciplina] GO 
	
	ALTER TABLE [FK_TbAlunoAproveitamentoDisciplina_TbDisciplina].[TbDisciplina] DROP CONSTRAINT [TbAlunoAproveitamentoDisciplina] GO 
	
	ALTER TABLE [FK_TbAlunoAproveitamentoDisciplina_TbTipoSituacaoAlunoDisciplina].[TbTipoSituacaoAlunoDisciplina] DROP CONSTRAINT [TbAlunoAproveitamentoDisciplina] GO 
	
	ALTER TABLE [FK_TbAlunoAproveitamentoDisciplina_TbEstabelecimentoEnsino].[TbEstabelecimentoEnsino] DROP CONSTRAINT [TbAlunoAproveitamentoDisciplina] GO 
	
	ALTER TABLE [FK_TbAlunoCurso_OrientadorMonografia].[TbProfessor] DROP CONSTRAINT [TbAlunoCurso] GO 
	
	ALTER TABLE [FK_TbAlunoCurso_TbAluno].[TbAluno] DROP CONSTRAINT [TbAlunoCurso] GO 
	
	ALTER TABLE [FK_TbAlunoCurso_TbFormaIngresso].[TbFormaIngresso] DROP CONSTRAINT [TbAlunoCurso] GO 
	
	ALTER TABLE [FK_TbAlunoCurso_TbCurriculo].[TbCurriculo] DROP CONSTRAINT [TbAlunoCurso] GO 
	
	ALTER TABLE [FK_TbAlunoCurso_TbTurno].[TbTurno] DROP CONSTRAINT [TbAlunoCurso] GO 
	
	ALTER TABLE [FK_TbAlunoCurso_TbSituacaoAlunoCurso].[TbSituacaoAlunoCurso] DROP CONSTRAINT [TbAlunoCurso] GO 
	
	ALTER TABLE [FK_TbAlunoCurso_TbMotivoDispensaENAD].[TbMotivoDispensaENAD] DROP CONSTRAINT [TbAlunoCurso] GO 
	
	ALTER TABLE [FK_TbAlunoCurso_TbCurso].[TbCurso] DROP CONSTRAINT [TbAlunoCurso] GO 
	
	ALTER TABLE [FK_TbAlunoCurso_TbCurso_Origem].[TbCurso] DROP CONSTRAINT [TbAlunoCurso] GO 
	
	ALTER TABLE [FK_TbAlunoCurso_TbEstabelecimentoEnsino].[TbEstabelecimentoEnsino] DROP CONSTRAINT [TbAlunoCurso] GO 
	
	ALTER TABLE [FK_TbAlunoCursoDesconto_TbAlunoCurso].[TbAlunoCurso] DROP CONSTRAINT [TbAlunoCursoDesconto] GO 
	
	ALTER TABLE [FK_TbAlunoCursoDesconto_TbPeriodo].[TbPeriodo] DROP CONSTRAINT [TbAlunoCursoDesconto] GO 
	
	ALTER TABLE [FK_TbAlunoCursoDesconto_TbAbatimento].[TbAbatimento] DROP CONSTRAINT [TbAlunoCursoDesconto] GO 
	
	ALTER TABLE [FK_TbAlunoCursoDesconto_TbSolicitacaoDesconto].[TbSolicitacaoDesconto] DROP CONSTRAINT [TbAlunoCursoDesconto] GO 
	
	ALTER TABLE [FK_TbAlunoCursoSuperior_TbFormaIngresso].[TbFormaIngresso] DROP CONSTRAINT [TbAlunoCursoSuperior] GO 
	
	ALTER TABLE [FK_TbAlunoCursoSuperior_TbAluno].[TbAluno] DROP CONSTRAINT [TbAlunoCursoSuperior] GO 
	
	ALTER TABLE [FK_TbAlunoCursoSuperior_TbCurriculo].[TbCurriculo] DROP CONSTRAINT [TbAlunoCursoSuperior] GO 
	
	ALTER TABLE [FK_TbAlunoCursoSuperior_TbTurno].[TbTurno] DROP CONSTRAINT [TbAlunoCursoSuperior] GO 
	
	ALTER TABLE [FK_TbAlunoCursoSuperior_TbPeriodo].[TbPeriodo] DROP CONSTRAINT [TbAlunoCursoSuperior] GO 
	
	ALTER TABLE [FK_TbAlunoCursoSuperior_TbPeriodo1].[TbPeriodo] DROP CONSTRAINT [TbAlunoCursoSuperior] GO 
	
	ALTER TABLE [FK_TbAlunoFichaMedica_TbAluno].[TbAluno] DROP CONSTRAINT [TbAlunoFichaMedica] GO 
	
	ALTER TABLE [FK_TbAlunoFoto_TbAluno].[TbAluno] DROP CONSTRAINT [TbAlunoFoto] GO 
	
	ALTER TABLE [FK_TbAlunoImpressaoDigital_TbAluno].[TbAluno] DROP CONSTRAINT [TbAlunoImpressaoDigital] GO 
	
	ALTER TABLE [FK_TbAlunoObs_TbUsuario].[TbUsuario] DROP CONSTRAINT [TbAlunoObs] GO 
	
	ALTER TABLE [FK_TbAlunoObs_TbUsuario1].[TbUsuario] DROP CONSTRAINT [TbAlunoObs] GO 
	
	ALTER TABLE [FK_TbAlunoObs_TbTipoOcorrencia].[TbTipoOcorrencia] DROP CONSTRAINT [TbAlunoObs] GO 
	
	ALTER TABLE [FK_TbAlunoObs_TbAluno].[TbAluno] DROP CONSTRAINT [TbAlunoObs] GO 
	
	ALTER TABLE [FK_TbCursoPeriodo_TbTurma].[TbTurma] DROP CONSTRAINT [TbAlunoPeriodo] GO 
	
	ALTER TABLE [FK_TbAlunoPeriodo_TbAlunoCurso].[TbAlunoCurso] DROP CONSTRAINT [TbAlunoPeriodo] GO 
	
	ALTER TABLE [FK_TbAlunoPeriodo_TbUsuario].[TbUsuario] DROP CONSTRAINT [TbAlunoPeriodo] GO 
	
	ALTER TABLE [FK_TbAlunoPeriodo_TbPeriodo].[TbPeriodo] DROP CONSTRAINT [TbAlunoPeriodo] GO 
	
	ALTER TABLE [FK_TbAlunoPeriodo_TbSituacaoAlunoCurso].[TbSituacaoAlunoCurso] DROP CONSTRAINT [TbAlunoPeriodo] GO 
	
	ALTER TABLE [FK_TbAlunoProprioResponsavel_TbAluno].[TbAluno] DROP CONSTRAINT [TbAlunoProprioResponsavel] GO 
	
	ALTER TABLE [FK_TbAlunoProprioResponsavel_TbResponsavel].[TbResponsavel] DROP CONSTRAINT [TbAlunoProprioResponsavel] GO 
	
	ALTER TABLE [FK_TbAlunoRotinaEducacaoInfantil_TbAluno].[TbAluno] DROP CONSTRAINT [TbAlunoRotinaEducacaoInfantil] GO 
	
	ALTER TABLE [FK_TbAlunoRotinaEducacaoInfantil_TbTurma].[TbTurma] DROP CONSTRAINT [TbAlunoRotinaEducacaoInfantil] GO 
	
	ALTER TABLE [FK_TbAlunoRotinaEducacaoInfantil_TbProfessor].[TbProfessor] DROP CONSTRAINT [TbAlunoRotinaEducacaoInfantil] GO 
	
	ALTER TABLE [FK_TbAlunoRotinaEducacaoInfantil_TbUsuario].[TbUsuario] DROP CONSTRAINT [TbAlunoRotinaEducacaoInfantil] GO 
	
	ALTER TABLE [FK_TbAlunoRotinaEducacaoInfantil_TbFormularioRotinaEducacaoInfantil].[TbFormularioRotinaEducacaoInfantil] DROP CONSTRAINT [TbAlunoRotinaEducacaoInfantil] GO 
	
	ALTER TABLE [FK_TbAlunoServico_TbAluno].[TbAluno] DROP CONSTRAINT [TbAlunoServico] GO 
	
	ALTER TABLE [FK_TbAlunoServico_TbServico].[TbServico] DROP CONSTRAINT [TbAlunoServico] GO 
	
	ALTER TABLE [FK_TbAlunoTaxa_TbAluno].[TbAluno] DROP CONSTRAINT [TbAlunoTaxa] GO 
	
	ALTER TABLE [FK_TbAlunoTaxa_TbServico].[TbServico] DROP CONSTRAINT [TbAlunoTaxa] GO 
	
	ALTER TABLE [FK_TbAlunoTipoAvaliacao_TbAluno].[TbAluno] DROP CONSTRAINT [TbAlunoTipoAvaliacao] GO 
	
	ALTER TABLE [FK_TbAlunoTipoAvaliacao_TbTurma].[TbTurma] DROP CONSTRAINT [TbAlunoTipoAvaliacao] GO 
	
	ALTER TABLE [FK_TbAlunoTipoAvaliacao_TbDisciplina].[TbDisciplina] DROP CONSTRAINT [TbAlunoTipoAvaliacao] GO 
	
	ALTER TABLE [FK_TbAlunoTipoAvaliacao_TbTipoAvaliacao].[TbTipoAvaliacao] DROP CONSTRAINT [TbAlunoTipoAvaliacao] GO 
	
	ALTER TABLE [FK_TbAlunoTipoAvaliacao_TbProfessor].[TbProfessor] DROP CONSTRAINT [TbAlunoTipoAvaliacao] GO 
	
	ALTER TABLE [FK_TbAlunoTurma_TbMotivoInativacao].[TbMotivoInativacao] DROP CONSTRAINT [TbAlunoTurma] GO 
	
	ALTER TABLE [FK_TbAlunoTurma_TbResponsavelFinanceiro].[TbResponsavel] DROP CONSTRAINT [TbAlunoTurma] GO 
	
	ALTER TABLE [FK_TbAlunoTurma_TbResponsavelSecundario].[TbResponsavel] DROP CONSTRAINT [TbAlunoTurma] GO 
	
	ALTER TABLE [FK_TbAlunoTurma_TbCurriculoOptativa].[TbCurriculoOptativa] DROP CONSTRAINT [TbAlunoTurma] GO 
	
	ALTER TABLE [FK_TbAlunoTurma_TbAlunoCurso].[TbAlunoCurso] DROP CONSTRAINT [TbAlunoTurma] GO 
	
	ALTER TABLE [FK_TbAlunoTurma_TbSituacaoAlunoTurma].[TbSituacaoAlunoTurma] DROP CONSTRAINT [TbAlunoTurma] GO 
	
	ALTER TABLE [FK_TbAlunoTurma_TbAluno].[TbAluno] DROP CONSTRAINT [TbAlunoTurma] GO 
	
	ALTER TABLE [FK_TbAlunoTurma_TbPlanoPagamento_PreMatricula].[TbPlanoPagamento] DROP CONSTRAINT [TbAlunoTurma] GO 
	
	ALTER TABLE [FK_TbAlunoTurma_TbPlanoPagamento_Matricula].[TbPlanoPagamento] DROP CONSTRAINT [TbAlunoTurma] GO 
	
	ALTER TABLE [FK_TbAlunoTurma_TbEventoTipoInscricao].[TbEventoTipoInscricao] DROP CONSTRAINT [TbAlunoTurma] GO 
	
	ALTER TABLE [FK_TbAlunoTurma_TbAlunoCursoSuperior].[TbAlunoCursoSuperior] DROP CONSTRAINT [TbAlunoTurma] GO 
	
	ALTER TABLE [FK_TbAlunoTurma_TbUsuario].[TbUsuario] DROP CONSTRAINT [TbAlunoTurma] GO 
	
	ALTER TABLE [FK_TbAlunoTurma_TbEstabelecimentoEnsino].[TbEstabelecimentoEnsino] DROP CONSTRAINT [TbAlunoTurma] GO 
	
	ALTER TABLE [FK_TbAlunoTurma_TbTipoResponsavelFinanceiro].[TbTipoResponsavel] DROP CONSTRAINT [TbAlunoTurma] GO 
	
	ALTER TABLE [FK_TbAlunoTurma_TbFaseNota].[TbFaseNota] DROP CONSTRAINT [TbAlunoTurma] GO 
	
	ALTER TABLE [FK_TbAlunoTurma_TbTipoResponsavelSecundario].[TbTipoResponsavel] DROP CONSTRAINT [TbAlunoTurma] GO 
	
	ALTER TABLE [FK_TbAlunoTurma_TbTurma].[TbTurma] DROP CONSTRAINT [TbAlunoTurma] GO 
	
	ALTER TABLE [FK_TbAlunoTurmaAlternativa_TbAlunoTurma_Principal].[TbAlunoTurma] DROP CONSTRAINT [TbAlunoTurmaAlternativa] GO 
	
	ALTER TABLE [FK_TbAlunoTurmaAlternativa_TbAlunoTurma_Principal].[TbAlunoTurma] DROP CONSTRAINT [TbAlunoTurmaAlternativa] GO 
	
	ALTER TABLE [FK_TbAlunoTurmaAlternativa_TbAlunoTurma_Alternativa].[TbAlunoTurma] DROP CONSTRAINT [TbAlunoTurmaAlternativa] GO 
	
	ALTER TABLE [FK_TbAlunoTurmaAlternativa_TbAlunoTurma_Alternativa].[TbAlunoTurma] DROP CONSTRAINT [TbAlunoTurmaAlternativa] GO 
	
	ALTER TABLE [FK_TbAlunoTurmaAvaliacaoRelatorio_TbAlunoTurma].[TbAlunoTurma] DROP CONSTRAINT [TbAlunoTurmaAvaliacaoRelatorio] GO 
	
	ALTER TABLE [FK_TbAlunoTurmaAvaliacaoRelatorio_TbAlunoTurma].[TbAlunoTurma] DROP CONSTRAINT [TbAlunoTurmaAvaliacaoRelatorio] GO 
	
	ALTER TABLE [FK_TbAlunoTurmaAvaliacaoRelatorio_TbDisciplina].[TbDisciplina] DROP CONSTRAINT [TbAlunoTurmaAvaliacaoRelatorio] GO 
	
	ALTER TABLE [FK_TbAlunoTurmaAvaliacaoRelatorio_TbFaseNota].[TbFaseNota] DROP CONSTRAINT [TbAlunoTurmaAvaliacaoRelatorio] GO 
	
	ALTER TABLE [FK_TbAlunoServicoBolsa_TbUsuario].[TbUsuario] DROP CONSTRAINT [TbAlunoTurmaBolsa] GO 
	
	ALTER TABLE [FK_TbAlunoTurmaBolsa_TbSolicitacaoDesconto].[TbSolicitacaoDesconto] DROP CONSTRAINT [TbAlunoTurmaBolsa] GO 
	
	ALTER TABLE [FK_TbAlunoTurmaBolsa_TbAluno].[TbAluno] DROP CONSTRAINT [TbAlunoTurmaBolsa] GO 
	
	ALTER TABLE [FK_TbAlunoTurmaBolsa_TbTurma].[TbTurma] DROP CONSTRAINT [TbAlunoTurmaBolsa] GO 
	
	ALTER TABLE [FK_TbAlunoTurmaBolsa_TbAbatimento].[TbAbatimento] DROP CONSTRAINT [TbAlunoTurmaBolsa] GO 
	
	ALTER TABLE [FK_TbAlunoTurmaBolsaHistorico_TbUsuario].[TbUsuario] DROP CONSTRAINT [TbAlunoTurmaBolsaHistorico] GO 
	
	ALTER TABLE [FK_TbAlunoTurmaBolsaHistorico_TbAluno].[TbAluno] DROP CONSTRAINT [TbAlunoTurmaBolsaHistorico] GO 
	
	ALTER TABLE [FK__TbAlunoTu__IdAlu__39B24E89].[TbAluno] DROP CONSTRAINT [TbAlunoTurmaDocumento] GO 
	
	ALTER TABLE [FK_TbAlunoTurma].[TbAlunoTurma] DROP CONSTRAINT [TbAlunoTurmaDocumento] GO 
	
	ALTER TABLE [FK_TbDocumento].[TbDocumento] DROP CONSTRAINT [TbAlunoTurmaDocumento] GO 
	
	ALTER TABLE [FK_TbAlunoTurmaHistorico_TbTurma].[TbTurma] DROP CONSTRAINT [TbAlunoTurmaHistorico] GO 
	
	ALTER TABLE [FK_TbAlunoTurmaHistorico_TbAluno].[TbAluno] DROP CONSTRAINT [TbAlunoTurmaHistorico] GO 
	
	ALTER TABLE [FK_TbAlunoTurmaHistorico_TbUsuario].[TbUsuario] DROP CONSTRAINT [TbAlunoTurmaHistorico] GO 
	
	ALTER TABLE [FK_TbAlunoTurmaObservacao_TbAlunoTurma].[TbAlunoTurma] DROP CONSTRAINT [TbAlunoTurmaObservacao] GO 
	
	ALTER TABLE [FK_TbAlunoTurmaObservacao_TbAlunoTurma].[TbAlunoTurma] DROP CONSTRAINT [TbAlunoTurmaObservacao] GO 
	
	ALTER TABLE [FK_TbAlunoTurmaProcedimentoMatricula_TbUsuario].[TbUsuario] DROP CONSTRAINT [TbAlunoTurmaProcedimentoMatricula] GO 
	
	ALTER TABLE [FK_TbAlunoTurmaProcedimentoMatricula_TbAlunoTurma].[TbAlunoTurma] DROP CONSTRAINT [TbAlunoTurmaProcedimentoMatricula] GO 
	
	ALTER TABLE [FK_TbAlunoTurmaProcedimentoMatricula_TbAlunoTurma].[TbAlunoTurma] DROP CONSTRAINT [TbAlunoTurmaProcedimentoMatricula] GO 
	
	ALTER TABLE [FK_TbAlunoTurmaProcedimentoMatriculaHistorico_TbAlunoTurma].[TbAlunoTurma] DROP CONSTRAINT [TbAlunoTurmaProcedimentoMatriculaHistorico] GO 
	
	ALTER TABLE [FK_TbAlunoTurmaProcedimentoMatriculaHistorico_TbAlunoTurma].[TbAlunoTurma] DROP CONSTRAINT [TbAlunoTurmaProcedimentoMatriculaHistorico] GO 
	
	ALTER TABLE [FK_TbAlunoTurmaProcedimentoMatriculaHistorico_TbUsuario].[TbUsuario] DROP CONSTRAINT [TbAlunoTurmaProcedimentoMatriculaHistorico] GO 
	
	ALTER TABLE [FK_TbAlunoTurmaReserva_TbAluno].[TbAluno] DROP CONSTRAINT [TbAlunoTurmaReserva] GO 
	
	ALTER TABLE [FK_TbAlunoTurmaReserva_TbMotivoInativacao].[TbMotivoInativacao] DROP CONSTRAINT [TbAlunoTurmaReserva] GO 
	
	ALTER TABLE [FK_TbAlunoTurmaReserva_TbTurma].[TbTurma] DROP CONSTRAINT [TbAlunoTurmaReserva] GO 
	
	ALTER TABLE [FK_TbAlunoTurmaReservaDesconto_TbAlunoTurmaReserva].[TbAlunoTurmaReserva] DROP CONSTRAINT [TbAlunoTurmaReservaDesconto] GO 
	
	ALTER TABLE [FK_TbAlunoTurmaReservaDesconto_TbDesconto].[TbAbatimento] DROP CONSTRAINT [TbAlunoTurmaReservaDesconto] GO 
	
	ALTER TABLE [FK_TbArqArquivo_TbProfessor].[TbProfessor] DROP CONSTRAINT [TbArqArquivo] GO 
	
	ALTER TABLE [FK_TbArqArquivo_TbDisciplina].[TbDisciplina] DROP CONSTRAINT [TbArqArquivo] GO 
	
	ALTER TABLE [FK_TbArqArquivoAlunoVisualizacao_IdArquivo].[TbArqArquivo] DROP CONSTRAINT [TbArqArquivoAlunoVisualizacao] GO 
	
	ALTER TABLE [FK_TbArqArquivoAlunoVisualizacao_IdAluno].[TbAluno] DROP CONSTRAINT [TbArqArquivoAlunoVisualizacao] GO 
	
	ALTER TABLE [FK_TbArqArquivoTurmaPublicacao_TbArqArquivo].[TbArqArquivo] DROP CONSTRAINT [TbArqArquivoTurmaPublicacao] GO 
	
	ALTER TABLE [FK_TbArqArquivoTurmaPublicacao_TbTurma].[TbTurma] DROP CONSTRAINT [TbArqArquivoTurmaPublicacao] GO 
	
	ALTER TABLE [FK_IdUsuarioUpload_TbUsuario].[TbUsuario] DROP CONSTRAINT [TbArquivoAnexo] GO 
	
	ALTER TABLE [FK_IdUsuarioExclusaoLogica_TbUsuario].[TbUsuario] DROP CONSTRAINT [TbArquivoAnexo] GO 
	
	ALTER TABLE [FK_TbArquivoRetorno_FilaProcessamento_TbUsuario].[TbUsuario] DROP CONSTRAINT [TbArquivoRetorno_FilaProcessamento] GO 
	
	ALTER TABLE [FK_TbAtividade_TbPeriodo].[TbPeriodo] DROP CONSTRAINT [TbAtividade] GO 
	
	ALTER TABLE [FK_TbAtividadeComplementar_TbAlunoCurso].[TbAlunoCurso] DROP CONSTRAINT [TbAtividadeComplementar] GO 
	
	ALTER TABLE [FK_TbAtividadeDistribuicaoAluno_TbAtividade].[TbAtividade] DROP CONSTRAINT [TbAtividadeDistribuicaoAluno] GO 
	
	ALTER TABLE [FK_TbAtividadeDistribuicaoAluno_TbTurma].[TbTurma] DROP CONSTRAINT [TbAtividadeDistribuicaoAluno] GO 
	
	ALTER TABLE [FK_TbAtividadeDistribuicaoAluno_TbAluno].[TbAluno] DROP CONSTRAINT [TbAtividadeDistribuicaoAluno] GO 
	
	ALTER TABLE [FK_TbAtividadeDistribuicaoAluno_TbSala].[TbSala] DROP CONSTRAINT [TbAtividadeDistribuicaoAluno] GO 
	
	ALTER TABLE [FK_TbAtividadeSala_TbAtividade].[TbAtividade] DROP CONSTRAINT [TbAtividadeSala] GO 
	
	ALTER TABLE [FK_TbAtividadeSala_TbSala].[TbSala] DROP CONSTRAINT [TbAtividadeSala] GO 
	
	ALTER TABLE [FK_TbAuditoria_TbUsuario].[TbUsuario] DROP CONSTRAINT [TbAuditoria] GO 
	
	ALTER TABLE [FK_TbAutoAtendimentoTerminal_TbCartaoOperadora].[TbCartaoOperadora] DROP CONSTRAINT [TbAutoAtendimentoTerminal] GO 
	
	ALTER TABLE [FK_TbAvaliacao_TbUnidade].[TbUnidade] DROP CONSTRAINT [TbAvaliacao] GO 
	
	ALTER TABLE [FK_TbAvaliacaoFormulario_TbAvaliacao].[TbAvaliacao] DROP CONSTRAINT [TbAvaliacaoFormulario] GO 
	
	ALTER TABLE [FK_TbAvaliacaoParametro_TbUnidade].[TbUnidade] DROP CONSTRAINT [TbAvaliacaoParametro] GO 
	
	ALTER TABLE [FK_TbBoletoIntegrado_FilaProcessamento_TbUsuario].[TbUsuario] DROP CONSTRAINT [TbBoletoIntegrado_FilaProcessamento] GO 
	
	ALTER TABLE [FK_TbCaixa_TbEmpresa].[TbEmpresa] DROP CONSTRAINT [TbCaixa] GO 
	
	ALTER TABLE [FK_TbCaixa_TbUnidade].[TbUnidade] DROP CONSTRAINT [TbCaixa] GO 
	
	ALTER TABLE [FK_TbCaixaAbertura_TbCaixa].[TbCaixa] DROP CONSTRAINT [TbCaixaAbertura] GO 
	
	ALTER TABLE [FK_TbCaixaAberturaSaldo_TbCaixaAbertura].[TbCaixaAbertura] DROP CONSTRAINT [TbCaixaAberturaSaldo] GO 
	
	ALTER TABLE [FK_TbCaixaAberturaSaldo_TbCaixaTipoRecebimento].[TbCaixaTipoRecebimento] DROP CONSTRAINT [TbCaixaAberturaSaldo] GO 
	
	ALTER TABLE [FK_TbCaixaLancamento_TbCaixaTipoRecebimento].[TbCaixaTipoRecebimento] DROP CONSTRAINT [TbCaixaLancamento] GO 
	
	ALTER TABLE [FK_TbCaixaLancamento_TbCheque].[TbCheque] DROP CONSTRAINT [TbCaixaLancamento] GO 
	
	ALTER TABLE [FK_TbCaixaLancamento_TbCaixaMovimentacao].[TbCaixaMovimentacao] DROP CONSTRAINT [TbCaixaLancamento] GO 
	
	ALTER TABLE [FK_TbCaixaMovimentacao_TbUsuario].[TbUsuario] DROP CONSTRAINT [TbCaixaMovimentacao] GO 
	
	ALTER TABLE [FK_TbCaixaMovimentacao_TbConta].[TbConta] DROP CONSTRAINT [TbCaixaMovimentacao] GO 
	
	ALTER TABLE [FK_TbCaixaMovimentacao_TbUsuario_Autorizacao].[TbUsuario] DROP CONSTRAINT [TbCaixaMovimentacao] GO 
	
	ALTER TABLE [FK_TbCaixaMovimentacao_TbChequeMovimentacao].[TbChequeMovimentacao] DROP CONSTRAINT [TbCaixaMovimentacao] GO 
	
	ALTER TABLE [FK_TbCaixaMovimentacao_TbCaixaAbertura].[TbCaixaAbertura] DROP CONSTRAINT [TbCaixaMovimentacao] GO 
	
	ALTER TABLE [FK_TbCaixaMovimentacao_TbCaixaMovimentacao].[TbCaixaMovimentacao] DROP CONSTRAINT [TbCaixaMovimentacao] GO 
	
	ALTER TABLE [FK_TbCaixaRecebimento_TbTituloCobranca].[TbTituloCobranca] DROP CONSTRAINT [TbCaixaRecebimento] GO 
	
	ALTER TABLE [FK_TbCaixaRecebimento_TbUsuario].[TbUsuario] DROP CONSTRAINT [TbCaixaRecebimento] GO 
	
	ALTER TABLE [FK_TbCaixaPagamento_TbCaixaMovimentacao].[TbCaixaMovimentacao] DROP CONSTRAINT [TbCaixaRecebimento] GO 
	
	ALTER TABLE [FK_TbCaixaRecebimentoServico_TbLancamentoCobranca].[TbLancamentoCobranca] DROP CONSTRAINT [TbCaixaRecebimentoServico] GO 
	
	ALTER TABLE [FK_TbCaixaRecebimentoServico_TbServico].[TbServico] DROP CONSTRAINT [TbCaixaRecebimentoServico] GO 
	
	ALTER TABLE [FK_TbCaixaRecebimentoServico_TbCaixaRecebimento].[TbCaixaRecebimento] DROP CONSTRAINT [TbCaixaRecebimentoServico] GO 
	
	ALTER TABLE [FK_TbCaixaTipoRecebimento_TbCartaoOperadora].[TbCartaoOperadora] DROP CONSTRAINT [TbCaixaTipoRecebimento] GO 
	
	ALTER TABLE [FK_TbCaixaUsuario_TbUsuario].[TbUsuario] DROP CONSTRAINT [TbCaixaUsuario] GO 
	
	ALTER TABLE [FK_TbCaixaUsuario_TbCaixa].[TbCaixa] DROP CONSTRAINT [TbCaixaUsuario] GO 
	
	ALTER TABLE [FK_TbCampoDinamico_TbCampoDinamicoConjunto].[TbCampoDinamicoConjunto] DROP CONSTRAINT [TbCampoDinamico] GO 
	
	ALTER TABLE [FK_TbCampoDinamicoConjuntoElemento_TbCampoDinamicoConjunto].[TbCampoDinamicoConjunto] DROP CONSTRAINT [TbCampoDinamicoConjuntoElemento] GO 
	
	ALTER TABLE [FK_TbCampoDinamicoValor_TbCampoDinamico].[TbCampoDinamico] DROP CONSTRAINT [TbCampoDinamicoValor] GO 
	
	ALTER TABLE [FK_TbCaptacaoAlunoInteressado_TbCaptacaoCursoInteresse].[TbCaptacaoCursoInteresse] DROP CONSTRAINT [TbCaptacaoAlunoInteressado] GO 
	
	ALTER TABLE [FK_TbCaptacaoAlunoInteressado_TbUnidade].[TbUnidade] DROP CONSTRAINT [TbCaptacaoAlunoInteressado] GO 
	
	ALTER TABLE [FK_TbCaptacaoAlunoInteressado_TbAluno].[TbAluno] DROP CONSTRAINT [TbCaptacaoAlunoInteressado] GO 
	
	ALTER TABLE [FK_TbCaptacaoAlunoInteressado_TbCaptacaoMotivoDesistencia].[TbCaptacaoMotivoDesistencia] DROP CONSTRAINT [TbCaptacaoAlunoInteressado] GO 
	
	ALTER TABLE [FK_TbCaptacaoAlunoInteressado_TbUsuario].[TbUsuario] DROP CONSTRAINT [TbCaptacaoAlunoInteressado] GO 
	
	ALTER TABLE [FK_TbCaptacaoAlunoInteressado_TbCaptacaoSituacaoLead].[TbCaptacaoSituacaoLead] DROP CONSTRAINT [TbCaptacaoAlunoInteressado] GO 
	
	ALTER TABLE [FK_TbCaptacaoAlunoInteressado_TbCaptacaoOrigemLead].[TbCaptacaoOrigemLead] DROP CONSTRAINT [TbCaptacaoAlunoInteressado] GO 
	
	ALTER TABLE [FK_TbCaptacaoCursoInteresse_TbUnidade].[TbUnidade] DROP CONSTRAINT [TbCaptacaoCursoInteresse] GO 
	
	ALTER TABLE [FK_TbCaptacaoInteracao_TbCaptacaoAluno].[TbCaptacaoAlunoInteressado] DROP CONSTRAINT [TbCaptacaoInteracao] GO 
	
	ALTER TABLE [FK_TbCaptacaoInteracao_TbUsuario].[TbUsuario] DROP CONSTRAINT [TbCaptacaoInteracao] GO 
	
	ALTER TABLE [FK_TbCaptacaoParametro_TbUnidade].[TbUnidade] DROP CONSTRAINT [TbCaptacaoParametro] GO 
	
	ALTER TABLE [FK_TbCartaoMovimentacao_TbPagamentoOnline].[TbPagamentoOnline] DROP CONSTRAINT [TbCartaoMovimentacao] GO 
	
	ALTER TABLE [FK_TbCartaoMovimentacao_TbPosTransacao].[TbPosTransacao] DROP CONSTRAINT [TbCartaoMovimentacao] GO 
	
	ALTER TABLE [FK_TbCartaoMovimentacao_TbCaixaTipoRecebimento].[TbCaixaTipoRecebimento] DROP CONSTRAINT [TbCartaoMovimentacao] GO 
	
	ALTER TABLE [FK_TbCartaoMovimentacao_TbCaixaLancamento].[TbCaixaLancamento] DROP CONSTRAINT [TbCartaoMovimentacao] GO 
	
	ALTER TABLE [FK_TbCartaoMovimentacao_TbCaixaLancamentoRetirada].[TbCaixaLancamento] DROP CONSTRAINT [TbCartaoMovimentacao] GO 
	
	ALTER TABLE [FK_TbCartaoMovimentacao_TbConta].[TbConta] DROP CONSTRAINT [TbCartaoMovimentacao] GO 
	
	ALTER TABLE [FK_TbCartaoOperadora_TbEmpresa].[TbEmpresa] DROP CONSTRAINT [TbCartaoOperadora] GO 
	
	ALTER TABLE [FK_TbCartaoOperadora_TbConta_Repasse].[TbConta] DROP CONSTRAINT [TbCartaoOperadora] GO 
	
	ALTER TABLE [FK_CartaoOperadora_TbPlanoContas_Despesa].[TbPlanoContas] DROP CONSTRAINT [TbCartaoOperadora] GO 
	
	ALTER TABLE [FK_TbCentroResultado_TbUnidade].[TbUnidade] DROP CONSTRAINT [TbCentroResultado] GO 
	
	ALTER TABLE [FK_TbChequeCustodia_TbConta].[TbConta] DROP CONSTRAINT [TbChequeCustodia] GO 
	
	ALTER TABLE [TbChequeEmitido_FK].[TbConta] DROP CONSTRAINT [TbChequeEmitido] GO 
	
	ALTER TABLE [FK_TbChequeEmitidoContaPagar_ChequeEmitido].[TbChequeEmitido] DROP CONSTRAINT [TbChequeEmitidoContaPagar] GO 
	
	ALTER TABLE [FK_TbChequeEmitidoContaPagar_ContaPagar].[TbContaPagar] DROP CONSTRAINT [TbChequeEmitidoContaPagar] GO 
	
	ALTER TABLE [FK_TbChequeEmitidoPagamentoAvulso_LancamentoFinanceiro].[TbLancamentoFinanceiro] DROP CONSTRAINT [TbChequeEmitidoPagamentoAvulso] GO 
	
	ALTER TABLE [FK_TbChequeEmitidoPagamentoAvulso_ChequeEmitido].[TbChequeEmitido] DROP CONSTRAINT [TbChequeEmitidoPagamentoAvulso] GO 
	
	ALTER TABLE [FK_TbChequeEmitidoPagamentoAvulso_Empresa].[TbEmpresa] DROP CONSTRAINT [TbChequeEmitidoPagamentoAvulso] GO 
	
	ALTER TABLE [FK_TbChequeEmitidoPagamentoAvulso_PlanoContas].[TbPlanoContas] DROP CONSTRAINT [TbChequeEmitidoPagamentoAvulso] GO 
	
	ALTER TABLE [FK_TbChequeEmitidoPagamentoAvulso_TbFavorecido].[TbFavorecido] DROP CONSTRAINT [TbChequeEmitidoPagamentoAvulso] GO 
	
	ALTER TABLE [FK_TbChequeEmitidoPagamentoAvulso_TbCentroResultado].[TbCentroResultado] DROP CONSTRAINT [TbChequeEmitidoPagamentoAvulso] GO 
	
	ALTER TABLE [FK_TbChequeEmitidoTransferencia_ChequeEmitido].[TbChequeEmitido] DROP CONSTRAINT [TbChequeEmitidoTransferencia] GO 
	
	ALTER TABLE [FK_TbChequeEmitidoTransferencia_Conta].[TbConta] DROP CONSTRAINT [TbChequeEmitidoTransferencia] GO 
	
	ALTER TABLE [FK_TbChequeEmitidoTransferencia_LancamentoFinanceiroTransferencia].[TbLancamentoFinanceiroTransferencia] DROP CONSTRAINT [TbChequeEmitidoTransferencia] GO 
	
	ALTER TABLE [FK_TbChequeMovimentacao_TbUsuario].[TbUsuario] DROP CONSTRAINT [TbChequeMovimentacao] GO 
	
	ALTER TABLE [FK_TbChequeMovimentacao_TbChequeCustodia].[TbChequeCustodia] DROP CONSTRAINT [TbChequeMovimentacao] GO 
	
	ALTER TABLE [FK_TbChequeMovimentacaoItem_TbChequeMovimentacao].[TbChequeMovimentacao] DROP CONSTRAINT [TbChequeMovimentacaoItem] GO 
	
	ALTER TABLE [FK_TbChequeMovimentacaoItem_TbCheque].[TbCheque] DROP CONSTRAINT [TbChequeMovimentacaoItem] GO 
	
	ALTER TABLE [FK_TbChequeTituloCobranca_TbTituloCobranca].[TbTituloCobranca] DROP CONSTRAINT [TbChequeTituloCobranca] GO 
	
	ALTER TABLE [FK_TbChequeTituloCobranca_TbCheque].[TbCheque] DROP CONSTRAINT [TbChequeTituloCobranca] GO 
	
	ALTER TABLE [FK_TbConfiguracaoEnvioBoleto_Email].[TbTextoPersonalizado] DROP CONSTRAINT [TbConfiguracaoEnvioBoleto] GO 
	
	ALTER TABLE [FK_TbConfiguracaoEnvioBoleto_App].[TbTextoPersonalizado] DROP CONSTRAINT [TbConfiguracaoEnvioBoleto] GO 
	
	ALTER TABLE [FK_TbConfiguracaoEnvioBoleto_SMS].[TbTextoPersonalizado] DROP CONSTRAINT [TbConfiguracaoEnvioBoleto] GO 
	
	ALTER TABLE [FK_TbConta_TbEmpresa].[TbEmpresa] DROP CONSTRAINT [TbConta] GO 
	
	ALTER TABLE [FK_TbConta_TbUnidade].[TbUnidade] DROP CONSTRAINT [TbConta] GO 
	
	ALTER TABLE [FK_TbContaPagar_TbContaPagar].[TbContaPagar] DROP CONSTRAINT [TbContaPagar] GO 
	
	ALTER TABLE [FK_TbContaPagar_TbHistoricoPadrao_IdComentarioPadrao].[TbHistoricoPadrao] DROP CONSTRAINT [TbContaPagar] GO 
	
	ALTER TABLE [FK_TbContaPagar_TbHistoricoPadrao_IdComentarioPadraoBaixa].[TbHistoricoPadrao] DROP CONSTRAINT [TbContaPagar] GO 
	
	ALTER TABLE [FK_TbContaPagar_TbFavorecido].[TbFavorecido] DROP CONSTRAINT [TbContaPagar] GO 
	
	ALTER TABLE [FK_TbContaPagar_TbConta_LIQ].[TbConta] DROP CONSTRAINT [TbContaPagar] GO 
	
	ALTER TABLE [FK_TbContaPagarRateio_TbEmpresa].[TbEmpresa] DROP CONSTRAINT [TbContaPagarRateio] GO 
	
	ALTER TABLE [FK_TbContaPagarRateio_TbPlanoContas].[TbPlanoContas] DROP CONSTRAINT [TbContaPagarRateio] GO 
	
	ALTER TABLE [FK_TbContaPagarRateio_TbCentroResultado].[TbCentroResultado] DROP CONSTRAINT [TbContaPagarRateio] GO 
	
	ALTER TABLE [FK_TbContaPagarRateio_TbContaPagar].[TbContaPagar] DROP CONSTRAINT [TbContaPagarRateio] GO 
	
	ALTER TABLE [FK_TbContaUsuario_TbConta].[TbConta] DROP CONSTRAINT [TbContaUsuario] GO 
	
	ALTER TABLE [FK_TbContaUsuario_TbUsuario].[TbUsuario] DROP CONSTRAINT [TbContaUsuario] GO 
	
	ALTER TABLE [FK_TbCurriculo_TbHabilitacao].[TbHabilitacao] DROP CONSTRAINT [TbCurriculo] GO 
	
	ALTER TABLE [FK_TbCurriculo_TbCurso].[TbCurso] DROP CONSTRAINT [TbCurriculo] GO 
	
	ALTER TABLE [FK_TbCurriculoDisciplina_TbCurriculo].[TbCurriculo] DROP CONSTRAINT [TbCurriculoDisciplina] GO 
	
	ALTER TABLE [FK_TbCurriculoDisciplina_TbDisciplina].[TbDisciplina] DROP CONSTRAINT [TbCurriculoDisciplina] GO 
	
	ALTER TABLE [FK_TbCurriculoDisciplinaEletiva_TbDisciplina1].[TbDisciplina] DROP CONSTRAINT [TbCurriculoDisciplinaEletiva] GO 
	
	ALTER TABLE [FK_TbCurriculoDisciplinaEletiva_TbDisciplina2].[TbDisciplina] DROP CONSTRAINT [TbCurriculoDisciplinaEletiva] GO 
	
	ALTER TABLE [FK_TbCurriculoDisciplinaEquivalente_TbDisciplina1].[TbDisciplina] DROP CONSTRAINT [TbCurriculoDisciplinaEquivalente] GO 
	
	ALTER TABLE [FK_TbCurriculoDisciplinaEquivalente_TbDisciplina2].[TbDisciplina] DROP CONSTRAINT [TbCurriculoDisciplinaEquivalente] GO 
	
	ALTER TABLE [FK_TbCurriculoOptativa_TbCurriculo].[TbCurriculo] DROP CONSTRAINT [TbCurriculoOptativa] GO 
	
	ALTER TABLE [FK_TbCurriculoOptativaDisciplina_TbCurriculoOptativa].[TbCurriculoOptativa] DROP CONSTRAINT [TbCurriculoOptativaDisciplina] GO 
	
	ALTER TABLE [FK_TbCurriculoOptativaDisciplina_TbDisciplina].[TbDisciplina] DROP CONSTRAINT [TbCurriculoOptativaDisciplina] GO 
	
	ALTER TABLE [FK_TbCurso_TbVerificacaoMatricula].[TbVerificacaoMatricula] DROP CONSTRAINT [TbCurso] GO 
	
	ALTER TABLE [FK_TbCurso_TbServico].[TbServico] DROP CONSTRAINT [TbCurso] GO 
	
	ALTER TABLE [FK_TbCurso_TbPlanoPagamento].[TbPlanoPagamento] DROP CONSTRAINT [TbCurso] GO 
	
	ALTER TABLE [FK_TbCurso_TbUsuario].[TbUsuario] DROP CONSTRAINT [TbCurso] GO 
	
	ALTER TABLE [FK_TbCurso_TbUnidade].[TbUnidade] DROP CONSTRAINT [TbCurso] GO 
	
	ALTER TABLE [FK_TbCurso_TbTextoPersonalizado].[TbTextoPersonalizado] DROP CONSTRAINT [TbCurso] GO 
	
	ALTER TABLE [FK_TbCursoSuperior_TbUnidade].[TbUnidade] DROP CONSTRAINT [TbCursoSuperior] GO 
	
	ALTER TABLE [FK_TbCursoTipoCobranca02_TbTurno].[TbTurno] DROP CONSTRAINT [TbCursoTipoCobranca02] GO 
	
	ALTER TABLE [FK_TbCursoTipoCobranca02_TbPlanoPagamento].[TbPlanoPagamento] DROP CONSTRAINT [TbCursoTipoCobranca02] GO 
	
	ALTER TABLE [FK_TbCursoTipoCobranca02_TbCurso].[TbCurso] DROP CONSTRAINT [TbCursoTipoCobranca02] GO 
	
	ALTER TABLE [FK_TbCursoTipoCobranca02_TbPeriodo].[TbPeriodo] DROP CONSTRAINT [TbCursoTipoCobranca02] GO 
	
	ALTER TABLE [FK_TbCursoTipoCobranca05_TbPlanoPagamento].[TbPlanoPagamento] DROP CONSTRAINT [TbCursoTipoCobranca05] GO 
	
	ALTER TABLE [FK_TbCursoTipoCobranca05_TbTurma].[TbTurma] DROP CONSTRAINT [TbCursoTipoCobranca05] GO 
	
	ALTER TABLE [FK_TbCursoTipoCobranca06_TbPeriodo].[TbPeriodo] DROP CONSTRAINT [TbCursoTipoCobranca06] GO 
	
	ALTER TABLE [FK_TbCursoTipoCobranca06_TbPlanoPagamento].[TbPlanoPagamento] DROP CONSTRAINT [TbCursoTipoCobranca06] GO 
	
	ALTER TABLE [FK_TbCursoTipoCobranca06_TbTurno].[TbTurno] DROP CONSTRAINT [TbCursoTipoCobranca06] GO 
	
	ALTER TABLE [FK_TbCursoTipoCobranca06_TbCurso].[TbCurso] DROP CONSTRAINT [TbCursoTipoCobranca06] GO 
	
	ALTER TABLE [FK_TbDadosUso_TbUsuario].[TbUsuario] DROP CONSTRAINT [TbDadosUso] GO 
	
	ALTER TABLE [FK_TbDadosUso_TbUnidade].[TbUnidade] DROP CONSTRAINT [TbDadosUso] GO 
	
	ALTER TABLE [FK_TbDiario_TbTurma].[TbTurma] DROP CONSTRAINT [TbDiario] GO 
	
	ALTER TABLE [FK_TbDiaro_TbDisciplina].[TbDisciplina] DROP CONSTRAINT [TbDiario] GO 
	
	ALTER TABLE [FK_TbDiario_TbFaseNota].[TbFaseNota] DROP CONSTRAINT [TbDiario] GO 
	
	ALTER TABLE [FK_TbDiarioAluno_TbDiario].[TbDiario] DROP CONSTRAINT [TbDiarioAluno] GO 
	
	ALTER TABLE [FK_TbDiarioAluno_TbAluno].[TbAluno] DROP CONSTRAINT [TbDiarioAluno] GO 
	
	ALTER TABLE [FK_TbDiarioAula_TbDiario].[TbDiario] DROP CONSTRAINT [TbDiarioAula] GO 
	
	ALTER TABLE [FK_TbDiarioAulaChamadaOnline_TbDiarioAula].[TbDiarioAula] DROP CONSTRAINT [TbDiarioAulaChamadaOnline] GO 
	
	ALTER TABLE [FK_TbDiarioAulaChamadaOnline_TbAluno].[TbAluno] DROP CONSTRAINT [TbDiarioAulaChamadaOnline] GO 
	
	ALTER TABLE [FK_TbDiarioFrequencia_TbDiarioAula].[TbDiarioAula] DROP CONSTRAINT [TbDiarioFrequencia] GO 
	
	ALTER TABLE [FK_TbDisciplinaPlano_TbDisciplina].[TbDisciplina] DROP CONSTRAINT [TbDisciplinaPlano] GO 
	
	ALTER TABLE [FK_TbDisciplinaPlanoAula_TbDisciplinaPlano].[TbDisciplinaPlano] DROP CONSTRAINT [TbDisciplinaPlanoAula] GO 
	
	ALTER TABLE [FK_TbDisciplinaRequisito_TbDisciplina1].[TbDisciplina] DROP CONSTRAINT [TbDisciplinaRequisito] GO 
	
	ALTER TABLE [FK_TbDisciplinaRequisito_TbDisciplina].[TbDisciplina] DROP CONSTRAINT [TbDisciplinaRequisito] GO 
	
	ALTER TABLE [FK_TbDisponibilidade_TbSala].[TbSala] DROP CONSTRAINT [TbDisponibilidade] GO 
	
	ALTER TABLE [FK_TbDocumento_TbUnidade].[TbUnidade] DROP CONSTRAINT [TbDocumento] GO 
	
	ALTER TABLE [FK_TbDocumentoHistorico_TbDocumento].[TbDocumento] DROP CONSTRAINT [TbDocumentoHistorico] GO 
	
	ALTER TABLE [FK_TbDocumentoHistorico_TbUsuario].[TbUsuario] DROP CONSTRAINT [TbDocumentoHistorico] GO 
	
	ALTER TABLE [FK_TbDocumentoSignatario_TbDocumento].[TbDocumento] DROP CONSTRAINT [TbDocumentoSignatario] GO 
	
	ALTER TABLE [FK_TbEducacensoUnidade_TbUnidade].[TbUnidade] DROP CONSTRAINT [TbEducacensoUnidade] GO 
	
	ALTER TABLE [FK_TbEducacensoUnidade_TbEducacensoCampo].[TbEducacensoCampo] DROP CONSTRAINT [TbEducacensoUnidade] GO 
	
	ALTER TABLE [FK_TbEmpresa_TbUnidade1].[TbUnidade] DROP CONSTRAINT [TbEmpresa] GO 
	
	ALTER TABLE [FK_TbEscola_TbUsuario].[TbUsuario] DROP CONSTRAINT [TbEscola] GO 
	
	ALTER TABLE [FK_TbEventoTipoInscricao_TbTurma_Evento].[TbTurma] DROP CONSTRAINT [TbEventoTipoInscricao] GO 
	
	ALTER TABLE [FK_TbEventoTipoInscricao_TbServico].[TbServico] DROP CONSTRAINT [TbEventoTipoInscricao] GO 
	
	ALTER TABLE [FK_TbEventoTipoInscricao_TbPlanoPagamento].[TbPlanoPagamento] DROP CONSTRAINT [TbEventoTipoInscricao] GO 
	
	ALTER TABLE [FK_TbExcecaoCobranca_TbParcelaCobranca].[TbParcelaCobranca] DROP CONSTRAINT [TbExcecaoCobranca] GO 
	
	ALTER TABLE [FK_TbExcecaoCobranca_TbParcelaCobranca].[TbParcelaCobranca] DROP CONSTRAINT [TbExcecaoCobranca] GO 
	
	ALTER TABLE [FK_TbExcecaoCobranca_TbServico].[TbServico] DROP CONSTRAINT [TbExcecaoCobranca] GO 
	
	ALTER TABLE [FK_TbFaseNota_TbFormula_FormulaNota].[TbFormula] DROP CONSTRAINT [TbFaseNota] GO 
	
	ALTER TABLE [FK_TbFaseNota_TbFaseNota1].[TbFaseNota] DROP CONSTRAINT [TbFaseNota] GO 
	
	ALTER TABLE [FK_TbFaseNota_TbFormula_FormulaComposicaoNota].[TbFormula] DROP CONSTRAINT [TbFaseNota] GO 
	
	ALTER TABLE [FK_TbFaseNota_TbFormula].[TbFormula] DROP CONSTRAINT [TbFaseNota] GO 
	
	ALTER TABLE [FK_TbFaseNota_TbFormula_AprovacaoFrequencia].[TbFormula] DROP CONSTRAINT [TbFaseNota] GO 
	
	ALTER TABLE [FK_TbFaseNota_TbSerie].[TbSerie] DROP CONSTRAINT [TbFaseNota] GO 
	
	ALTER TABLE [FK_TbFaseNota_TbTipoSituacaoAlunoDisciplina].[TbTipoSituacaoAlunoDisciplina] DROP CONSTRAINT [TbFaseNota] GO 
	
	ALTER TABLE [FK_TbFaseNota_TbTipoSituacaoAlunoDisciplina_SituacaoAprovado].[TbTipoSituacaoAlunoDisciplina] DROP CONSTRAINT [TbFaseNota] GO 
	
	ALTER TABLE [FK_TbFaseNota_TbPeriodo].[TbPeriodo] DROP CONSTRAINT [TbFaseNota] GO 
	
	ALTER TABLE [FK_TbFaseNota_TbTipoSituacaoAlunoDisciplina_SituacaoReprovado].[TbTipoSituacaoAlunoDisciplina] DROP CONSTRAINT [TbFaseNota] GO 
	
	ALTER TABLE [FK_TbFaseNota_TbFormula_FormulaFalta].[TbFormula] DROP CONSTRAINT [TbFaseNota] GO 
	
	ALTER TABLE [FK_TbFaseNota_TbFaseNota].[TbFaseNota] DROP CONSTRAINT [TbFaseNota] GO 
	
	ALTER TABLE [FK_TbFaseNotaAluno_TbFaseNota1].[TbFaseNota] DROP CONSTRAINT [TbFaseNotaAluno] GO 
	
	ALTER TABLE [FK_TbFaseNotaAluno_TbFormula].[TbFormula] DROP CONSTRAINT [TbFaseNotaAluno] GO 
	
	ALTER TABLE [FK_TbFaseNotaAluno_TbAlunoTurma].[TbAlunoTurma] DROP CONSTRAINT [TbFaseNotaAluno] GO 
	
	ALTER TABLE [FK_TbFaseNotaAluno_TbAlunoTurma].[TbAlunoTurma] DROP CONSTRAINT [TbFaseNotaAluno] GO 
	
	ALTER TABLE [FK_TbFaseNotaAluno_TbDisciplina].[TbDisciplina] DROP CONSTRAINT [TbFaseNotaAluno] GO 
	
	ALTER TABLE [FK_TbFaseNotaAluno_TbTurmaDisciplinaAluno].[TbSituacaoAlunoDisciplina] DROP CONSTRAINT [TbFaseNotaAluno] GO 
	
	ALTER TABLE [FK_TbFaseNotaAluno_TbTurmaDisciplinaAluno].[TbSituacaoAlunoDisciplina] DROP CONSTRAINT [TbFaseNotaAluno] GO 
	
	ALTER TABLE [FK_TbFaseNotaAluno_TbTurmaDisciplinaAluno].[TbSituacaoAlunoDisciplina] DROP CONSTRAINT [TbFaseNotaAluno] GO 
	
	ALTER TABLE [FK_TbFaseNotaAluno_FilaProcessamento_TbDisciplina].[TbDisciplina] DROP CONSTRAINT [TbFaseNotaAluno_FilaProcessamento] GO 
	
	ALTER TABLE [FK_TbFaseNotaAluno_FilaProcessamento_TbTurma].[TbTurma] DROP CONSTRAINT [TbFaseNotaAluno_FilaProcessamento] GO 
	
	ALTER TABLE [FK_TbFaseNotaAluno_FilaProcessamento_TbAluno].[TbAluno] DROP CONSTRAINT [TbFaseNotaAluno_FilaProcessamento] GO 
	
	ALTER TABLE [FK_TbFaseNotaAluno_FilaProcessamento_TbUnidade].[TbUnidade] DROP CONSTRAINT [TbFaseNotaAluno_FilaProcessamento] GO 
	
	ALTER TABLE [FK_TbFaseNotaAluno_FilaProcessamento_TbUsuario].[TbUsuario] DROP CONSTRAINT [TbFaseNotaAluno_FilaProcessamento] GO 
	
	ALTER TABLE [FK_TbFaseNotaAluno_FilaProcessamento_TbProfessor].[TbProfessor] DROP CONSTRAINT [TbFaseNotaAluno_FilaProcessamento] GO 
	
	ALTER TABLE [FK_TbFaseNotaDisciplina_TbFaseNota].[TbFaseNota] DROP CONSTRAINT [TbFaseNotaDisciplina] GO 
	
	ALTER TABLE [FK_TbFaseNotaDisciplina_TbFormula].[TbFormula] DROP CONSTRAINT [TbFaseNotaDisciplina] GO 
	
	ALTER TABLE [FK_TbFaseNotaDisciplina_TbDisciplina].[TbDisciplina] DROP CONSTRAINT [TbFaseNotaDisciplina] GO 
	
	ALTER TABLE [FK_TbFaseNotaDisciplinaTurma_TbFaseNota].[TbFaseNota] DROP CONSTRAINT [TbFaseNotaDisciplinaTurma] GO 
	
	ALTER TABLE [FK_TbFaseNotaDisciplinaTurma_TbDisciplina].[TbDisciplina] DROP CONSTRAINT [TbFaseNotaDisciplinaTurma] GO 
	
	ALTER TABLE [FK_TbFaseNotaDisciplinaTurma_TbTurma].[TbTurma] DROP CONSTRAINT [TbFaseNotaDisciplinaTurma] GO 
	
	ALTER TABLE [FK_TbFaseNotaNotaNecessaria_TbPeriodo].[TbPeriodo] DROP CONSTRAINT [TbFaseNotaNotaNecessaria] GO 
	
	ALTER TABLE [FK_TbFaseNotaNotaNecessariaExibicao_TbFaseNotaNotaNecessaria].[TbFaseNotaNotaNecessaria] DROP CONSTRAINT [TbFaseNotaNotaNecessariaExibicao] GO 
	
	ALTER TABLE [FK_TbFaseNotaOrigemDestino_TbPeriodo].[TbPeriodo] DROP CONSTRAINT [TbFaseNotaOrigemDestino] GO 
	
	ALTER TABLE [FK_TbFaseNotaOrigemDestino_TbSerie_Origem].[TbSerie] DROP CONSTRAINT [TbFaseNotaOrigemDestino] GO 
	
	ALTER TABLE [FK_TbFaseNotaOrigemDestino_TbSerie_Destino].[TbSerie] DROP CONSTRAINT [TbFaseNotaOrigemDestino] GO 
	
	ALTER TABLE [FK_TbFavorecido_TbHistoricoPadrao_IdComentarioPadrao].[TbHistoricoPadrao] DROP CONSTRAINT [TbFavorecido] GO 
	
	ALTER TABLE [FK_TbFavorecido_TbUnidade].[TbUnidade] DROP CONSTRAINT [TbFavorecido] GO 
	
	ALTER TABLE [FK_TbFavorecido_TbCentroResultado].[TbCentroResultado] DROP CONSTRAINT [TbFavorecido] GO 
	
	ALTER TABLE [FK_TbFavorecidoPlanoConta_TbFavorecido].[TbFavorecido] DROP CONSTRAINT [TbFavorecidoPlanoConta] GO 
	
	ALTER TABLE [FK_TbFavorecidoPlanoConta_TbPlanoContas].[TbPlanoContas] DROP CONSTRAINT [TbFavorecidoPlanoConta] GO 
	
	ALTER TABLE [FK_TbFeriado_TbUnidade].[TbUnidade] DROP CONSTRAINT [TbFeriado] GO 
	
	ALTER TABLE [FK_TbFidUsuarioPontuacao_TbFidUsuario].[TbFidUsuario] DROP CONSTRAINT [TbFidUsuarioPontuacao] GO 
	
	ALTER TABLE [FK_TbFidUsuarioPontuacao_TbFidTipoLancamento].[TbFidTipoLancamento] DROP CONSTRAINT [TbFidUsuarioPontuacao] GO 
	
	ALTER TABLE [FK_TbFidUsuarioPontuacao_TbUsuario].[TbUsuario] DROP CONSTRAINT [TbFidUsuarioPontuacao] GO 
	
	ALTER TABLE [FK_TbFiesRepasse_TbParametroEnsinoSuperiorFIES].[TbParametroEnsinoSuperiorFIES] DROP CONSTRAINT [TbFiesRepasse] GO 
	
	ALTER TABLE [FK_TbFiesRepasse_TbAluno].[TbAluno] DROP CONSTRAINT [TbFiesRepasse] GO 
	
	ALTER TABLE [FK_TbFiesRepasse_TbConta].[TbConta] DROP CONSTRAINT [TbFiesRepasse] GO 
	
	ALTER TABLE [FK_TbFormaRecebimento_TbConta].[TbConta] DROP CONSTRAINT [TbFormaRecebimento] GO 
	
	ALTER TABLE [FK_TbFormaRecebimento_TbFavorecidoPagamento].[TbFavorecido] DROP CONSTRAINT [TbFormaRecebimento] GO 
	
	ALTER TABLE [FK_TbFormaRecebimento_TbFavorecido].[TbFavorecido] DROP CONSTRAINT [TbFormaRecebimento] GO 
	
	ALTER TABLE [FK_TbFormaRecebimento_TbBanco].[TbBanco] DROP CONSTRAINT [TbFormaRecebimento] GO 
	
	ALTER TABLE [FK_TbFormaRecebimento_TbServico].[TbServico] DROP CONSTRAINT [TbFormaRecebimento] GO 
	
	ALTER TABLE [FK_TbFormaRecebimentoLiquidacaoImpedimento_IdFormaRecebimento].[TbFormaRecebimento] DROP CONSTRAINT [TbFormaRecebimentoLiquidacaoImpedimento] GO 
	
	ALTER TABLE [FK_TbFormaRecebimentoLiquidacaoImpedimento_IdUsuarioLiberacao].[TbUsuario] DROP CONSTRAINT [TbFormaRecebimentoLiquidacaoImpedimento] GO 
	
	ALTER TABLE [FK_TbFormula_TbPeriodo].[TbPeriodo] DROP CONSTRAINT [TbFormula] GO 
	
	ALTER TABLE [FK_TbFormula_TbUnidade].[TbUnidade] DROP CONSTRAINT [TbFormula] GO 
	
	ALTER TABLE [FK_TbFormularioRotinaEducacaoInfantilCampoDinamico_TbFormularioRotinaEducacaoInfantil].[TbFormularioRotinaEducacaoInfantil] DROP CONSTRAINT [TbFormularioRotinaEducacaoInfantilCampoDinamico] GO 
	
	ALTER TABLE [FK_TbFormularioRotinaEducacaoInfantilCampoDinamico_TbCampoDinamico].[TbCampoDinamico] DROP CONSTRAINT [TbFormularioRotinaEducacaoInfantilCampoDinamico] GO 
	
	ALTER TABLE [FK_TbFreqAlunoNotificacaoResponsavel_TbAluno].[TbAluno] DROP CONSTRAINT [TbFreqAlunoNotificacaoResponsavel] GO 
	
	ALTER TABLE [FK_TbFreqAlunoNotificacaoResponsavel_TbResponsavel].[TbResponsavel] DROP CONSTRAINT [TbFreqAlunoNotificacaoResponsavel] GO 
	
	ALTER TABLE [FK_TbFreqAlunoPermissaoSaida_TbAluno].[TbAluno] DROP CONSTRAINT [TbFreqAlunoPermissaoSaida] GO 
	
	ALTER TABLE [FK_TbFreqAlunoPermissaoSaidaResponsavel_TbFreqAlunoPermissaoSaida].[TbFreqAlunoPermissaoSaida] DROP CONSTRAINT [TbFreqAlunoPermissaoSaidaResponsavel] GO 
	
	ALTER TABLE [FK_TbFreqAlunoPermissaoSaidaResponsavel_TbResponsavel].[TbResponsavel] DROP CONSTRAINT [TbFreqAlunoPermissaoSaidaResponsavel] GO 
	
	ALTER TABLE [FK_TbFreqApuracao_TbAluno].[TbAluno] DROP CONSTRAINT [TbFreqApuracao] GO 
	
	ALTER TABLE [FK_TbFreqApuracao_TbTurma].[TbTurma] DROP CONSTRAINT [TbFreqApuracao] GO 
	
	ALTER TABLE [FK_TbFreqApuracao_TbDisciplina].[TbDisciplina] DROP CONSTRAINT [TbFreqApuracao] GO 
	
	ALTER TABLE [FK_TbFreqMarcacao_TbResponsavel].[TbResponsavel] DROP CONSTRAINT [TbFreqMarcacao] GO 
	
	ALTER TABLE [FK_TbFreqMarcacao_TbFreqColetor].[TbFreqColetor] DROP CONSTRAINT [TbFreqMarcacao] GO 
	
	ALTER TABLE [FK_TbFreqMarcacao_TbFreqColetor1].[TbFreqColetor] DROP CONSTRAINT [TbFreqMarcacao] GO 
	
	ALTER TABLE [FK_TbFreqProfessorPermissao_TbProfessor].[TbProfessor] DROP CONSTRAINT [TbFreqProfessorPermissao] GO 
	
	ALTER TABLE [FK_TbFreqQuadroHorario_TbFreqQuadroHorario].[TbFreqQuadroHorario] DROP CONSTRAINT [TbFreqQuadroHorario] GO 
	
	ALTER TABLE [FK_TbFreqQuadroHorario_TbTurma].[TbTurma] DROP CONSTRAINT [TbFreqQuadroHorario] GO 
	
	ALTER TABLE [FK_TbFreqQuadroHorario_TbDisciplina].[TbDisciplina] DROP CONSTRAINT [TbFreqQuadroHorario] GO 
	
	ALTER TABLE [FK_TbFreqQuadroHorario_TbSala].[TbSala] DROP CONSTRAINT [TbFreqQuadroHorario] GO 
	
	ALTER TABLE [FK_TbFreqVerificacao_TbTipoImpedimento].[TbTipoImpedimento] DROP CONSTRAINT [TbFreqVerificacao] GO 
	
	ALTER TABLE [FK_TbFuncionalidadeGrupo_TbGrupo].[TbGrupo] DROP CONSTRAINT [TbFuncionalidadeGrupo] GO 
	
	ALTER TABLE [FK_TbGradeCurricular_TbFormula].[TbFormula] DROP CONSTRAINT [TbGradeCurricular] GO 
	
	ALTER TABLE [FK_TbGradeCurricular_TbDisciplina].[TbDisciplina] DROP CONSTRAINT [TbGradeCurricular] GO 
	
	ALTER TABLE [FK_TbGradeCurricular_TbPeriodo].[TbPeriodo] DROP CONSTRAINT [TbGradeCurricular] GO 
	
	ALTER TABLE [FK_TbGradeCurricular_TbSerie].[TbSerie] DROP CONSTRAINT [TbGradeCurricular] GO 
	
	ALTER TABLE [FK_TbGradeHorario_TbSala].[TbSala] DROP CONSTRAINT [TbGradeHorario] GO 
	
	ALTER TABLE [FK_TbHabilitacao_TbCursoSuperior].[TbCursoSuperior] DROP CONSTRAINT [TbHabilitacao] GO 
	
	ALTER TABLE [FK_TbHistorico_TbAluno].[TbAluno] DROP CONSTRAINT [TbHistorico] GO 
	
	ALTER TABLE [FK_TbHistorico_TbEstabelecimentoEnsino].[TbEstabelecimentoEnsino] DROP CONSTRAINT [TbHistorico] GO 
	
	ALTER TABLE [FK_TbHistoricoAproveitamento_TbAluno].[TbAluno] DROP CONSTRAINT [TbHistoricoAproveitamento] GO 
	
	ALTER TABLE [FK_TbHistoricoAproveitamento_TbPeriodo].[TbPeriodo] DROP CONSTRAINT [TbHistoricoAproveitamento] GO 
	
	ALTER TABLE [FK_TbHistoricoAproveitamento_TbDisciplina].[TbDisciplina] DROP CONSTRAINT [TbHistoricoAproveitamento] GO 
	
	ALTER TABLE [FK_TbHistoricoAproveitamento_TbEEnsino].[TbEstabelecimentoEnsino] DROP CONSTRAINT [TbHistoricoAproveitamento] GO 
	
	ALTER TABLE [FK_TbHistoricoEnsinoSuperior_TbDisciplina].[TbDisciplina] DROP CONSTRAINT [TbHistoricoEnsinoSuperior] GO 
	
	ALTER TABLE [FK_TbHistoricoEnsinoSuperior_TbAlunoCursoSuperior].[TbAlunoCursoSuperior] DROP CONSTRAINT [TbHistoricoEnsinoSuperior] GO 
	
	ALTER TABLE [FK_TbHistoricoEnsinoSuperior_TbPeriodo].[TbPeriodo] DROP CONSTRAINT [TbHistoricoEnsinoSuperior] GO 
	
	ALTER TABLE [FK_TbHistoricoEnsinoSuperior_TbEstabelecimentoEnsino].[TbEstabelecimentoEnsino] DROP CONSTRAINT [TbHistoricoEnsinoSuperior] GO 
	
	ALTER TABLE [FK_TbHistoricoNotas_TbDisciplina].[TbDisciplina] DROP CONSTRAINT [TbHistoricoNotas] GO 
	
	ALTER TABLE [FK_TbHistoricoNotas_TbHistorico].[TbHistorico] DROP CONSTRAINT [TbHistoricoNotas] GO 
	
	ALTER TABLE [FK_TbHistoricoNotas_TbHistorico].[TbHistorico] DROP CONSTRAINT [TbHistoricoNotas] GO 
	
	ALTER TABLE [FK_TbHistoricoNotas_TbHistorico].[TbHistorico] DROP CONSTRAINT [TbHistoricoNotas] GO 
	
	ALTER TABLE [FK_TbInformativo_TbUnidade].[TbUnidade] DROP CONSTRAINT [TbInformativo] GO 
	
	ALTER TABLE [FK_TbInformativoTurma_TbTurma].[TbTurma] DROP CONSTRAINT [TbInformativoTurma] GO 
	
	ALTER TABLE [FK_TbInformativoTurma_TbInformativo].[TbInformativo] DROP CONSTRAINT [TbInformativoTurma] GO 
	
	ALTER TABLE [FK_TbIntegracaoComercialFaturas_TbIntegracaoComercial].[TbIntegracaoComercial] DROP CONSTRAINT [tbIntegracaoComercialFaturas] GO 
	
	ALTER TABLE [FK_TbIntegracaoComercialItens_TbIntegracaoComercial].[TbIntegracaoComercial] DROP CONSTRAINT [TbIntegracaoComercialItens] GO 
	
	ALTER TABLE [FK_TbLancamentoCobranca_TbLoteCobranca].[TbLoteCobranca] DROP CONSTRAINT [TbLancamentoCobranca] GO 
	
	ALTER TABLE [FK_TbLancamentoCobranca_TbNotaFiscal].[TbNotaFiscal] DROP CONSTRAINT [TbLancamentoCobranca] GO 
	
	ALTER TABLE [FK_TbLancamentoCobranca_LIQ_IdContaDevolucao].[TbConta] DROP CONSTRAINT [TbLancamentoCobranca] GO 
	
	ALTER TABLE [FK_TbLancamnetoCobranca_TbDisciplina].[TbDisciplina] DROP CONSTRAINT [TbLancamentoCobranca] GO 
	
	ALTER TABLE [FK_TbLancamentoCobranca_TbAlunoServico].[TbAlunoServico] DROP CONSTRAINT [TbLancamentoCobranca] GO 
	
	ALTER TABLE [FK_TbLancamentoCobranca_TbAlunoTurmaReserva].[TbAlunoTurmaReserva] DROP CONSTRAINT [TbLancamentoCobranca] GO 
	
	ALTER TABLE [FK_TbLancamentoCobranca_TbLoteCobrancaServico].[TbLoteCobrancaServico] DROP CONSTRAINT [TbLancamentoCobranca] GO 
	
	ALTER TABLE [FK_TbLancamentoCobranca_TbLoteCobrancaServico].[TbLoteCobrancaServico] DROP CONSTRAINT [TbLancamentoCobranca] GO 
	
	ALTER TABLE [FK_TbLancamentoCobranca_TbServico].[TbServico] DROP CONSTRAINT [TbLancamentoCobranca] GO 
	
	ALTER TABLE [FK_TbLancamentoCobranca_TbTurma].[TbTurma] DROP CONSTRAINT [TbLancamentoCobranca] GO 
	
	ALTER TABLE [FK_TbLancamentoCobranca_TbTituloCobranca].[TbTituloCobranca] DROP CONSTRAINT [TbLancamentoCobranca] GO 
	
	ALTER TABLE [FK_TbLancamentoCobranca_TbAlunoTaxa].[TbAlunoTaxa] DROP CONSTRAINT [TbLancamentoCobranca] GO 
	
	ALTER TABLE [FK_TbLancamentoCobranca_TbEmpresa].[TbEmpresa] DROP CONSTRAINT [TbLancamentoCobranca] GO 
	
	ALTER TABLE [FK_TbLancamentoCobranca_Persistido_TbLancamentoCobranca].[TbLancamentoCobranca] DROP CONSTRAINT [TbLancamentoCobranca_Persistido] GO 
	
	ALTER TABLE [FK_TbLancamentoCobrancaDesconto_TbLancamentoCobranca].[TbLancamentoCobranca] DROP CONSTRAINT [TbLancamentoCobrancaDesconto] GO 
	
	ALTER TABLE [FK_TbLancamentoCobrancaDesconto_TbAbatimento].[TbAbatimento] DROP CONSTRAINT [TbLancamentoCobrancaDesconto] GO 
	
	ALTER TABLE [FK_TbLancamentoCobrancaRecebimento_TbCaixaTipoRecebimento].[TbCaixaTipoRecebimento] DROP CONSTRAINT [TbLancamentoCobrancaRecebimento] GO 
	
	ALTER TABLE [FK_TbLancamentoCobrancaRecebimento_TbLancamentoCobranca].[TbLancamentoCobranca] DROP CONSTRAINT [TbLancamentoCobrancaRecebimento] GO 
	
	ALTER TABLE [FK_TbLancamentoFinanceiro_TbHistoricoPadrao_IdComentarioPadrao].[TbHistoricoPadrao] DROP CONSTRAINT [TbLancamentoFinanceiro] GO 
	
	ALTER TABLE [FK_TbLancamentoFinanceiro_TbConta].[TbConta] DROP CONSTRAINT [TbLancamentoFinanceiro] GO 
	
	ALTER TABLE [FK_TbLancamentoFinanceiro_TbFavorecido].[TbFavorecido] DROP CONSTRAINT [TbLancamentoFinanceiro] GO 
	
	ALTER TABLE [FK_TbLancamentoFinanceiro_TbLancamentoFinanceiroTransferencia].[TbLancamentoFinanceiroTransferencia] DROP CONSTRAINT [TbLancamentoFinanceiro] GO 
	
	ALTER TABLE [FK_TbLancamentoFinanceiroRateio_TbLancamentoFinanceiro].[TbLancamentoFinanceiro] DROP CONSTRAINT [TbLancamentoFinanceiroRateio] GO 
	
	ALTER TABLE [FK_TbLancamentoFinanceiroRateio_TbPlanoContas].[TbPlanoContas] DROP CONSTRAINT [TbLancamentoFinanceiroRateio] GO 
	
	ALTER TABLE [FK_TbLancamentoFinanceiroRateio_TbCentroResultado].[TbCentroResultado] DROP CONSTRAINT [TbLancamentoFinanceiroRateio] GO 
	
	ALTER TABLE [FK_TbLancamentoFinanceiroRateio_TbEmpresa].[TbEmpresa] DROP CONSTRAINT [TbLancamentoFinanceiroRateio] GO 
	
	ALTER TABLE [FK_TbLancamentoFinanceiroTransferencia_TbConta_Saida].[TbConta] DROP CONSTRAINT [TbLancamentoFinanceiroTransferencia] GO 
	
	ALTER TABLE [FK_TbLancamentoFinanceiroTransferencia_TbConta_Entrada].[TbConta] DROP CONSTRAINT [TbLancamentoFinanceiroTransferencia] GO 
	
	ALTER TABLE [FK_TbLoteCobranca_TbParcelaCobranca].[TbParcelaCobranca] DROP CONSTRAINT [TbLoteCobranca] GO 
	
	ALTER TABLE [FK_TbLoteCobranca_TbParcelaCobranca].[TbParcelaCobranca] DROP CONSTRAINT [TbLoteCobranca] GO 
	
	ALTER TABLE [FK_TbLoteCobranca_TbServico].[TbServico] DROP CONSTRAINT [TbLoteCobranca] GO 
	
	ALTER TABLE [FK_TbLoteCobrancaRegistrada_TbAgenteCobranca].[TbAgenteCobranca] DROP CONSTRAINT [TbLoteCobrancaRegistrada] GO 
	
	ALTER TABLE [FK_TbLoteCobrancaRegistrada_TbUsuario].[TbUsuario] DROP CONSTRAINT [TbLoteCobrancaRegistrada] GO 
	
	ALTER TABLE [FK_TbLoteCobrancaRegistradaArquivoRemessa_TbUsuario].[TbUsuario] DROP CONSTRAINT [TbLoteCobrancaRegistradaArquivoRemessa] GO 
	
	ALTER TABLE [FK_TbLoteCobrancaRegistradaTitulo_TbTituloCobranca].[TbTituloCobranca] DROP CONSTRAINT [TbLoteCobrancaRegistradaTitulo] GO 
	
	ALTER TABLE [FK_TbLoteCobrancaRegistradaTitulo_TbLoteCobrancaRegistrada].[TbLoteCobrancaRegistrada] DROP CONSTRAINT [TbLoteCobrancaRegistradaTitulo] GO 
	
	ALTER TABLE [FK_TbLoteCobrancaServico_TbLoteCobranca].[TbLoteCobranca] DROP CONSTRAINT [TbLoteCobrancaServico] GO 
	
	ALTER TABLE [FK_TbLoteCobrancaServico_TbServico].[TbServico] DROP CONSTRAINT [TbLoteCobrancaServico] GO 
	
	ALTER TABLE [FK_TbMensagemCaixaSaida_TbUsuario].[TbUsuario] DROP CONSTRAINT [TbMensagemCaixaSaida] GO 
	
	ALTER TABLE [FK_TbMeta_TbMetaFaseNota].[TbMetaFaseNota] DROP CONSTRAINT [TbMeta] GO 
	
	ALTER TABLE [FK_TbMeta_TbDisciplina].[TbDisciplina] DROP CONSTRAINT [TbMeta] GO 
	
	ALTER TABLE [FK_TbMeta_TbTipoMeta].[TbTipoMeta] DROP CONSTRAINT [TbMeta] GO 
	
	ALTER TABLE [FK_TbMetaConceito_Periodo].[TbPeriodo] DROP CONSTRAINT [TbMetaConceito] GO 
	
	ALTER TABLE [FK_TbMetaConceito_Serie].[TbSerie] DROP CONSTRAINT [TbMetaConceito] GO 
	
	ALTER TABLE [FK_TbMetaFaseNota_TbSerie].[TbSerie] DROP CONSTRAINT [TbMetaFaseNota] GO 
	
	ALTER TABLE [FK_TbMetaFaseNota_TbPeriodo].[TbPeriodo] DROP CONSTRAINT [TbMetaFaseNota] GO 
	
	ALTER TABLE [FK_TbMetaFaseNotaAluno_TbMetaConceito].[TbMetaConceito] DROP CONSTRAINT [TbMetaFaseNotaAluno] GO 
	
	ALTER TABLE [FK_TbMetaFaseNotaAluno_TbMeta].[TbMeta] DROP CONSTRAINT [TbMetaFaseNotaAluno] GO 
	
	ALTER TABLE [FK_TbMetaFaseNotaAluno_TbAlunoTurma].[TbAlunoTurma] DROP CONSTRAINT [TbMetaFaseNotaAluno] GO 
	
	ALTER TABLE [FK_TbMetaFaseNotaAluno_TbAlunoTurma].[TbAlunoTurma] DROP CONSTRAINT [TbMetaFaseNotaAluno] GO 
	
	ALTER TABLE [FK_TbMetaFaseNotaAlunoRegistro_TbAluno].[TbAluno] DROP CONSTRAINT [TbMetaFaseNotaAlunoRegistro] GO 
	
	ALTER TABLE [FK_TbMetaFaseNotaAlunoRegistro_TbTurma].[TbTurma] DROP CONSTRAINT [TbMetaFaseNotaAlunoRegistro] GO 
	
	ALTER TABLE [FK_TbMetaFaseNotaAlunoRegistro_TbMetaFaseNota].[TbMetaFaseNota] DROP CONSTRAINT [TbMetaFaseNotaAlunoRegistro] GO 
	
	ALTER TABLE [FK_TbMetaSituacaoAlunoDisciplina_TbDisciplina].[TbDisciplina] DROP CONSTRAINT [TbMetaSituacaoAlunoDisciplina] GO 
	
	ALTER TABLE [FK_TbMobileMensagem_TbMobileTipoMensagem].[TbMobileTipoMensagem] DROP CONSTRAINT [TbMobileMensagem] GO 
	
	ALTER TABLE [FK_TbMobileTipoMensagemUsuario_TbMobileTipoMensagem].[TbMobileTipoMensagem] DROP CONSTRAINT [TbMobileTipoMensagemUsuario] GO 
	
	ALTER TABLE [FK_TbMobileTipoMensagemUsuario_TbUsuario].[TbUsuario] DROP CONSTRAINT [TbMobileTipoMensagemUsuario] GO 
	
	ALTER TABLE [FK_TbModeloContrato_TbProfessor].[TbProfessor] DROP CONSTRAINT [TbModeloContrato] GO 
	
	ALTER TABLE [FK_TbModeloContrato_TbProfessor1].[TbProfessor] DROP CONSTRAINT [TbModeloContrato] GO 
	
	ALTER TABLE [FK_TbModeloContrato_TbProfessor2].[TbProfessor] DROP CONSTRAINT [TbModeloContrato] GO 
	
	ALTER TABLE [FK_TbModeloContrato_TbPeriodo].[TbPeriodo] DROP CONSTRAINT [TbModeloContrato] GO 
	
	ALTER TABLE [FK_TbNegociacao_TbAluno].[TbAluno] DROP CONSTRAINT [TbNegociacao] GO 
	
	ALTER TABLE [FK_TbNegociacao_TbUsuario].[TbUsuario] DROP CONSTRAINT [TbNegociacao] GO 
	
	ALTER TABLE [FK_TbNegociacaoItem_TbTituloCobranca].[TbTituloCobranca] DROP CONSTRAINT [TbNegociacaoItem] GO 
	
	ALTER TABLE [FK_TbNegociacaoItem_TbNegociacao].[TbNegociacao] DROP CONSTRAINT [TbNegociacaoItem] GO 
	
	ALTER TABLE [FK_TbNotaConceito_TbUnidade].[TbUnidade] DROP CONSTRAINT [TbNotaConceito] GO 
	
	ALTER TABLE [FK_TbNotaConceito_TbPeriodo].[TbPeriodo] DROP CONSTRAINT [TbNotaConceito] GO 
	
	ALTER TABLE [FK_TbNotaConceito_TbSerie].[TbSerie] DROP CONSTRAINT [TbNotaConceito] GO 
	
	ALTER TABLE [FK_TbNotaFiscal_TbNotaFiscalLote].[TbNotaFiscalLote] DROP CONSTRAINT [TbNotaFiscal] GO 
	
	ALTER TABLE [FK_TbNotaFiscalCodigoVerificacaoRPS_TbNotaFiscal].[TbNotaFiscal] DROP CONSTRAINT [TbNotaFiscalCodigoVerificacaoRPS] GO 
	
	ALTER TABLE [FK_TbNotaFiscalLote_TbNotaFiscalLote_OrigemDivisao].[TbNotaFiscalLote] DROP CONSTRAINT [TbNotaFiscalLote] GO 
	
	ALTER TABLE [FK_TbNotaFiscalLote_TbEmpresa].[TbEmpresa] DROP CONSTRAINT [TbNotaFiscalLote] GO 
	
	ALTER TABLE [FK_TbNotaFiscalLote_TbUsuario].[TbUsuario] DROP CONSTRAINT [TbNotaFiscalLote] GO 
	
	ALTER TABLE [FK_TbOptProva_TbSerie].[TbSerie] DROP CONSTRAINT [TbOptProva] GO 
	
	ALTER TABLE [FK_TbOptProva_TbFaseNota].[TbFaseNota] DROP CONSTRAINT [TbOptProva] GO 
	
	ALTER TABLE [FK_TbOptProva_TbPeriodo].[TbPeriodo] DROP CONSTRAINT [TbOptProva] GO 
	
	ALTER TABLE [FK_TbOptProva_TbUsuario].[TbUsuario] DROP CONSTRAINT [TbOptProva] GO 
	
	ALTER TABLE [FK_TbOptProvaAlunoTurma_TbOptProva].[TbOptProva] DROP CONSTRAINT [TbOptProvaAlunoTurma] GO 
	
	ALTER TABLE [FK_TbOptProvaAlunoTurma_TbAluno].[TbAluno] DROP CONSTRAINT [TbOptProvaAlunoTurma] GO 
	
	ALTER TABLE [FK_TbOptProvaAlunoTurma_TbTurma].[TbTurma] DROP CONSTRAINT [TbOptProvaAlunoTurma] GO 
	
	ALTER TABLE [FK__TbOptProv__IdPro__043C47BD].[TbOptProva] DROP CONSTRAINT [TbOptProvaGabarito] GO 
	
	ALTER TABLE [FK_TbOptProvaGabarito_TbDisciplina02].[TbDisciplina] DROP CONSTRAINT [TbOptProvaGabarito] GO 
	
	ALTER TABLE [FK_TbOptProvaGabarito_TbDisciplina03].[TbDisciplina] DROP CONSTRAINT [TbOptProvaGabarito] GO 
	
	ALTER TABLE [FK_TbOptProvaGabarito_TbDisciplina04].[TbDisciplina] DROP CONSTRAINT [TbOptProvaGabarito] GO 
	
	ALTER TABLE [FK_TbOptProvaGabarito_TbDisciplina05].[TbDisciplina] DROP CONSTRAINT [TbOptProvaGabarito] GO 
	
	ALTER TABLE [FK_TbOptProvaGabarito_TbDisciplina06].[TbDisciplina] DROP CONSTRAINT [TbOptProvaGabarito] GO 
	
	ALTER TABLE [FK_TbOptProvaGabarito_TbDisciplina07].[TbDisciplina] DROP CONSTRAINT [TbOptProvaGabarito] GO 
	
	ALTER TABLE [FK_TbOptProvaGabarito_TbDisciplina08].[TbDisciplina] DROP CONSTRAINT [TbOptProvaGabarito] GO 
	
	ALTER TABLE [FK_TbOptProvaGabarito_TbDisciplina09].[TbDisciplina] DROP CONSTRAINT [TbOptProvaGabarito] GO 
	
	ALTER TABLE [FK_TbOptProvaGabarito_TbDisciplina10].[TbDisciplina] DROP CONSTRAINT [TbOptProvaGabarito] GO 
	
	ALTER TABLE [FK__TbOptProv__IdDis__03482384].[TbDisciplina] DROP CONSTRAINT [TbOptProvaGabarito] GO 
	
	ALTER TABLE [FK_TbOptProvaGabarito_TbDisciplina11].[TbDisciplina] DROP CONSTRAINT [TbOptProvaGabarito] GO 
	
	ALTER TABLE [FK_TbOptProvaGabarito_TbDisciplina12].[TbDisciplina] DROP CONSTRAINT [TbOptProvaGabarito] GO 
	
	ALTER TABLE [FK_TbOptProvaGabarito_TbDisciplina13].[TbDisciplina] DROP CONSTRAINT [TbOptProvaGabarito] GO 
	
	ALTER TABLE [FK_TbOptProvaGabarito_TbDisciplina14].[TbDisciplina] DROP CONSTRAINT [TbOptProvaGabarito] GO 
	
	ALTER TABLE [FK_TbOptProvaGabarito_TbDisciplina15].[TbDisciplina] DROP CONSTRAINT [TbOptProvaGabarito] GO 
	
	ALTER TABLE [FK_TbOptProvaResposta_TbOptProvaGabarito].[TbOptProvaGabarito] DROP CONSTRAINT [TbOptProvaResposta] GO 
	
	ALTER TABLE [FK_TbOptProvaResposta_TbOptProvaGabarito].[TbOptProvaGabarito] DROP CONSTRAINT [TbOptProvaResposta] GO 
	
	ALTER TABLE [FK_TbOptProvaResposta_TbOptProvaAlunoTurma].[TbOptProvaAlunoTurma] DROP CONSTRAINT [TbOptProvaResposta] GO 
	
	ALTER TABLE [FK_TbOptProvaResposta_TbOptProvaAlunoTurma].[TbOptProvaAlunoTurma] DROP CONSTRAINT [TbOptProvaResposta] GO 
	
	ALTER TABLE [FK_TbOptProvaResposta_TbOptProvaAlunoTurma].[TbOptProvaAlunoTurma] DROP CONSTRAINT [TbOptProvaResposta] GO 
	
	ALTER TABLE [FK_TbOptSimuladoEnem_TbFaseNota_IdFaseNota].[TbFaseNota] DROP CONSTRAINT [TbOptSimuladoEnem] GO 
	
	ALTER TABLE [FK_TbOptSimuladoEnem_TbOptProva_IdProvaCHumanas].[TbOptProva] DROP CONSTRAINT [TbOptSimuladoEnem] GO 
	
	ALTER TABLE [FK_TbOptSimuladoEnem_TbOptProva_IdProvaCBiomedicas].[TbOptProva] DROP CONSTRAINT [TbOptSimuladoEnem] GO 
	
	ALTER TABLE [FK_TbOptSimuladoEnem_TbOptProva_IdProvaLinguagens].[TbOptProva] DROP CONSTRAINT [TbOptSimuladoEnem] GO 
	
	ALTER TABLE [FK_TbOptSimuladoEnem_TbOptProva_IdProvaMatematica].[TbOptProva] DROP CONSTRAINT [TbOptSimuladoEnem] GO 
	
	ALTER TABLE [FK_TbOptSimuladoEnem_TbDisciplina_IdDisciplinaRedacao].[TbDisciplina] DROP CONSTRAINT [TbOptSimuladoEnem] GO 
	
	ALTER TABLE [FK_TbOrcOrcamento_TbCentroResultado].[TbCentroResultado] DROP CONSTRAINT [TbOrcOrcamento] GO 
	
	ALTER TABLE [FK_TbOrcOrcamento_TbEmpresa].[TbEmpresa] DROP CONSTRAINT [TbOrcOrcamento] GO 
	
	ALTER TABLE [FK_TbOrcOrcamento_TbOrcCenario].[TbOrcCenario] DROP CONSTRAINT [TbOrcOrcamento] GO 
	
	ALTER TABLE [FK_TbOrcOrcamento_TbPlanoContas].[TbPlanoContas] DROP CONSTRAINT [TbOrcOrcamento] GO 
	
	ALTER TABLE [FK_TbPagamento_TbPagamentoLote].[TbPagamentoLote] DROP CONSTRAINT [TbPagamento] GO 
	
	ALTER TABLE [FK_TbPagamentoArquivoRetorno_TbUsuario].[TbUsuario] DROP CONSTRAINT [TbPagamentoLote] GO 
	
	ALTER TABLE [FK_TbPagamentoLote_TbFormaRecebimento].[TbFormaRecebimento] DROP CONSTRAINT [TbPagamentoLote] GO 
	
	ALTER TABLE [FK_TbPagamentoLote_TbConta].[TbConta] DROP CONSTRAINT [TbPagamentoLote] GO 
	
	ALTER TABLE [FK_TbPagamentoOnline_TbTituloCobranca].[TbTituloCobranca] DROP CONSTRAINT [TbPagamentoOnline] GO 
	
	ALTER TABLE [FK_TbPagamentoOnlineSituacao_TbPagamentoOnline].[TbPagamentoOnline] DROP CONSTRAINT [TbPagamentoOnlineSituacao] GO 
	
	ALTER TABLE [FK_TbPagamentoTituloRelacionado_TbTituloCobranca].[TbTituloCobranca] DROP CONSTRAINT [TbPagamentoTituloRelacionado] GO 
	
	ALTER TABLE [FK_TbPagamentoTituloRelacionado_TbPagamento].[TbPagamento] DROP CONSTRAINT [TbPagamentoTituloRelacionado] GO 
	
	ALTER TABLE [FK_TbDocumentoSignatario_TbUnidade].[TbUnidade] DROP CONSTRAINT [TbParametroAssinaturaEletronica] GO 
	
	ALTER TABLE [FK_TbModeloContrato_TbSituacaoAlunoTurma].[TbSituacaoAlunoTurma] DROP CONSTRAINT [TbParametroAssinaturaEletronica] GO 
	
	ALTER TABLE [FK_TbParametroControleAcessoCartaoMestre_TbResponsavel].[TbResponsavel] DROP CONSTRAINT [TbParametroControleAcessoCartaoMestre] GO 
	
	ALTER TABLE [FK_TbParametroCPR_TbConta_EstornoManualLiquidacao].[TbConta] DROP CONSTRAINT [TbParametroCPR] GO 
	
	ALTER TABLE [FK_TbParametroCPR_TbChequeCustodia].[TbChequeCustodia] DROP CONSTRAINT [TbParametroCPR] GO 
	
	ALTER TABLE [FK_TbParametroCPR_TbConta_TransitoriaRecebimentoAMaior].[TbConta] DROP CONSTRAINT [TbParametroCPR] GO 
	
	ALTER TABLE [FK_TbParametroCPR_TbFavorecido].[TbFavorecido] DROP CONSTRAINT [TbParametroCPR] GO 
	
	ALTER TABLE [FK_TbParametroCPR_TbCentroResultado].[TbCentroResultado] DROP CONSTRAINT [TbParametroCPR] GO 
	
	ALTER TABLE [FK_TbParametroCPR_TbPlanoContasReceberMulta].[TbPlanoContas] DROP CONSTRAINT [TbParametroCPR] GO 
	
	ALTER TABLE [FK_TbParametroCPR_TbPlanoContasReceberJuros].[TbPlanoContas] DROP CONSTRAINT [TbParametroCPR] GO 
	
	ALTER TABLE [FK_TbParametroCPR_TbPlanoContasReceberDesconto].[TbPlanoContas] DROP CONSTRAINT [TbParametroCPR] GO 
	
	ALTER TABLE [FK_TbParametroCPR_TbPlanoContasReceberAMaior].[TbPlanoContas] DROP CONSTRAINT [TbParametroCPR] GO 
	
	ALTER TABLE [FK_TbParametroCPR_TbPlanoContasReceberNaoIdentificado].[TbPlanoContas] DROP CONSTRAINT [TbParametroCPR] GO 
	
	ALTER TABLE [FK_TbParametroCPR_TbPlanoContasReceberTarifaCobrancaBoleto].[TbPlanoContas] DROP CONSTRAINT [TbParametroCPR] GO 
	
	ALTER TABLE [FK_TbParametroCPR_TbPlanoContasPagarMulta].[TbPlanoContas] DROP CONSTRAINT [TbParametroCPR] GO 
	
	ALTER TABLE [FK_TbParametroCPR_TbPlanoContasPagarJuros].[TbPlanoContas] DROP CONSTRAINT [TbParametroCPR] GO 
	
	ALTER TABLE [FK_TbParametroCPR_TbPlanoContasPagarDesconto].[TbPlanoContas] DROP CONSTRAINT [TbParametroCPR] GO 
	
	ALTER TABLE [FK_TbParametroEnsinoSuperior_TbTipoSituacaoAlunoDisciplina].[TbTipoSituacaoAlunoDisciplina] DROP CONSTRAINT [TbParametroEnsinoSuperior] GO 
	
	ALTER TABLE [FK_TbParametroEnsinoSuperior_TbSituacaoAlunoCurso_Cursando].[TbSituacaoAlunoCurso] DROP CONSTRAINT [TbParametroEnsinoSuperior] GO 
	
	ALTER TABLE [FK_TbParametroEnsinoSuperior_TbTipoSituacaoAlunoDisciplina_Ativacao].[TbTipoSituacaoAlunoDisciplina] DROP CONSTRAINT [TbParametroEnsinoSuperior] GO 
	
	ALTER TABLE [FK_TbParametroEnsinoSuperiorFIES_TbAbatimento].[TbAbatimento] DROP CONSTRAINT [TbParametroEnsinoSuperiorFIES] GO 
	
	ALTER TABLE [FK_TbParametroEnsinoSuperiorFIES_TbConta].[TbConta] DROP CONSTRAINT [TbParametroEnsinoSuperiorFIES] GO 
	
	ALTER TABLE [FK_TbParametroEnsinoSuperiorFIES_TbEmpresa].[TbEmpresa] DROP CONSTRAINT [TbParametroEnsinoSuperiorFIES] GO 
	
	ALTER TABLE [FK_TbParametroEnsinoSuperiorFIES_TbFavorecido].[TbFavorecido] DROP CONSTRAINT [TbParametroEnsinoSuperiorFIES] GO 
	
	ALTER TABLE [FK_TbParametroEnsinoSuperiorFIES_TbPlanoContasFGEduc].[TbPlanoContas] DROP CONSTRAINT [TbParametroEnsinoSuperiorFIES] GO 
	
	ALTER TABLE [FK_TbParametroEnsinoSuperiorFIES_TbPlanoContasFIES].[TbPlanoContas] DROP CONSTRAINT [TbParametroEnsinoSuperiorFIES] GO 
	
	ALTER TABLE [FK_TbParametroGlobal_TbFormaRecebimento].[TbFormaRecebimento] DROP CONSTRAINT [TbParametroGlobal] GO 
	
	ALTER TABLE [FK_TbParametroGlobal_IdContaTesourariaCaixaPagamentoRapido].[TbConta] DROP CONSTRAINT [TbParametroGlobal] GO 
	
	ALTER TABLE [FK_TbParametroGlobal_IdConta_RetiradaAutomatica].[TbConta] DROP CONSTRAINT [TbParametroGlobal] GO 
	
	ALTER TABLE [FK_TbParametroGlobal_IdChequeCustodia_RetiradaAutomatica].[TbChequeCustodia] DROP CONSTRAINT [TbParametroGlobal] GO 
	
	ALTER TABLE [FK_TbParametroInternet_TbSolicitacaoTipo].[TbSolicitacaoTipo] DROP CONSTRAINT [TbParametroInternet] GO 
	
	ALTER TABLE [FK_TbParametroInternet_TbSolicitacaoTipo1].[TbSolicitacaoTipo] DROP CONSTRAINT [TbParametroInternet] GO 
	
	ALTER TABLE [FK_TbParametroInternet_TbSolicitacaoTipo2].[TbSolicitacaoTipo] DROP CONSTRAINT [TbParametroInternet] GO 
	
	ALTER TABLE [FK_TbParametroInternet_TbPeriodo_ReservaMatriculaOnline].[TbPeriodo] DROP CONSTRAINT [TbParametroInternet] GO 
	
	ALTER TABLE [FK_TbParametroInternet_InscrEvento_IdSituacaoAlunoTurmaParticipante].[TbSituacaoAlunoTurma] DROP CONSTRAINT [TbParametroInternet] GO 
	
	ALTER TABLE [FK_TbParametroInternet_TbSituacaoSolicitacaoDesconto_AguardandoDocumento].[TbSituacaoSolicitacaoDesconto] DROP CONSTRAINT [TbParametroInternet] GO 
	
	ALTER TABLE [FK_TbParametroInternet_TbSituacaoSolicitacaoDesconto_AnalisePedente].[TbSituacaoSolicitacaoDesconto] DROP CONSTRAINT [TbParametroInternet] GO 
	
	ALTER TABLE [FK_TbParametroInternet_InscrTurma_IdTextoPersonalizadoComVaga].[TbTextoPersonalizado] DROP CONSTRAINT [TbParametroInternet] GO 
	
	ALTER TABLE [FK_TbParametroInternet_InscrTurma_IdTextoPersonalizadoSemVaga].[TbTextoPersonalizado] DROP CONSTRAINT [TbParametroInternet] GO 
	
	ALTER TABLE [FK_TbParametroInternet_TbPeriodo_InscrTurma].[TbPeriodo] DROP CONSTRAINT [TbParametroInternet] GO 
	
	ALTER TABLE [FK_TbParametroInternet_InscrTurma_IdTipoImpedimento].[TbTipoImpedimento] DROP CONSTRAINT [TbParametroInternet] GO 
	
	ALTER TABLE [FK_TbParametroInternet_TbPeriodo1].[TbPeriodo] DROP CONSTRAINT [TbParametroInternet] GO 
	
	ALTER TABLE [FK_TbParametroInternet_FInscr_TbSituacaoAlunoTurma].[TbSituacaoAlunoTurma] DROP CONSTRAINT [TbParametroInternet] GO 
	
	ALTER TABLE [FK_TbParametroInternet_TbPeriodo].[TbPeriodo] DROP CONSTRAINT [TbParametroInternet] GO 
	
	ALTER TABLE [FK_TbParametroInternet_FInscr_TbTextoPersonalizado].[TbTextoPersonalizado] DROP CONSTRAINT [TbParametroInternet] GO 
	
	ALTER TABLE [FK_TbParametroInternet_InscrTurma_IdSituacaoAlunoTurmaComVaga].[TbSituacaoAlunoTurma] DROP CONSTRAINT [TbParametroInternet] GO 
	
	ALTER TABLE [FK_TbParametroInternet_InscrTurma_IdSituacaoAlunoTurmaSemVaga].[TbSituacaoAlunoTurma] DROP CONSTRAINT [TbParametroInternet] GO 
	
	ALTER TABLE [FK_TbParametroInternet_InscrTurma_Remover].[TbTextoPersonalizado] DROP CONSTRAINT [TbParametroInternet] GO 
	
	ALTER TABLE [FK_TbParametroInternet_TbPeriodo_Agendamento].[TbPeriodo] DROP CONSTRAINT [TbParametroInternet] GO 
	
	ALTER TABLE [FK_TbParametroInternet_RMOnLine_TbSituacaoAlunoTurma].[TbSituacaoAlunoTurma] DROP CONSTRAINT [TbParametroInternet] GO 
	
	ALTER TABLE [FK_TbParametroInternet_RMOnLine_TbTextoPersonalizado].[TbTextoPersonalizado] DROP CONSTRAINT [TbParametroInternet] GO 
	
	ALTER TABLE [FK_TbParametroNotaFiscal_TbEmpresa].[TbEmpresa] DROP CONSTRAINT [TbParametroNotaFiscal] GO 
	
	ALTER TABLE [FK_TbParametroRCartao_TbPlanoContas].[TbPlanoContas] DROP CONSTRAINT [TbParametroRCartao] GO 
	
	ALTER TABLE [FK_TbParcelaCobranca_TbUnidade].[TbUnidade] DROP CONSTRAINT [TbParcelaCobranca] GO 
	
	ALTER TABLE [FK_TbPeriodo_TbPeriodo].[TbPeriodo] DROP CONSTRAINT [TbPeriodo] GO 
	
	ALTER TABLE [FK_TbPeriodo_TbSerie].[TbSerie] DROP CONSTRAINT [TbPeriodo] GO 
	
	ALTER TABLE [FK_TbPesquisaNPS_TbUsuario].[TbUsuario] DROP CONSTRAINT [TbPesquisaNPS] GO 
	
	ALTER TABLE [FK_TbPlanoContas_TbPlanoContas].[TbPlanoContas] DROP CONSTRAINT [TbPlanoContas] GO 
	
	ALTER TABLE [FK_TbPlanoContas_TbUnidade].[TbUnidade] DROP CONSTRAINT [TbPlanoContas] GO 
	
	ALTER TABLE [FK_TbPlanoPagamento_TbPeriodo].[TbPeriodo] DROP CONSTRAINT [TbPlanoPagamento] GO 
	
	ALTER TABLE [FK_TbPlanoPagamentoParcela_TbFormaRecebimento].[TbFormaRecebimento] DROP CONSTRAINT [TbPlanoPagamentoParcela] GO 
	
	ALTER TABLE [FK_TbPlanoPagamentoParcela_TbPlanoPagamento].[TbPlanoPagamento] DROP CONSTRAINT [TbPlanoPagamentoParcela] GO 
	
	ALTER TABLE [FK_TbPlanoPagamentoParcela_TbTipoCalculoMultaJuros].[TbTipoCalculoMultaJuros] DROP CONSTRAINT [TbPlanoPagamentoParcela] GO 
	
	ALTER TABLE [FK_TbPlanoPagamentoParcelaLancamento_TbPlanoPagamentoParcela].[TbPlanoPagamentoParcela] DROP CONSTRAINT [TbPlanoPagamentoParcelaLancamento] GO 
	
	ALTER TABLE [FK_TbPlanoPagamentoParcelaLancamento_TbServico].[TbServico] DROP CONSTRAINT [TbPlanoPagamentoParcelaLancamento] GO 
	
	ALTER TABLE [FK_TbPlanoPagamentoParcelaLancamentoDesconto_TbAbatimento].[TbAbatimento] DROP CONSTRAINT [TbPlanoPagamentoParcelaLancamentoDesconto] GO 
	
	ALTER TABLE [FK_TbPlanoPagamentoParcelaLancamentoDesconto_TbPlanoPagamentoParcelaLancamento].[TbPlanoPagamentoParcelaLancamento] DROP CONSTRAINT [TbPlanoPagamentoParcelaLancamentoDesconto] GO 
	
	ALTER TABLE [FK_TbPlanoPagamentoServico_TbPlanoPagamento1].[TbPlanoPagamento] DROP CONSTRAINT [TbPlanoPagamentoServico] GO 
	
	ALTER TABLE [FK_TbPlanoPagamentoServico_TbServico].[TbServico] DROP CONSTRAINT [TbPlanoPagamentoServico] GO 
	
	ALTER TABLE [FK_TbPosTransacao_TbUnidade].[TbUnidade] DROP CONSTRAINT [TbPosTransacao] GO 
	
	ALTER TABLE [FK_TbPosTransacao_TbAutoAtendimentoTerminal].[TbAutoAtendimentoTerminal] DROP CONSTRAINT [TbPosTransacao] GO 
	
	ALTER TABLE [FK_TbPosTransacaoTituloCobranca_TbPosTransacao].[TbPosTransacao] DROP CONSTRAINT [TbPosTransacaoTituloCobranca] GO 
	
	ALTER TABLE [FK_TbPosTransacaoTituloCobranca_TbTituloCobranca].[TbTituloCobranca] DROP CONSTRAINT [TbPosTransacaoTituloCobranca] GO 
	
	ALTER TABLE [FK_TbProcedimentoMatricula_TbPeriodo].[TbPeriodo] DROP CONSTRAINT [TbProcedimentoMatricula] GO 
	
	ALTER TABLE [FK_TbProcedimentoMatricula_TbSerie].[TbSerie] DROP CONSTRAINT [TbProcedimentoMatricula] GO 
	
	ALTER TABLE [FK_TbProfessor_TbPais].[TbPais] DROP CONSTRAINT [TbProfessor] GO 
	
	ALTER TABLE [FK_TbProfessor_TbResponsavel_Pai].[TbResponsavel] DROP CONSTRAINT [TbProfessor] GO 
	
	ALTER TABLE [FK_TbProfessor_TbResponsavel_Mae].[TbResponsavel] DROP CONSTRAINT [TbProfessor] GO 
	
	ALTER TABLE [FK_TbProfessor_TbReligiao].[TbReligiao] DROP CONSTRAINT [TbProfessor] GO 
	
	ALTER TABLE [FK_TbProfessor_TbUnidade].[TbUnidade] DROP CONSTRAINT [TbProfessor] GO 
	
	ALTER TABLE [FK_TbProfessor_TbEndereco].[TbEndereco] DROP CONSTRAINT [TbProfessor] GO 
	
	ALTER TABLE [FK_TbProfessorDisciplina_TbDisciplina].[TbDisciplina] DROP CONSTRAINT [TbProfessorDisciplina] GO 
	
	ALTER TABLE [FK_TbProfessorDisciplina_TbProfessor].[TbProfessor] DROP CONSTRAINT [TbProfessorDisciplina] GO 
	
	ALTER TABLE [FK_TbProfessorEscolaridade_TbEstabelecimentoEnsino].[TbEstabelecimentoEnsino] DROP CONSTRAINT [TbProfessorEscolaridade] GO 
	
	ALTER TABLE [FK_TbProfessorEscolaridade_TbProfessor].[TbProfessor] DROP CONSTRAINT [TbProfessorEscolaridade] GO 
	
	ALTER TABLE [FK_TbProfessorFoto_TbProfessor].[TbProfessor] DROP CONSTRAINT [TbProfessorFoto] GO 
	
	ALTER TABLE [FK_TbProfessorHorario_TbProfessor].[TbProfessor] DROP CONSTRAINT [TbProfessorHorario] GO 
	
	ALTER TABLE [FK_TbProfessorHorario_TbPeriodo].[TbPeriodo] DROP CONSTRAINT [TbProfessorHorario] GO 
	
	ALTER TABLE [FK_TbProfessorImpressaoDigital_TbProfessor].[TbProfessor] DROP CONSTRAINT [TbProfessorImpressaoDigital] GO 
	
	ALTER TABLE [FK_TbProfessorObs_TbProfessor].[TbProfessor] DROP CONSTRAINT [TbProfessorObs] GO 
	
	ALTER TABLE [FK_TbProfessorObs_TbTipoOcorrencia].[TbTipoOcorrencia] DROP CONSTRAINT [TbProfessorObs] GO 
	
	ALTER TABLE [FK_TbProfessorObs_TbUsuario].[TbUsuario] DROP CONSTRAINT [TbProfessorObs] GO 
	
	ALTER TABLE [FK_TbProfessorVinculoInstituicao_TbProfessor].[TbProfessor] DROP CONSTRAINT [TbProfessorVinculoInstituicao] GO 
	
	ALTER TABLE [FK_TbProfessorVinculoInstituicao_TbSituacaoProfessorInstituicao].[TbSituacaoProfessorInstituicao] DROP CONSTRAINT [TbProfessorVinculoInstituicao] GO 
	
	ALTER TABLE [FK_TbRateioLancamento_TbRateioPagamento].[TbRateioPagamento] DROP CONSTRAINT [TbRateioLancamento] GO 
	
	ALTER TABLE [FK_TbRateioLancamento_TbRateioPessoa].[TbRateioPessoa] DROP CONSTRAINT [TbRateioLancamento] GO 
	
	ALTER TABLE [FK_TbRateioLancamento_TbLancamentoCobranca].[TbLancamentoCobranca] DROP CONSTRAINT [TbRateioLancamento] GO 
	
	ALTER TABLE [FK_TbRateioLancamentoCobranca_TbRateioPessoa].[TbRateioPessoa] DROP CONSTRAINT [TbRateioLancamentoCobranca] GO 
	
	ALTER TABLE [FK_TbRateioLancamentoCobranca_TbLancamentoCobranca].[TbLancamentoCobranca] DROP CONSTRAINT [TbRateioLancamentoCobranca] GO 
	
	ALTER TABLE [FK_TbRateioPagamento_TbUsuario].[TbUsuario] DROP CONSTRAINT [TbRateioPagamento] GO 
	
	ALTER TABLE [FK_TbRateioPagamento_TbRateioPessoa].[TbRateioPessoa] DROP CONSTRAINT [TbRateioPagamento] GO 
	
	ALTER TABLE [FK_TbRateioServico_TbRateioPessoa].[TbRateioPessoa] DROP CONSTRAINT [TbRateioServico] GO 
	
	ALTER TABLE [FK_TbRateioServico_TbServico].[TbServico] DROP CONSTRAINT [TbRateioServico] GO 
	
	ALTER TABLE [FK_TbRelatorioFuncionalidade_TbRelatorio].[TbRelatorio] DROP CONSTRAINT [TbRelatorioFuncionalidade] GO 
	
	ALTER TABLE [FK_TbRelatorioGrupo_TbGrupo].[TbGrupo] DROP CONSTRAINT [TbRelatorioGrupo] GO 
	
	ALTER TABLE [FK_TbRelatorioGrupo_TbRelatorio].[TbRelatorio] DROP CONSTRAINT [TbRelatorioGrupo] GO 
	
	ALTER TABLE [FK_TbRelatorioMatricula_TbRelatorio].[TbRelatorio] DROP CONSTRAINT [TbRelatorioMatricula] GO 
	
	ALTER TABLE [FK_TbRelatorioMatricula_TbPeriodo].[TbPeriodo] DROP CONSTRAINT [TbRelatorioMatricula] GO 
	
	ALTER TABLE [FK_TbRelatorioMatricula_TbSerie].[TbSerie] DROP CONSTRAINT [TbRelatorioMatricula] GO 
	
	ALTER TABLE [FK_TbRelatorioMatriculaCursoSuperior_TbPeriodo].[TbPeriodo] DROP CONSTRAINT [TbRelatorioMatriculaCursoSuperior] GO 
	
	ALTER TABLE [FK_TbRelatorioMatriculaCursoSuperior_TbRelatorio].[TbRelatorio] DROP CONSTRAINT [TbRelatorioMatriculaCursoSuperior] GO 
	
	ALTER TABLE [FK_TbRelatorioMatriculaCursoSuperior_TbCurso].[TbCurso] DROP CONSTRAINT [TbRelatorioMatriculaCursoSuperior] GO 
	
	ALTER TABLE [FK_TbResponsavel_TbResponsavel_Pai].[TbResponsavel] DROP CONSTRAINT [TbResponsavel] GO 
	
	ALTER TABLE [FK_TbResponsavel_TbResponsavel_Mae].[TbResponsavel] DROP CONSTRAINT [TbResponsavel] GO 
	
	ALTER TABLE [FK_TbResponsavel_TbUnidade].[TbUnidade] DROP CONSTRAINT [TbResponsavel] GO 
	
	ALTER TABLE [FK_TbResponsavel_TbProfissao].[TbProfissao] DROP CONSTRAINT [TbResponsavel] GO 
	
	ALTER TABLE [FK_TbResponsavel_TbReligiao].[TbReligiao] DROP CONSTRAINT [TbResponsavel] GO 
	
	ALTER TABLE [FK_TbResponsavel_TbFormaEntregaDocumento].[TbFormaEntregaDocumento] DROP CONSTRAINT [TbResponsavel] GO 
	
	ALTER TABLE [FK_TbResponsavel_TbFormaRecebimento].[TbFormaRecebimento] DROP CONSTRAINT [TbResponsavel] GO 
	
	ALTER TABLE [FK_TbResponsavel_TbBanco].[TbBanco] DROP CONSTRAINT [TbResponsavel] GO 
	
	ALTER TABLE [FK_TbResponsavel_TbEndereco].[TbEndereco] DROP CONSTRAINT [TbResponsavel] GO 
	
	ALTER TABLE [FK_TbResponsavelFoto_TbResponsavel].[TbResponsavel] DROP CONSTRAINT [TbResponsavelFoto] GO 
	
	ALTER TABLE [FK_TbResponsavelImpressaoDigital_TbResponsavel].[TbResponsavel] DROP CONSTRAINT [TbResponsavelImpressaoDigital] GO 
	
	ALTER TABLE [FK_TbResponsavelMobile_TbResponsavel].[TbResponsavel] DROP CONSTRAINT [TbResponsavelMobile] GO 
	
	ALTER TABLE [FK_TbResponsavelObs_TbAluno].[TbResponsavel] DROP CONSTRAINT [TbResponsavelObs] GO 
	
	ALTER TABLE [FK_TbResponsavelObs_TbTipoOcorrencia].[TbTipoOcorrencia] DROP CONSTRAINT [TbResponsavelObs] GO 
	
	ALTER TABLE [FK_TbResponsavelObs_TbUsuario_Registro].[TbUsuario] DROP CONSTRAINT [TbResponsavelObs] GO 
	
	ALTER TABLE [FK_TbResponsavelObs_TbUsuario_Liberacao].[TbUsuario] DROP CONSTRAINT [TbResponsavelObs] GO 
	
	ALTER TABLE [FK_TbSala_TbUnidade].[TbUnidade] DROP CONSTRAINT [TbSala] GO 
	
	ALTER TABLE [FK_TbSala_TbMensagemConfiguracaoContaSMTP].[TbMensagemConfiguracaoContaSMTP] DROP CONSTRAINT [TbSala] GO 
	
	ALTER TABLE [FK_TbSerie_TbSituacaoAlunoTurma1].[TbSituacaoAlunoTurma] DROP CONSTRAINT [TbSerie] GO 
	
	ALTER TABLE [FK_TbSerie_TbSituacaoAlunoTurma2].[TbSituacaoAlunoTurma] DROP CONSTRAINT [TbSerie] GO 
	
	ALTER TABLE [FK_TbSerie_TbSituacaoAlunoTurma3].[TbSituacaoAlunoTurma] DROP CONSTRAINT [TbSerie] GO 
	
	ALTER TABLE [FK_TbSerie_TbSituacaoAlunoTurma4].[TbSituacaoAlunoTurma] DROP CONSTRAINT [TbSerie] GO 
	
	ALTER TABLE [FK_TbSerie_TbServico_Reserva].[TbServico] DROP CONSTRAINT [TbSerie] GO 
	
	ALTER TABLE [FK_TbSerie_TbCurso].[TbCurso] DROP CONSTRAINT [TbSerie] GO 
	
	ALTER TABLE [FK_TbSerie_TbServico].[TbServico] DROP CONSTRAINT [TbSerie] GO 
	
	ALTER TABLE [FK_TbSerie_TbEstabelecimentoEnsino].[TbEstabelecimentoEnsino] DROP CONSTRAINT [TbSerie] GO 
	
	ALTER TABLE [FK_TbSerie_TbSerie].[TbSerie] DROP CONSTRAINT [TbSerie] GO 
	
	ALTER TABLE [FK_TbSerie_TbFormularioRotinaEducacaoInfantil].[TbFormularioRotinaEducacaoInfantil] DROP CONSTRAINT [TbSerie] GO 
	
	ALTER TABLE [FK_TbSerieGrupo_TbGrupo].[TbGrupo] DROP CONSTRAINT [TbSerieGrupo] GO 
	
	ALTER TABLE [FK_TbSerieGrupo_TbSerie].[TbSerie] DROP CONSTRAINT [TbSerieGrupo] GO 
	
	ALTER TABLE [FK_TbSeriePeriodo_TbTextoPersonalizado_AssinaturaDirecaoBoletimWeb].[TbTextoPersonalizado] DROP CONSTRAINT [TbSeriePeriodo] GO 
	
	ALTER TABLE [FK_TbSeriePeriodo_TbTextoPersonalizado_AssinaturaSecretariaBoletimWeb].[TbTextoPersonalizado] DROP CONSTRAINT [TbSeriePeriodo] GO 
	
	ALTER TABLE [FK_TbSeriePeriodo_TbTextoPersonalizado_AssinaturaCoordenacaoBoletimWeb].[TbTextoPersonalizado] DROP CONSTRAINT [TbSeriePeriodo] GO 
	
	ALTER TABLE [FK_TbSeriePeriodo_TbTextoPersonalizado_AssinaturaTesourariaBoletimWeb].[TbTextoPersonalizado] DROP CONSTRAINT [TbSeriePeriodo] GO 
	
	ALTER TABLE [FK_TbSeriePeriodo_TbPeriodo].[TbPeriodo] DROP CONSTRAINT [TbSeriePeriodo] GO 
	
	ALTER TABLE [FK_TbSeriePeriodo_TbSerie].[TbSerie] DROP CONSTRAINT [TbSeriePeriodo] GO 
	
	ALTER TABLE [FK_TbServico_TbFormaRecebimento].[TbFormaRecebimento] DROP CONSTRAINT [TbServico] GO 
	
	ALTER TABLE [FK_TbServico_TbEmpresa].[TbEmpresa] DROP CONSTRAINT [TbServico] GO 
	
	ALTER TABLE [FK_TbServico_TbCentroResultado].[TbCentroResultado] DROP CONSTRAINT [TbServico] GO 
	
	ALTER TABLE [FK_TbServico_TbPlanoContas].[TbPlanoContas] DROP CONSTRAINT [TbServico] GO 
	
	ALTER TABLE [FK_TbServicoAdicional_TbPeriodo].[TbPeriodo] DROP CONSTRAINT [TbServicoAdicional] GO 
	
	ALTER TABLE [FK_TbServicoAdicional_TbServico].[TbServico] DROP CONSTRAINT [TbServicoAdicional] GO 
	
	ALTER TABLE [FK_TbServicoAdicionalPlanoPagamento_TbServicoAdicional].[TbServicoAdicional] DROP CONSTRAINT [TbServicoAdicionalPlanoPagamento] GO 
	
	ALTER TABLE [FK_TbServicoAdicionalPlanoPagamento_TbPlanoPagamento].[TbPlanoPagamento] DROP CONSTRAINT [TbServicoAdicionalPlanoPagamento] GO 
	
	ALTER TABLE [FK_TbServicoAdicionalTurma_TbServicoAdicional].[TbServicoAdicional] DROP CONSTRAINT [TbServicoAdicionalTurma] GO 
	
	ALTER TABLE [FK_TbServicoAdicionalTurma_TbTurma].[TbTurma] DROP CONSTRAINT [TbServicoAdicionalTurma] GO 
	
	ALTER TABLE [FK_TbServicoPreco_TbServico].[TbServico] DROP CONSTRAINT [TbServicoPreco] GO 
	
	ALTER TABLE [FK_TbServicoPrecoDesconto_TbServicoPreco].[TbServicoPreco] DROP CONSTRAINT [TbServicoPrecoDesconto] GO 
	
	ALTER TABLE [FK_TbServicoPrecoDesconto_TbAbatimento].[TbAbatimento] DROP CONSTRAINT [TbServicoPrecoDesconto] GO 
	
	ALTER TABLE [FK_TbTurmaDisciplinaAluno_TbFaseNota].[TbFaseNota] DROP CONSTRAINT [TbSituacaoAlunoDisciplina] GO 
	
	ALTER TABLE [FK_TbSituacaoAlunoDisciplina_TbAlunoCurso].[TbAlunoCurso] DROP CONSTRAINT [TbSituacaoAlunoDisciplina] GO 
	
	ALTER TABLE [FK_TbSituacaoAlunoDisciplina_TbUsuarioMatricula].[TbUsuario] DROP CONSTRAINT [TbSituacaoAlunoDisciplina] GO 
	
	ALTER TABLE [FK_TbSituacaoAlunoDisciplina_TbUsuarioTrancamento].[TbUsuario] DROP CONSTRAINT [TbSituacaoAlunoDisciplina] GO 
	
	ALTER TABLE [FK_TbTurmaDisciplinaAluno_TbDisciplina].[TbDisciplina] DROP CONSTRAINT [TbSituacaoAlunoDisciplina] GO 
	
	ALTER TABLE [FK_TbSituacaoAlunoDisciplina_TbMotivoInativacao].[TbMotivoInativacao] DROP CONSTRAINT [TbSituacaoAlunoDisciplina] GO 
	
	ALTER TABLE [FK_TbTurmaDisciplinaAluno_TbAlunoTurma].[TbAlunoTurma] DROP CONSTRAINT [TbSituacaoAlunoDisciplina] GO 
	
	ALTER TABLE [FK_TbTurmaDisciplinaAluno_TbAlunoTurma].[TbAlunoTurma] DROP CONSTRAINT [TbSituacaoAlunoDisciplina] GO 
	
	ALTER TABLE [FK_TbSituacaoAlunoDisciplina_TbTipoSituacaoAlunoDisciplina].[TbTipoSituacaoAlunoDisciplina] DROP CONSTRAINT [TbSituacaoAlunoDisciplina] GO 
	
	ALTER TABLE [FK_TbSituacaoAlunoTurmaPagamento_TbTurma].[TbTurma] DROP CONSTRAINT [TbSituacaoAlunoTurmaPagamento] GO 
	
	ALTER TABLE [FK_TbSituacaoAlunoTurmaPagamento_TbPeriodo].[TbPeriodo] DROP CONSTRAINT [TbSituacaoAlunoTurmaPagamento] GO 
	
	ALTER TABLE [FK_TbSituacaoAlunoTurmaPagamento_TbPlanoPagamento].[TbPlanoPagamento] DROP CONSTRAINT [TbSituacaoAlunoTurmaPagamento] GO 
	
	ALTER TABLE [FK_TbSituacaoAlunoTurmaPagamento_TbSerie].[TbSerie] DROP CONSTRAINT [TbSituacaoAlunoTurmaPagamento] GO 
	
	ALTER TABLE [FK_TbSituacaoAlunoTurmaPagamento_TbSituacaoAlunoTurmaDestino].[TbSituacaoAlunoTurma] DROP CONSTRAINT [TbSituacaoAlunoTurmaPagamento] GO 
	
	ALTER TABLE [FK_TbSituacaoAlunoTurmaPagamento_TbSituacaoAlunoTurmaOrigem].[TbSituacaoAlunoTurma] DROP CONSTRAINT [TbSituacaoAlunoTurmaPagamento] GO 
	
	ALTER TABLE [FK_TbSolicitacao_TbSolicitacaoTipo].[TbSolicitacaoTipo] DROP CONSTRAINT [TbSolicitacao] GO 
	
	ALTER TABLE [FK_TbSolicitacao_TbUsuario].[TbUsuario] DROP CONSTRAINT [TbSolicitacao] GO 
	
	ALTER TABLE [FK_TbSolicitacao_TbTurma_IdTurma].[TbTurma] DROP CONSTRAINT [TbSolicitacao] GO 
	
	ALTER TABLE [FK_TbSolicitacao_TbTituloCobranca_IdTituloCobranca].[TbTituloCobranca] DROP CONSTRAINT [TbSolicitacao] GO 
	
	ALTER TABLE [FK_TbSolicitacao_TbResponsavel_IdProfissao].[TbProfissao] DROP CONSTRAINT [TbSolicitacao] GO 
	
	ALTER TABLE [FK_TbSolicitacao_TbResponsavel_IdReligiao].[TbReligiao] DROP CONSTRAINT [TbSolicitacao] GO 
	
	ALTER TABLE [FK_TbSolicitacao_TbResponsavel_IdResponsavelFinanceiro].[TbResponsavel] DROP CONSTRAINT [TbSolicitacao] GO 
	
	ALTER TABLE [FK_TbSolicitacao_TbTipoResponsavel_IdTipoResponsavel].[TbTipoResponsavel] DROP CONSTRAINT [TbSolicitacao] GO 
	
	ALTER TABLE [FK_TbSolicitacao_TbResponsavel_IdPai].[TbResponsavel] DROP CONSTRAINT [TbSolicitacao] GO 
	
	ALTER TABLE [FK_TbSolicitacao_TbResponsavel_IdMae].[TbResponsavel] DROP CONSTRAINT [TbSolicitacao] GO 
	
	ALTER TABLE [FK_TbSolicitacao_TbResponsavel_IdResponsavelSecundario].[TbResponsavel] DROP CONSTRAINT [TbSolicitacao] GO 
	
	ALTER TABLE [FK_TbSolicitacao_TbResponsavel_IdTipoResponsavelSecundario].[TbTipoResponsavel] DROP CONSTRAINT [TbSolicitacao] GO 
	
	ALTER TABLE [FK_TbSolicitacaoComplemento_TbSolicitacao].[TbSolicitacao] DROP CONSTRAINT [TbSolicitacaoComplemento] GO 
	
	ALTER TABLE [FK_TbSolicitacaoDesconto_TbSolicitacaoDescontoTipo].[TbSolicitacaoDescontoTipo] DROP CONSTRAINT [TbSolicitacaoDesconto] GO 
	
	ALTER TABLE [FK_TbSolicitacaoDesconto_TbAluno].[TbAluno] DROP CONSTRAINT [TbSolicitacaoDesconto] GO 
	
	ALTER TABLE [FK_TbSolicitacaoDesconto_TbResponsavel].[TbResponsavel] DROP CONSTRAINT [TbSolicitacaoDesconto] GO 
	
	ALTER TABLE [FK_TbSolicitacaoDesconto_TbUsuario].[TbUsuario] DROP CONSTRAINT [TbSolicitacaoDesconto] GO 
	
	ALTER TABLE [FK_TbSolicitacaoDesconto_TbSituacaoSolicitacaoDesconto].[TbSituacaoSolicitacaoDesconto] DROP CONSTRAINT [TbSolicitacaoDesconto] GO 
	
	ALTER TABLE [FK_TbSolicitacaoDesconto_TbPeriodo].[TbPeriodo] DROP CONSTRAINT [TbSolicitacaoDesconto] GO 
	
	ALTER TABLE [FK_TbSolicitacaoDesconto_TbSerie].[TbSerie] DROP CONSTRAINT [TbSolicitacaoDesconto] GO 
	
	ALTER TABLE [FK_TbSolicitacaoDesconto_TbResponsavel_Entrevista].[TbResponsavel] DROP CONSTRAINT [TbSolicitacaoDesconto] GO 
	
	ALTER TABLE [FK_TbSolicitacaoDesconto_TbAbatimento].[TbAbatimento] DROP CONSTRAINT [TbSolicitacaoDesconto] GO 
	
	ALTER TABLE [FK_TbSolicitacaoDescontoDocumento_TbSolicitacaoDesconto].[TbSolicitacaoDesconto] DROP CONSTRAINT [TbSolicitacaoDescontoDocumento] GO 
	
	ALTER TABLE [FK_TbSolicitacaoDescontoDocumento_TbSolicitacaoDescontoTipoDocumento].[TbSolicitacaoDescontoTipoDocumento] DROP CONSTRAINT [TbSolicitacaoDescontoDocumento] GO 
	
	ALTER TABLE [FK_TbSolicitacaoDescontoDocumento_TbUsuario].[TbUsuario] DROP CONSTRAINT [TbSolicitacaoDescontoDocumento] GO 
	
	ALTER TABLE [FK_TbSolicitacaoDescontoTipo_TbTextoPersonalizado].[TbTextoPersonalizado] DROP CONSTRAINT [TbSolicitacaoDescontoTipo] GO 
	
	ALTER TABLE [FK_TbSolicitacaoDescontoTipo_TbTipoImpedimento].[TbTipoImpedimento] DROP CONSTRAINT [TbSolicitacaoDescontoTipo] GO 
	
	ALTER TABLE [FK_TbSolicitacaoDescontoTipoDocumento_TbSolicitacaoDescontoTipo].[TbSolicitacaoDescontoTipo] DROP CONSTRAINT [TbSolicitacaoDescontoTipoDocumento] GO 
	
	ALTER TABLE [FK_TbSolicitacaoDespesa_TbCentroResultado].[TbCentroResultado] DROP CONSTRAINT [TbSolicitacaoDespesa] GO 
	
	ALTER TABLE [FK_TbSolicitacaoDespesa_TbEmpresa].[TbEmpresa] DROP CONSTRAINT [TbSolicitacaoDespesa] GO 
	
	ALTER TABLE [FK_TbSolicitacaoDespesa_TbUsuario_Solicitante].[TbUsuario] DROP CONSTRAINT [TbSolicitacaoDespesa] GO 
	
	ALTER TABLE [FK_TbSolicitacaoDespesa_TbUsuario_Autorizacao].[TbUsuario] DROP CONSTRAINT [TbSolicitacaoDespesa] GO 
	
	ALTER TABLE [FK_TbSolicitacaoDespesa_TbPlanoContas].[TbPlanoContas] DROP CONSTRAINT [TbSolicitacaoDespesa] GO 
	
	ALTER TABLE [FK_TbSolicitacaoProcedimentoMatricula_TbSolicitacao].[TbSolicitacao] DROP CONSTRAINT [TbSolicitacaoProcedimentoMatricula] GO 
	
	ALTER TABLE [FK_TbSolicitacaoProcedimentoMatricula_TbProcedimentoMatricula].[TbProcedimentoMatricula] DROP CONSTRAINT [TbSolicitacaoProcedimentoMatricula] GO 
	
	ALTER TABLE [FK_TbSolicitacaoProcedimentoMatricula_TbUsuario].[TbUsuario] DROP CONSTRAINT [TbSolicitacaoProcedimentoMatricula] GO 
	
	ALTER TABLE [FK_TbSolicitacaoTipo_TbTipoCalculoMultaJuros].[TbTipoCalculoMultaJuros] DROP CONSTRAINT [TbSolicitacaoTipo] GO 
	
	ALTER TABLE [FK_TbSolicitacaoTipo_TbServico].[TbServico] DROP CONSTRAINT [TbSolicitacaoTipo] GO 
	
	ALTER TABLE [FK_TbSolicitacaoTipo_TbFormaRecebimento].[TbFormaRecebimento] DROP CONSTRAINT [TbSolicitacaoTipo] GO 
	
	ALTER TABLE [FK_TbTextoPersonalizado_TbUnidade].[TbUnidade] DROP CONSTRAINT [TbTextoPersonalizado] GO 
	
	ALTER TABLE [FK_TbTextoPersonalizadoSerie_TbTextoPersonalizado].[TbTextoPersonalizado] DROP CONSTRAINT [TbTextoPersonalizadoSerie] GO 
	
	ALTER TABLE [FK_TbTextoPersonalizadoSerie_TbSerie].[TbSerie] DROP CONSTRAINT [TbTextoPersonalizadoSerie] GO 
	
	ALTER TABLE [FK_TbTipoOcorrencia_TbTextoPersonalizado2].[TbTextoPersonalizado] DROP CONSTRAINT [TbTipoOcorrencia] GO 
	
	ALTER TABLE [FK_TbTipoOcorrencia_TbTextoPersonalizado].[TbTextoPersonalizado] DROP CONSTRAINT [TbTipoOcorrencia] GO 
	
	ALTER TABLE [FK_TbTipoRetencaoPagamento_TbFavorecido].[TbFavorecido] DROP CONSTRAINT [TbTipoRetencaoPagamento] GO 
	
	ALTER TABLE [FK_TbTipoRetencaoPagamento_TbPlanoContas].[TbPlanoContas] DROP CONSTRAINT [TbTipoRetencaoPagamento] GO 
	
	ALTER TABLE [FK_TbTituloCobranca_TbResponsavel].[TbResponsavel] DROP CONSTRAINT [TbTituloCobranca] GO 
	
	ALTER TABLE [FK_TbTituloCobranca_TbAgenteCobranca].[TbAgenteCobranca] DROP CONSTRAINT [TbTituloCobranca] GO 
	
	ALTER TABLE [FK_TbTituloCobranca_TbConta].[TbConta] DROP CONSTRAINT [TbTituloCobranca] GO 
	
	ALTER TABLE [FK_TbTituloCobranca_TbContaRecebimentoCaixaOperadoraCartao].[TbConta] DROP CONSTRAINT [TbTituloCobranca] GO 
	
	ALTER TABLE [FK_TbTituloCobranca_TbTipoCalculoMultaJuros].[TbTipoCalculoMultaJuros] DROP CONSTRAINT [TbTituloCobranca] GO 
	
	ALTER TABLE [FK_TbTituloCobranca_TbAluno].[TbAluno] DROP CONSTRAINT [TbTituloCobranca] GO 
	
	ALTER TABLE [FK_TbTituloCobranca_TbFormaRecebimento].[TbFormaRecebimento] DROP CONSTRAINT [TbTituloCobranca] GO 
	
	ALTER TABLE [FK_TbTituloCobranca_LIQ_IdContaDevolucaoRecebidoAMaior].[TbConta] DROP CONSTRAINT [TbTituloCobranca] GO 
	
	ALTER TABLE [FK_TbTituloCobranca_CobrarValorPagoAMenor_TbTituloCobrancaDestino].[TbTituloCobranca] DROP CONSTRAINT [TbTituloCobranca_CobrarValorPagoAMenor] GO 
	
	ALTER TABLE [FK_TbTituloCobranca_CobrarValorPagoAMenor_TbUsuarioConferido].[TbUsuario] DROP CONSTRAINT [TbTituloCobranca_CobrarValorPagoAMenor] GO 
	
	ALTER TABLE [FK_TbTituloCobranca_CobrarValorPagoAMenor_TbTituloCobranca].[TbTituloCobranca] DROP CONSTRAINT [TbTituloCobranca_CobrarValorPagoAMenor] GO 
	
	ALTER TABLE [FK_TbTituloCobranca_CobrarValorPagoAMenor_TbUsuario].[TbUsuario] DROP CONSTRAINT [TbTituloCobranca_CobrarValorPagoAMenor] GO 
	
	ALTER TABLE [FK_TbTituloCobranca_Persistido_TbTituloCobranca].[TbTituloCobranca] DROP CONSTRAINT [TbTituloCobranca_Persistido] GO 
	
	ALTER TABLE [FK_TbTituloCobrancaBOL_TbTituloCobranca].[TbTituloCobranca] DROP CONSTRAINT [TbTituloCobrancaBoleto] GO 
	
	ALTER TABLE [FK_TbTituloCobrancaBoleto_Auditoria_TbTituloCobranca].[TbTituloCobranca] DROP CONSTRAINT [TbTituloCobrancaBoleto_Auditoria] GO 
	
	ALTER TABLE [FK_TbTituloCobrancaCadastroInadimplente_TbTituloCobranca].[TbTituloCobranca] DROP CONSTRAINT [TbTituloCobrancaCadastroInadimplente] GO 
	
	ALTER TABLE [FK_TbTituloCobrancaCadastroInadimplente_TbUsuario].[TbUsuario] DROP CONSTRAINT [TbTituloCobrancaCadastroInadimplente] GO 
	
	ALTER TABLE [FK_TbTituloCobrancaRecebimento_TbCaixaTipoRecebimento].[TbCaixaTipoRecebimento] DROP CONSTRAINT [TbTituloCobrancaRecebimento] GO 
	
	ALTER TABLE [FK_TbTituloCobrancaRecebimento_TbTituloCobranca].[TbTituloCobranca] DROP CONSTRAINT [TbTituloCobrancaRecebimento] GO 
	
	ALTER TABLE [FK_TbTituloCobrancaRegistrada_TbTituloCobranca].[TbTituloCobranca] DROP CONSTRAINT [TbTituloCobrancaRegistrada] GO 
	
	ALTER TABLE [FK_TbTituloCobrancaRegistrada_TbUsuario].[TbUsuario] DROP CONSTRAINT [TbTituloCobrancaRegistrada] GO 
	
	ALTER TABLE [FK_TbTituloCobrancaRegistrada_TbAgenteCobranca].[TbAgenteCobranca] DROP CONSTRAINT [TbTituloCobrancaRegistrada] GO 
	
	ALTER TABLE [FK_TbTituloCobrancaRegistrada_IdFormaRecebimento].[TbFormaRecebimento] DROP CONSTRAINT [TbTituloCobrancaRegistrada] GO 
	
	ALTER TABLE [FK_TbTituloCobrancaVencimento_TbTituloCobranca].[TbTituloCobranca] DROP CONSTRAINT [TbTituloCobrancaVencimento] GO 
	
	ALTER TABLE [FK_TbTituloCobrancaVisualizacao_TbTituloCobranca].[TbTituloCobranca] DROP CONSTRAINT [TbTituloCobrancaVisualizacao] GO 
	
	ALTER TABLE [FK_TbTurma_TbCursoSuperior].[TbCursoSuperior] DROP CONSTRAINT [TbTurma] GO 
	
	ALTER TABLE [FK_TbTurma_TbDisciplina].[TbDisciplina] DROP CONSTRAINT [TbTurma] GO 
	
	ALTER TABLE [FK_TbTurma_Evento_IdTextoPersonalizadoCertificado].[TbTextoPersonalizado] DROP CONSTRAINT [TbTurma] GO 
	
	ALTER TABLE [FK_TbTurma_TbTextoPersonalizado].[TbTextoPersonalizado] DROP CONSTRAINT [TbTurma] GO 
	
	ALTER TABLE [FK_TbTurma_TbTurno].[TbTurno] DROP CONSTRAINT [TbTurma] GO 
	
	ALTER TABLE [FK_TbTurma_TbFreqTipoHorario].[TbFreqTipoHorario] DROP CONSTRAINT [TbTurma] GO 
	
	ALTER TABLE [FK_TbTurma_TbSituacaoAlunoTurma].[TbSituacaoAlunoTurma] DROP CONSTRAINT [TbTurma] GO 
	
	ALTER TABLE [FK_TbTurma_TbSala].[TbSala] DROP CONSTRAINT [TbTurma] GO 
	
	ALTER TABLE [FK_TbTurma_IdModeloContrato].[TbModeloContrato] DROP CONSTRAINT [TbTurma] GO 
	
	ALTER TABLE [FK_TbTurma_TbServico_Reserva].[TbServico] DROP CONSTRAINT [TbTurma] GO 
	
	ALTER TABLE [FK_TbTurma_TbPeriodo].[TbPeriodo] DROP CONSTRAINT [TbTurma] GO 
	
	ALTER TABLE [FK_TbTurma_TbServico].[TbServico] DROP CONSTRAINT [TbTurma] GO 
	
	ALTER TABLE [FK_TbTurma_TbEventoTipo].[TbEventoTipo] DROP CONSTRAINT [TbTurma] GO 
	
	ALTER TABLE [FK_TbTurma_TbUsuario].[TbUsuario] DROP CONSTRAINT [TbTurma] GO 
	
	ALTER TABLE [FK_TbTurma_TbSerie].[TbSerie] DROP CONSTRAINT [TbTurma] GO 
	
	ALTER TABLE [FK_TbTurmaDisciplina_GoogleForEducation_TbTurma].[TbTurma] DROP CONSTRAINT [TbTurmaDisciplina_GoogleForEducation] GO 
	
	ALTER TABLE [FK_TbTurmaDisciplina_GoogleForEducation_TbDisciplina].[TbDisciplina] DROP CONSTRAINT [TbTurmaDisciplina_GoogleForEducation] GO 
	
	ALTER TABLE [FK_TbTurmaDisciplinaFaseNota_TbFaseNota].[TbFaseNota] DROP CONSTRAINT [TbTurmaDisciplinaFaseNota] GO 
	
	ALTER TABLE [FK_TbTurmaDisciplinaFaseNota_TbTurma].[TbTurma] DROP CONSTRAINT [TbTurmaDisciplinaFaseNota] GO 
	
	ALTER TABLE [FK_TbTurmaDisciplinaFaseNota_TbDisciplina].[TbDisciplina] DROP CONSTRAINT [TbTurmaDisciplinaFaseNota] GO 
	
	ALTER TABLE [FK_TbTurmaDisciplinaPlanoAula_TbTurma].[TbTurma] DROP CONSTRAINT [TbTurmaDisciplinaPlanoAula] GO 
	
	ALTER TABLE [FK_TbTurmaDisciplinaPlanoAula_TbDisciplina].[TbDisciplina] DROP CONSTRAINT [TbTurmaDisciplinaPlanoAula] GO 
	
	ALTER TABLE [FK_TbTurmaProfessor_TbTurma].[TbTurma] DROP CONSTRAINT [TbTurmaProfessor] GO 
	
	ALTER TABLE [FK_TbTurmaProfessor_TbProfessorDisciplina].[TbProfessorDisciplina] DROP CONSTRAINT [TbTurmaProfessor] GO 
	
	ALTER TABLE [FK_TbTurmaProfessor_TbProfessorDisciplina].[TbProfessorDisciplina] DROP CONSTRAINT [TbTurmaProfessor] GO 
	
	ALTER TABLE [FK_TbTurmaProfessor_TbPlanoPagamento].[TbPlanoPagamento] DROP CONSTRAINT [TbTurmaProfessor] GO 
	
	ALTER TABLE [FK_TbAlunoProfessor_TbProfessor_IdProfessorAlteracao].[TbProfessor] DROP CONSTRAINT [TbTurmaProfessor] GO 
	
	ALTER TABLE [FK_TbAlunoProfessor_TbUsuario_IdUsuarioConfirmacao].[TbUsuario] DROP CONSTRAINT [TbTurmaProfessor] GO 
	
	ALTER TABLE [FK_TbTurmaProfessorCursoAdicional_TbCurso].[TbCurso] DROP CONSTRAINT [TbTurmaProfessorCursoAdicional] GO 
	
	ALTER TABLE [FK_TbTurmaProfessorCursoAdicional_TbTurma].[TbTurma] DROP CONSTRAINT [TbTurmaProfessorCursoAdicional] GO 
	
	ALTER TABLE [FK_TbTurmaProfessorCursoAdicional_TbDisciplina].[TbDisciplina] DROP CONSTRAINT [TbTurmaProfessorCursoAdicional] GO 
	
	ALTER TABLE [FK_TbTurmaTurmaPrincipal_TbTurma].[TbTurma] DROP CONSTRAINT [TbTurmaTurmaPrincipal] GO 
	
	ALTER TABLE [FK__TbUnidade__IdTex__0301381D].[TbTextoPersonalizado] DROP CONSTRAINT [TbUnidade] GO 
	
	ALTER TABLE [FK__TbUnidade__IdTex__03F55C56].[TbTextoPersonalizado] DROP CONSTRAINT [TbUnidade] GO 
	
	ALTER TABLE [FK__TbUnidade__IdTex__04E9808F].[TbTextoPersonalizado] DROP CONSTRAINT [TbUnidade] GO 
	
	ALTER TABLE [FK_TbUnidade_TbAbatimento].[TbAbatimento] DROP CONSTRAINT [TbUnidade] GO 
	
	ALTER TABLE [FK_TbUnidade_TbTipoImpedimentoRecebimentoCaixa].[TbTipoImpedimento] DROP CONSTRAINT [TbUnidade] GO 
	
	ALTER TABLE [FK_TbUnidade_TbResponsavelNaoCadastrado].[TbResponsavel] DROP CONSTRAINT [TbUnidade] GO 
	
	ALTER TABLE [FK_TbUnidade_TbTipoImpedimentoAgendamento].[TbTipoImpedimento] DROP CONSTRAINT [TbUnidade] GO 
	
	ALTER TABLE [FK_TbUnidade_TbTipoImpedimentoBoletoWEB].[TbTipoImpedimento] DROP CONSTRAINT [TbUnidade] GO 
	
	ALTER TABLE [FK_TbUnidade_TbTipoImpedimento].[TbTipoImpedimento] DROP CONSTRAINT [TbUnidade] GO 
	
	ALTER TABLE [FK_TbUnidade_TbTipoImpedimentoWeb].[TbTipoImpedimento] DROP CONSTRAINT [TbUnidade] GO 
	
	ALTER TABLE [FK_TbUnidade_TbTipoOcorrencia].[TbTipoOcorrencia] DROP CONSTRAINT [TbUnidade] GO 
	
	ALTER TABLE [FK_TbUnidade_TbFormaRecebimento].[TbFormaRecebimento] DROP CONSTRAINT [TbUnidade] GO 
	
	ALTER TABLE [FK_TbUnidade_TbTipoCalculoMultaJuros].[TbTipoCalculoMultaJuros] DROP CONSTRAINT [TbUnidade] GO 
	
	ALTER TABLE [FK_TbUnidade_TbTipoImpedimentoRMOnline].[TbTipoImpedimento] DROP CONSTRAINT [TbUnidade] GO 
	
	ALTER TABLE [FK_TbUnidade_TbTextoPersonalizado1].[TbTextoPersonalizado] DROP CONSTRAINT [TbUnidade] GO 
	
	ALTER TABLE [FK_TbUnidade_TbTextoPersonalizado2].[TbTextoPersonalizado] DROP CONSTRAINT [TbUnidade] GO 
	
	ALTER TABLE [FK_TbUnidade_TbTextoPersonalizado3].[TbTextoPersonalizado] DROP CONSTRAINT [TbUnidade] GO 
	
	ALTER TABLE [FK_TbUnidade_TbEscola].[TbEscola] DROP CONSTRAINT [TbUnidade] GO 
	
	ALTER TABLE [FK_TbUnidade_TbEstabelecimentoEnsino].[TbEstabelecimentoEnsino] DROP CONSTRAINT [TbUnidade] GO 
	
	ALTER TABLE [FK_TbUnidade_TbUsuario1].[TbUsuario] DROP CONSTRAINT [TbUnidade] GO 
	
	ALTER TABLE [FK_TbUnidade_TbUsuario].[TbUsuario] DROP CONSTRAINT [TbUnidade] GO 
	
	ALTER TABLE [FK__TbUnidade__IdUni__70436964].[TbUnidade] DROP CONSTRAINT [TbUnidadeTermoConsentimento] GO 
	
	ALTER TABLE [FK_TbUsuario_TbUnidade].[TbUnidade] DROP CONSTRAINT [TbUsuario] GO 
	
	ALTER TABLE [FK_TbUsuarioGrupo_TbGrupo].[TbGrupo] DROP CONSTRAINT [TbUsuarioGrupo] GO 
	
	ALTER TABLE [FK_TbUsuarioGrupo_TbUsuario].[TbUsuario] DROP CONSTRAINT [TbUsuarioGrupo] GO 
	
	ALTER TABLE [FK_TbUsuarioSituacaoSolicitacaoDesconto_TbUsuario].[TbUsuario] DROP CONSTRAINT [TbUsuarioSituacaoSolicitacaoDesconto] GO 
	
	ALTER TABLE [FK_TbUsuarioSituacaoSolicitacaoDesconto_TbSituacaoSolicitacaoDesconto].[TbSituacaoSolicitacaoDesconto] DROP CONSTRAINT [TbUsuarioSituacaoSolicitacaoDesconto] GO 
	
	ALTER TABLE [FK_TbUsuarioUnidade_TbUsuario].[TbUsuario] DROP CONSTRAINT [TbUsuarioUnidade] GO 
	
	ALTER TABLE [FK_TbUsuarioUnidade_TbUnidade].[TbUnidade] DROP CONSTRAINT [TbUsuarioUnidade] GO 
	
	-- Total execution time: 00:00:00.749	



USE dbSigaAslan;


ALTER TABLE [dbo].[TbAlmoxMaterialMovimentacao] DROP CONSTRAINT [FK_TbAlmoxMaterialMovimentacao_TbUsuario]
GO
ALTER TABLE [dbo].[TbAlmoxRequisicao] DROP CONSTRAINT [FK_TbAlmoxRequisicao_TbUsuario_Requisitante]
GO
ALTER TABLE [dbo].[TbAlmoxRequisicao] DROP CONSTRAINT [FK_TbAlmoxRequisicao_TbUsuario_Recebimento]
GO
ALTER TABLE [dbo].[TbAlmoxRequisicao] DROP CONSTRAINT [FK_TbAlmoxRequisicao_TbUsuario_Conclusao]
GO
ALTER TABLE [dbo].[TbAlmoxUsuarioAlmoxarifado] DROP CONSTRAINT [FK_TbAlmoxUsuarioAlmoxarifado_TbUsuario]
GO
ALTER TABLE [dbo].[TbAlmoxUsuarioCentroResultado] DROP CONSTRAINT [FK_TbAlmoxUsuarioCentroResultado_TbUsuario]
GO
IF OBJECT_ID('dbo.FK_TbAlmoxUsuarioGrupoMaterial_TbUsuario') IS NOT NULL
BEGIN
	ALTER TABLE [dbo].[TbAlmoxUsuarioGrupoMaterial] DROP CONSTRAINT [FK_TbAlmoxUsuarioGrupoMaterial_TbUsuario]
END

ALTER TABLE [dbo].[TbAlunoObs] DROP CONSTRAINT [FK_TbAlunoObs_TbUsuario]
GO
ALTER TABLE [dbo].[TbAlunoObs] DROP CONSTRAINT [FK_TbAlunoObs_TbUsuario1]
GO
IF OBJECT_ID('dbo.FK_TbAlunoPeriodo_TbUsuario') IS NOT NULL
BEGIN
	ALTER TABLE [dbo].[TbAlunoPeriodo] DROP CONSTRAINT [FK_TbAlunoPeriodo_TbUsuario]
END

IF OBJECT_ID('dbo.FK_TbAlunoRotinaEducacaoInfantil_TbUsuario') IS NOT NULL
BEGIN
	ALTER TABLE [dbo].[TbAlunoRotinaEducacaoInfantil] DROP CONSTRAINT [FK_TbAlunoRotinaEducacaoInfantil_TbUsuario]
END

ALTER TABLE [dbo].[TbAlunoTurma] DROP CONSTRAINT [FK_TbAlunoTurma_TbUsuario]
GO
ALTER TABLE [dbo].[TbAlunoTurmaBolsa] DROP CONSTRAINT [FK_TbAlunoServicoBolsa_TbUsuario]
GO
ALTER TABLE [dbo].[TbAlunoTurmaBolsaHistorico] DROP CONSTRAINT [FK_TbAlunoTurmaBolsaHistorico_TbUsuario]
GO
ALTER TABLE [dbo].[TbAlunoTurmaHistorico] DROP CONSTRAINT [FK_TbAlunoTurmaHistorico_TbUsuario]
GO
ALTER TABLE [dbo].[TbAlunoTurmaProcedimentoMatricula] DROP CONSTRAINT [FK_TbAlunoTurmaProcedimentoMatricula_TbUsuario]
GO
ALTER TABLE [dbo].[TbAlunoTurmaProcedimentoMatriculaHistorico] DROP CONSTRAINT [FK_TbAlunoTurmaProcedimentoMatriculaHistorico_TbUsuario]
GO
IF OBJECT_ID('dbo.FK_IdUsuarioUpload_TbUsuario') IS NOT NULL
BEGIN
	ALTER TABLE [dbo].[TbArquivoAnexo] DROP CONSTRAINT [FK_IdUsuarioUpload_TbUsuario]
END
IF OBJECT_ID('dbo.FK_IdUsuarioExclusaoLogica_TbUsuario') IS NOT NULL
BEGIN
	ALTER TABLE [dbo].[TbArquivoAnexo] DROP CONSTRAINT [FK_IdUsuarioExclusaoLogica_TbUsuario]
END

ALTER TABLE [dbo].[TbAuditoria] DROP CONSTRAINT [FK_TbAuditoria_TbUsuario]
GO
ALTER TABLE [dbo].[TbCaixaMovimentacao] DROP CONSTRAINT [FK_TbCaixaMovimentacao_TbUsuario_Autorizacao]
GO
ALTER TABLE [dbo].[TbCaixaMovimentacao] DROP CONSTRAINT [FK_TbCaixaMovimentacao_TbUsuario]
GO
ALTER TABLE [dbo].[TbCaixaRecebimento] DROP CONSTRAINT [FK_TbCaixaRecebimento_TbUsuario]
GO
ALTER TABLE [dbo].[TbCaixaUsuario] DROP CONSTRAINT [FK_TbCaixaUsuario_TbUsuario]
GO

IF OBJECT_ID('dbo.FK_TbCaptacaoAlunoInteressado_TbUsuario') IS NOT NULL
BEGIN
	ALTER TABLE [dbo].[TbCaptacaoAlunoInteressado] DROP CONSTRAINT [FK_TbCaptacaoAlunoInteressado_TbUsuario]
END

IF OBJECT_ID('dbo.FK_TbCaptacaoInteracao_TbUsuario') IS NOT NULL
BEGIN
	ALTER TABLE [dbo].[TbCaptacaoInteracao] DROP CONSTRAINT [FK_TbCaptacaoInteracao_TbUsuario]
END

ALTER TABLE [dbo].[TbChequeMovimentacao] DROP CONSTRAINT [FK_TbChequeMovimentacao_TbUsuario]
GO
ALTER TABLE [dbo].[TbContaUsuario] DROP CONSTRAINT [FK_TbContaUsuario_TbUsuario]
GO
IF OBJECT_ID('dbo.FK_TbCurso_TbUsuario') IS NOT NULL
BEGIN
	ALTER TABLE [dbo].[TbCurso] DROP CONSTRAINT [FK_TbCurso_TbUsuario]
END

IF OBJECT_ID('dbo.FK_TbDadosUso_TbUsuario') IS NOT NULL
BEGIN
	ALTER TABLE [dbo].[TbDadosUso] DROP CONSTRAINT [FK_TbDadosUso_TbUsuario]
END

ALTER TABLE [dbo].[TbEscola] DROP CONSTRAINT [FK_TbEscola_TbUsuario]
GO

IF OBJECT_ID('dbo.FK_TbFaseNotaAluno_FilaProcessamento_TbUsuario') IS NOT NULL
BEGIN
	ALTER TABLE [dbo].[TbFaseNotaAluno_FilaProcessamento] DROP CONSTRAINT [FK_TbFaseNotaAluno_FilaProcessamento_TbUsuario]
END

ALTER TABLE [dbo].[TbFidUsuarioPontuacao] DROP CONSTRAINT [FK_TbFidUsuarioPontuacao_TbUsuario]
GO
ALTER TABLE [dbo].[TbLoteCobrancaRegistrada] DROP CONSTRAINT [FK_TbLoteCobrancaRegistrada_TbUsuario]
GO
ALTER TABLE [dbo].[TbLoteCobrancaRegistradaArquivoRemessa] DROP CONSTRAINT [FK_TbLoteCobrancaRegistradaArquivoRemessa_TbUsuario]
GO
ALTER TABLE [dbo].[TbMensagemCaixaSaida] DROP CONSTRAINT [FK_TbMensagemCaixaSaida_TbUsuario]
GO
ALTER TABLE [dbo].[TbMobileTipoMensagemUsuario] DROP CONSTRAINT [FK_TbMobileTipoMensagemUsuario_TbUsuario]
GO
ALTER TABLE [dbo].[TbNegociacao] DROP CONSTRAINT [FK_TbNegociacao_TbUsuario]
GO
ALTER TABLE [dbo].[TbNotaFiscalLote] DROP CONSTRAINT [FK_TbNotaFiscalLote_TbUsuario]
GO
ALTER TABLE [dbo].[TbOptProva] DROP CONSTRAINT [FK_TbOptProva_TbUsuario]
GO
ALTER TABLE [dbo].[TbPagamentoLote] DROP CONSTRAINT [FK_TbPagamentoArquivoRetorno_TbUsuario]
GO
ALTER TABLE [dbo].[TbProfessorObs] DROP CONSTRAINT [FK_TbProfessorObs_TbUsuario]
GO
ALTER TABLE [dbo].[TbRateioPagamento] DROP CONSTRAINT [FK_TbRateioPagamento_TbUsuario]
GO
ALTER TABLE [dbo].[TbResponsavelObs] DROP CONSTRAINT [FK_TbResponsavelObs_TbUsuario_Registro]
GO
ALTER TABLE [dbo].[TbResponsavelObs] DROP CONSTRAINT [FK_TbResponsavelObs_TbUsuario_Liberacao]
GO

IF OBJECT_ID('dbo.FK_TbSituacaoAlunoDisciplina_TbUsuarioMatricula') IS NOT NULL
BEGIN
	ALTER TABLE [dbo].[TbSituacaoAlunoDisciplina] DROP CONSTRAINT [FK_TbSituacaoAlunoDisciplina_TbUsuarioMatricula]
END

IF OBJECT_ID('dbo.FK_TbSituacaoAlunoDisciplina_TbUsuarioTrancamento') IS NOT NULL
BEGIN
	ALTER TABLE [dbo].[TbSituacaoAlunoDisciplina] DROP CONSTRAINT [FK_TbSituacaoAlunoDisciplina_TbUsuarioTrancamento]
END


ALTER TABLE [dbo].[TbSolicitacao] DROP CONSTRAINT [FK_TbSolicitacao_TbUsuario]
GO
ALTER TABLE [dbo].[TbSolicitacaoDesconto] DROP CONSTRAINT [FK_TbSolicitacaoDesconto_TbUsuario]
GO
ALTER TABLE [dbo].[TbSolicitacaoDespesa] DROP CONSTRAINT [FK_TbSolicitacaoDespesa_TbUsuario_Solicitante]
GO
ALTER TABLE [dbo].[TbSolicitacaoDespesa] DROP CONSTRAINT [FK_TbSolicitacaoDespesa_TbUsuario_Autorizacao]
GO
ALTER TABLE [dbo].[TbTituloCobranca_CobrarValorPagoAMenor] DROP CONSTRAINT [FK_TbTituloCobranca_CobrarValorPagoAMenor_TbUsuario]
GO
ALTER TABLE [dbo].[TbTituloCobranca_CobrarValorPagoAMenor] DROP CONSTRAINT [FK_TbTituloCobranca_CobrarValorPagoAMenor_TbUsuarioConferido]
GO
ALTER TABLE [dbo].[TbTituloCobrancaCadastroInadimplente] DROP CONSTRAINT [FK_TbTituloCobrancaCadastroInadimplente_TbUsuario]
GO
ALTER TABLE [dbo].[TbTituloCobrancaRegistrada] DROP CONSTRAINT [FK_TbTituloCobrancaRegistrada_TbUsuario]
GO
ALTER TABLE [dbo].[TbTurma] DROP CONSTRAINT [FK_TbTurma_TbUsuario]
GO

IF OBJECT_ID('dbo.FK_TbAlunoProfessor_TbUsuario_IdUsuarioConfirmacao') IS NOT NULL
BEGIN
	ALTER TABLE [dbo].[TbTurmaProfessor] DROP CONSTRAINT [FK_TbAlunoProfessor_TbUsuario_IdUsuarioConfirmacao]
END

ALTER TABLE [dbo].[TbUnidade] DROP CONSTRAINT [FK_TbUnidade_TbUsuario1]
GO
ALTER TABLE [dbo].[TbUnidade] DROP CONSTRAINT [FK_TbUnidade_TbUsuario]
GO
ALTER TABLE [dbo].[TbUsuarioGrupo] DROP CONSTRAINT [FK_TbUsuarioGrupo_TbUsuario]
GO
ALTER TABLE [dbo].[TbUsuarioUnidade] DROP CONSTRAINT [FK_TbUsuarioUnidade_TbUsuario]
GO
-- novo
IF OBJECT_ID('dbo.[FK_TbPesquisaNPS_TbUsuario]') IS NOT NULL 
	BEGIN
		ALTER TABLE [dbo].[TbPesquisaNPS] DROP CONSTRAINT [FK_TbPesquisaNPS_TbUsuario]
	END



-- 22Out20
ALTER TABLE [dbo].[TbSolicitacaoDescontoDocumento] DROP CONSTRAINT [FK_TbSolicitacaoDescontoDocumento_TbUsuario]
GO


ALTER TABLE [dbo].[TbDocumentoHistorico] DROP CONSTRAINT [FK_TbDocumentoHistorico_TbUsuario]
GO

ALTER TABLE [dbo].[TbUsuarioSituacaoSolicitacaoDesconto] DROP CONSTRAINT [FK_TbUsuarioSituacaoSolicitacaoDesconto_TbUsuario]
GO


ALTER TABLE [dbo].[TbBoletoIntegrado_FilaProcessamento] DROP CONSTRAINT [FK_TbBoletoIntegrado_FilaProcessamento_TbUsuario]
GO



ALTER TABLE [dbo].[TbFormaRecebimentoLiquidacaoImpedimento] DROP CONSTRAINT [FK_TbFormaRecebimentoLiquidacaoImpedimento_IdUsuarioLiberacao]
GO


ALTER TABLE [dbo].[TbArquivoRetorno_FilaProcessamento] DROP CONSTRAINT [FK_TbArquivoRetorno_FilaProcessamento_TbUsuario]
GO

-- 21jul21
ALTER TABLE [dbo].[TbSolicitacaoProcedimentoMatricula] DROP CONSTRAINT [FK_TbSolicitacaoProcedimentoMatricula_TbUsuario]
GO

ALTER TABLE [dbo].[TbArqArquivo] DROP CONSTRAINT [FK_TbArqArquivo_IdUsuarioInsercao];

ALTER TABLE [dbo].[TbTituloCobranca_Persistido] DROP CONSTRAINT [FK_TbTituloCobranca_Persistido_TbUsuario];

ALTER TABLE [dbo].[TbTituloCobrancaEnvio] DROP CONSTRAINT [FK_TbTituloCobrancaEnvio_TbUsuario];

ALTER TABLE [dbo].[TbNotaFiscal] DROP CONSTRAINT [FK_TbNotaFiscal_TbUsuario_NotaFiscalCancelada_IdUsuario]

ALTER TABLE [dbo].[TbTituloCobrancaEnvio] DROP CONSTRAINT [FK_TbTituloCobrancaEnvio_TbUsuario]

ALTER TABLE [dbo].[TbNotaFiscal] DROP CONSTRAINT [FK_TbNotaFiscal_TbUsuario_NotaFiscalCancelada_IdUsuario]




	ALTER TABLE [dbo].[TbUsuario] DROP CONSTRAINT [PK_TbUsuario];



-- TbUsuario - 2a.Parte

    ALTER TABLE [dbo].[TbUsuario] ADD  CONSTRAINT [PK_TbUsuario] PRIMARY KEY CLUSTERED 
	(
			[IdUsuario] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY];


--ALTER TABLE [dbo].[TbNotaFiscal] WITH CHECK ADD CONSTRAINT [FK_TbNotaFiscal_TbUsuario_NotaFiscalCancelada_IdUsuario] FOREIGN KEY([NotaFiscalCancelada_IdUsuario]) REFERENCES [dbo].[TbUsuario] ([IdUsuario]); 
--
--ALTER TABLE [dbo].[TbNotaFiscal] CHECK CONSTRAINT [FK_TbNotaFiscal_TbUsuario_NotaFiscalCancelada_IdUsuario]


ALTER TABLE dbo.TbTituloCobranca_Persistido ADD CONSTRAINT FK_TbTituloCobranca_Persistido_TbUsuario FOREIGN KEY (IdUsuario_UltimaAlteracao) REFERENCES dbo.TbUsuario(IdUsuario) ON DELETE SET NULL;

ALTER TABLE [dbo].[TbTituloCobranca_Persistido] CHECK CONSTRAINT [FK_TbTituloCobranca_Persistido_TbUsuario]


ALTER TABLE [dbo].[TbTituloCobrancaEnvio] WITH CHECK ADD CONSTRAINT [FK_TbTituloCobrancaEnvio_TbUsuario] FOREIGN KEY([IdUsuario]) 	REFERENCES [dbo].[TbUsuario] ([IdUsuario]); 

ALTER TABLE [dbo].[TbTituloCobrancaEnvio] CHECK CONSTRAINT [FK_TbTituloCobrancaEnvio_TbUsuario]



ALTER TABLE [dbo].[TbNotaFiscal]  WITH CHECK ADD  CONSTRAINT [FK_TbNotaFiscal_TbUsuario_NotaFiscalCancelada_IdUsuario] FOREIGN KEY([NotaFiscalCancelada_IdUsuario])	REFERENCES [dbo].[TbUsuario] ([IdUsuario])

ALTER TABLE [dbo].[TbNotaFiscal] CHECK CONSTRAINT [FK_TbNotaFiscal_TbUsuario_NotaFiscalCancelada_IdUsuario]



	
ALTER TABLE dbo.TbTituloCobrancaEnvio ADD CONSTRAINT FK_TbTituloCobrancaEnvio_TbUsuario FOREIGN KEY (IdUsuario) REFERENCES dbo.TbUsuario(IdUsuario);
	
ALTER TABLE [dbo].[TbTituloCobrancaEnvio] CHECK CONSTRAINT [FK_TbTituloCobrancaEnvio_TbUsuario];
	
	
ALTER TABLE dbo.TbTituloCobranca_Persistido ADD CONSTRAINT FK_TbTituloCobranca_Persistido_TbTituloCobranca FOREIGN KEY (IdTituloCobranca) REFERENCES dbo.TbTituloCobranca(IdTituloCobranca);
	
ALTER TABLE [dbo].[TbTituloCobranca_Persistido] CHECK CONSTRAINT [FK_TbTituloCobranca_Persistido_TbTituloCobranca];
	
	
	
ALTER TABLE [dbo].[TbArqArquivo] WITH CHECK ADD CONSTRAINT [FK_TbArqArquivo_IdUsuarioInsercao] FOREIGN KEY([IdUsuarioInsercao]) 
REFERENCES [dbo].[TbUsuario] ([IdUsuario]); 
	
ALTER TABLE [dbo].[TbArqArquivo] CHECK CONSTRAINT [FK_TbArqArquivo_IdUsuarioInsercao];
	
	

-- 21jul21
ALTER TABLE [dbo].[TbSolicitacaoProcedimentoMatricula] WITH CHECK ADD CONSTRAINT [FK_TbSolicitacaoProcedimentoMatricula_TbUsuario] FOREIGN KEY([IdUsuario]) 
REFERENCES [dbo].[TbUsuario] ([IdUsuario]);

ALTER TABLE [dbo].[TbSolicitacaoProcedimentoMatricula] CHECK CONSTRAINT [FK_TbSolicitacaoProcedimentoMatricula_TbUsuario];
	


-- 15Fev21
ALTER TABLE [dbo].[TbFormaRecebimentoLiquidacaoImpedimento]  WITH CHECK ADD  CONSTRAINT [FK_TbFormaRecebimentoLiquidacaoImpedimento_IdUsuarioLiberacao] FOREIGN KEY([IdUsuarioLiberacao])
REFERENCES [dbo].[TbUsuario] ([IdUsuario])
GO

ALTER TABLE [dbo].[TbFormaRecebimentoLiquidacaoImpedimento] CHECK CONSTRAINT [FK_TbFormaRecebimentoLiquidacaoImpedimento_IdUsuarioLiberacao]
GO



ALTER TABLE [dbo].[TbArquivoRetorno_FilaProcessamento]  WITH CHECK ADD  CONSTRAINT [FK_TbArquivoRetorno_FilaProcessamento_TbUsuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[TbUsuario] ([IdUsuario])
GO

ALTER TABLE [dbo].[TbArquivoRetorno_FilaProcessamento] CHECK CONSTRAINT [FK_TbArquivoRetorno_FilaProcessamento_TbUsuario]
GO



-- TbUsuario - 3a.Parte
    

-- 17Jan21
ALTER TABLE [dbo].[TbBoletoIntegrado_FilaProcessamento]  WITH CHECK ADD  CONSTRAINT [FK_TbBoletoIntegrado_FilaProcessamento_TbUsuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[TbUsuario] ([IdUsuario])
GO

ALTER TABLE [dbo].[TbBoletoIntegrado_FilaProcessamento] CHECK CONSTRAINT [FK_TbBoletoIntegrado_FilaProcessamento_TbUsuario]
GO


-- 22Out20
ALTER TABLE [dbo].[TbSolicitacaoDescontoDocumento]  WITH CHECK ADD  CONSTRAINT [FK_TbSolicitacaoDescontoDocumento_TbUsuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[TbUsuario] ([IdUsuario])
GO

ALTER TABLE [dbo].[TbSolicitacaoDescontoDocumento] CHECK CONSTRAINT [FK_TbSolicitacaoDescontoDocumento_TbUsuario]
GO


ALTER TABLE [dbo].[TbDocumentoHistorico]  WITH CHECK ADD  CONSTRAINT [FK_TbDocumentoHistorico_TbUsuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[TbUsuario] ([IdUsuario])
GO

ALTER TABLE [dbo].[TbDocumentoHistorico] CHECK CONSTRAINT [FK_TbDocumentoHistorico_TbUsuario]
GO


ALTER TABLE [dbo].[TbUsuarioSituacaoSolicitacaoDesconto]  WITH CHECK ADD  CONSTRAINT [FK_TbUsuarioSituacaoSolicitacaoDesconto_TbUsuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[TbUsuario] ([IdUsuario])
GO

ALTER TABLE [dbo].[TbUsuarioSituacaoSolicitacaoDesconto] CHECK CONSTRAINT [FK_TbUsuarioSituacaoSolicitacaoDesconto_TbUsuario]
GO


IF	EXISTS		( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbAlmoxMaterialMovimentacao'	AND COLUMN_NAME = 'IdUsuario' )
	AND	EXISTS	( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbUsuario'						AND COLUMN_NAME = 'IdUsuario' )
	BEGIN
		ALTER TABLE [dbo].[TbAlmoxMaterialMovimentacao] WITH CHECK ADD  CONSTRAINT [FK_TbAlmoxMaterialMovimentacao_TbUsuario] FOREIGN KEY([IdUsuario]) REFERENCES [dbo].[TbUsuario] ([IdUsuario])                                                                        

		ALTER TABLE [dbo].[TbAlmoxMaterialMovimentacao] CHECK CONSTRAINT [FK_TbAlmoxMaterialMovimentacao_TbUsuario]
	END

IF	EXISTS		( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbAlmoxRequisicao'	AND COLUMN_NAME = 'IdUsuarioRequisitante' )
	AND	EXISTS	( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbUsuario'			AND COLUMN_NAME = 'IdUsuario' )
	BEGIN
		ALTER TABLE [dbo].[TbAlmoxRequisicao] WITH CHECK ADD  CONSTRAINT [FK_TbAlmoxRequisicao_TbUsuario_Requisitante] FOREIGN KEY([IdUsuarioRequisitante]) REFERENCES [dbo].[TbUsuario] ([IdUsuario])                                                                   

		ALTER TABLE [dbo].[TbAlmoxRequisicao] CHECK CONSTRAINT [FK_TbAlmoxRequisicao_TbUsuario_Requisitante]
	END

ALTER TABLE [dbo].[TbAlmoxRequisicao] WITH CHECK ADD  CONSTRAINT [FK_TbAlmoxRequisicao_TbUsuario_Recebimento] FOREIGN KEY([IdUsuarioRecebimento]) REFERENCES [dbo].[TbUsuario] ([IdUsuario])                                                                     
GO
ALTER TABLE [dbo].[TbAlmoxRequisicao] CHECK CONSTRAINT [FK_TbAlmoxRequisicao_TbUsuario_Recebimento]
GO

ALTER TABLE [dbo].[TbAlmoxRequisicao] WITH CHECK ADD  CONSTRAINT [FK_TbAlmoxRequisicao_TbUsuario_Conclusao] FOREIGN KEY([IdUsuario_ConclusaoRequisicao]) REFERENCES [dbo].[TbUsuario] ([IdUsuario])                                                              
GO
ALTER TABLE [dbo].[TbAlmoxRequisicao] CHECK CONSTRAINT [FK_TbAlmoxRequisicao_TbUsuario_Conclusao]
GO

IF	EXISTS		( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbAlmoxUsuarioAlmoxarifado'	AND COLUMN_NAME = 'IdUsuario' )
	AND	EXISTS	( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbUsuario'					AND COLUMN_NAME = 'IdUsuario' )
	BEGIN
		ALTER TABLE [dbo].[TbAlmoxUsuarioAlmoxarifado] WITH CHECK ADD  CONSTRAINT [FK_TbAlmoxUsuarioAlmoxarifado_TbUsuario] FOREIGN KEY([IdUsuario]) REFERENCES [dbo].[TbUsuario] ([IdUsuario])                                                                          

		ALTER TABLE [dbo].[TbAlmoxUsuarioAlmoxarifado] CHECK CONSTRAINT [FK_TbAlmoxUsuarioAlmoxarifado_TbUsuario]
	END

ALTER TABLE [dbo].[TbAlmoxUsuarioCentroResultado] WITH CHECK ADD  CONSTRAINT [FK_TbAlmoxUsuarioCentroResultado_TbUsuario] FOREIGN KEY([IdUsuario]) REFERENCES [dbo].[TbUsuario] ([IdUsuario])                                                                    
GO
ALTER TABLE [dbo].[TbAlmoxUsuarioCentroResultado] CHECK CONSTRAINT [FK_TbAlmoxUsuarioCentroResultado_TbUsuario]
GO

IF	EXISTS		( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbAlmoxUsuarioGrupoMaterial'	AND COLUMN_NAME = 'IdUsuario' )
	AND	EXISTS	( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbUsuario'						AND COLUMN_NAME = 'IdUsuario' )
	BEGIN
		ALTER TABLE [dbo].[TbAlmoxUsuarioGrupoMaterial] WITH CHECK ADD  CONSTRAINT [FK_TbAlmoxUsuarioGrupoMaterial_TbUsuario] FOREIGN KEY([IdUsuario]) REFERENCES [dbo].[TbUsuario] ([IdUsuario])                                                                        

		ALTER TABLE [dbo].[TbAlmoxUsuarioGrupoMaterial] CHECK CONSTRAINT [FK_TbAlmoxUsuarioGrupoMaterial_TbUsuario]
	END

ALTER TABLE [dbo].[TbAlunoObs] WITH CHECK ADD  CONSTRAINT [FK_TbAlunoObs_TbUsuario] FOREIGN KEY([IdUsuarioRegistro]) REFERENCES [dbo].[TbUsuario] ([IdUsuario])                                                                                                  
GO
ALTER TABLE [dbo].[TbAlunoObs] CHECK CONSTRAINT [FK_TbAlunoObs_TbUsuario]
GO

ALTER TABLE [dbo].[TbAlunoObs] WITH CHECK ADD  CONSTRAINT [FK_TbAlunoObs_TbUsuario1] FOREIGN KEY([IdUsuarioLiberacao]) REFERENCES [dbo].[TbUsuario] ([IdUsuario])                                                                                                
GO
ALTER TABLE [dbo].[TbAlunoObs] CHECK CONSTRAINT [FK_TbAlunoObs_TbUsuario1]
GO


IF	EXISTS		( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbAlunoPeriodo'	AND COLUMN_NAME = 'IdUsuario_AditamentoFies' )
	AND	EXISTS	( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbUsuario'		AND COLUMN_NAME = 'IdUsuario' )
	BEGIN
		ALTER TABLE [dbo].[TbAlunoPeriodo] WITH CHECK ADD  CONSTRAINT [FK_TbAlunoPeriodo_TbUsuario] FOREIGN KEY([IdUsuario_AditamentoFies]) REFERENCES [dbo].[TbUsuario] ([IdUsuario])                                                                                   

		ALTER TABLE [dbo].[TbAlunoPeriodo] CHECK CONSTRAINT [FK_TbAlunoPeriodo_TbUsuario]
	END

IF	EXISTS		( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbAlunoRotinaEducacaoInfantil'	AND COLUMN_NAME = 'IdUsuarioResponsavel' )
	AND	EXISTS	( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbUsuario'						AND COLUMN_NAME = 'IdUsuario' )
	BEGIN
		ALTER TABLE [dbo].[TbAlunoRotinaEducacaoInfantil] WITH CHECK ADD  CONSTRAINT [FK_TbAlunoRotinaEducacaoInfantil_TbUsuario] FOREIGN KEY([IdUsuarioResponsavel]) REFERENCES [dbo].[TbUsuario] ([IdUsuario])                                                         

		ALTER TABLE [dbo].[TbAlunoRotinaEducacaoInfantil] CHECK CONSTRAINT [FK_TbAlunoRotinaEducacaoInfantil_TbUsuario]
	END

ALTER TABLE [dbo].[TbAlunoTurma] WITH CHECK ADD  CONSTRAINT [FK_TbAlunoTurma_TbUsuario] FOREIGN KEY([IdUsuarioEfetivacaoMatricula]) REFERENCES [dbo].[TbUsuario] ([IdUsuario])                                                                                   
GO
ALTER TABLE [dbo].[TbAlunoTurma] CHECK CONSTRAINT [FK_TbAlunoTurma_TbUsuario]
GO

ALTER TABLE [dbo].[TbAlunoTurmaBolsa] WITH CHECK ADD  CONSTRAINT [FK_TbAlunoServicoBolsa_TbUsuario] FOREIGN KEY([IdUsuarioAutorizacao]) REFERENCES [dbo].[TbUsuario] ([IdUsuario])                                                                               
GO
ALTER TABLE [dbo].[TbAlunoTurmaBolsa] CHECK CONSTRAINT [FK_TbAlunoServicoBolsa_TbUsuario]
GO

ALTER TABLE [dbo].[TbAlunoTurmaBolsaHistorico] WITH CHECK ADD  CONSTRAINT [FK_TbAlunoTurmaBolsaHistorico_TbUsuario] FOREIGN KEY([IdUsuario]) REFERENCES [dbo].[TbUsuario] ([IdUsuario])                                                                          
GO
ALTER TABLE [dbo].[TbAlunoTurmaBolsaHistorico] CHECK CONSTRAINT [FK_TbAlunoTurmaBolsaHistorico_TbUsuario]
GO

ALTER TABLE [dbo].[TbAlunoTurmaHistorico] WITH CHECK ADD  CONSTRAINT [FK_TbAlunoTurmaHistorico_TbUsuario] FOREIGN KEY([IdUsuario]) REFERENCES [dbo].[TbUsuario] ([IdUsuario])                                                                                    
GO
ALTER TABLE [dbo].[TbAlunoTurmaHistorico] CHECK CONSTRAINT [FK_TbAlunoTurmaHistorico_TbUsuario]
GO

ALTER TABLE [dbo].[TbAlunoTurmaProcedimentoMatricula] WITH CHECK ADD  CONSTRAINT [FK_TbAlunoTurmaProcedimentoMatricula_TbUsuario] FOREIGN KEY([IdUsuario]) REFERENCES [dbo].[TbUsuario] ([IdUsuario])                                                            
GO
ALTER TABLE [dbo].[TbAlunoTurmaProcedimentoMatricula] CHECK CONSTRAINT [FK_TbAlunoTurmaProcedimentoMatricula_TbUsuario]
GO

ALTER TABLE [dbo].[TbAlunoTurmaProcedimentoMatriculaHistorico] WITH CHECK ADD  CONSTRAINT [FK_TbAlunoTurmaProcedimentoMatriculaHistorico_TbUsuario] FOREIGN KEY([IdUsuario]) REFERENCES [dbo].[TbUsuario] ([IdUsuario])                                          
GO
ALTER TABLE [dbo].[TbAlunoTurmaProcedimentoMatriculaHistorico] CHECK CONSTRAINT [FK_TbAlunoTurmaProcedimentoMatriculaHistorico_TbUsuario]
GO

IF	EXISTS		( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbArquivoAnexo'	AND COLUMN_NAME = 'IdUsuarioUpload' )
	AND	EXISTS	( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbUsuario'		AND COLUMN_NAME = 'IdUsuario' )
	BEGIN
		ALTER TABLE [dbo].[TbArquivoAnexo] WITH CHECK ADD  CONSTRAINT [FK_IdUsuarioUpload_TbUsuario] FOREIGN KEY([IdUsuarioUpload]) REFERENCES [dbo].[TbUsuario] ([IdUsuario])                                                                                           

		ALTER TABLE [dbo].[TbArquivoAnexo] CHECK CONSTRAINT [FK_IdUsuarioUpload_TbUsuario]
	END

IF	EXISTS		( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbArquivoAnexo'	AND COLUMN_NAME = 'IdUsuarioExclusaoLogica' )
	AND	EXISTS	( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbUsuario'		AND COLUMN_NAME = 'IdUsuario' )
	BEGIN
		ALTER TABLE [dbo].[TbArquivoAnexo] WITH CHECK ADD  CONSTRAINT [FK_IdUsuarioExclusaoLogica_TbUsuario] FOREIGN KEY([IdUsuarioExclusaoLogica]) REFERENCES [dbo].[TbUsuario] ([IdUsuario])                                                                           

		ALTER TABLE [dbo].[TbArquivoAnexo] CHECK CONSTRAINT [FK_IdUsuarioExclusaoLogica_TbUsuario]
	END

ALTER TABLE [dbo].[TbAuditoria] WITH CHECK ADD  CONSTRAINT [FK_TbAuditoria_TbUsuario] FOREIGN KEY([IdUsuario]) REFERENCES [dbo].[TbUsuario] ([IdUsuario])                                                                                                        
GO
ALTER TABLE [dbo].[TbAuditoria] CHECK CONSTRAINT [FK_TbAuditoria_TbUsuario]
GO

ALTER TABLE [dbo].[TbCaixaMovimentacao] WITH CHECK ADD  CONSTRAINT [FK_TbCaixaMovimentacao_TbUsuario_Autorizacao] FOREIGN KEY([IdUsuarioAutorizacao]) REFERENCES [dbo].[TbUsuario] ([IdUsuario])                                                                 
GO
ALTER TABLE [dbo].[TbCaixaMovimentacao] CHECK CONSTRAINT [FK_TbCaixaMovimentacao_TbUsuario_Autorizacao]
GO

ALTER TABLE [dbo].[TbCaixaMovimentacao] WITH CHECK ADD  CONSTRAINT [FK_TbCaixaMovimentacao_TbUsuario] FOREIGN KEY([IdUsuarioAutorizacaoEstorno]) REFERENCES [dbo].[TbUsuario] ([IdUsuario])                                                                      
GO
ALTER TABLE [dbo].[TbCaixaMovimentacao] CHECK CONSTRAINT [FK_TbCaixaMovimentacao_TbUsuario]
GO

ALTER TABLE [dbo].[TbCaixaRecebimento] WITH CHECK ADD  CONSTRAINT [FK_TbCaixaRecebimento_TbUsuario] FOREIGN KEY([IdUsuarioEstornoRecebimento]) REFERENCES [dbo].[TbUsuario] ([IdUsuario])                                                                        
GO
ALTER TABLE [dbo].[TbCaixaRecebimento] CHECK CONSTRAINT [FK_TbCaixaRecebimento_TbUsuario]
GO

ALTER TABLE [dbo].[TbCaixaUsuario] WITH CHECK ADD  CONSTRAINT [FK_TbCaixaUsuario_TbUsuario] FOREIGN KEY([IdUsuario]) REFERENCES [dbo].[TbUsuario] ([IdUsuario])                                                                                                 
GO
ALTER TABLE [dbo].[TbCaixaUsuario] CHECK CONSTRAINT [FK_TbCaixaUsuario_TbUsuario]
GO

IF	EXISTS		( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbCaptacaoAlunoInteressado'	AND COLUMN_NAME = 'IdUsuarioResponsavel' )
	AND	EXISTS	( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbUsuario'					AND COLUMN_NAME = 'IdUsuario' )
	BEGIN
		ALTER TABLE [dbo].[TbCaptacaoAlunoInteressado] WITH CHECK ADD  CONSTRAINT [FK_TbCaptacaoAlunoInteressado_TbUsuario] FOREIGN KEY([IdUsuarioResponsavel]) REFERENCES [dbo].[TbUsuario] ([IdUsuario])                                                               

		ALTER TABLE [dbo].[TbCaptacaoAlunoInteressado] CHECK CONSTRAINT [FK_TbCaptacaoAlunoInteressado_TbUsuario]
	END

IF	EXISTS		( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbCaptacaoInteracao'	AND COLUMN_NAME = 'IdUsuario' )
	AND	EXISTS	( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbUsuario'				AND COLUMN_NAME = 'IdUsuario' )
	BEGIN
		ALTER TABLE [dbo].[TbCaptacaoInteracao] WITH CHECK ADD  CONSTRAINT [FK_TbCaptacaoInteracao_TbUsuario] FOREIGN KEY([IdUsuario]) REFERENCES [dbo].[TbUsuario] ([IdUsuario])                                                                                        

		ALTER TABLE [dbo].[TbCaptacaoInteracao] CHECK CONSTRAINT [FK_TbCaptacaoInteracao_TbUsuario]
	END

ALTER TABLE [dbo].[TbChequeMovimentacao] WITH CHECK ADD  CONSTRAINT [FK_TbChequeMovimentacao_TbUsuario] FOREIGN KEY([IdUsuario]) REFERENCES [dbo].[TbUsuario] ([IdUsuario])                                                                                      
GO
ALTER TABLE [dbo].[TbChequeMovimentacao] CHECK CONSTRAINT [FK_TbChequeMovimentacao_TbUsuario]
GO

ALTER TABLE [dbo].[TbContaUsuario] WITH CHECK ADD  CONSTRAINT [FK_TbContaUsuario_TbUsuario] FOREIGN KEY([IdUsuario]) REFERENCES [dbo].[TbUsuario] ([IdUsuario])                                                                                                  
GO
ALTER TABLE [dbo].[TbContaUsuario] CHECK CONSTRAINT [FK_TbContaUsuario_TbUsuario]
GO

IF	EXISTS		( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbCurso'	AND COLUMN_NAME = 'IdUsuarioCoordenadorResponsavel' )
	AND	EXISTS	( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbUsuario'	AND COLUMN_NAME = 'IdUsuario' )
	BEGIN
		ALTER TABLE [dbo].[TbCurso] WITH CHECK ADD  CONSTRAINT [FK_TbCurso_TbUsuario] FOREIGN KEY([IdUsuarioCoordenadorResponsavel]) REFERENCES [dbo].[TbUsuario] ([IdUsuario])                                                                                          

		ALTER TABLE [dbo].[TbCurso] CHECK CONSTRAINT [FK_TbCurso_TbUsuario]
	END

IF	EXISTS		( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbDadosUso'	AND COLUMN_NAME = 'IdUsuario' )
	AND	EXISTS	( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbUsuario'	AND COLUMN_NAME = 'IdUsuario' )
	BEGIN
		ALTER TABLE [dbo].[TbDadosUso] WITH CHECK ADD  CONSTRAINT [FK_TbDadosUso_TbUsuario] FOREIGN KEY([IdUsuario]) REFERENCES [dbo].[TbUsuario] ([IdUsuario])                                                                                                          

		ALTER TABLE [dbo].[TbDadosUso] CHECK CONSTRAINT [FK_TbDadosUso_TbUsuario]
	END

ALTER TABLE [dbo].[TbEscola] WITH CHECK ADD  CONSTRAINT [FK_TbEscola_TbUsuario] FOREIGN KEY([IdUsuarioRespEscola]) REFERENCES [dbo].[TbUsuario] ([IdUsuario])                                                                                                    
GO
ALTER TABLE [dbo].[TbEscola] CHECK CONSTRAINT [FK_TbEscola_TbUsuario]
GO

IF	EXISTS		( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbFaseNotaAluno_FilaProcessamento'	AND COLUMN_NAME = 'IdUsuario' )
	AND	EXISTS	( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbUsuario'							AND COLUMN_NAME = 'IdUsuario' )
	BEGIN
		ALTER TABLE [dbo].[TbFaseNotaAluno_FilaProcessamento] WITH CHECK ADD  CONSTRAINT [FK_TbFaseNotaAluno_FilaProcessamento_TbUsuario] FOREIGN KEY([IdUsuario]) REFERENCES [dbo].[TbUsuario] ([IdUsuario])                                                            

		ALTER TABLE [dbo].[TbFaseNotaAluno_FilaProcessamento] CHECK CONSTRAINT [FK_TbFaseNotaAluno_FilaProcessamento_TbUsuario]
	END

ALTER TABLE [dbo].[TbFidUsuarioPontuacao] WITH CHECK ADD  CONSTRAINT [FK_TbFidUsuarioPontuacao_TbUsuario] FOREIGN KEY([IdUsuarioLancamento]) REFERENCES [dbo].[TbUsuario] ([IdUsuario])                                                                          
GO
ALTER TABLE [dbo].[TbFidUsuarioPontuacao] CHECK CONSTRAINT [FK_TbFidUsuarioPontuacao_TbUsuario]
GO

ALTER TABLE [dbo].[TbLoteCobrancaRegistrada] WITH CHECK ADD  CONSTRAINT [FK_TbLoteCobrancaRegistrada_TbUsuario] FOREIGN KEY([IdUsuarioFechamento]) REFERENCES [dbo].[TbUsuario] ([IdUsuario])                                                                    
GO
ALTER TABLE [dbo].[TbLoteCobrancaRegistrada] CHECK CONSTRAINT [FK_TbLoteCobrancaRegistrada_TbUsuario]
GO

ALTER TABLE [dbo].[TbLoteCobrancaRegistradaArquivoRemessa] WITH CHECK ADD  CONSTRAINT [FK_TbLoteCobrancaRegistradaArquivoRemessa_TbUsuario] FOREIGN KEY([IdUsuario]) REFERENCES [dbo].[TbUsuario] ([IdUsuario])                                                  
GO
ALTER TABLE [dbo].[TbLoteCobrancaRegistradaArquivoRemessa] CHECK CONSTRAINT [FK_TbLoteCobrancaRegistradaArquivoRemessa_TbUsuario]
GO

ALTER TABLE [dbo].[TbMensagemCaixaSaida] WITH CHECK ADD  CONSTRAINT [FK_TbMensagemCaixaSaida_TbUsuario] FOREIGN KEY([IdUsuarioInsercao]) REFERENCES [dbo].[TbUsuario] ([IdUsuario])                                                                              
GO
ALTER TABLE [dbo].[TbMensagemCaixaSaida] CHECK CONSTRAINT [FK_TbMensagemCaixaSaida_TbUsuario]
GO

ALTER TABLE [dbo].[TbMobileTipoMensagemUsuario] WITH CHECK ADD  CONSTRAINT [FK_TbMobileTipoMensagemUsuario_TbUsuario] FOREIGN KEY([IdUsuario]) REFERENCES [dbo].[TbUsuario] ([IdUsuario])                                                                        
GO
ALTER TABLE [dbo].[TbMobileTipoMensagemUsuario] CHECK CONSTRAINT [FK_TbMobileTipoMensagemUsuario_TbUsuario]
GO

ALTER TABLE [dbo].[TbNegociacao] WITH CHECK ADD  CONSTRAINT [FK_TbNegociacao_TbUsuario] FOREIGN KEY([IdUsuario]) REFERENCES [dbo].[TbUsuario] ([IdUsuario])                                                                                                      
GO
ALTER TABLE [dbo].[TbNegociacao] CHECK CONSTRAINT [FK_TbNegociacao_TbUsuario]
GO

ALTER TABLE [dbo].[TbNotaFiscalLote] WITH CHECK ADD  CONSTRAINT [FK_TbNotaFiscalLote_TbUsuario] FOREIGN KEY([IdUsuarioFechamento]) REFERENCES [dbo].[TbUsuario] ([IdUsuario])                                                                                    
GO
ALTER TABLE [dbo].[TbNotaFiscalLote] CHECK CONSTRAINT [FK_TbNotaFiscalLote_TbUsuario]
GO

ALTER TABLE [dbo].[TbOptProva] WITH CHECK ADD  CONSTRAINT [FK_TbOptProva_TbUsuario] FOREIGN KEY([IdUsuarioUltimaAlteracaoGabarito]) REFERENCES [dbo].[TbUsuario] ([IdUsuario])                                                                                   
GO
ALTER TABLE [dbo].[TbOptProva] CHECK CONSTRAINT [FK_TbOptProva_TbUsuario]
GO

ALTER TABLE [dbo].[TbPagamentoLote] WITH CHECK ADD  CONSTRAINT [FK_TbPagamentoArquivoRetorno_TbUsuario] FOREIGN KEY([IdUsuarioImportacao]) REFERENCES [dbo].[TbUsuario] ([IdUsuario])                                                                            
GO
ALTER TABLE [dbo].[TbPagamentoLote] CHECK CONSTRAINT [FK_TbPagamentoArquivoRetorno_TbUsuario]
GO

ALTER TABLE [dbo].[TbProfessorObs] WITH CHECK ADD  CONSTRAINT [FK_TbProfessorObs_TbUsuario] FOREIGN KEY([IdUsuarioRegistro]) REFERENCES [dbo].[TbUsuario] ([IdUsuario])                                                                                          
GO
ALTER TABLE [dbo].[TbProfessorObs] CHECK CONSTRAINT [FK_TbProfessorObs_TbUsuario]
GO

ALTER TABLE [dbo].[TbRateioPagamento] WITH CHECK ADD  CONSTRAINT [FK_TbRateioPagamento_TbUsuario] FOREIGN KEY([IdUsuario]) REFERENCES [dbo].[TbUsuario] ([IdUsuario])                                                                                            
GO
ALTER TABLE [dbo].[TbRateioPagamento] CHECK CONSTRAINT [FK_TbRateioPagamento_TbUsuario]
GO

ALTER TABLE [dbo].[TbResponsavelObs] WITH CHECK ADD  CONSTRAINT [FK_TbResponsavelObs_TbUsuario_Registro] FOREIGN KEY([IdUsuarioRegistro]) REFERENCES [dbo].[TbUsuario] ([IdUsuario])                                                                             
GO
ALTER TABLE [dbo].[TbResponsavelObs] CHECK CONSTRAINT [FK_TbResponsavelObs_TbUsuario_Registro]
GO

ALTER TABLE [dbo].[TbResponsavelObs] WITH CHECK ADD  CONSTRAINT [FK_TbResponsavelObs_TbUsuario_Liberacao] FOREIGN KEY([IdUsuarioLiberacao]) REFERENCES [dbo].[TbUsuario] ([IdUsuario])                                                                           
GO
ALTER TABLE [dbo].[TbResponsavelObs] CHECK CONSTRAINT [FK_TbResponsavelObs_TbUsuario_Liberacao]
GO

IF	EXISTS		( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbSituacaoAlunoDisciplina'	AND COLUMN_NAME = 'IdUsuarioMatricula' )
	AND	EXISTS	( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbUsuario'					AND COLUMN_NAME = 'IdUsuario' )
	BEGIN
		ALTER TABLE [dbo].[TbSituacaoAlunoDisciplina] WITH CHECK ADD  CONSTRAINT [FK_TbSituacaoAlunoDisciplina_TbUsuarioMatricula] FOREIGN KEY([IdUsuarioMatricula]) REFERENCES [dbo].[TbUsuario] ([IdUsuario])                                                          

		ALTER TABLE [dbo].[TbSituacaoAlunoDisciplina] CHECK CONSTRAINT [FK_TbSituacaoAlunoDisciplina_TbUsuarioMatricula]
	END

IF	EXISTS		( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbSituacaoAlunoDisciplina'	AND COLUMN_NAME = 'IdUsuarioTrancamento' )
	AND	EXISTS	( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbUsuario'					AND COLUMN_NAME = 'IdUsuario' )
	BEGIN
		ALTER TABLE [dbo].[TbSituacaoAlunoDisciplina] WITH CHECK ADD  CONSTRAINT [FK_TbSituacaoAlunoDisciplina_TbUsuarioTrancamento] FOREIGN KEY([IdUsuarioTrancamento]) REFERENCES [dbo].[TbUsuario] ([IdUsuario])                                                      

		ALTER TABLE [dbo].[TbSituacaoAlunoDisciplina] CHECK CONSTRAINT [FK_TbSituacaoAlunoDisciplina_TbUsuarioTrancamento]
	END

ALTER TABLE [dbo].[TbSolicitacao] WITH CHECK ADD  CONSTRAINT [FK_TbSolicitacao_TbUsuario] FOREIGN KEY([IdUsuarioAnalise]) REFERENCES [dbo].[TbUsuario] ([IdUsuario])                                                                                             
GO
ALTER TABLE [dbo].[TbSolicitacao] CHECK CONSTRAINT [FK_TbSolicitacao_TbUsuario]
GO

ALTER TABLE [dbo].[TbSolicitacaoDesconto] WITH CHECK ADD  CONSTRAINT [FK_TbSolicitacaoDesconto_TbUsuario] FOREIGN KEY([Analise_IdUsuario]) REFERENCES [dbo].[TbUsuario] ([IdUsuario])                                                                            
GO
ALTER TABLE [dbo].[TbSolicitacaoDesconto] CHECK CONSTRAINT [FK_TbSolicitacaoDesconto_TbUsuario]
GO

ALTER TABLE [dbo].[TbSolicitacaoDespesa] WITH CHECK ADD  CONSTRAINT [FK_TbSolicitacaoDespesa_TbUsuario_Solicitante] FOREIGN KEY([IdUsuarioSolicitante]) REFERENCES [dbo].[TbUsuario] ([IdUsuario])                                                               
GO
ALTER TABLE [dbo].[TbSolicitacaoDespesa] CHECK CONSTRAINT [FK_TbSolicitacaoDespesa_TbUsuario_Solicitante]
GO

ALTER TABLE [dbo].[TbSolicitacaoDespesa] WITH CHECK ADD  CONSTRAINT [FK_TbSolicitacaoDespesa_TbUsuario_Autorizacao] FOREIGN KEY([IdUsuarioAutorizacao]) REFERENCES [dbo].[TbUsuario] ([IdUsuario])                                                               
GO
ALTER TABLE [dbo].[TbSolicitacaoDespesa] CHECK CONSTRAINT [FK_TbSolicitacaoDespesa_TbUsuario_Autorizacao]
GO

ALTER TABLE [dbo].[TbTituloCobranca_CobrarValorPagoAMenor] WITH CHECK ADD  CONSTRAINT [FK_TbTituloCobranca_CobrarValorPagoAMenor_TbUsuario] FOREIGN KEY([IdUsuario]) REFERENCES [dbo].[TbUsuario] ([IdUsuario])                                                  
GO
ALTER TABLE [dbo].[TbTituloCobranca_CobrarValorPagoAMenor] CHECK CONSTRAINT [FK_TbTituloCobranca_CobrarValorPagoAMenor_TbUsuario]
GO

ALTER TABLE [dbo].[TbTituloCobranca_CobrarValorPagoAMenor] WITH CHECK ADD  CONSTRAINT [FK_TbTituloCobranca_CobrarValorPagoAMenor_TbUsuarioConferido] FOREIGN KEY([IdUsuarioConferido]) REFERENCES [dbo].[TbUsuario] ([IdUsuario])                                
GO
ALTER TABLE [dbo].[TbTituloCobranca_CobrarValorPagoAMenor] CHECK CONSTRAINT [FK_TbTituloCobranca_CobrarValorPagoAMenor_TbUsuarioConferido]
GO

ALTER TABLE [dbo].[TbTituloCobrancaCadastroInadimplente] WITH CHECK ADD  CONSTRAINT [FK_TbTituloCobrancaCadastroInadimplente_TbUsuario] FOREIGN KEY([IdUsuario]) REFERENCES [dbo].[TbUsuario] ([IdUsuario])                                                      
GO
ALTER TABLE [dbo].[TbTituloCobrancaCadastroInadimplente] CHECK CONSTRAINT [FK_TbTituloCobrancaCadastroInadimplente_TbUsuario]
GO

ALTER TABLE [dbo].[TbTituloCobrancaRegistrada] WITH CHECK ADD  CONSTRAINT [FK_TbTituloCobrancaRegistrada_TbUsuario] FOREIGN KEY([IdUsuario]) REFERENCES [dbo].[TbUsuario] ([IdUsuario])                                                                          
GO
ALTER TABLE [dbo].[TbTituloCobrancaRegistrada] CHECK CONSTRAINT [FK_TbTituloCobrancaRegistrada_TbUsuario]
GO

ALTER TABLE [dbo].[TbTurma] WITH CHECK ADD  CONSTRAINT [FK_TbTurma_TbUsuario] FOREIGN KEY([IdUsuarioCoordenador]) REFERENCES [dbo].[TbUsuario] ([IdUsuario])                                                                                                     
GO
ALTER TABLE [dbo].[TbTurma] CHECK CONSTRAINT [FK_TbTurma_TbUsuario]
GO

IF	EXISTS		( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbTurmaProfessor'	AND COLUMN_NAME = 'IdUsuarioConfirmacao' )
	AND	EXISTS	( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbUsuario'			AND COLUMN_NAME = 'IdUsuario' )
	BEGIN
		ALTER TABLE [dbo].[TbTurmaProfessor] WITH CHECK ADD  CONSTRAINT [FK_TbAlunoProfessor_TbUsuario_IdUsuarioConfirmacao] FOREIGN KEY([IdUsuarioConfirmacao]) REFERENCES [dbo].[TbUsuario] ([IdUsuario])                                                              

		ALTER TABLE [dbo].[TbTurmaProfessor] CHECK CONSTRAINT [FK_TbAlunoProfessor_TbUsuario_IdUsuarioConfirmacao]
	END

ALTER TABLE [dbo].[TbUnidade] WITH CHECK ADD  CONSTRAINT [FK_TbUnidade_TbUsuario1] FOREIGN KEY([IdUsuarioRespSecretaria]) REFERENCES [dbo].[TbUsuario] ([IdUsuario])                                                                                             
GO
ALTER TABLE [dbo].[TbUnidade] CHECK CONSTRAINT [FK_TbUnidade_TbUsuario1]
GO

ALTER TABLE [dbo].[TbUnidade] WITH CHECK ADD  CONSTRAINT [FK_TbUnidade_TbUsuario] FOREIGN KEY([IdUsuarioRespUnidade]) REFERENCES [dbo].[TbUsuario] ([IdUsuario])                                                                                                 
GO
ALTER TABLE [dbo].[TbUnidade] CHECK CONSTRAINT [FK_TbUnidade_TbUsuario]
GO

ALTER TABLE [dbo].[TbUsuarioGrupo] WITH CHECK ADD  CONSTRAINT [FK_TbUsuarioGrupo_TbUsuario] FOREIGN KEY([IdUsuario]) REFERENCES [dbo].[TbUsuario] ([IdUsuario])                                                                                                  
GO
ALTER TABLE [dbo].[TbUsuarioGrupo] CHECK CONSTRAINT [FK_TbUsuarioGrupo_TbUsuario]
GO

ALTER TABLE [dbo].[TbUsuarioUnidade] WITH CHECK ADD  CONSTRAINT [FK_TbUsuarioUnidade_TbUsuario] FOREIGN KEY([IdUsuario]) REFERENCES [dbo].[TbUsuario] ([IdUsuario])                                                                                              
GO
ALTER TABLE [dbo].[TbUsuarioUnidade] CHECK CONSTRAINT [FK_TbUsuarioUnidade_TbUsuario]
GO


IF	EXISTS		( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbPesquisaNPS'	AND COLUMN_NAME = 'IdUsuario' )
	AND	EXISTS	( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbUsuario'		AND COLUMN_NAME = 'IdUsuario' )
	BEGIN
		ALTER TABLE [dbo].[TbPesquisaNPS]  WITH CHECK ADD  CONSTRAINT [FK_TbPesquisaNPS_TbUsuario] FOREIGN KEY([IdUsuario]) REFERENCES [dbo].[TbUsuario] ([IdUsuario])

		ALTER TABLE [dbo].[TbPesquisaNPS] CHECK CONSTRAINT [FK_TbPesquisaNPS_TbUsuario]
	END

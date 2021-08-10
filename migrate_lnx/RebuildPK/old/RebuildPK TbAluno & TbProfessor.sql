-- RebuildPK TbAluno & TbProfessor 
 

IF OBJECT_ID('dbo.FK_TbAluno_TbAluno_Vinculado') IS NOT NULL
BEGIN
	ALTER TABLE [dbo].[TbAluno] DROP CONSTRAINT [FK_TbAluno_TbAluno_Vinculado]
END

IF OBJECT_ID('dbo.FK_TbAlunoCurso_TbAluno') IS NOT NULL
BEGIN
	ALTER TABLE [dbo].[TbAlunoCurso] DROP CONSTRAINT [FK_TbAlunoCurso_TbAluno]
END

IF OBJECT_ID('dbo.FK_TbAlunoCursoSuperior_TbAluno') IS NOT NULL
BEGIN
	ALTER TABLE [dbo].[TbAlunoCursoSuperior] DROP CONSTRAINT [FK_TbAlunoCursoSuperior_TbAluno]
END

ALTER TABLE [dbo].[TbAlunoFichaMedica] DROP CONSTRAINT [FK_TbAlunoFichaMedica_TbAluno]
GO
ALTER TABLE [dbo].[TbAlunoFoto] DROP CONSTRAINT [FK_TbAlunoFoto_TbAluno]
GO
ALTER TABLE [dbo].[TbAlunoImpressaoDigital] DROP CONSTRAINT [FK_TbAlunoImpressaoDigital_TbAluno]
GO
ALTER TABLE [dbo].[TbAlunoObs] DROP CONSTRAINT [FK_TbAlunoObs_TbAluno]
GO
ALTER TABLE [dbo].[TbAlunoProprioResponsavel] DROP CONSTRAINT [FK_TbAlunoProprioResponsavel_TbAluno]
GO
ALTER TABLE [dbo].[TbAlunoRotinaEducacaoInfantil] DROP CONSTRAINT [FK_TbAlunoRotinaEducacaoInfantil_TbAluno]
GO
ALTER TABLE [dbo].[TbAlunoServico] DROP CONSTRAINT [FK_TbAlunoServico_TbAluno]
GO
ALTER TABLE [dbo].[TbAlunoTaxa] DROP CONSTRAINT [FK_TbAlunoTaxa_TbAluno]
GO

IF OBJECT_ID('dbo.FK_TbAlunoTurma_TbFaseNota') IS NOT NULL
BEGIN
	ALTER TABLE [dbo].[TbAlunoTipoAvaliacao] DROP CONSTRAINT [FK_TbAlunoTipoAvaliacao_TbAluno]
END

ALTER TABLE [dbo].[TbAlunoTurma] DROP CONSTRAINT [FK_TbAlunoTurma_TbAluno]
GO
ALTER TABLE [dbo].[TbAlunoTurmaBolsa] DROP CONSTRAINT [FK_TbAlunoTurmaBolsa_TbAluno]
GO
ALTER TABLE [dbo].[TbAlunoTurmaBolsaHistorico] DROP CONSTRAINT [FK_TbAlunoTurmaBolsaHistorico_TbAluno]
GO
ALTER TABLE [dbo].[TbAlunoTurmaHistorico] DROP CONSTRAINT [FK_TbAlunoTurmaHistorico_TbAluno]
GO
ALTER TABLE [dbo].[TbAlunoTurmaReserva] DROP CONSTRAINT [FK_TbAlunoTurmaReserva_TbAluno]
GO

IF OBJECT_ID('dbo.FK_TbAlunoTurma_TbFaseNota') IS NOT NULL
BEGIN
	ALTER TABLE [dbo].[TbArqArquivoAlunoVisualizacao] DROP CONSTRAINT [FK_TbArqArquivoAlunoVisualizacao_IdAluno]
END

ALTER TABLE [dbo].[TbAtividadeDistribuicaoAluno] DROP CONSTRAINT [FK_TbAtividadeDistribuicaoAluno_TbAluno]
GO
ALTER TABLE [dbo].[TbCaptacaoAlunoInteressado] DROP CONSTRAINT [FK_TbCaptacaoAlunoInteressado_TbAluno]
GO
ALTER TABLE [dbo].[TbDiarioAluno] DROP CONSTRAINT [FK_TbDiarioAluno_TbAluno]
GO

IF OBJECT_ID('dbo.FK_TbAlunoTurma_TbFaseNota') IS NOT NULL
BEGIN
	ALTER TABLE [dbo].[TbFaseNotaAluno_FilaProcessamento] DROP CONSTRAINT [FK_TbFaseNotaAluno_FilaProcessamento_TbAluno]
END

ALTER TABLE [dbo].[TbFiesRepasse] DROP CONSTRAINT [FK_TbFiesRepasse_TbAluno]
GO
ALTER TABLE [dbo].[TbFreqAlunoNotificacaoResponsavel] DROP CONSTRAINT [FK_TbFreqAlunoNotificacaoResponsavel_TbAluno]
GO
ALTER TABLE [dbo].[TbFreqAlunoPermissaoSaida] DROP CONSTRAINT [FK_TbFreqAlunoPermissaoSaida_TbAluno]
GO
ALTER TABLE [dbo].[TbFreqApuracao] DROP CONSTRAINT [FK_TbFreqApuracao_TbAluno]
GO
ALTER TABLE [dbo].[TbHistorico] DROP CONSTRAINT [FK_TbHistorico_TbAluno]
GO
ALTER TABLE [dbo].[TbHistoricoAproveitamento] DROP CONSTRAINT [FK_TbHistoricoAproveitamento_TbAluno]
GO
ALTER TABLE [dbo].[TbMetaFaseNotaAlunoRegistro] DROP CONSTRAINT [FK_TbMetaFaseNotaAlunoRegistro_TbAluno]
GO
ALTER TABLE [dbo].[TbNegociacao] DROP CONSTRAINT [FK_TbNegociacao_TbAluno]
GO
ALTER TABLE [dbo].[TbOptProvaAlunoTurma] DROP CONSTRAINT [FK_TbOptProvaAlunoTurma_TbAluno]
GO
ALTER TABLE [dbo].[TbSolicitacaoDesconto] DROP CONSTRAINT [FK_TbSolicitacaoDesconto_TbAluno]
GO
ALTER TABLE [dbo].[TbTituloCobranca] DROP CONSTRAINT [FK_TbTituloCobranca_TbAluno]
GO



ALTER TABLE [dbo].[TbAluno] DROP CONSTRAINT [PK_TbAluno]
GO


ALTER TABLE [dbo].[TbAluno] ADD  CONSTRAINT [PK_TbAluno] PRIMARY KEY CLUSTERED 
(
        [IdAluno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO

                                                                                                                                                                                                                                                                 
ALTER TABLE [dbo].[TbAluno] WITH CHECK ADD  CONSTRAINT [FK_TbAluno_TbAluno_Vinculado] FOREIGN KEY([IdAluno_CadastroVinculadoOrigem]) REFERENCES [dbo].[TbAluno] ([IdAluno])                                                                                      
GO
ALTER TABLE [dbo].[TbAluno] CHECK CONSTRAINT [FK_TbAluno_TbAluno_Vinculado]
GO

ALTER TABLE [dbo].[TbAlunoCurso] WITH CHECK ADD  CONSTRAINT [FK_TbAlunoCurso_TbAluno] FOREIGN KEY([IdAluno]) REFERENCES [dbo].[TbAluno] ([IdAluno])                                                                                                              
GO
ALTER TABLE [dbo].[TbAlunoCurso] CHECK CONSTRAINT [FK_TbAlunoCurso_TbAluno]
GO

ALTER TABLE [dbo].[TbAlunoCursoSuperior] WITH CHECK ADD  CONSTRAINT [FK_TbAlunoCursoSuperior_TbAluno] FOREIGN KEY([IdAluno]) REFERENCES [dbo].[TbAluno] ([IdAluno])                                                                                              
GO
ALTER TABLE [dbo].[TbAlunoCursoSuperior] CHECK CONSTRAINT [FK_TbAlunoCursoSuperior_TbAluno]
GO

ALTER TABLE [dbo].[TbAlunoFichaMedica] WITH CHECK ADD  CONSTRAINT [FK_TbAlunoFichaMedica_TbAluno] FOREIGN KEY([IdAluno]) REFERENCES [dbo].[TbAluno] ([IdAluno])                                                                                                  
GO
ALTER TABLE [dbo].[TbAlunoFichaMedica] CHECK CONSTRAINT [FK_TbAlunoFichaMedica_TbAluno]
GO

ALTER TABLE [dbo].[TbAlunoFoto] WITH CHECK ADD  CONSTRAINT [FK_TbAlunoFoto_TbAluno] FOREIGN KEY([IdAluno]) REFERENCES [dbo].[TbAluno] ([IdAluno])                                                                                                                
GO
ALTER TABLE [dbo].[TbAlunoFoto] CHECK CONSTRAINT [FK_TbAlunoFoto_TbAluno]
GO

ALTER TABLE [dbo].[TbAlunoImpressaoDigital] WITH CHECK ADD  CONSTRAINT [FK_TbAlunoImpressaoDigital_TbAluno] FOREIGN KEY([IdAluno]) REFERENCES [dbo].[TbAluno] ([IdAluno])                                                                                        
GO
ALTER TABLE [dbo].[TbAlunoImpressaoDigital] CHECK CONSTRAINT [FK_TbAlunoImpressaoDigital_TbAluno]
GO

ALTER TABLE [dbo].[TbAlunoObs] WITH CHECK ADD  CONSTRAINT [FK_TbAlunoObs_TbAluno] FOREIGN KEY([IdAluno]) REFERENCES [dbo].[TbAluno] ([IdAluno])                                                                                                                  
GO
ALTER TABLE [dbo].[TbAlunoObs] CHECK CONSTRAINT [FK_TbAlunoObs_TbAluno]
GO

ALTER TABLE [dbo].[TbAlunoProprioResponsavel] WITH CHECK ADD  CONSTRAINT [FK_TbAlunoProprioResponsavel_TbAluno] FOREIGN KEY([IdAluno]) REFERENCES [dbo].[TbAluno] ([IdAluno])                                                                                    
GO
ALTER TABLE [dbo].[TbAlunoProprioResponsavel] CHECK CONSTRAINT [FK_TbAlunoProprioResponsavel_TbAluno]
GO

ALTER TABLE [dbo].[TbAlunoRotinaEducacaoInfantil] WITH CHECK ADD  CONSTRAINT [FK_TbAlunoRotinaEducacaoInfantil_TbAluno] FOREIGN KEY([IdAluno]) REFERENCES [dbo].[TbAluno] ([IdAluno])                                                                            
GO
ALTER TABLE [dbo].[TbAlunoRotinaEducacaoInfantil] CHECK CONSTRAINT [FK_TbAlunoRotinaEducacaoInfantil_TbAluno]
GO

ALTER TABLE [dbo].[TbAlunoServico] WITH CHECK ADD  CONSTRAINT [FK_TbAlunoServico_TbAluno] FOREIGN KEY([IdAluno]) REFERENCES [dbo].[TbAluno] ([IdAluno])                                                                                                          
GO
ALTER TABLE [dbo].[TbAlunoServico] CHECK CONSTRAINT [FK_TbAlunoServico_TbAluno]
GO

ALTER TABLE [dbo].[TbAlunoTaxa] WITH CHECK ADD  CONSTRAINT [FK_TbAlunoTaxa_TbAluno] FOREIGN KEY([IdAluno]) REFERENCES [dbo].[TbAluno] ([IdAluno])                                                                                                                
GO
ALTER TABLE [dbo].[TbAlunoTaxa] CHECK CONSTRAINT [FK_TbAlunoTaxa_TbAluno]
GO

ALTER TABLE [dbo].[TbAlunoTipoAvaliacao] WITH CHECK ADD  CONSTRAINT [FK_TbAlunoTipoAvaliacao_TbAluno] FOREIGN KEY([IdAluno]) REFERENCES [dbo].[TbAluno] ([IdAluno])                                                                                              
GO
ALTER TABLE [dbo].[TbAlunoTipoAvaliacao] CHECK CONSTRAINT [FK_TbAlunoTipoAvaliacao_TbAluno]
GO

ALTER TABLE [dbo].[TbAlunoTurma] WITH CHECK ADD  CONSTRAINT [FK_TbAlunoTurma_TbAluno] FOREIGN KEY([IdAluno]) REFERENCES [dbo].[TbAluno] ([IdAluno])                                                                                                              
GO
ALTER TABLE [dbo].[TbAlunoTurma] CHECK CONSTRAINT [FK_TbAlunoTurma_TbAluno]
GO

ALTER TABLE [dbo].[TbAlunoTurmaBolsa] WITH CHECK ADD  CONSTRAINT [FK_TbAlunoTurmaBolsa_TbAluno] FOREIGN KEY([IdAluno]) REFERENCES [dbo].[TbAluno] ([IdAluno])                                                                                                    
GO
ALTER TABLE [dbo].[TbAlunoTurmaBolsa] CHECK CONSTRAINT [FK_TbAlunoTurmaBolsa_TbAluno]
GO

ALTER TABLE [dbo].[TbAlunoTurmaBolsaHistorico] WITH CHECK ADD  CONSTRAINT [FK_TbAlunoTurmaBolsaHistorico_TbAluno] FOREIGN KEY([IdAluno]) REFERENCES [dbo].[TbAluno] ([IdAluno])                                                                                  
GO
ALTER TABLE [dbo].[TbAlunoTurmaBolsaHistorico] CHECK CONSTRAINT [FK_TbAlunoTurmaBolsaHistorico_TbAluno]
GO

ALTER TABLE [dbo].[TbAlunoTurmaHistorico] WITH CHECK ADD  CONSTRAINT [FK_TbAlunoTurmaHistorico_TbAluno] FOREIGN KEY([IdAluno]) REFERENCES [dbo].[TbAluno] ([IdAluno])                                                                                            
GO
ALTER TABLE [dbo].[TbAlunoTurmaHistorico] CHECK CONSTRAINT [FK_TbAlunoTurmaHistorico_TbAluno]
GO

ALTER TABLE [dbo].[TbAlunoTurmaReserva] WITH CHECK ADD  CONSTRAINT [FK_TbAlunoTurmaReserva_TbAluno] FOREIGN KEY([IdAluno]) REFERENCES [dbo].[TbAluno] ([IdAluno])                                                                                                
GO
ALTER TABLE [dbo].[TbAlunoTurmaReserva] CHECK CONSTRAINT [FK_TbAlunoTurmaReserva_TbAluno]
GO

ALTER TABLE [dbo].[TbArqArquivoAlunoVisualizacao] WITH CHECK ADD  CONSTRAINT [FK_TbArqArquivoAlunoVisualizacao_IdAluno] FOREIGN KEY([IdAluno]) REFERENCES [dbo].[TbAluno] ([IdAluno])                                                                            
GO
ALTER TABLE [dbo].[TbArqArquivoAlunoVisualizacao] CHECK CONSTRAINT [FK_TbArqArquivoAlunoVisualizacao_IdAluno]
GO

ALTER TABLE [dbo].[TbAtividadeDistribuicaoAluno] WITH CHECK ADD  CONSTRAINT [FK_TbAtividadeDistribuicaoAluno_TbAluno] FOREIGN KEY([IdAluno]) REFERENCES [dbo].[TbAluno] ([IdAluno])                                                                              
GO
ALTER TABLE [dbo].[TbAtividadeDistribuicaoAluno] CHECK CONSTRAINT [FK_TbAtividadeDistribuicaoAluno_TbAluno]
GO

ALTER TABLE [dbo].[TbCaptacaoAlunoInteressado] WITH CHECK ADD  CONSTRAINT [FK_TbCaptacaoAlunoInteressado_TbAluno] FOREIGN KEY([IdAlunoConvertido]) REFERENCES [dbo].[TbAluno] ([IdAluno])                                                                        
GO
ALTER TABLE [dbo].[TbCaptacaoAlunoInteressado] CHECK CONSTRAINT [FK_TbCaptacaoAlunoInteressado_TbAluno]
GO

ALTER TABLE [dbo].[TbDiarioAluno] WITH CHECK ADD  CONSTRAINT [FK_TbDiarioAluno_TbAluno] FOREIGN KEY([IdAluno]) REFERENCES [dbo].[TbAluno] ([IdAluno])                                                                                                            
GO
ALTER TABLE [dbo].[TbDiarioAluno] CHECK CONSTRAINT [FK_TbDiarioAluno_TbAluno]
GO

ALTER TABLE [dbo].[TbFaseNotaAluno_FilaProcessamento] WITH CHECK ADD  CONSTRAINT [FK_TbFaseNotaAluno_FilaProcessamento_TbAluno] FOREIGN KEY([IdAluno]) REFERENCES [dbo].[TbAluno] ([IdAluno])                                                                    
GO
ALTER TABLE [dbo].[TbFaseNotaAluno_FilaProcessamento] CHECK CONSTRAINT [FK_TbFaseNotaAluno_FilaProcessamento_TbAluno]
GO

ALTER TABLE [dbo].[TbFiesRepasse] WITH CHECK ADD  CONSTRAINT [FK_TbFiesRepasse_TbAluno] FOREIGN KEY([IdAluno]) REFERENCES [dbo].[TbAluno] ([IdAluno])                                                                                                            
GO
ALTER TABLE [dbo].[TbFiesRepasse] CHECK CONSTRAINT [FK_TbFiesRepasse_TbAluno]
GO

ALTER TABLE [dbo].[TbFreqAlunoNotificacaoResponsavel] WITH CHECK ADD  CONSTRAINT [FK_TbFreqAlunoNotificacaoResponsavel_TbAluno] FOREIGN KEY([IdAluno]) REFERENCES [dbo].[TbAluno] ([IdAluno])                                                                    
GO
ALTER TABLE [dbo].[TbFreqAlunoNotificacaoResponsavel] CHECK CONSTRAINT [FK_TbFreqAlunoNotificacaoResponsavel_TbAluno]
GO

ALTER TABLE [dbo].[TbFreqAlunoPermissaoSaida] WITH CHECK ADD  CONSTRAINT [FK_TbFreqAlunoPermissaoSaida_TbAluno] FOREIGN KEY([IdAluno]) REFERENCES [dbo].[TbAluno] ([IdAluno])                                                                                    
GO
ALTER TABLE [dbo].[TbFreqAlunoPermissaoSaida] CHECK CONSTRAINT [FK_TbFreqAlunoPermissaoSaida_TbAluno]
GO

ALTER TABLE [dbo].[TbFreqApuracao] WITH CHECK ADD  CONSTRAINT [FK_TbFreqApuracao_TbAluno] FOREIGN KEY([IdAluno]) REFERENCES [dbo].[TbAluno] ([IdAluno])                                                                                                          
GO
ALTER TABLE [dbo].[TbFreqApuracao] CHECK CONSTRAINT [FK_TbFreqApuracao_TbAluno]
GO

ALTER TABLE [dbo].[TbHistorico] WITH CHECK ADD  CONSTRAINT [FK_TbHistorico_TbAluno] FOREIGN KEY([IdAluno]) REFERENCES [dbo].[TbAluno] ([IdAluno])                                                                                                                
GO
ALTER TABLE [dbo].[TbHistorico] CHECK CONSTRAINT [FK_TbHistorico_TbAluno]
GO

ALTER TABLE [dbo].[TbHistoricoAproveitamento] WITH CHECK ADD  CONSTRAINT [FK_TbHistoricoAproveitamento_TbAluno] FOREIGN KEY([IdAluno]) REFERENCES [dbo].[TbAluno] ([IdAluno])                                                                                    
GO
ALTER TABLE [dbo].[TbHistoricoAproveitamento] CHECK CONSTRAINT [FK_TbHistoricoAproveitamento_TbAluno]
GO

ALTER TABLE [dbo].[TbMetaFaseNotaAlunoRegistro] WITH CHECK ADD  CONSTRAINT [FK_TbMetaFaseNotaAlunoRegistro_TbAluno] FOREIGN KEY([IdAluno]) REFERENCES [dbo].[TbAluno] ([IdAluno])                                                                                
GO
ALTER TABLE [dbo].[TbMetaFaseNotaAlunoRegistro] CHECK CONSTRAINT [FK_TbMetaFaseNotaAlunoRegistro_TbAluno]
GO

ALTER TABLE [dbo].[TbNegociacao] WITH CHECK ADD  CONSTRAINT [FK_TbNegociacao_TbAluno] FOREIGN KEY([IdAluno]) REFERENCES [dbo].[TbAluno] ([IdAluno])                                                                                                              
GO
ALTER TABLE [dbo].[TbNegociacao] CHECK CONSTRAINT [FK_TbNegociacao_TbAluno]
GO

ALTER TABLE [dbo].[TbOptProvaAlunoTurma] WITH CHECK ADD  CONSTRAINT [FK_TbOptProvaAlunoTurma_TbAluno] FOREIGN KEY([IdAluno]) REFERENCES [dbo].[TbAluno] ([IdAluno])                                                                                              
GO
ALTER TABLE [dbo].[TbOptProvaAlunoTurma] CHECK CONSTRAINT [FK_TbOptProvaAlunoTurma_TbAluno]
GO

ALTER TABLE [dbo].[TbSolicitacaoDesconto] WITH CHECK ADD  CONSTRAINT [FK_TbSolicitacaoDesconto_TbAluno] FOREIGN KEY([IdAluno]) REFERENCES [dbo].[TbAluno] ([IdAluno])                                                                                            
GO
ALTER TABLE [dbo].[TbSolicitacaoDesconto] CHECK CONSTRAINT [FK_TbSolicitacaoDesconto_TbAluno]
GO

ALTER TABLE [dbo].[TbTituloCobranca] WITH CHECK ADD  CONSTRAINT [FK_TbTituloCobranca_TbAluno] FOREIGN KEY([IdAluno]) REFERENCES [dbo].[TbAluno] ([IdAluno])                                                                                                      
GO
ALTER TABLE [dbo].[TbTituloCobranca] CHECK CONSTRAINT [FK_TbTituloCobranca_TbAluno]
GO



-- TbSerie & TbTurma --- TbPeriodo & TbUsuario


IF OBJECT_ID('dbo.FK_TbCaptacaoAlunoInteressado_TbSerie') IS NOT NULL
BEGIN
	ALTER TABLE [dbo].[TbCaptacaoAlunoInteressado] DROP CONSTRAINT [FK_TbCaptacaoAlunoInteressado_TbSerie]
END

ALTER TABLE [dbo].[TbFaseNota] DROP CONSTRAINT [FK_TbFaseNota_TbSerie]
GO

IF OBJECT_ID('dbo.FK_TbFaseNotaOrigemDestino_TbSerie_Origem') IS NOT NULL
BEGIN
	ALTER TABLE [dbo].[TbFaseNotaOrigemDestino] DROP CONSTRAINT [FK_TbFaseNotaOrigemDestino_TbSerie_Origem]
END

ALTER TABLE [dbo].[TbFaseNotaOrigemDestino] DROP CONSTRAINT [FK_TbFaseNotaOrigemDestino_TbSerie_Destino]
GO
ALTER TABLE [dbo].[TbGradeCurricular] DROP CONSTRAINT [FK_TbGradeCurricular_TbSerie]
GO
ALTER TABLE [dbo].[TbMetaConceito] DROP CONSTRAINT [FK_TbMetaConceito_Serie]
GO
ALTER TABLE [dbo].[TbMetaFaseNota] DROP CONSTRAINT [FK_TbMetaFaseNota_TbSerie]
GO
ALTER TABLE [dbo].[TbNotaConceito] DROP CONSTRAINT [FK_TbNotaConceito_TbSerie]
GO
ALTER TABLE [dbo].[TbOptProva] DROP CONSTRAINT [FK_TbOptProva_TbSerie]
GO
ALTER TABLE [dbo].[TbPeriodo] DROP CONSTRAINT [FK_TbPeriodo_TbSerie]
GO
ALTER TABLE [dbo].[TbProcedimentoMatricula] DROP CONSTRAINT [FK_TbProcedimentoMatricula_TbSerie]
GO
ALTER TABLE [dbo].[TbRelatorioMatricula] DROP CONSTRAINT [FK_TbRelatorioMatricula_TbSerie]
GO
ALTER TABLE [dbo].[TbSerie] DROP CONSTRAINT [FK_TbSerie_TbSerie]
GO
ALTER TABLE [dbo].[TbSerieGrupo] DROP CONSTRAINT [FK_TbSerieGrupo_TbSerie]
GO
ALTER TABLE [dbo].[TbSeriePeriodo] DROP CONSTRAINT [FK_TbSeriePeriodo_TbSerie]
GO
ALTER TABLE [dbo].[TbSituacaoAlunoTurmaPagamento] DROP CONSTRAINT [FK_TbSituacaoAlunoTurmaPagamento_TbSerie]
GO
ALTER TABLE [dbo].[TbSolicitacaoDesconto] DROP CONSTRAINT [FK_TbSolicitacaoDesconto_TbSerie]
GO
ALTER TABLE [dbo].[TbTextoPersonalizadoSerie] DROP CONSTRAINT [FK_TbTextoPersonalizadoSerie_TbSerie]
GO
ALTER TABLE [dbo].[TbTurma] DROP CONSTRAINT [FK_TbTurma_TbSerie]
GO


ALTER TABLE [dbo].[TbSerie] DROP CONSTRAINT [PK_TbSerie]
GO


ALTER TABLE [dbo].[TbSerie] ADD  CONSTRAINT [PK_TbSerie] PRIMARY KEY CLUSTERED 
(
        [IdSerie] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO

                                                                                                                                                                                                                                                                 
ALTER TABLE [dbo].[TbCaptacaoAlunoInteressado] WITH CHECK ADD  CONSTRAINT [FK_TbCaptacaoAlunoInteressado_TbSerie] FOREIGN KEY([IdSerie]) REFERENCES [dbo].[TbSerie] ([IdSerie])                                                                                  
GO
ALTER TABLE [dbo].[TbCaptacaoAlunoInteressado] CHECK CONSTRAINT [FK_TbCaptacaoAlunoInteressado_TbSerie]
GO

ALTER TABLE [dbo].[TbFaseNota] WITH CHECK ADD  CONSTRAINT [FK_TbFaseNota_TbSerie] FOREIGN KEY([IdSerie]) REFERENCES [dbo].[TbSerie] ([IdSerie])                                                                                                                  
GO
ALTER TABLE [dbo].[TbFaseNota] CHECK CONSTRAINT [FK_TbFaseNota_TbSerie]
GO

ALTER TABLE [dbo].[TbFaseNotaOrigemDestino] WITH CHECK ADD  CONSTRAINT [FK_TbFaseNotaOrigemDestino_TbSerie_Origem] FOREIGN KEY([IdSerieOrigem]) REFERENCES [dbo].[TbSerie] ([IdSerie])                                                                           
GO
ALTER TABLE [dbo].[TbFaseNotaOrigemDestino] CHECK CONSTRAINT [FK_TbFaseNotaOrigemDestino_TbSerie_Origem]
GO

ALTER TABLE [dbo].[TbFaseNotaOrigemDestino] WITH CHECK ADD  CONSTRAINT [FK_TbFaseNotaOrigemDestino_TbSerie_Destino] FOREIGN KEY([IdSerieDestino]) REFERENCES [dbo].[TbSerie] ([IdSerie])                                                                         
GO
ALTER TABLE [dbo].[TbFaseNotaOrigemDestino] CHECK CONSTRAINT [FK_TbFaseNotaOrigemDestino_TbSerie_Destino]
GO

ALTER TABLE [dbo].[TbGradeCurricular] WITH CHECK ADD  CONSTRAINT [FK_TbGradeCurricular_TbSerie] FOREIGN KEY([IdSerie]) REFERENCES [dbo].[TbSerie] ([IdSerie])                                                                                                    
GO
ALTER TABLE [dbo].[TbGradeCurricular] CHECK CONSTRAINT [FK_TbGradeCurricular_TbSerie]
GO

ALTER TABLE [dbo].[TbMetaConceito] WITH CHECK ADD  CONSTRAINT [FK_TbMetaConceito_Serie] FOREIGN KEY([IdSerie]) REFERENCES [dbo].[TbSerie] ([IdSerie])                                                                                                            
GO
ALTER TABLE [dbo].[TbMetaConceito] CHECK CONSTRAINT [FK_TbMetaConceito_Serie]
GO

ALTER TABLE [dbo].[TbMetaFaseNota] WITH CHECK ADD  CONSTRAINT [FK_TbMetaFaseNota_TbSerie] FOREIGN KEY([IdSerie]) REFERENCES [dbo].[TbSerie] ([IdSerie])                                                                                                          
GO
ALTER TABLE [dbo].[TbMetaFaseNota] CHECK CONSTRAINT [FK_TbMetaFaseNota_TbSerie]
GO

ALTER TABLE [dbo].[TbNotaConceito] WITH CHECK ADD  CONSTRAINT [FK_TbNotaConceito_TbSerie] FOREIGN KEY([IdSerie]) REFERENCES [dbo].[TbSerie] ([IdSerie])                                                                                                          
GO
ALTER TABLE [dbo].[TbNotaConceito] CHECK CONSTRAINT [FK_TbNotaConceito_TbSerie]
GO

ALTER TABLE [dbo].[TbOptProva] WITH CHECK ADD  CONSTRAINT [FK_TbOptProva_TbSerie] FOREIGN KEY([IdSerie]) REFERENCES [dbo].[TbSerie] ([IdSerie])                                                                                                                  
GO
ALTER TABLE [dbo].[TbOptProva] CHECK CONSTRAINT [FK_TbOptProva_TbSerie]
GO

ALTER TABLE [dbo].[TbPeriodo] WITH CHECK ADD  CONSTRAINT [FK_TbPeriodo_TbSerie] FOREIGN KEY([ES_IdSerieRelacionada]) REFERENCES [dbo].[TbSerie] ([IdSerie])                                                                                                      
GO
ALTER TABLE [dbo].[TbPeriodo] CHECK CONSTRAINT [FK_TbPeriodo_TbSerie]
GO

ALTER TABLE [dbo].[TbProcedimentoMatricula] WITH CHECK ADD  CONSTRAINT [FK_TbProcedimentoMatricula_TbSerie] FOREIGN KEY([IdSerie]) REFERENCES [dbo].[TbSerie] ([IdSerie])                                                                                        
GO
ALTER TABLE [dbo].[TbProcedimentoMatricula] CHECK CONSTRAINT [FK_TbProcedimentoMatricula_TbSerie]
GO

ALTER TABLE [dbo].[TbRelatorioMatricula] WITH CHECK ADD  CONSTRAINT [FK_TbRelatorioMatricula_TbSerie] FOREIGN KEY([IdSerie]) REFERENCES [dbo].[TbSerie] ([IdSerie])                                                                                              
GO
ALTER TABLE [dbo].[TbRelatorioMatricula] CHECK CONSTRAINT [FK_TbRelatorioMatricula_TbSerie]
GO

ALTER TABLE [dbo].[TbSerie] WITH CHECK ADD  CONSTRAINT [FK_TbSerie_TbSerie] FOREIGN KEY([IdProximaSerie]) REFERENCES [dbo].[TbSerie] ([IdSerie])                                                                                                                 
GO
ALTER TABLE [dbo].[TbSerie] CHECK CONSTRAINT [FK_TbSerie_TbSerie]
GO

ALTER TABLE [dbo].[TbSerieGrupo] WITH CHECK ADD  CONSTRAINT [FK_TbSerieGrupo_TbSerie] FOREIGN KEY([IdSerie]) REFERENCES [dbo].[TbSerie] ([IdSerie])                                                                                                              
GO
ALTER TABLE [dbo].[TbSerieGrupo] CHECK CONSTRAINT [FK_TbSerieGrupo_TbSerie]
GO

ALTER TABLE [dbo].[TbSeriePeriodo] WITH CHECK ADD  CONSTRAINT [FK_TbSeriePeriodo_TbSerie] FOREIGN KEY([IdSerie]) REFERENCES [dbo].[TbSerie] ([IdSerie])                                                                                                          
GO
ALTER TABLE [dbo].[TbSeriePeriodo] CHECK CONSTRAINT [FK_TbSeriePeriodo_TbSerie]
GO

ALTER TABLE [dbo].[TbSituacaoAlunoTurmaPagamento] WITH CHECK ADD  CONSTRAINT [FK_TbSituacaoAlunoTurmaPagamento_TbSerie] FOREIGN KEY([IdSerie]) REFERENCES [dbo].[TbSerie] ([IdSerie])                                                                            
GO
ALTER TABLE [dbo].[TbSituacaoAlunoTurmaPagamento] CHECK CONSTRAINT [FK_TbSituacaoAlunoTurmaPagamento_TbSerie]
GO

ALTER TABLE [dbo].[TbSolicitacaoDesconto] WITH CHECK ADD  CONSTRAINT [FK_TbSolicitacaoDesconto_TbSerie] FOREIGN KEY([IdSerie]) REFERENCES [dbo].[TbSerie] ([IdSerie])                                                                                            
GO
ALTER TABLE [dbo].[TbSolicitacaoDesconto] CHECK CONSTRAINT [FK_TbSolicitacaoDesconto_TbSerie]
GO

ALTER TABLE [dbo].[TbTextoPersonalizadoSerie] WITH CHECK ADD  CONSTRAINT [FK_TbTextoPersonalizadoSerie_TbSerie] FOREIGN KEY([IdSerie]) REFERENCES [dbo].[TbSerie] ([IdSerie])                                                                                    
GO
ALTER TABLE [dbo].[TbTextoPersonalizadoSerie] CHECK CONSTRAINT [FK_TbTextoPersonalizadoSerie_TbSerie]
GO

ALTER TABLE [dbo].[TbTurma] WITH CHECK ADD  CONSTRAINT [FK_TbTurma_TbSerie] FOREIGN KEY([IdSerie]) REFERENCES [dbo].[TbSerie] ([IdSerie])                                                                                                                        
GO
ALTER TABLE [dbo].[TbTurma] CHECK CONSTRAINT [FK_TbTurma_TbSerie]
GO


---------------




-- TbTurma ----------------------------------------------------------------------------------------------



ALTER TABLE [dbo].[TbAlunoPeriodo] DROP CONSTRAINT [FK_TbCursoPeriodo_TbTurma]
GO
ALTER TABLE [dbo].[TbAlunoRotinaEducacaoInfantil] DROP CONSTRAINT [FK_TbAlunoRotinaEducacaoInfantil_TbTurma]
GO
ALTER TABLE [dbo].[TbAlunoTipoAvaliacao] DROP CONSTRAINT [FK_TbAlunoTipoAvaliacao_TbTurma]
GO
ALTER TABLE [dbo].[TbAlunoTurma] DROP CONSTRAINT [FK_TbAlunoTurma_TbTurma]
GO
ALTER TABLE [dbo].[TbAlunoTurmaBolsa] DROP CONSTRAINT [FK_TbAlunoTurmaBolsa_TbTurma]
GO
ALTER TABLE [dbo].[TbAlunoTurmaHistorico] DROP CONSTRAINT [FK_TbAlunoTurmaHistorico_TbTurma]
GO
ALTER TABLE [dbo].[TbAlunoTurmaReserva] DROP CONSTRAINT [FK_TbAlunoTurmaReserva_TbTurma]
GO
ALTER TABLE [dbo].[TbArqArquivoTurmaPublicacao] DROP CONSTRAINT [FK_TbArqArquivoTurmaPublicacao_TbTurma]
GO
ALTER TABLE [dbo].[TbAtividadeDistribuicaoAluno] DROP CONSTRAINT [FK_TbAtividadeDistribuicaoAluno_TbTurma]
GO
ALTER TABLE [dbo].[TbCursoTipoCobranca05] DROP CONSTRAINT [FK_TbCursoTipoCobranca05_TbTurma]
GO
ALTER TABLE [dbo].[TbDiario] DROP CONSTRAINT [FK_TbDiario_TbTurma]
GO
ALTER TABLE [dbo].[TbEventoTipoInscricao] DROP CONSTRAINT [FK_TbEventoTipoInscricao_TbTurma_Evento]
GO
ALTER TABLE [dbo].[TbFaseNotaAluno_FilaProcessamento] DROP CONSTRAINT [FK_TbFaseNotaAluno_FilaProcessamento_TbTurma]
GO
ALTER TABLE [dbo].[TbFaseNotaDisciplinaTurma] DROP CONSTRAINT [FK_TbFaseNotaDisciplinaTurma_TbTurma]
GO
ALTER TABLE [dbo].[TbFreqApuracao] DROP CONSTRAINT [FK_TbFreqApuracao_TbTurma]
GO
ALTER TABLE [dbo].[TbFreqQuadroHorario] DROP CONSTRAINT [FK_TbFreqQuadroHorario_TbTurma]
GO
ALTER TABLE [dbo].[TbInformativoTurma] DROP CONSTRAINT [FK_TbInformativoTurma_TbTurma]
GO
ALTER TABLE [dbo].[TbLancamentoCobranca] DROP CONSTRAINT [FK_TbLancamentoCobranca_TbTurma]
GO
ALTER TABLE [dbo].[TbMetaFaseNotaAlunoRegistro] DROP CONSTRAINT [FK_TbMetaFaseNotaAlunoRegistro_TbTurma]
GO
ALTER TABLE [dbo].[TbOptProvaAlunoTurma] DROP CONSTRAINT [FK_TbOptProvaAlunoTurma_TbTurma]
GO
ALTER TABLE [dbo].[TbSituacaoAlunoTurmaPagamento] DROP CONSTRAINT [FK_TbSituacaoAlunoTurmaPagamento_TbTurma]
GO
ALTER TABLE [dbo].[TbSolicitacao] DROP CONSTRAINT [FK_TbSolicitacao_TbTurma_IdTurma]
GO
ALTER TABLE [dbo].[TbTurmaDisciplinaFaseNota] DROP CONSTRAINT [FK_TbTurmaDisciplinaFaseNota_TbTurma]
GO
ALTER TABLE [dbo].[TbTurmaDisciplinaPlanoAula] DROP CONSTRAINT [FK_TbTurmaDisciplinaPlanoAula_TbTurma]
GO
ALTER TABLE [dbo].[TbTurmaProfessor] DROP CONSTRAINT [FK_TbTurmaProfessor_TbTurma]
GO
ALTER TABLE [dbo].[TbTurmaProfessorCursoAdicional] DROP CONSTRAINT [FK_TbTurmaProfessorCursoAdicional_TbTurma]
GO
ALTER TABLE [dbo].[TbTurmaTurmaPrincipal] DROP CONSTRAINT [FK_TbTurmaTurmaPrincipal_TbTurma]
GO


ALTER TABLE [dbo].[TbTurma] DROP CONSTRAINT [PK_TbTurma]
GO


ALTER TABLE [dbo].[TbTurma] ADD  CONSTRAINT [PK_TbTurma] PRIMARY KEY CLUSTERED 
(
                [IdTurma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO



ALTER TABLE [dbo].[TbAlunoPeriodo] WITH CHECK ADD  CONSTRAINT [FK_TbCursoPeriodo_TbTurma] FOREIGN KEY([IdTurmaReferencia]) REFERENCES [dbo].[TbTurma] ([IdTurma])                                                                                                
GO
ALTER TABLE [dbo].[TbAlunoPeriodo] CHECK CONSTRAINT [FK_TbCursoPeriodo_TbTurma]
GO

ALTER TABLE [dbo].[TbAlunoRotinaEducacaoInfantil] WITH CHECK ADD  CONSTRAINT [FK_TbAlunoRotinaEducacaoInfantil_TbTurma] FOREIGN KEY([IdTurma]) REFERENCES [dbo].[TbTurma] ([IdTurma])                                                                            
GO
ALTER TABLE [dbo].[TbAlunoRotinaEducacaoInfantil] CHECK CONSTRAINT [FK_TbAlunoRotinaEducacaoInfantil_TbTurma]
GO

ALTER TABLE [dbo].[TbAlunoTipoAvaliacao] WITH CHECK ADD  CONSTRAINT [FK_TbAlunoTipoAvaliacao_TbTurma] FOREIGN KEY([IdTurma]) REFERENCES [dbo].[TbTurma] ([IdTurma])                                                                                              
GO
ALTER TABLE [dbo].[TbAlunoTipoAvaliacao] CHECK CONSTRAINT [FK_TbAlunoTipoAvaliacao_TbTurma]
GO

ALTER TABLE [dbo].[TbAlunoTurma] WITH CHECK ADD  CONSTRAINT [FK_TbAlunoTurma_TbTurma] FOREIGN KEY([IdTurma]) REFERENCES [dbo].[TbTurma] ([IdTurma])                                                                                                              
GO
ALTER TABLE [dbo].[TbAlunoTurma] CHECK CONSTRAINT [FK_TbAlunoTurma_TbTurma]
GO

ALTER TABLE [dbo].[TbAlunoTurmaBolsa] WITH CHECK ADD  CONSTRAINT [FK_TbAlunoTurmaBolsa_TbTurma] FOREIGN KEY([IdTurma]) REFERENCES [dbo].[TbTurma] ([IdTurma])                                                                                                    
GO
ALTER TABLE [dbo].[TbAlunoTurmaBolsa] CHECK CONSTRAINT [FK_TbAlunoTurmaBolsa_TbTurma]
GO

ALTER TABLE [dbo].[TbAlunoTurmaHistorico] WITH CHECK ADD  CONSTRAINT [FK_TbAlunoTurmaHistorico_TbTurma] FOREIGN KEY([IdTurma]) REFERENCES [dbo].[TbTurma] ([IdTurma])                                                                                            
GO
ALTER TABLE [dbo].[TbAlunoTurmaHistorico] CHECK CONSTRAINT [FK_TbAlunoTurmaHistorico_TbTurma]
GO

ALTER TABLE [dbo].[TbAlunoTurmaReserva] WITH CHECK ADD  CONSTRAINT [FK_TbAlunoTurmaReserva_TbTurma] FOREIGN KEY([IdTurma]) REFERENCES [dbo].[TbTurma] ([IdTurma])                                                                                                
GO
ALTER TABLE [dbo].[TbAlunoTurmaReserva] CHECK CONSTRAINT [FK_TbAlunoTurmaReserva_TbTurma]
GO

ALTER TABLE [dbo].[TbArqArquivoTurmaPublicacao] WITH CHECK ADD  CONSTRAINT [FK_TbArqArquivoTurmaPublicacao_TbTurma] FOREIGN KEY([IdTurma]) REFERENCES [dbo].[TbTurma] ([IdTurma])                                                                                
GO
ALTER TABLE [dbo].[TbArqArquivoTurmaPublicacao] CHECK CONSTRAINT [FK_TbArqArquivoTurmaPublicacao_TbTurma]
GO

ALTER TABLE [dbo].[TbAtividadeDistribuicaoAluno] WITH CHECK ADD  CONSTRAINT [FK_TbAtividadeDistribuicaoAluno_TbTurma] FOREIGN KEY([IdTurma]) REFERENCES [dbo].[TbTurma] ([IdTurma])                                                                              
GO
ALTER TABLE [dbo].[TbAtividadeDistribuicaoAluno] CHECK CONSTRAINT [FK_TbAtividadeDistribuicaoAluno_TbTurma]
GO

ALTER TABLE [dbo].[TbCursoTipoCobranca05] WITH CHECK ADD  CONSTRAINT [FK_TbCursoTipoCobranca05_TbTurma] FOREIGN KEY([Turma_IdTurma]) REFERENCES [dbo].[TbTurma] ([IdTurma])                                                                                      
GO
ALTER TABLE [dbo].[TbCursoTipoCobranca05] CHECK CONSTRAINT [FK_TbCursoTipoCobranca05_TbTurma]
GO

ALTER TABLE [dbo].[TbDiario] WITH CHECK ADD  CONSTRAINT [FK_TbDiario_TbTurma] FOREIGN KEY([IdTurma]) REFERENCES [dbo].[TbTurma] ([IdTurma])                                                                                                                      
GO
ALTER TABLE [dbo].[TbDiario] CHECK CONSTRAINT [FK_TbDiario_TbTurma]
GO

ALTER TABLE [dbo].[TbEventoTipoInscricao] WITH CHECK ADD  CONSTRAINT [FK_TbEventoTipoInscricao_TbTurma_Evento] FOREIGN KEY([IdTurma_Evento]) REFERENCES [dbo].[TbTurma] ([IdTurma])                                                                              
GO
ALTER TABLE [dbo].[TbEventoTipoInscricao] CHECK CONSTRAINT [FK_TbEventoTipoInscricao_TbTurma_Evento]
GO

ALTER TABLE [dbo].[TbFaseNotaAluno_FilaProcessamento] WITH CHECK ADD  CONSTRAINT [FK_TbFaseNotaAluno_FilaProcessamento_TbTurma] FOREIGN KEY([IdTurma]) REFERENCES [dbo].[TbTurma] ([IdTurma])                                                                    
GO
ALTER TABLE [dbo].[TbFaseNotaAluno_FilaProcessamento] CHECK CONSTRAINT [FK_TbFaseNotaAluno_FilaProcessamento_TbTurma]
GO

ALTER TABLE [dbo].[TbFaseNotaDisciplinaTurma] WITH CHECK ADD  CONSTRAINT [FK_TbFaseNotaDisciplinaTurma_TbTurma] FOREIGN KEY([IdTurma]) REFERENCES [dbo].[TbTurma] ([IdTurma])                                                                                    
GO
ALTER TABLE [dbo].[TbFaseNotaDisciplinaTurma] CHECK CONSTRAINT [FK_TbFaseNotaDisciplinaTurma_TbTurma]
GO

ALTER TABLE [dbo].[TbFreqApuracao] WITH CHECK ADD  CONSTRAINT [FK_TbFreqApuracao_TbTurma] FOREIGN KEY([IdTurma]) REFERENCES [dbo].[TbTurma] ([IdTurma])                                                                                                          
GO
ALTER TABLE [dbo].[TbFreqApuracao] CHECK CONSTRAINT [FK_TbFreqApuracao_TbTurma]
GO

ALTER TABLE [dbo].[TbFreqQuadroHorario] WITH CHECK ADD  CONSTRAINT [FK_TbFreqQuadroHorario_TbTurma] FOREIGN KEY([IdTurma]) REFERENCES [dbo].[TbTurma] ([IdTurma])                                                                                                
GO
ALTER TABLE [dbo].[TbFreqQuadroHorario] CHECK CONSTRAINT [FK_TbFreqQuadroHorario_TbTurma]
GO

ALTER TABLE [dbo].[TbInformativoTurma] WITH CHECK ADD  CONSTRAINT [FK_TbInformativoTurma_TbTurma] FOREIGN KEY([IdTurma]) REFERENCES [dbo].[TbTurma] ([IdTurma])                                                                                                  
GO
ALTER TABLE [dbo].[TbInformativoTurma] CHECK CONSTRAINT [FK_TbInformativoTurma_TbTurma]
GO

ALTER TABLE [dbo].[TbLancamentoCobranca] WITH CHECK ADD  CONSTRAINT [FK_TbLancamentoCobranca_TbTurma] FOREIGN KEY([IdTurma]) REFERENCES [dbo].[TbTurma] ([IdTurma])                                                                                              
GO
ALTER TABLE [dbo].[TbLancamentoCobranca] CHECK CONSTRAINT [FK_TbLancamentoCobranca_TbTurma]
GO

ALTER TABLE [dbo].[TbMetaFaseNotaAlunoRegistro] WITH CHECK ADD  CONSTRAINT [FK_TbMetaFaseNotaAlunoRegistro_TbTurma] FOREIGN KEY([IdTurma]) REFERENCES [dbo].[TbTurma] ([IdTurma])                                                                                
GO
ALTER TABLE [dbo].[TbMetaFaseNotaAlunoRegistro] CHECK CONSTRAINT [FK_TbMetaFaseNotaAlunoRegistro_TbTurma]
GO

ALTER TABLE [dbo].[TbOptProvaAlunoTurma] WITH CHECK ADD  CONSTRAINT [FK_TbOptProvaAlunoTurma_TbTurma] FOREIGN KEY([IdTurma]) REFERENCES [dbo].[TbTurma] ([IdTurma])                                                                                              
GO
ALTER TABLE [dbo].[TbOptProvaAlunoTurma] CHECK CONSTRAINT [FK_TbOptProvaAlunoTurma_TbTurma]
GO

ALTER TABLE [dbo].[TbSituacaoAlunoTurmaPagamento] WITH CHECK ADD  CONSTRAINT [FK_TbSituacaoAlunoTurmaPagamento_TbTurma] FOREIGN KEY([IdTurma]) REFERENCES [dbo].[TbTurma] ([IdTurma])                                                                            
GO
ALTER TABLE [dbo].[TbSituacaoAlunoTurmaPagamento] CHECK CONSTRAINT [FK_TbSituacaoAlunoTurmaPagamento_TbTurma]
GO

ALTER TABLE [dbo].[TbSolicitacao] WITH CHECK ADD  CONSTRAINT [FK_TbSolicitacao_TbTurma_IdTurma] FOREIGN KEY([IdTurma]) REFERENCES [dbo].[TbTurma] ([IdTurma])                                                                                                    
GO
ALTER TABLE [dbo].[TbSolicitacao] CHECK CONSTRAINT [FK_TbSolicitacao_TbTurma_IdTurma]
GO

ALTER TABLE [dbo].[TbTurmaDisciplinaFaseNota] WITH CHECK ADD  CONSTRAINT [FK_TbTurmaDisciplinaFaseNota_TbTurma] FOREIGN KEY([IdTurma]) REFERENCES [dbo].[TbTurma] ([IdTurma])                                                                                    
GO
ALTER TABLE [dbo].[TbTurmaDisciplinaFaseNota] CHECK CONSTRAINT [FK_TbTurmaDisciplinaFaseNota_TbTurma]
GO

ALTER TABLE [dbo].[TbTurmaDisciplinaPlanoAula] WITH CHECK ADD  CONSTRAINT [FK_TbTurmaDisciplinaPlanoAula_TbTurma] FOREIGN KEY([IdTurma]) REFERENCES [dbo].[TbTurma] ([IdTurma])                                                                                  
GO
ALTER TABLE [dbo].[TbTurmaDisciplinaPlanoAula] CHECK CONSTRAINT [FK_TbTurmaDisciplinaPlanoAula_TbTurma]
GO

ALTER TABLE [dbo].[TbTurmaProfessor] WITH CHECK ADD  CONSTRAINT [FK_TbTurmaProfessor_TbTurma] FOREIGN KEY([IdTurma]) REFERENCES [dbo].[TbTurma] ([IdTurma])                                                                                                      
GO
ALTER TABLE [dbo].[TbTurmaProfessor] CHECK CONSTRAINT [FK_TbTurmaProfessor_TbTurma]
GO

ALTER TABLE [dbo].[TbTurmaProfessorCursoAdicional] WITH CHECK ADD  CONSTRAINT [FK_TbTurmaProfessorCursoAdicional_TbTurma] FOREIGN KEY([IdTurma]) REFERENCES [dbo].[TbTurma] ([IdTurma])                                                                          
GO
ALTER TABLE [dbo].[TbTurmaProfessorCursoAdicional] CHECK CONSTRAINT [FK_TbTurmaProfessorCursoAdicional_TbTurma]
GO

ALTER TABLE [dbo].[TbTurmaTurmaPrincipal] WITH CHECK ADD  CONSTRAINT [FK_TbTurmaTurmaPrincipal_TbTurma] FOREIGN KEY([IdTurmaPrincipal]) REFERENCES [dbo].[TbTurma] ([IdTurma])                                                                                   
GO
ALTER TABLE [dbo].[TbTurmaTurmaPrincipal] CHECK CONSTRAINT [FK_TbTurmaTurmaPrincipal_TbTurma]
GO





-- TbDisciplina ---------------------------------------------------------------------------------------------------


ALTER TABLE [dbo].[TbAlunoAproveitamentoDisciplina] DROP CONSTRAINT [FK_TbAlunoAproveitamentoDisciplina_TbDisciplina]
GO
ALTER TABLE [dbo].[TbAlunoTipoAvaliacao] DROP CONSTRAINT [FK_TbAlunoTipoAvaliacao_TbDisciplina]
GO
ALTER TABLE [dbo].[TbAlunoTurmaAvaliacaoRelatorio] DROP CONSTRAINT [FK_TbAlunoTurmaAvaliacaoRelatorio_TbDisciplina]
GO
ALTER TABLE [dbo].[TbArqArquivo] DROP CONSTRAINT [FK_TbArqArquivo_TbDisciplina]
GO
ALTER TABLE [dbo].[TbCurriculoDisciplina] DROP CONSTRAINT [FK_TbCurriculoDisciplina_TbDisciplina]
GO
ALTER TABLE [dbo].[TbCurriculoDisciplinaEletiva] DROP CONSTRAINT [FK_TbCurriculoDisciplinaEletiva_TbDisciplina1]
GO
ALTER TABLE [dbo].[TbCurriculoDisciplinaEletiva] DROP CONSTRAINT [FK_TbCurriculoDisciplinaEletiva_TbDisciplina2]
GO
ALTER TABLE [dbo].[TbCurriculoDisciplinaEquivalente] DROP CONSTRAINT [FK_TbCurriculoDisciplinaEquivalente_TbDisciplina1]
GO
ALTER TABLE [dbo].[TbCurriculoDisciplinaEquivalente] DROP CONSTRAINT [FK_TbCurriculoDisciplinaEquivalente_TbDisciplina2]
GO
ALTER TABLE [dbo].[TbCurriculoOptativaDisciplina] DROP CONSTRAINT [FK_TbCurriculoOptativaDisciplina_TbDisciplina]
GO
ALTER TABLE [dbo].[TbDiario] DROP CONSTRAINT [FK_TbDiaro_TbDisciplina]
GO
ALTER TABLE [dbo].[TbDisciplinaPlano] DROP CONSTRAINT [FK_TbDisciplinaPlano_TbDisciplina]
GO
ALTER TABLE [dbo].[TbDisciplinaRequisito] DROP CONSTRAINT [FK_TbDisciplinaRequisito_TbDisciplina1]
GO
ALTER TABLE [dbo].[TbDisciplinaRequisito] DROP CONSTRAINT [FK_TbDisciplinaRequisito_TbDisciplina]
GO
ALTER TABLE [dbo].[TbFaseNotaAluno] DROP CONSTRAINT [FK_TbFaseNotaAluno_TbDisciplina]
GO
ALTER TABLE [dbo].[TbFaseNotaAluno_FilaProcessamento] DROP CONSTRAINT [FK_TbFaseNotaAluno_FilaProcessamento_TbDisciplina]
GO
ALTER TABLE [dbo].[TbFaseNotaDisciplina] DROP CONSTRAINT [FK_TbFaseNotaDisciplina_TbDisciplina]
GO
ALTER TABLE [dbo].[TbFaseNotaDisciplinaTurma] DROP CONSTRAINT [FK_TbFaseNotaDisciplinaTurma_TbDisciplina]
GO
ALTER TABLE [dbo].[TbFreqApuracao] DROP CONSTRAINT [FK_TbFreqApuracao_TbDisciplina]
GO
ALTER TABLE [dbo].[TbFreqQuadroHorario] DROP CONSTRAINT [FK_TbFreqQuadroHorario_TbDisciplina]
GO
ALTER TABLE [dbo].[TbGradeCurricular] DROP CONSTRAINT [FK_TbGradeCurricular_TbDisciplina]
GO
ALTER TABLE [dbo].[TbHistoricoAproveitamento] DROP CONSTRAINT [FK_TbHistoricoAproveitamento_TbDisciplina]
GO
ALTER TABLE [dbo].[TbHistoricoEnsinoSuperior] DROP CONSTRAINT [FK_TbHistoricoEnsinoSuperior_TbDisciplina]
GO
ALTER TABLE [dbo].[TbHistoricoNotas] DROP CONSTRAINT [FK_TbHistoricoNotas_TbDisciplina]
GO
ALTER TABLE [dbo].[TbLancamentoCobranca] DROP CONSTRAINT [FK_TbLancamnetoCobranca_TbDisciplina]
GO
ALTER TABLE [dbo].[TbMeta] DROP CONSTRAINT [FK_TbMeta_TbDisciplina]
GO
ALTER TABLE [dbo].[TbMetaSituacaoAlunoDisciplina] DROP CONSTRAINT [FK_TbMetaSituacaoAlunoDisciplina_TbDisciplina]
GO
ALTER TABLE [dbo].[TbOptProvaGabarito] DROP CONSTRAINT [FK_TbOptProvaGabarito_TbDisciplina14]
GO
ALTER TABLE [dbo].[TbOptProvaGabarito] DROP CONSTRAINT [FK_TbOptProvaGabarito_TbDisciplina15]
GO
ALTER TABLE [dbo].[TbOptProvaGabarito] DROP CONSTRAINT [FK_TbOptProvaGabarito_TbDisciplina09]
GO
ALTER TABLE [dbo].[TbOptProvaGabarito] DROP CONSTRAINT [FK_TbOptProvaGabarito_TbDisciplina12]
GO
ALTER TABLE [dbo].[TbOptProvaGabarito] DROP CONSTRAINT [FK_TbOptProvaGabarito_TbDisciplina13]
GO
ALTER TABLE [dbo].[TbOptProvaGabarito] DROP CONSTRAINT [FK_TbOptProvaGabarito_TbDisciplina10]
GO
ALTER TABLE [dbo].[TbOptProvaGabarito] DROP CONSTRAINT [FK__TbOptProv__IdDis__03482384]
GO
ALTER TABLE [dbo].[TbOptProvaGabarito] DROP CONSTRAINT [FK_TbOptProvaGabarito_TbDisciplina11]
GO
ALTER TABLE [dbo].[TbOptProvaGabarito] DROP CONSTRAINT [FK_TbOptProvaGabarito_TbDisciplina06]
GO
ALTER TABLE [dbo].[TbOptProvaGabarito] DROP CONSTRAINT [FK_TbOptProvaGabarito_TbDisciplina08]
GO
ALTER TABLE [dbo].[TbOptProvaGabarito] DROP CONSTRAINT [FK_TbOptProvaGabarito_TbDisciplina07]
GO
ALTER TABLE [dbo].[TbOptProvaGabarito] DROP CONSTRAINT [FK_TbOptProvaGabarito_TbDisciplina02]
GO
ALTER TABLE [dbo].[TbOptProvaGabarito] DROP CONSTRAINT [FK_TbOptProvaGabarito_TbDisciplina03]
GO
ALTER TABLE [dbo].[TbOptProvaGabarito] DROP CONSTRAINT [FK_TbOptProvaGabarito_TbDisciplina04]
GO
ALTER TABLE [dbo].[TbOptProvaGabarito] DROP CONSTRAINT [FK_TbOptProvaGabarito_TbDisciplina05]
GO
ALTER TABLE [dbo].[TbOptSimuladoEnem] DROP CONSTRAINT [FK_TbOptSimuladoEnem_TbDisciplina_IdDisciplinaRedacao]
GO
ALTER TABLE [dbo].[TbProfessorDisciplina] DROP CONSTRAINT [FK_TbProfessorDisciplina_TbDisciplina]
GO
ALTER TABLE [dbo].[TbSituacaoAlunoDisciplina] DROP CONSTRAINT [FK_TbTurmaDisciplinaAluno_TbDisciplina]
GO
ALTER TABLE [dbo].[TbTurma] DROP CONSTRAINT [FK_TbTurma_TbDisciplina]
GO
ALTER TABLE [dbo].[TbTurmaDisciplinaFaseNota] DROP CONSTRAINT [FK_TbTurmaDisciplinaFaseNota_TbDisciplina]
GO
ALTER TABLE [dbo].[TbTurmaDisciplinaPlanoAula] DROP CONSTRAINT [FK_TbTurmaDisciplinaPlanoAula_TbDisciplina]
GO
ALTER TABLE [dbo].[TbTurmaProfessorCursoAdicional] DROP CONSTRAINT [FK_TbTurmaProfessorCursoAdicional_TbDisciplina]
GO



ALTER TABLE [dbo].[TbDisciplina] DROP CONSTRAINT [PK_TbDisciplina]
GO


ALTER TABLE [dbo].[TbDisciplina] ADD  CONSTRAINT [PK_TbDisciplina] PRIMARY KEY CLUSTERED 
(
        [IdDisciplina] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO



                                                                                                                                                                                                                                                                 
ALTER TABLE [dbo].[TbAlunoAproveitamentoDisciplina] WITH CHECK ADD  CONSTRAINT [FK_TbAlunoAproveitamentoDisciplina_TbDisciplina] FOREIGN KEY([IdDisciplina]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina])                                                    
GO
ALTER TABLE [dbo].[TbAlunoAproveitamentoDisciplina] CHECK CONSTRAINT [FK_TbAlunoAproveitamentoDisciplina_TbDisciplina]
GO

ALTER TABLE [dbo].[TbAlunoTipoAvaliacao] WITH CHECK ADD  CONSTRAINT [FK_TbAlunoTipoAvaliacao_TbDisciplina] FOREIGN KEY([IdDisciplina]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina])                                                                          
GO
ALTER TABLE [dbo].[TbAlunoTipoAvaliacao] CHECK CONSTRAINT [FK_TbAlunoTipoAvaliacao_TbDisciplina]
GO

ALTER TABLE [dbo].[TbAlunoTurmaAvaliacaoRelatorio] WITH CHECK ADD  CONSTRAINT [FK_TbAlunoTurmaAvaliacaoRelatorio_TbDisciplina] FOREIGN KEY([IdDisciplina]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina])                                                      
GO
ALTER TABLE [dbo].[TbAlunoTurmaAvaliacaoRelatorio] CHECK CONSTRAINT [FK_TbAlunoTurmaAvaliacaoRelatorio_TbDisciplina]
GO

ALTER TABLE [dbo].[TbArqArquivo] WITH CHECK ADD  CONSTRAINT [FK_TbArqArquivo_TbDisciplina] FOREIGN KEY([IdDisciplina]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina])                                                                                          
GO
ALTER TABLE [dbo].[TbArqArquivo] CHECK CONSTRAINT [FK_TbArqArquivo_TbDisciplina]
GO

ALTER TABLE [dbo].[TbCurriculoDisciplina] WITH CHECK ADD  CONSTRAINT [FK_TbCurriculoDisciplina_TbDisciplina] FOREIGN KEY([IdDisciplina]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina])                                                                        
GO
ALTER TABLE [dbo].[TbCurriculoDisciplina] CHECK CONSTRAINT [FK_TbCurriculoDisciplina_TbDisciplina]
GO

ALTER TABLE [dbo].[TbCurriculoDisciplinaEletiva] WITH CHECK ADD  CONSTRAINT [FK_TbCurriculoDisciplinaEletiva_TbDisciplina1] FOREIGN KEY([IdDisciplinaCursada]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina])                                                  
GO
ALTER TABLE [dbo].[TbCurriculoDisciplinaEletiva] CHECK CONSTRAINT [FK_TbCurriculoDisciplinaEletiva_TbDisciplina1]
GO

ALTER TABLE [dbo].[TbCurriculoDisciplinaEletiva] WITH CHECK ADD  CONSTRAINT [FK_TbCurriculoDisciplinaEletiva_TbDisciplina2] FOREIGN KEY([IdDisciplinaEletiva]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina])                                                  
GO
ALTER TABLE [dbo].[TbCurriculoDisciplinaEletiva] CHECK CONSTRAINT [FK_TbCurriculoDisciplinaEletiva_TbDisciplina2]
GO

ALTER TABLE [dbo].[TbCurriculoDisciplinaEquivalente] WITH CHECK ADD  CONSTRAINT [FK_TbCurriculoDisciplinaEquivalente_TbDisciplina1] FOREIGN KEY([IdDisciplinaCursada]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina])                                          
GO
ALTER TABLE [dbo].[TbCurriculoDisciplinaEquivalente] CHECK CONSTRAINT [FK_TbCurriculoDisciplinaEquivalente_TbDisciplina1]
GO

ALTER TABLE [dbo].[TbCurriculoDisciplinaEquivalente] WITH CHECK ADD  CONSTRAINT [FK_TbCurriculoDisciplinaEquivalente_TbDisciplina2] FOREIGN KEY([IdDisciplinaEquivalente]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina])                                      
GO
ALTER TABLE [dbo].[TbCurriculoDisciplinaEquivalente] CHECK CONSTRAINT [FK_TbCurriculoDisciplinaEquivalente_TbDisciplina2]
GO

ALTER TABLE [dbo].[TbCurriculoOptativaDisciplina] WITH CHECK ADD  CONSTRAINT [FK_TbCurriculoOptativaDisciplina_TbDisciplina] FOREIGN KEY([IdDisciplina]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina])                                                        
GO
ALTER TABLE [dbo].[TbCurriculoOptativaDisciplina] CHECK CONSTRAINT [FK_TbCurriculoOptativaDisciplina_TbDisciplina]
GO

ALTER TABLE [dbo].[TbDiario] WITH CHECK ADD  CONSTRAINT [FK_TbDiaro_TbDisciplina] FOREIGN KEY([IdDisciplina]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina])                                                                                                   
GO
ALTER TABLE [dbo].[TbDiario] CHECK CONSTRAINT [FK_TbDiaro_TbDisciplina]
GO

ALTER TABLE [dbo].[TbDisciplinaPlano] WITH CHECK ADD  CONSTRAINT [FK_TbDisciplinaPlano_TbDisciplina] FOREIGN KEY([IdDisciplina]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina])                                                                                
GO
ALTER TABLE [dbo].[TbDisciplinaPlano] CHECK CONSTRAINT [FK_TbDisciplinaPlano_TbDisciplina]
GO

ALTER TABLE [dbo].[TbDisciplinaRequisito] WITH CHECK ADD  CONSTRAINT [FK_TbDisciplinaRequisito_TbDisciplina1] FOREIGN KEY([IdDisciplinaRequerida]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina])                                                              
GO
ALTER TABLE [dbo].[TbDisciplinaRequisito] CHECK CONSTRAINT [FK_TbDisciplinaRequisito_TbDisciplina1]
GO

ALTER TABLE [dbo].[TbDisciplinaRequisito] WITH CHECK ADD  CONSTRAINT [FK_TbDisciplinaRequisito_TbDisciplina] FOREIGN KEY([IdDisciplina]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina])                                                                        
GO
ALTER TABLE [dbo].[TbDisciplinaRequisito] CHECK CONSTRAINT [FK_TbDisciplinaRequisito_TbDisciplina]
GO

ALTER TABLE [dbo].[TbFaseNotaAluno] WITH CHECK ADD  CONSTRAINT [FK_TbFaseNotaAluno_TbDisciplina] FOREIGN KEY([IdDisciplina]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina])                                                                                    
GO
ALTER TABLE [dbo].[TbFaseNotaAluno] CHECK CONSTRAINT [FK_TbFaseNotaAluno_TbDisciplina]
GO

ALTER TABLE [dbo].[TbFaseNotaAluno_FilaProcessamento] WITH CHECK ADD  CONSTRAINT [FK_TbFaseNotaAluno_FilaProcessamento_TbDisciplina] FOREIGN KEY([IdDisciplina]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina])                                                
GO
ALTER TABLE [dbo].[TbFaseNotaAluno_FilaProcessamento] CHECK CONSTRAINT [FK_TbFaseNotaAluno_FilaProcessamento_TbDisciplina]
GO

ALTER TABLE [dbo].[TbFaseNotaDisciplina] WITH CHECK ADD  CONSTRAINT [FK_TbFaseNotaDisciplina_TbDisciplina] FOREIGN KEY([IdDisciplina]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina])                                                                          
GO
ALTER TABLE [dbo].[TbFaseNotaDisciplina] CHECK CONSTRAINT [FK_TbFaseNotaDisciplina_TbDisciplina]
GO

ALTER TABLE [dbo].[TbFaseNotaDisciplinaTurma] WITH CHECK ADD  CONSTRAINT [FK_TbFaseNotaDisciplinaTurma_TbDisciplina] FOREIGN KEY([IdDisciplina]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina])                                                                
GO
ALTER TABLE [dbo].[TbFaseNotaDisciplinaTurma] CHECK CONSTRAINT [FK_TbFaseNotaDisciplinaTurma_TbDisciplina]
GO

ALTER TABLE [dbo].[TbFreqApuracao] WITH CHECK ADD  CONSTRAINT [FK_TbFreqApuracao_TbDisciplina] FOREIGN KEY([IdDisciplina]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina])                                                                                      
GO
ALTER TABLE [dbo].[TbFreqApuracao] CHECK CONSTRAINT [FK_TbFreqApuracao_TbDisciplina]
GO

ALTER TABLE [dbo].[TbFreqQuadroHorario] WITH CHECK ADD  CONSTRAINT [FK_TbFreqQuadroHorario_TbDisciplina] FOREIGN KEY([IdDisciplina]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina])                                                                            
GO
ALTER TABLE [dbo].[TbFreqQuadroHorario] CHECK CONSTRAINT [FK_TbFreqQuadroHorario_TbDisciplina]
GO

ALTER TABLE [dbo].[TbGradeCurricular] WITH CHECK ADD  CONSTRAINT [FK_TbGradeCurricular_TbDisciplina] FOREIGN KEY([IdDisciplina]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina])                                                                                
GO
ALTER TABLE [dbo].[TbGradeCurricular] CHECK CONSTRAINT [FK_TbGradeCurricular_TbDisciplina]
GO

ALTER TABLE [dbo].[TbHistoricoAproveitamento] WITH CHECK ADD  CONSTRAINT [FK_TbHistoricoAproveitamento_TbDisciplina] FOREIGN KEY([IdDisciplinaCursada]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina])                                                         
GO
ALTER TABLE [dbo].[TbHistoricoAproveitamento] CHECK CONSTRAINT [FK_TbHistoricoAproveitamento_TbDisciplina]
GO

ALTER TABLE [dbo].[TbHistoricoEnsinoSuperior] WITH CHECK ADD  CONSTRAINT [FK_TbHistoricoEnsinoSuperior_TbDisciplina] FOREIGN KEY([IdDisciplina]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina])                                                                
GO
ALTER TABLE [dbo].[TbHistoricoEnsinoSuperior] CHECK CONSTRAINT [FK_TbHistoricoEnsinoSuperior_TbDisciplina]
GO

ALTER TABLE [dbo].[TbHistoricoNotas] WITH CHECK ADD  CONSTRAINT [FK_TbHistoricoNotas_TbDisciplina] FOREIGN KEY([IdDisciplina]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina])                                                                                  
GO
ALTER TABLE [dbo].[TbHistoricoNotas] CHECK CONSTRAINT [FK_TbHistoricoNotas_TbDisciplina]
GO

ALTER TABLE [dbo].[TbLancamentoCobranca] WITH CHECK ADD  CONSTRAINT [FK_TbLancamnetoCobranca_TbDisciplina] FOREIGN KEY([IdDisciplina]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina])                                                                          
GO
ALTER TABLE [dbo].[TbLancamentoCobranca] CHECK CONSTRAINT [FK_TbLancamnetoCobranca_TbDisciplina]
GO

ALTER TABLE [dbo].[TbMeta] WITH CHECK ADD  CONSTRAINT [FK_TbMeta_TbDisciplina] FOREIGN KEY([IdDisciplina]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina])                                                                                                      
GO
ALTER TABLE [dbo].[TbMeta] CHECK CONSTRAINT [FK_TbMeta_TbDisciplina]
GO

ALTER TABLE [dbo].[TbMetaSituacaoAlunoDisciplina] WITH CHECK ADD  CONSTRAINT [FK_TbMetaSituacaoAlunoDisciplina_TbDisciplina] FOREIGN KEY([IdDisciplina]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina])                                                        
GO
ALTER TABLE [dbo].[TbMetaSituacaoAlunoDisciplina] CHECK CONSTRAINT [FK_TbMetaSituacaoAlunoDisciplina_TbDisciplina]
GO

ALTER TABLE [dbo].[TbOptProvaGabarito] WITH CHECK ADD  CONSTRAINT [FK_TbOptProvaGabarito_TbDisciplina14] FOREIGN KEY([IdDisciplina14]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina])                                                                          
GO
ALTER TABLE [dbo].[TbOptProvaGabarito] CHECK CONSTRAINT [FK_TbOptProvaGabarito_TbDisciplina14]
GO

ALTER TABLE [dbo].[TbOptProvaGabarito] WITH CHECK ADD  CONSTRAINT [FK_TbOptProvaGabarito_TbDisciplina15] FOREIGN KEY([IdDisciplina15]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina])                                                                          
GO
ALTER TABLE [dbo].[TbOptProvaGabarito] CHECK CONSTRAINT [FK_TbOptProvaGabarito_TbDisciplina15]
GO

ALTER TABLE [dbo].[TbOptProvaGabarito] WITH CHECK ADD  CONSTRAINT [FK_TbOptProvaGabarito_TbDisciplina09] FOREIGN KEY([IdDisciplina09]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina])                                                                          
GO
ALTER TABLE [dbo].[TbOptProvaGabarito] CHECK CONSTRAINT [FK_TbOptProvaGabarito_TbDisciplina09]
GO

ALTER TABLE [dbo].[TbOptProvaGabarito] WITH CHECK ADD  CONSTRAINT [FK_TbOptProvaGabarito_TbDisciplina12] FOREIGN KEY([IdDisciplina12]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina])                                                                          
GO
ALTER TABLE [dbo].[TbOptProvaGabarito] CHECK CONSTRAINT [FK_TbOptProvaGabarito_TbDisciplina12]
GO

ALTER TABLE [dbo].[TbOptProvaGabarito] WITH CHECK ADD  CONSTRAINT [FK_TbOptProvaGabarito_TbDisciplina13] FOREIGN KEY([IdDisciplina13]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina])                                                                          
GO
ALTER TABLE [dbo].[TbOptProvaGabarito] CHECK CONSTRAINT [FK_TbOptProvaGabarito_TbDisciplina13]
GO

ALTER TABLE [dbo].[TbOptProvaGabarito] WITH CHECK ADD  CONSTRAINT [FK_TbOptProvaGabarito_TbDisciplina10] FOREIGN KEY([IdDisciplina10]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina])                                                                          
GO
ALTER TABLE [dbo].[TbOptProvaGabarito] CHECK CONSTRAINT [FK_TbOptProvaGabarito_TbDisciplina10]
GO

ALTER TABLE [dbo].[TbOptProvaGabarito] WITH CHECK ADD  CONSTRAINT [FK__TbOptProv__IdDis__03482384] FOREIGN KEY([IdDisciplina]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina])                                                                                  
GO
ALTER TABLE [dbo].[TbOptProvaGabarito] CHECK CONSTRAINT [FK__TbOptProv__IdDis__03482384]
GO

ALTER TABLE [dbo].[TbOptProvaGabarito] WITH CHECK ADD  CONSTRAINT [FK_TbOptProvaGabarito_TbDisciplina11] FOREIGN KEY([IdDisciplina11]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina])                                                                          
GO
ALTER TABLE [dbo].[TbOptProvaGabarito] CHECK CONSTRAINT [FK_TbOptProvaGabarito_TbDisciplina11]
GO

ALTER TABLE [dbo].[TbOptProvaGabarito] WITH CHECK ADD  CONSTRAINT [FK_TbOptProvaGabarito_TbDisciplina06] FOREIGN KEY([IdDisciplina06]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina])                                                                          
GO
ALTER TABLE [dbo].[TbOptProvaGabarito] CHECK CONSTRAINT [FK_TbOptProvaGabarito_TbDisciplina06]
GO

ALTER TABLE [dbo].[TbOptProvaGabarito] WITH CHECK ADD  CONSTRAINT [FK_TbOptProvaGabarito_TbDisciplina08] FOREIGN KEY([IdDisciplina08]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina])                                                                          
GO
ALTER TABLE [dbo].[TbOptProvaGabarito] CHECK CONSTRAINT [FK_TbOptProvaGabarito_TbDisciplina08]
GO

ALTER TABLE [dbo].[TbOptProvaGabarito] WITH CHECK ADD  CONSTRAINT [FK_TbOptProvaGabarito_TbDisciplina07] FOREIGN KEY([IdDisciplina07]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina])                                                                          
GO
ALTER TABLE [dbo].[TbOptProvaGabarito] CHECK CONSTRAINT [FK_TbOptProvaGabarito_TbDisciplina07]
GO

ALTER TABLE [dbo].[TbOptProvaGabarito] WITH CHECK ADD  CONSTRAINT [FK_TbOptProvaGabarito_TbDisciplina02] FOREIGN KEY([IdDisciplina02]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina])                                                                          
GO
ALTER TABLE [dbo].[TbOptProvaGabarito] CHECK CONSTRAINT [FK_TbOptProvaGabarito_TbDisciplina02]
GO

ALTER TABLE [dbo].[TbOptProvaGabarito] WITH CHECK ADD  CONSTRAINT [FK_TbOptProvaGabarito_TbDisciplina03] FOREIGN KEY([IdDisciplina03]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina])                                                                         
GO
ALTER TABLE [dbo].[TbOptProvaGabarito] CHECK CONSTRAINT [FK_TbOptProvaGabarito_TbDisciplina03]
GO

ALTER TABLE [dbo].[TbOptProvaGabarito] WITH CHECK ADD  CONSTRAINT [FK_TbOptProvaGabarito_TbDisciplina04] FOREIGN KEY([IdDisciplina04]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina])                                                                          
GO
ALTER TABLE [dbo].[TbOptProvaGabarito] CHECK CONSTRAINT [FK_TbOptProvaGabarito_TbDisciplina04]
GO

ALTER TABLE [dbo].[TbOptProvaGabarito] WITH CHECK ADD  CONSTRAINT [FK_TbOptProvaGabarito_TbDisciplina05] FOREIGN KEY([IdDisciplina05]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina])                                                                          
GO
ALTER TABLE [dbo].[TbOptProvaGabarito] CHECK CONSTRAINT [FK_TbOptProvaGabarito_TbDisciplina05]
GO

ALTER TABLE [dbo].[TbOptSimuladoEnem] WITH CHECK ADD  CONSTRAINT [FK_TbOptSimuladoEnem_TbDisciplina_IdDisciplinaRedacao] FOREIGN KEY([IdDisciplinaRedacao]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina])                                                     
GO
ALTER TABLE [dbo].[TbOptSimuladoEnem] CHECK CONSTRAINT [FK_TbOptSimuladoEnem_TbDisciplina_IdDisciplinaRedacao]
GO

ALTER TABLE [dbo].[TbProfessorDisciplina] WITH CHECK ADD  CONSTRAINT [FK_TbProfessorDisciplina_TbDisciplina] FOREIGN KEY([IdDisciplina]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina])                                                                        
GO
ALTER TABLE [dbo].[TbProfessorDisciplina] CHECK CONSTRAINT [FK_TbProfessorDisciplina_TbDisciplina]
GO

ALTER TABLE [dbo].[TbSituacaoAlunoDisciplina] WITH CHECK ADD  CONSTRAINT [FK_TbTurmaDisciplinaAluno_TbDisciplina] FOREIGN KEY([IdDisciplina]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina])                                                                   
GO
ALTER TABLE [dbo].[TbSituacaoAlunoDisciplina] CHECK CONSTRAINT [FK_TbTurmaDisciplinaAluno_TbDisciplina]
GO

ALTER TABLE [dbo].[TbTurma] WITH CHECK ADD  CONSTRAINT [FK_TbTurma_TbDisciplina] FOREIGN KEY([IdDisciplina]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina])                                                                                                    
GO
ALTER TABLE [dbo].[TbTurma] CHECK CONSTRAINT [FK_TbTurma_TbDisciplina]
GO

ALTER TABLE [dbo].[TbTurmaDisciplinaFaseNota] WITH CHECK ADD  CONSTRAINT [FK_TbTurmaDisciplinaFaseNota_TbDisciplina] FOREIGN KEY([IdDisciplina]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina])                                                                
GO
ALTER TABLE [dbo].[TbTurmaDisciplinaFaseNota] CHECK CONSTRAINT [FK_TbTurmaDisciplinaFaseNota_TbDisciplina]
GO

ALTER TABLE [dbo].[TbTurmaDisciplinaPlanoAula] WITH CHECK ADD  CONSTRAINT [FK_TbTurmaDisciplinaPlanoAula_TbDisciplina] FOREIGN KEY([IdDisciplina]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina])                                                             
GO
ALTER TABLE [dbo].[TbTurmaDisciplinaPlanoAula] CHECK CONSTRAINT [FK_TbTurmaDisciplinaPlanoAula_TbDisciplina]
GO

ALTER TABLE [dbo].[TbTurmaProfessorCursoAdicional] WITH CHECK ADD  CONSTRAINT [FK_TbTurmaProfessorCursoAdicional_TbDisciplina] FOREIGN KEY([IdDisciplina]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina])                                                      
GO
ALTER TABLE [dbo].[TbTurmaProfessorCursoAdicional] CHECK CONSTRAINT [FK_TbTurmaProfessorCursoAdicional_TbDisciplina]
GO






-- TbPeriodo ----------------------------------------------------------------------------------------


ALTER TABLE [dbo].[TbAlunoCursoDesconto] DROP CONSTRAINT [FK_TbAlunoCursoDesconto_TbPeriodo]
GO
ALTER TABLE [dbo].[TbAlunoCursoSuperior] DROP CONSTRAINT [FK_TbAlunoCursoSuperior_TbPeriodo]
GO
ALTER TABLE [dbo].[TbAlunoCursoSuperior] DROP CONSTRAINT [FK_TbAlunoCursoSuperior_TbPeriodo1]
GO
ALTER TABLE [dbo].[TbAlunoPeriodo] DROP CONSTRAINT [FK_TbAlunoPeriodo_TbPeriodo]
GO
ALTER TABLE [dbo].[TbAtividade] DROP CONSTRAINT [FK_TbAtividade_TbPeriodo]
GO
ALTER TABLE [dbo].[TbCursoTipoCobranca02] DROP CONSTRAINT [FK_TbCursoTipoCobranca02_TbPeriodo]
GO
ALTER TABLE [dbo].[TbCursoTipoCobranca06] DROP CONSTRAINT [FK_TbCursoTipoCobranca06_TbPeriodo]
GO
ALTER TABLE [dbo].[TbFaseNota] DROP CONSTRAINT [FK_TbFaseNota_TbPeriodo]
GO
ALTER TABLE [dbo].[TbFaseNotaNotaNecessaria] DROP CONSTRAINT [FK_TbFaseNotaNotaNecessaria_TbPeriodo]
GO
ALTER TABLE [dbo].[TbFaseNotaOrigemDestino] DROP CONSTRAINT [FK_TbFaseNotaOrigemDestino_TbPeriodo]
GO
ALTER TABLE [dbo].[TbFormula] DROP CONSTRAINT [FK_TbFormula_TbPeriodo]
GO
ALTER TABLE [dbo].[TbGradeCurricular] DROP CONSTRAINT [FK_TbGradeCurricular_TbPeriodo]
GO
ALTER TABLE [dbo].[TbHistoricoAproveitamento] DROP CONSTRAINT [FK_TbHistoricoAproveitamento_TbPeriodo]
GO
ALTER TABLE [dbo].[TbHistoricoEnsinoSuperior] DROP CONSTRAINT [FK_TbHistoricoEnsinoSuperior_TbPeriodo]
GO
ALTER TABLE [dbo].[TbMetaConceito] DROP CONSTRAINT [FK_TbMetaConceito_Periodo]
GO
ALTER TABLE [dbo].[TbMetaFaseNota] DROP CONSTRAINT [FK_TbMetaFaseNota_TbPeriodo]
GO
ALTER TABLE [dbo].[TbNotaConceito] DROP CONSTRAINT [FK_TbNotaConceito_TbPeriodo]
GO
ALTER TABLE [dbo].[TbOptProva] DROP CONSTRAINT [FK_TbOptProva_TbPeriodo]
GO
ALTER TABLE [dbo].[TbParametroInternet] DROP CONSTRAINT [FK_TbParametroInternet_TbPeriodo_Agendamento]
GO
ALTER TABLE [dbo].[TbParametroInternet] DROP CONSTRAINT [FK_TbParametroInternet_TbPeriodo1]
GO
ALTER TABLE [dbo].[TbParametroInternet] DROP CONSTRAINT [FK_TbParametroInternet_TbPeriodo]
GO
ALTER TABLE [dbo].[TbParametroInternet] DROP CONSTRAINT [FK_TbParametroInternet_TbPeriodo_InscrTurma]
GO
ALTER TABLE [dbo].[TbParametroInternet] DROP CONSTRAINT [FK_TbParametroInternet_TbPeriodo_ReservaMatriculaOnline]
GO
ALTER TABLE [dbo].[TbPeriodo] DROP CONSTRAINT [FK_TbPeriodo_TbPeriodo]
GO
ALTER TABLE [dbo].[TbPlanoPagamento] DROP CONSTRAINT [FK_TbPlanoPagamento_TbPeriodo]
GO
ALTER TABLE [dbo].[TbProcedimentoMatricula] DROP CONSTRAINT [FK_TbProcedimentoMatricula_TbPeriodo]
GO
ALTER TABLE [dbo].[TbProfessorHorario] DROP CONSTRAINT [FK_TbProfessorHorario_TbPeriodo]
GO
ALTER TABLE [dbo].[TbRelatorioMatricula] DROP CONSTRAINT [FK_TbRelatorioMatricula_TbPeriodo]
GO
ALTER TABLE [dbo].[TbRelatorioMatriculaCursoSuperior] DROP CONSTRAINT [FK_TbRelatorioMatriculaCursoSuperior_TbPeriodo]
GO
ALTER TABLE [dbo].[TbSeriePeriodo] DROP CONSTRAINT [FK_TbSeriePeriodo_TbPeriodo]
GO
ALTER TABLE [dbo].[TbSituacaoAlunoTurmaPagamento] DROP CONSTRAINT [FK_TbSituacaoAlunoTurmaPagamento_TbPeriodo]
GO
ALTER TABLE [dbo].[TbSolicitacaoDesconto] DROP CONSTRAINT [FK_TbSolicitacaoDesconto_TbPeriodo]
GO
ALTER TABLE [dbo].[TbTurma] DROP CONSTRAINT [FK_TbTurma_TbPeriodo]
GO



ALTER TABLE [dbo].[TbPeriodo] DROP CONSTRAINT [PK_TbPeriodo]
GO


ALTER TABLE [dbo].[TbPeriodo] ADD  CONSTRAINT [PK_TbPeriodo] PRIMARY KEY CLUSTERED 
(
        [IdPeriodo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO


                                                                                                                                                                                                                                                                 
ALTER TABLE [dbo].[TbAlunoCursoDesconto] WITH CHECK ADD  CONSTRAINT [FK_TbAlunoCursoDesconto_TbPeriodo] FOREIGN KEY([IdPeriodo]) REFERENCES [dbo].[TbPeriodo] ([IdPeriodo])                                                                                      
GO
ALTER TABLE [dbo].[TbAlunoCursoDesconto] CHECK CONSTRAINT [FK_TbAlunoCursoDesconto_TbPeriodo]
GO

ALTER TABLE [dbo].[TbAlunoCursoSuperior] WITH CHECK ADD  CONSTRAINT [FK_TbAlunoCursoSuperior_TbPeriodo] FOREIGN KEY([IdPeriodoIngresso]) REFERENCES [dbo].[TbPeriodo] ([IdPeriodo])                                                                              
GO
ALTER TABLE [dbo].[TbAlunoCursoSuperior] CHECK CONSTRAINT [FK_TbAlunoCursoSuperior_TbPeriodo]
GO

ALTER TABLE [dbo].[TbAlunoCursoSuperior] WITH CHECK ADD  CONSTRAINT [FK_TbAlunoCursoSuperior_TbPeriodo1] FOREIGN KEY([IdPeriodoSaida]) REFERENCES [dbo].[TbPeriodo] ([IdPeriodo])                                                                                
GO
ALTER TABLE [dbo].[TbAlunoCursoSuperior] CHECK CONSTRAINT [FK_TbAlunoCursoSuperior_TbPeriodo1]
GO

ALTER TABLE [dbo].[TbAlunoPeriodo] WITH CHECK ADD  CONSTRAINT [FK_TbAlunoPeriodo_TbPeriodo] FOREIGN KEY([IdPeriodo]) REFERENCES [dbo].[TbPeriodo] ([IdPeriodo])                                                                                                  
GO
ALTER TABLE [dbo].[TbAlunoPeriodo] CHECK CONSTRAINT [FK_TbAlunoPeriodo_TbPeriodo]
GO

ALTER TABLE [dbo].[TbAtividade] WITH CHECK ADD  CONSTRAINT [FK_TbAtividade_TbPeriodo] FOREIGN KEY([IdPeriodo]) REFERENCES [dbo].[TbPeriodo] ([IdPeriodo])                                                                                                        
GO
ALTER TABLE [dbo].[TbAtividade] CHECK CONSTRAINT [FK_TbAtividade_TbPeriodo]
GO

ALTER TABLE [dbo].[TbCursoTipoCobranca02] WITH CHECK ADD  CONSTRAINT [FK_TbCursoTipoCobranca02_TbPeriodo] FOREIGN KEY([Turma_IdPeriodo]) REFERENCES [dbo].[TbPeriodo] ([IdPeriodo])                                                                              
GO
ALTER TABLE [dbo].[TbCursoTipoCobranca02] CHECK CONSTRAINT [FK_TbCursoTipoCobranca02_TbPeriodo]
GO

ALTER TABLE [dbo].[TbCursoTipoCobranca06] WITH CHECK ADD  CONSTRAINT [FK_TbCursoTipoCobranca06_TbPeriodo] FOREIGN KEY([Turma_IdPeriodo]) REFERENCES [dbo].[TbPeriodo] ([IdPeriodo])                                                                              
GO
ALTER TABLE [dbo].[TbCursoTipoCobranca06] CHECK CONSTRAINT [FK_TbCursoTipoCobranca06_TbPeriodo]
GO

ALTER TABLE [dbo].[TbFaseNota] WITH CHECK ADD  CONSTRAINT [FK_TbFaseNota_TbPeriodo] FOREIGN KEY([IdPeriodo]) REFERENCES [dbo].[TbPeriodo] ([IdPeriodo])                                                                                                          
GO
ALTER TABLE [dbo].[TbFaseNota] CHECK CONSTRAINT [FK_TbFaseNota_TbPeriodo]
GO

ALTER TABLE [dbo].[TbFaseNotaNotaNecessaria] WITH CHECK ADD  CONSTRAINT [FK_TbFaseNotaNotaNecessaria_TbPeriodo] FOREIGN KEY([IdPeriodo]) REFERENCES [dbo].[TbPeriodo] ([IdPeriodo])                                                                              
GO
ALTER TABLE [dbo].[TbFaseNotaNotaNecessaria] CHECK CONSTRAINT [FK_TbFaseNotaNotaNecessaria_TbPeriodo]
GO

ALTER TABLE [dbo].[TbFaseNotaOrigemDestino] WITH CHECK ADD  CONSTRAINT [FK_TbFaseNotaOrigemDestino_TbPeriodo] FOREIGN KEY([IdPeriodo]) REFERENCES [dbo].[TbPeriodo] ([IdPeriodo])                                                                                
GO
ALTER TABLE [dbo].[TbFaseNotaOrigemDestino] CHECK CONSTRAINT [FK_TbFaseNotaOrigemDestino_TbPeriodo]
GO

ALTER TABLE [dbo].[TbFormula] WITH CHECK ADD  CONSTRAINT [FK_TbFormula_TbPeriodo] FOREIGN KEY([IdPeriodo]) REFERENCES [dbo].[TbPeriodo] ([IdPeriodo])                                                                                                            
GO
ALTER TABLE [dbo].[TbFormula] CHECK CONSTRAINT [FK_TbFormula_TbPeriodo]
GO

ALTER TABLE [dbo].[TbGradeCurricular] WITH CHECK ADD  CONSTRAINT [FK_TbGradeCurricular_TbPeriodo] FOREIGN KEY([IdPeriodo]) REFERENCES [dbo].[TbPeriodo] ([IdPeriodo])                                                                                            
GO
ALTER TABLE [dbo].[TbGradeCurricular] CHECK CONSTRAINT [FK_TbGradeCurricular_TbPeriodo]
GO

ALTER TABLE [dbo].[TbHistoricoAproveitamento] WITH CHECK ADD  CONSTRAINT [FK_TbHistoricoAproveitamento_TbPeriodo] FOREIGN KEY([IdPeriodo]) REFERENCES [dbo].[TbPeriodo] ([IdPeriodo])                                                                            
GO
ALTER TABLE [dbo].[TbHistoricoAproveitamento] CHECK CONSTRAINT [FK_TbHistoricoAproveitamento_TbPeriodo]
GO

ALTER TABLE [dbo].[TbHistoricoEnsinoSuperior] WITH CHECK ADD  CONSTRAINT [FK_TbHistoricoEnsinoSuperior_TbPeriodo] FOREIGN KEY([IdPeriodo]) REFERENCES [dbo].[TbPeriodo] ([IdPeriodo])                                                                            
GO
ALTER TABLE [dbo].[TbHistoricoEnsinoSuperior] CHECK CONSTRAINT [FK_TbHistoricoEnsinoSuperior_TbPeriodo]
GO

ALTER TABLE [dbo].[TbMetaConceito] WITH CHECK ADD  CONSTRAINT [FK_TbMetaConceito_Periodo] FOREIGN KEY([IdPeriodo]) REFERENCES [dbo].[TbPeriodo] ([IdPeriodo])                                                                                                    
GO
ALTER TABLE [dbo].[TbMetaConceito] CHECK CONSTRAINT [FK_TbMetaConceito_Periodo]
GO

ALTER TABLE [dbo].[TbMetaFaseNota] WITH CHECK ADD  CONSTRAINT [FK_TbMetaFaseNota_TbPeriodo] FOREIGN KEY([IdPeriodo]) REFERENCES [dbo].[TbPeriodo] ([IdPeriodo])                                                                                                  
GO
ALTER TABLE [dbo].[TbMetaFaseNota] CHECK CONSTRAINT [FK_TbMetaFaseNota_TbPeriodo]
GO

ALTER TABLE [dbo].[TbNotaConceito] WITH CHECK ADD  CONSTRAINT [FK_TbNotaConceito_TbPeriodo] FOREIGN KEY([IdPeriodo]) REFERENCES [dbo].[TbPeriodo] ([IdPeriodo])                                                                                                  
GO
ALTER TABLE [dbo].[TbNotaConceito] CHECK CONSTRAINT [FK_TbNotaConceito_TbPeriodo]
GO

ALTER TABLE [dbo].[TbOptProva] WITH CHECK ADD  CONSTRAINT [FK_TbOptProva_TbPeriodo] FOREIGN KEY([IdPeriodo]) REFERENCES [dbo].[TbPeriodo] ([IdPeriodo])                                                                                                          
GO
ALTER TABLE [dbo].[TbOptProva] CHECK CONSTRAINT [FK_TbOptProva_TbPeriodo]
GO

ALTER TABLE [dbo].[TbParametroInternet] WITH CHECK ADD  CONSTRAINT [FK_TbParametroInternet_TbPeriodo_Agendamento] FOREIGN KEY([Agendamento_IdPeriodo]) REFERENCES [dbo].[TbPeriodo] ([IdPeriodo])                                                                
GO
ALTER TABLE [dbo].[TbParametroInternet] CHECK CONSTRAINT [FK_TbParametroInternet_TbPeriodo_Agendamento]
GO

ALTER TABLE [dbo].[TbParametroInternet] WITH CHECK ADD  CONSTRAINT [FK_TbParametroInternet_TbPeriodo1] FOREIGN KEY([ExibirAlunosTurma_IdPeriodo]) REFERENCES [dbo].[TbPeriodo] ([IdPeriodo])                                                                     
GO
ALTER TABLE [dbo].[TbParametroInternet] CHECK CONSTRAINT [FK_TbParametroInternet_TbPeriodo1]
GO

ALTER TABLE [dbo].[TbParametroInternet] WITH CHECK ADD  CONSTRAINT [FK_TbParametroInternet_TbPeriodo] FOREIGN KEY([SolicitacaoDesconto_IdPeriodo]) REFERENCES [dbo].[TbPeriodo] ([IdPeriodo])                                                                    
GO
ALTER TABLE [dbo].[TbParametroInternet] CHECK CONSTRAINT [FK_TbParametroInternet_TbPeriodo]
GO

ALTER TABLE [dbo].[TbParametroInternet] WITH CHECK ADD  CONSTRAINT [FK_TbParametroInternet_TbPeriodo_InscrTurma] FOREIGN KEY([InscrTurma_IdPeriodo]) REFERENCES [dbo].[TbPeriodo] ([IdPeriodo])                                                                  
GO
ALTER TABLE [dbo].[TbParametroInternet] CHECK CONSTRAINT [FK_TbParametroInternet_TbPeriodo_InscrTurma]
GO

ALTER TABLE [dbo].[TbParametroInternet] WITH CHECK ADD  CONSTRAINT [FK_TbParametroInternet_TbPeriodo_ReservaMatriculaOnline] FOREIGN KEY([ReservaMatriculaOnline_IdPeriodo]) REFERENCES [dbo].[TbPeriodo] ([IdPeriodo])                                          
GO
ALTER TABLE [dbo].[TbParametroInternet] CHECK CONSTRAINT [FK_TbParametroInternet_TbPeriodo_ReservaMatriculaOnline]
GO

ALTER TABLE [dbo].[TbPeriodo] WITH CHECK ADD  CONSTRAINT [FK_TbPeriodo_TbPeriodo] FOREIGN KEY([IdProximoPeriodo]) REFERENCES [dbo].[TbPeriodo] ([IdPeriodo])                                                                                                     
GO
ALTER TABLE [dbo].[TbPeriodo] CHECK CONSTRAINT [FK_TbPeriodo_TbPeriodo]
GO

ALTER TABLE [dbo].[TbPlanoPagamento] WITH CHECK ADD  CONSTRAINT [FK_TbPlanoPagamento_TbPeriodo] FOREIGN KEY([IdPeriodo]) REFERENCES [dbo].[TbPeriodo] ([IdPeriodo])                                                                                              
GO
ALTER TABLE [dbo].[TbPlanoPagamento] CHECK CONSTRAINT [FK_TbPlanoPagamento_TbPeriodo]
GO

ALTER TABLE [dbo].[TbProcedimentoMatricula] WITH CHECK ADD  CONSTRAINT [FK_TbProcedimentoMatricula_TbPeriodo] FOREIGN KEY([IdPeriodo]) REFERENCES [dbo].[TbPeriodo] ([IdPeriodo])                                                                                
GO
ALTER TABLE [dbo].[TbProcedimentoMatricula] CHECK CONSTRAINT [FK_TbProcedimentoMatricula_TbPeriodo]
GO

ALTER TABLE [dbo].[TbProfessorHorario] WITH CHECK ADD  CONSTRAINT [FK_TbProfessorHorario_TbPeriodo] FOREIGN KEY([IdPeriodo]) REFERENCES [dbo].[TbPeriodo] ([IdPeriodo])                                                                                          
GO
ALTER TABLE [dbo].[TbProfessorHorario] CHECK CONSTRAINT [FK_TbProfessorHorario_TbPeriodo]
GO

ALTER TABLE [dbo].[TbRelatorioMatricula] WITH CHECK ADD  CONSTRAINT [FK_TbRelatorioMatricula_TbPeriodo] FOREIGN KEY([IdPeriodo]) REFERENCES [dbo].[TbPeriodo] ([IdPeriodo])                                                                                      
GO
ALTER TABLE [dbo].[TbRelatorioMatricula] CHECK CONSTRAINT [FK_TbRelatorioMatricula_TbPeriodo]
GO

ALTER TABLE [dbo].[TbRelatorioMatriculaCursoSuperior] WITH CHECK ADD  CONSTRAINT [FK_TbRelatorioMatriculaCursoSuperior_TbPeriodo] FOREIGN KEY([IdPeriodo]) REFERENCES [dbo].[TbPeriodo] ([IdPeriodo])                                                            
GO
ALTER TABLE [dbo].[TbRelatorioMatriculaCursoSuperior] CHECK CONSTRAINT [FK_TbRelatorioMatriculaCursoSuperior_TbPeriodo]
GO

ALTER TABLE [dbo].[TbSeriePeriodo] WITH CHECK ADD  CONSTRAINT [FK_TbSeriePeriodo_TbPeriodo] FOREIGN KEY([IdPeriodo]) REFERENCES [dbo].[TbPeriodo] ([IdPeriodo])                                                                                                  
GO
ALTER TABLE [dbo].[TbSeriePeriodo] CHECK CONSTRAINT [FK_TbSeriePeriodo_TbPeriodo]
GO

ALTER TABLE [dbo].[TbSituacaoAlunoTurmaPagamento] WITH CHECK ADD  CONSTRAINT [FK_TbSituacaoAlunoTurmaPagamento_TbPeriodo] FOREIGN KEY([IdPeriodo]) REFERENCES [dbo].[TbPeriodo] ([IdPeriodo])                                                                    
GO
ALTER TABLE [dbo].[TbSituacaoAlunoTurmaPagamento] CHECK CONSTRAINT [FK_TbSituacaoAlunoTurmaPagamento_TbPeriodo]
GO

ALTER TABLE [dbo].[TbSolicitacaoDesconto] WITH CHECK ADD  CONSTRAINT [FK_TbSolicitacaoDesconto_TbPeriodo] FOREIGN KEY([IdPeriodo]) REFERENCES [dbo].[TbPeriodo] ([IdPeriodo])                                                                                    
GO
ALTER TABLE [dbo].[TbSolicitacaoDesconto] CHECK CONSTRAINT [FK_TbSolicitacaoDesconto_TbPeriodo]
GO

ALTER TABLE [dbo].[TbTurma] WITH CHECK ADD  CONSTRAINT [FK_TbTurma_TbPeriodo] FOREIGN KEY([IdPeriodo]) REFERENCES [dbo].[TbPeriodo] ([IdPeriodo])                                                                                                                
GO
ALTER TABLE [dbo].[TbTurma] CHECK CONSTRAINT [FK_TbTurma_TbPeriodo]
GO




-- TbUsuario -------------------------------------------------------------------------------------------------



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
ALTER TABLE [dbo].[TbAlmoxUsuarioGrupoMaterial] DROP CONSTRAINT [FK_TbAlmoxUsuarioGrupoMaterial_TbUsuario]
GO
ALTER TABLE [dbo].[TbAlunoObs] DROP CONSTRAINT [FK_TbAlunoObs_TbUsuario]
GO
ALTER TABLE [dbo].[TbAlunoObs] DROP CONSTRAINT [FK_TbAlunoObs_TbUsuario1]
GO
ALTER TABLE [dbo].[TbAlunoPeriodo] DROP CONSTRAINT [FK_TbAlunoPeriodo_TbUsuario]
GO
ALTER TABLE [dbo].[TbAlunoRotinaEducacaoInfantil] DROP CONSTRAINT [FK_TbAlunoRotinaEducacaoInfantil_TbUsuario]
GO
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
ALTER TABLE [dbo].[TbArquivoAnexo] DROP CONSTRAINT [FK_IdUsuarioUpload_TbUsuario]
GO
ALTER TABLE [dbo].[TbArquivoAnexo] DROP CONSTRAINT [FK_IdUsuarioExclusaoLogica_TbUsuario]
GO
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
ALTER TABLE [dbo].[TbCaptacaoAlunoInteressado] DROP CONSTRAINT [FK_TbCaptacaoAlunoInteressado_TbUsuario]
GO
ALTER TABLE [dbo].[TbCaptacaoInteracao] DROP CONSTRAINT [FK_TbCaptacaoInteracao_TbUsuario]
GO
ALTER TABLE [dbo].[TbChequeMovimentacao] DROP CONSTRAINT [FK_TbChequeMovimentacao_TbUsuario]
GO
ALTER TABLE [dbo].[TbContaUsuario] DROP CONSTRAINT [FK_TbContaUsuario_TbUsuario]
GO
ALTER TABLE [dbo].[TbCurso] DROP CONSTRAINT [FK_TbCurso_TbUsuario]
GO
ALTER TABLE [dbo].[TbDadosUso] DROP CONSTRAINT [FK_TbDadosUso_TbUsuario]
GO
ALTER TABLE [dbo].[TbEscola] DROP CONSTRAINT [FK_TbEscola_TbUsuario]
GO
ALTER TABLE [dbo].[TbFaseNotaAluno_FilaProcessamento] DROP CONSTRAINT [FK_TbFaseNotaAluno_FilaProcessamento_TbUsuario]
GO
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
ALTER TABLE [dbo].[TbSituacaoAlunoDisciplina] DROP CONSTRAINT [FK_TbSituacaoAlunoDisciplina_TbUsuarioMatricula]
GO
ALTER TABLE [dbo].[TbSituacaoAlunoDisciplina] DROP CONSTRAINT [FK_TbSituacaoAlunoDisciplina_TbUsuarioTrancamento]
GO
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
ALTER TABLE [dbo].[TbTurmaProfessor] DROP CONSTRAINT [FK_TbAlunoProfessor_TbUsuario_IdUsuarioConfirmacao]
GO
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




ALTER TABLE [dbo].[TbUsuario] DROP CONSTRAINT [PK_TbUsuario]
GO


ALTER TABLE [dbo].[TbUsuario] ADD  CONSTRAINT [PK_TbUsuario] PRIMARY KEY CLUSTERED 
(
        [IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO


ALTER TABLE [dbo].[TbAlmoxMaterialMovimentacao] WITH CHECK ADD  CONSTRAINT [FK_TbAlmoxMaterialMovimentacao_TbUsuario] FOREIGN KEY([IdUsuario]) REFERENCES [dbo].[TbUsuario] ([IdUsuario])                                                                        
GO
ALTER TABLE [dbo].[TbAlmoxMaterialMovimentacao] CHECK CONSTRAINT [FK_TbAlmoxMaterialMovimentacao_TbUsuario]
GO

ALTER TABLE [dbo].[TbAlmoxRequisicao] WITH CHECK ADD  CONSTRAINT [FK_TbAlmoxRequisicao_TbUsuario_Requisitante] FOREIGN KEY([IdUsuarioRequisitante]) REFERENCES [dbo].[TbUsuario] ([IdUsuario])                                                                   
GO
ALTER TABLE [dbo].[TbAlmoxRequisicao] CHECK CONSTRAINT [FK_TbAlmoxRequisicao_TbUsuario_Requisitante]
GO

ALTER TABLE [dbo].[TbAlmoxRequisicao] WITH CHECK ADD  CONSTRAINT [FK_TbAlmoxRequisicao_TbUsuario_Recebimento] FOREIGN KEY([IdUsuarioRecebimento]) REFERENCES [dbo].[TbUsuario] ([IdUsuario])                                                                     
GO
ALTER TABLE [dbo].[TbAlmoxRequisicao] CHECK CONSTRAINT [FK_TbAlmoxRequisicao_TbUsuario_Recebimento]
GO

ALTER TABLE [dbo].[TbAlmoxRequisicao] WITH CHECK ADD  CONSTRAINT [FK_TbAlmoxRequisicao_TbUsuario_Conclusao] FOREIGN KEY([IdUsuario_ConclusaoRequisicao]) REFERENCES [dbo].[TbUsuario] ([IdUsuario])                                                              
GO
ALTER TABLE [dbo].[TbAlmoxRequisicao] CHECK CONSTRAINT [FK_TbAlmoxRequisicao_TbUsuario_Conclusao]
GO

ALTER TABLE [dbo].[TbAlmoxUsuarioAlmoxarifado] WITH CHECK ADD  CONSTRAINT [FK_TbAlmoxUsuarioAlmoxarifado_TbUsuario] FOREIGN KEY([IdUsuario]) REFERENCES [dbo].[TbUsuario] ([IdUsuario])                                                                          
GO
ALTER TABLE [dbo].[TbAlmoxUsuarioAlmoxarifado] CHECK CONSTRAINT [FK_TbAlmoxUsuarioAlmoxarifado_TbUsuario]
GO

ALTER TABLE [dbo].[TbAlmoxUsuarioCentroResultado] WITH CHECK ADD  CONSTRAINT [FK_TbAlmoxUsuarioCentroResultado_TbUsuario] FOREIGN KEY([IdUsuario]) REFERENCES [dbo].[TbUsuario] ([IdUsuario])                                                                    
GO
ALTER TABLE [dbo].[TbAlmoxUsuarioCentroResultado] CHECK CONSTRAINT [FK_TbAlmoxUsuarioCentroResultado_TbUsuario]
GO

ALTER TABLE [dbo].[TbAlmoxUsuarioGrupoMaterial] WITH CHECK ADD  CONSTRAINT [FK_TbAlmoxUsuarioGrupoMaterial_TbUsuario] FOREIGN KEY([IdUsuario]) REFERENCES [dbo].[TbUsuario] ([IdUsuario])                                                                        
GO
ALTER TABLE [dbo].[TbAlmoxUsuarioGrupoMaterial] CHECK CONSTRAINT [FK_TbAlmoxUsuarioGrupoMaterial_TbUsuario]
GO

ALTER TABLE [dbo].[TbAlunoObs] WITH CHECK ADD  CONSTRAINT [FK_TbAlunoObs_TbUsuario] FOREIGN KEY([IdUsuarioRegistro]) REFERENCES [dbo].[TbUsuario] ([IdUsuario])                                                                                                  
GO
ALTER TABLE [dbo].[TbAlunoObs] CHECK CONSTRAINT [FK_TbAlunoObs_TbUsuario]
GO

ALTER TABLE [dbo].[TbAlunoObs] WITH CHECK ADD  CONSTRAINT [FK_TbAlunoObs_TbUsuario1] FOREIGN KEY([IdUsuarioLiberacao]) REFERENCES [dbo].[TbUsuario] ([IdUsuario])                                                                                                
GO
ALTER TABLE [dbo].[TbAlunoObs] CHECK CONSTRAINT [FK_TbAlunoObs_TbUsuario1]
GO

ALTER TABLE [dbo].[TbAlunoPeriodo] WITH CHECK ADD  CONSTRAINT [FK_TbAlunoPeriodo_TbUsuario] FOREIGN KEY([IdUsuario_AditamentoFies]) REFERENCES [dbo].[TbUsuario] ([IdUsuario])                                                                                   
GO
ALTER TABLE [dbo].[TbAlunoPeriodo] CHECK CONSTRAINT [FK_TbAlunoPeriodo_TbUsuario]
GO

ALTER TABLE [dbo].[TbAlunoRotinaEducacaoInfantil] WITH CHECK ADD  CONSTRAINT [FK_TbAlunoRotinaEducacaoInfantil_TbUsuario] FOREIGN KEY([IdUsuarioResponsavel]) REFERENCES [dbo].[TbUsuario] ([IdUsuario])                                                         
GO
ALTER TABLE [dbo].[TbAlunoRotinaEducacaoInfantil] CHECK CONSTRAINT [FK_TbAlunoRotinaEducacaoInfantil_TbUsuario]
GO

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

ALTER TABLE [dbo].[TbArquivoAnexo] WITH CHECK ADD  CONSTRAINT [FK_IdUsuarioUpload_TbUsuario] FOREIGN KEY([IdUsuarioUpload]) REFERENCES [dbo].[TbUsuario] ([IdUsuario])                                                                                           
GO
ALTER TABLE [dbo].[TbArquivoAnexo] CHECK CONSTRAINT [FK_IdUsuarioUpload_TbUsuario]
GO

ALTER TABLE [dbo].[TbArquivoAnexo] WITH CHECK ADD  CONSTRAINT [FK_IdUsuarioExclusaoLogica_TbUsuario] FOREIGN KEY([IdUsuarioExclusaoLogica]) REFERENCES [dbo].[TbUsuario] ([IdUsuario])                                                                           
GO
ALTER TABLE [dbo].[TbArquivoAnexo] CHECK CONSTRAINT [FK_IdUsuarioExclusaoLogica_TbUsuario]
GO

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

ALTER TABLE [dbo].[TbCaptacaoAlunoInteressado] WITH CHECK ADD  CONSTRAINT [FK_TbCaptacaoAlunoInteressado_TbUsuario] FOREIGN KEY([IdUsuarioResponsavel]) REFERENCES [dbo].[TbUsuario] ([IdUsuario])                                                               
GO
ALTER TABLE [dbo].[TbCaptacaoAlunoInteressado] CHECK CONSTRAINT [FK_TbCaptacaoAlunoInteressado_TbUsuario]
GO

ALTER TABLE [dbo].[TbCaptacaoInteracao] WITH CHECK ADD  CONSTRAINT [FK_TbCaptacaoInteracao_TbUsuario] FOREIGN KEY([IdUsuario]) REFERENCES [dbo].[TbUsuario] ([IdUsuario])                                                                                        
GO
ALTER TABLE [dbo].[TbCaptacaoInteracao] CHECK CONSTRAINT [FK_TbCaptacaoInteracao_TbUsuario]
GO

ALTER TABLE [dbo].[TbChequeMovimentacao] WITH CHECK ADD  CONSTRAINT [FK_TbChequeMovimentacao_TbUsuario] FOREIGN KEY([IdUsuario]) REFERENCES [dbo].[TbUsuario] ([IdUsuario])                                                                                      
GO
ALTER TABLE [dbo].[TbChequeMovimentacao] CHECK CONSTRAINT [FK_TbChequeMovimentacao_TbUsuario]
GO

ALTER TABLE [dbo].[TbContaUsuario] WITH CHECK ADD  CONSTRAINT [FK_TbContaUsuario_TbUsuario] FOREIGN KEY([IdUsuario]) REFERENCES [dbo].[TbUsuario] ([IdUsuario])                                                                                                  
GO
ALTER TABLE [dbo].[TbContaUsuario] CHECK CONSTRAINT [FK_TbContaUsuario_TbUsuario]
GO

ALTER TABLE [dbo].[TbCurso] WITH CHECK ADD  CONSTRAINT [FK_TbCurso_TbUsuario] FOREIGN KEY([IdUsuarioCoordenadorResponsavel]) REFERENCES [dbo].[TbUsuario] ([IdUsuario])                                                                                          
GO
ALTER TABLE [dbo].[TbCurso] CHECK CONSTRAINT [FK_TbCurso_TbUsuario]
GO

ALTER TABLE [dbo].[TbDadosUso] WITH CHECK ADD  CONSTRAINT [FK_TbDadosUso_TbUsuario] FOREIGN KEY([IdUsuario]) REFERENCES [dbo].[TbUsuario] ([IdUsuario])                                                                                                          
GO
ALTER TABLE [dbo].[TbDadosUso] CHECK CONSTRAINT [FK_TbDadosUso_TbUsuario]
GO

ALTER TABLE [dbo].[TbEscola] WITH CHECK ADD  CONSTRAINT [FK_TbEscola_TbUsuario] FOREIGN KEY([IdUsuarioRespEscola]) REFERENCES [dbo].[TbUsuario] ([IdUsuario])                                                                                                    
GO
ALTER TABLE [dbo].[TbEscola] CHECK CONSTRAINT [FK_TbEscola_TbUsuario]
GO

ALTER TABLE [dbo].[TbFaseNotaAluno_FilaProcessamento] WITH CHECK ADD  CONSTRAINT [FK_TbFaseNotaAluno_FilaProcessamento_TbUsuario] FOREIGN KEY([IdUsuario]) REFERENCES [dbo].[TbUsuario] ([IdUsuario])                                                            
GO
ALTER TABLE [dbo].[TbFaseNotaAluno_FilaProcessamento] CHECK CONSTRAINT [FK_TbFaseNotaAluno_FilaProcessamento_TbUsuario]
GO

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

ALTER TABLE [dbo].[TbSituacaoAlunoDisciplina] WITH CHECK ADD  CONSTRAINT [FK_TbSituacaoAlunoDisciplina_TbUsuarioMatricula] FOREIGN KEY([IdUsuarioMatricula]) REFERENCES [dbo].[TbUsuario] ([IdUsuario])                                                          
GO
ALTER TABLE [dbo].[TbSituacaoAlunoDisciplina] CHECK CONSTRAINT [FK_TbSituacaoAlunoDisciplina_TbUsuarioMatricula]
GO

ALTER TABLE [dbo].[TbSituacaoAlunoDisciplina] WITH CHECK ADD  CONSTRAINT [FK_TbSituacaoAlunoDisciplina_TbUsuarioTrancamento] FOREIGN KEY([IdUsuarioTrancamento]) REFERENCES [dbo].[TbUsuario] ([IdUsuario])                                                      
GO
ALTER TABLE [dbo].[TbSituacaoAlunoDisciplina] CHECK CONSTRAINT [FK_TbSituacaoAlunoDisciplina_TbUsuarioTrancamento]
GO

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

ALTER TABLE [dbo].[TbTurmaProfessor] WITH CHECK ADD  CONSTRAINT [FK_TbAlunoProfessor_TbUsuario_IdUsuarioConfirmacao] FOREIGN KEY([IdUsuarioConfirmacao]) REFERENCES [dbo].[TbUsuario] ([IdUsuario])                                                              
GO
ALTER TABLE [dbo].[TbTurmaProfessor] CHECK CONSTRAINT [FK_TbAlunoProfessor_TbUsuario_IdUsuarioConfirmacao]
GO

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




----------------------------


-- TbProfessor


-- Novo
--ALTER TABLE [dbo].[TbAlunoCurso] DROP CONSTRAINT [FK_TbAlunoCurso_OrientadorMonografia]
--GO

IF OBJECT_ID('dbo.[FK_TbAlunoCurso_OrientadorMonografia]') IS NOT NULL 
	BEGIN
		ALTER TABLE dbo.[TbAlunoCurso] DROP CONSTRAINT FK_TbAlunoCurso_OrientadorMonografia
	END


ALTER TABLE [dbo].[TbAlunoRotinaEducacaoInfantil] DROP CONSTRAINT [FK_TbAlunoRotinaEducacaoInfantil_TbProfessor]
GO
ALTER TABLE [dbo].[TbAlunoTipoAvaliacao] DROP CONSTRAINT [FK_TbAlunoTipoAvaliacao_TbProfessor]
GO
ALTER TABLE [dbo].[TbArqArquivo] DROP CONSTRAINT [FK_TbArqArquivo_TbProfessor]
GO
ALTER TABLE [dbo].[TbFaseNotaAluno_Auditoria] DROP CONSTRAINT [FK_TbProfessor_TbFaseNotaAluno_Auditoria]
GO
ALTER TABLE [dbo].[TbFaseNotaAluno_FilaProcessamento] DROP CONSTRAINT [FK_TbFaseNotaAluno_FilaProcessamento_TbProfessor]
GO
ALTER TABLE [dbo].[TbFreqProfessorPermissao] DROP CONSTRAINT [FK_TbFreqProfessorPermissao_TbProfessor]
GO
ALTER TABLE [dbo].[TbProfessorDisciplina] DROP CONSTRAINT [FK_TbProfessorDisciplina_TbProfessor]
GO
ALTER TABLE [dbo].[TbProfessorEscolaridade] DROP CONSTRAINT [FK_TbProfessorEscolaridade_TbProfessor]
GO
ALTER TABLE [dbo].[TbProfessorFoto] DROP CONSTRAINT [FK_TbProfessorFoto_TbProfessor]
GO
ALTER TABLE [dbo].[TbProfessorHorario] DROP CONSTRAINT [FK_TbProfessorHorario_TbProfessor]
GO
ALTER TABLE [dbo].[TbProfessorImpressaoDigital] DROP CONSTRAINT [FK_TbProfessorImpressaoDigital_TbProfessor]
GO
ALTER TABLE [dbo].[TbProfessorObs] DROP CONSTRAINT [FK_TbProfessorObs_TbProfessor]
GO
ALTER TABLE [dbo].[TbProfessorVinculoInstituicao] DROP CONSTRAINT [FK_TbProfessorVinculoInstituicao_TbProfessor]
GO
ALTER TABLE [dbo].[TbTurmaProfessor] DROP CONSTRAINT [FK_TbAlunoProfessor_TbProfessor_IdProfessorAlteracao]
GO


ALTER TABLE [dbo].[TbProfessor] DROP CONSTRAINT [PK_TbProfessor]
GO


ALTER TABLE [dbo].[TbProfessor] ADD  CONSTRAINT [PK_TbProfessor] PRIMARY KEY CLUSTERED 
(
        [IdProfessor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO


ALTER TABLE [dbo].[TbAlunoRotinaEducacaoInfantil] WITH CHECK ADD  CONSTRAINT [FK_TbAlunoRotinaEducacaoInfantil_TbProfessor] FOREIGN KEY([IdProfessorResponsavel]) REFERENCES [dbo].[TbProfessor] ([IdProfessor])                                                 
GO
ALTER TABLE [dbo].[TbAlunoRotinaEducacaoInfantil] CHECK CONSTRAINT [FK_TbAlunoRotinaEducacaoInfantil_TbProfessor]
GO

ALTER TABLE [dbo].[TbAlunoTipoAvaliacao] WITH CHECK ADD  CONSTRAINT [FK_TbAlunoTipoAvaliacao_TbProfessor] FOREIGN KEY([IdProfessor]) REFERENCES [dbo].[TbProfessor] ([IdProfessor])                                                                              
GO
ALTER TABLE [dbo].[TbAlunoTipoAvaliacao] CHECK CONSTRAINT [FK_TbAlunoTipoAvaliacao_TbProfessor]
GO

ALTER TABLE [dbo].[TbArqArquivo] WITH CHECK ADD  CONSTRAINT [FK_TbArqArquivo_TbProfessor] FOREIGN KEY([IdProfessor]) REFERENCES [dbo].[TbProfessor] ([IdProfessor])                                                                                              
GO
ALTER TABLE [dbo].[TbArqArquivo] CHECK CONSTRAINT [FK_TbArqArquivo_TbProfessor]
GO

ALTER TABLE [dbo].[TbFaseNotaAluno_Auditoria] WITH CHECK ADD  CONSTRAINT [FK_TbProfessor_TbFaseNotaAluno_Auditoria] FOREIGN KEY([IdProfessor]) REFERENCES [dbo].[TbProfessor] ([IdProfessor])                                                                    
GO
ALTER TABLE [dbo].[TbFaseNotaAluno_Auditoria] CHECK CONSTRAINT [FK_TbProfessor_TbFaseNotaAluno_Auditoria]
GO



IF OBJECT_ID('dbo.[TbFaseNotaAluno_FilaProcessamento]') IS NOT NULL 
	BEGIN
		ALTER TABLE [dbo].[TbFaseNotaAluno_FilaProcessamento] WITH CHECK ADD  CONSTRAINT [FK_TbFaseNotaAluno_FilaProcessamento_TbProfessor] FOREIGN KEY([IdProfessor]) REFERENCES [dbo].[TbProfessor] ([IdProfessor])                                                    
	END
GO

IF OBJECT_ID('dbo.[TbFaseNotaAluno_FilaProcessamento]') IS NOT NULL 
	BEGIN
		ALTER TABLE [dbo].[TbFaseNotaAluno_FilaProcessamento] CHECK CONSTRAINT [FK_TbFaseNotaAluno_FilaProcessamento_TbProfessor]
	END
GO
--

ALTER TABLE [dbo].[TbFreqProfessorPermissao] WITH CHECK ADD  CONSTRAINT [FK_TbFreqProfessorPermissao_TbProfessor] FOREIGN KEY([IdProfessor]) REFERENCES [dbo].[TbProfessor] ([IdProfessor])                                                                      
GO
ALTER TABLE [dbo].[TbFreqProfessorPermissao] CHECK CONSTRAINT [FK_TbFreqProfessorPermissao_TbProfessor]
GO

ALTER TABLE [dbo].[TbProfessorDisciplina] WITH CHECK ADD  CONSTRAINT [FK_TbProfessorDisciplina_TbProfessor] FOREIGN KEY([IdProfessor]) REFERENCES [dbo].[TbProfessor] ([IdProfessor])                                                                            
GO
ALTER TABLE [dbo].[TbProfessorDisciplina] CHECK CONSTRAINT [FK_TbProfessorDisciplina_TbProfessor]
GO

ALTER TABLE [dbo].[TbProfessorEscolaridade] WITH CHECK ADD  CONSTRAINT [FK_TbProfessorEscolaridade_TbProfessor] FOREIGN KEY([IdProfessor]) REFERENCES [dbo].[TbProfessor] ([IdProfessor])                                                                        
GO
ALTER TABLE [dbo].[TbProfessorEscolaridade] CHECK CONSTRAINT [FK_TbProfessorEscolaridade_TbProfessor]
GO

ALTER TABLE [dbo].[TbProfessorFoto] WITH CHECK ADD  CONSTRAINT [FK_TbProfessorFoto_TbProfessor] FOREIGN KEY([IdProfessor]) REFERENCES [dbo].[TbProfessor] ([IdProfessor])                                                                                        
GO
ALTER TABLE [dbo].[TbProfessorFoto] CHECK CONSTRAINT [FK_TbProfessorFoto_TbProfessor]
GO

ALTER TABLE [dbo].[TbProfessorHorario] WITH CHECK ADD  CONSTRAINT [FK_TbProfessorHorario_TbProfessor] FOREIGN KEY([IdProfessor]) REFERENCES [dbo].[TbProfessor] ([IdProfessor])                                                                                  
GO
ALTER TABLE [dbo].[TbProfessorHorario] CHECK CONSTRAINT [FK_TbProfessorHorario_TbProfessor]
GO

ALTER TABLE [dbo].[TbProfessorImpressaoDigital] WITH CHECK ADD  CONSTRAINT [FK_TbProfessorImpressaoDigital_TbProfessor] FOREIGN KEY([IdProfessor]) REFERENCES [dbo].[TbProfessor] ([IdProfessor])                                                                
GO
ALTER TABLE [dbo].[TbProfessorImpressaoDigital] CHECK CONSTRAINT [FK_TbProfessorImpressaoDigital_TbProfessor]
GO

ALTER TABLE [dbo].[TbProfessorObs] WITH CHECK ADD  CONSTRAINT [FK_TbProfessorObs_TbProfessor] FOREIGN KEY([IdProfessor]) REFERENCES [dbo].[TbProfessor] ([IdProfessor])                                                                                          
GO
ALTER TABLE [dbo].[TbProfessorObs] CHECK CONSTRAINT [FK_TbProfessorObs_TbProfessor]
GO

ALTER TABLE [dbo].[TbProfessorVinculoInstituicao] WITH CHECK ADD  CONSTRAINT [FK_TbProfessorVinculoInstituicao_TbProfessor] FOREIGN KEY([IdProfessor]) REFERENCES [dbo].[TbProfessor] ([IdProfessor])                                                            
GO
ALTER TABLE [dbo].[TbProfessorVinculoInstituicao] CHECK CONSTRAINT [FK_TbProfessorVinculoInstituicao_TbProfessor]
GO

ALTER TABLE [dbo].[TbTurmaProfessor] WITH CHECK ADD  CONSTRAINT [FK_TbAlunoProfessor_TbProfessor_IdProfessorAlteracao] FOREIGN KEY([IdProfessorAlteracao]) REFERENCES [dbo].[TbProfessor] ([IdProfessor])                                                        
GO
ALTER TABLE [dbo].[TbTurmaProfessor] CHECK CONSTRAINT [FK_TbAlunoProfessor_TbProfessor_IdProfessorAlteracao]
GO


IF	EXISTS		( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbAlunoCurso'	AND COLUMN_NAME = 'IdOrientadorMonografia' )
	AND	EXISTS	( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbProfessor'	AND COLUMN_NAME = 'IdProfessor' )
	BEGIN
		ALTER TABLE [dbo].[TbAlunoCurso]  WITH CHECK ADD  CONSTRAINT [FK_TbAlunoCurso_OrientadorMonografia] FOREIGN KEY([IdOrientadorMonografia])		REFERENCES [dbo].[TbProfessor] ([IdProfessor])

		ALTER TABLE [dbo].[TbAlunoCurso] CHECK CONSTRAINT [FK_TbAlunoCurso_OrientadorMonografia]
	END
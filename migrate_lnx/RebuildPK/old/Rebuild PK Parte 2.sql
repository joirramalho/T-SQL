-- Rebuild PK Parte 2


/*
-- TbGrupo
ALTER TABLE [dbo].[TbFuncionalidadeGrupo] DROP CONSTRAINT [FK_TbFuncionalidadeGrupo_TbGrupo]
GO
ALTER TABLE [dbo].[TbRelatorioGrupo] DROP CONSTRAINT [FK_TbRelatorioGrupo_TbGrupo]
GO
ALTER TABLE [dbo].[TbSerieGrupo] DROP CONSTRAINT [FK_TbSerieGrupo_TbGrupo]
GO
ALTER TABLE [dbo].[TbUsuarioGrupo] DROP CONSTRAINT [FK_TbUsuarioGrupo_TbGrupo]
GO

ALTER TABLE [dbo].[TbGrupo] DROP CONSTRAINT [PK_TbGrupo]
GO


ALTER TABLE [dbo].[TbGrupo] ADD  CONSTRAINT [PK_TbGrupo] PRIMARY KEY CLUSTERED 
(
        [IdGrupo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO


                                                                                                                                                                                                                                                                 
ALTER TABLE [dbo].[TbFuncionalidadeGrupo] WITH CHECK ADD  CONSTRAINT [FK_TbFuncionalidadeGrupo_TbGrupo] FOREIGN KEY([IdGrupo]) REFERENCES [dbo].[TbGrupo] ([IdGrupo])                                                                                            
GO
ALTER TABLE [dbo].[TbFuncionalidadeGrupo] CHECK CONSTRAINT [FK_TbFuncionalidadeGrupo_TbGrupo]
GO

ALTER TABLE [dbo].[TbRelatorioGrupo] WITH CHECK ADD  CONSTRAINT [FK_TbRelatorioGrupo_TbGrupo] FOREIGN KEY([IdGrupo]) REFERENCES [dbo].[TbGrupo] ([IdGrupo])                                                                                                      
GO
ALTER TABLE [dbo].[TbRelatorioGrupo] CHECK CONSTRAINT [FK_TbRelatorioGrupo_TbGrupo]
GO

ALTER TABLE [dbo].[TbSerieGrupo] WITH CHECK ADD  CONSTRAINT [FK_TbSerieGrupo_TbGrupo] FOREIGN KEY([IdGrupo]) REFERENCES [dbo].[TbGrupo] ([IdGrupo])                                                                                                              
GO
ALTER TABLE [dbo].[TbSerieGrupo] CHECK CONSTRAINT [FK_TbSerieGrupo_TbGrupo]
GO

ALTER TABLE [dbo].[TbUsuarioGrupo] WITH CHECK ADD  CONSTRAINT [FK_TbUsuarioGrupo_TbGrupo] FOREIGN KEY([IdGrupo]) REFERENCES [dbo].[TbGrupo] ([IdGrupo])                                                                                                          
GO
ALTER TABLE [dbo].[TbUsuarioGrupo] CHECK CONSTRAINT [FK_TbUsuarioGrupo_TbGrupo]
GO





-- TbLoteCobranca
ALTER TABLE [dbo].[TbLancamentoCobranca] DROP CONSTRAINT [FK_TbLancamentoCobranca_TbLoteCobranca]
GO
ALTER TABLE [dbo].[TbLoteCobrancaServico] DROP CONSTRAINT [FK_TbLoteCobrancaServico_TbLoteCobranca]
GO


ALTER TABLE [dbo].[TbLoteCobranca] DROP CONSTRAINT [PK_TbLoteCobranca]
GO

ALTER TABLE [dbo].[TbLoteCobranca] ADD  CONSTRAINT [PK_TbLoteCobranca] PRIMARY KEY CLUSTERED 
(
        [IdLoteCobranca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO


                                                                                                                                                                                                                                                                 
ALTER TABLE [dbo].[TbLancamentoCobranca] WITH CHECK ADD  CONSTRAINT [FK_TbLancamentoCobranca_TbLoteCobranca] FOREIGN KEY([IdLoteCobranca]) REFERENCES [dbo].[TbLoteCobranca] ([IdLoteCobranca])                                                                  
GO
ALTER TABLE [dbo].[TbLancamentoCobranca] CHECK CONSTRAINT [FK_TbLancamentoCobranca_TbLoteCobranca]
GO

ALTER TABLE [dbo].[TbLoteCobrancaServico] WITH CHECK ADD  CONSTRAINT [FK_TbLoteCobrancaServico_TbLoteCobranca] FOREIGN KEY([IdLoteCobranca]) REFERENCES [dbo].[TbLoteCobranca] ([IdLoteCobranca])                                                                
GO
ALTER TABLE [dbo].[TbLoteCobrancaServico] CHECK CONSTRAINT [FK_TbLoteCobrancaServico_TbLoteCobranca]
GO




-- TbOptProva
ALTER TABLE [dbo].[TbOptProvaAlunoTurma] DROP CONSTRAINT [FK_TbOptProvaAlunoTurma_TbOptProva]
GO

-- MadreDeusUN2
-- Para quem essa FK aponta?
IF OBJECT_ID('dbo.FK__TbOptProv__IdPro__080CD8A1') IS NOT NULL
BEGIN
        ALTER TABLE [dbo].[TbOptProvaGabarito] DROP CONSTRAINT [FK__TbOptProv__IdPro__080CD8A1]
END

ALTER TABLE [dbo].[TbOptProvaGabarito] DROP CONSTRAINT [FK__TbOptProv__IdPro__043C47BD]
GO
ALTER TABLE [dbo].[TbOptProvaGabarito] DROP CONSTRAINT [FK__TbOptProv__IdPro__043C47BD]
GO
ALTER TABLE [dbo].[TbOptSimuladoEnem] DROP CONSTRAINT [FK_TbOptSimuladoEnem_TbOptProva_IdProvaCHumanas]
GO
ALTER TABLE [dbo].[TbOptSimuladoEnem] DROP CONSTRAINT [FK_TbOptSimuladoEnem_TbOptProva_IdProvaCBiomedicas]
GO
ALTER TABLE [dbo].[TbOptSimuladoEnem] DROP CONSTRAINT [FK_TbOptSimuladoEnem_TbOptProva_IdProvaLinguagens]
GO
ALTER TABLE [dbo].[TbOptSimuladoEnem] DROP CONSTRAINT [FK_TbOptSimuladoEnem_TbOptProva_IdProvaMatematica]
GO


ALTER TABLE [dbo].[TbOptProva] DROP CONSTRAINT [PK_TbOptProva]
GO

ALTER TABLE [dbo].[TbOptProva] ADD  CONSTRAINT [PK_TbOptProva] PRIMARY KEY CLUSTERED 
(
        [IdProva] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO


                                                                                                                                                                                                                                                                 
ALTER TABLE [dbo].[TbOptProvaAlunoTurma] WITH CHECK ADD  CONSTRAINT [FK_TbOptProvaAlunoTurma_TbOptProva] FOREIGN KEY([IdProva]) REFERENCES [dbo].[TbOptProva] ([IdProva])                                                                                        
GO
ALTER TABLE [dbo].[TbOptProvaAlunoTurma] CHECK CONSTRAINT [FK_TbOptProvaAlunoTurma_TbOptProva]
GO


ALTER TABLE [dbo].[TbOptProvaGabarito] WITH CHECK ADD  CONSTRAINT [FK__TbOptProv__IdPro__043C47BD] FOREIGN KEY([IdProva]) REFERENCES [dbo].[TbOptProva] ([IdProva])                                                                                              
GO
ALTER TABLE [dbo].[TbOptProvaGabarito] CHECK CONSTRAINT [FK__TbOptProv__IdPro__043C47BD]
GO



ALTER TABLE [dbo].[TbOptSimuladoEnem] WITH CHECK ADD  CONSTRAINT [FK_TbOptSimuladoEnem_TbOptProva_IdProvaCHumanas] FOREIGN KEY([IdProvaCHumanas]) REFERENCES [dbo].[TbOptProva] ([IdProva])                                                                      
GO
ALTER TABLE [dbo].[TbOptSimuladoEnem] CHECK CONSTRAINT [FK_TbOptSimuladoEnem_TbOptProva_IdProvaCHumanas]
GO

ALTER TABLE [dbo].[TbOptSimuladoEnem] WITH CHECK ADD  CONSTRAINT [FK_TbOptSimuladoEnem_TbOptProva_IdProvaCBiomedicas] FOREIGN KEY([IdProvaCBiomedicas]) REFERENCES [dbo].[TbOptProva] ([IdProva])                                                                
GO
ALTER TABLE [dbo].[TbOptSimuladoEnem] CHECK CONSTRAINT [FK_TbOptSimuladoEnem_TbOptProva_IdProvaCBiomedicas]
GO

ALTER TABLE [dbo].[TbOptSimuladoEnem] WITH CHECK ADD  CONSTRAINT [FK_TbOptSimuladoEnem_TbOptProva_IdProvaLinguagens] FOREIGN KEY([IdProvaLinguagens]) REFERENCES [dbo].[TbOptProva] ([IdProva])                                                                  
GO
ALTER TABLE [dbo].[TbOptSimuladoEnem] CHECK CONSTRAINT [FK_TbOptSimuladoEnem_TbOptProva_IdProvaLinguagens]
GO

ALTER TABLE [dbo].[TbOptSimuladoEnem] WITH CHECK ADD  CONSTRAINT [FK_TbOptSimuladoEnem_TbOptProva_IdProvaMatematica] FOREIGN KEY([IdProvaMatematica]) REFERENCES [dbo].[TbOptProva] ([IdProva])                                                                  
GO
ALTER TABLE [dbo].[TbOptSimuladoEnem] CHECK CONSTRAINT [FK_TbOptSimuladoEnem_TbOptProva_IdProvaMatematica]
GO





-- TbOptProvaGabarito
-- Obs.: FK COMPOSTA - DEVE GERAR SCRIPT MANUALMENTE
ALTER TABLE [dbo].[TbOptProvaResposta] DROP CONSTRAINT [FK_TbOptProvaResposta_TbOptProvaGabarito]                                                                                                                                                                
GO                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                

ALTER TABLE [dbo].[TbOptProvaGabarito] DROP CONSTRAINT [PK_TbOptProvaGabarito] WITH ( ONLINE = OFF )
GO

ALTER TABLE [dbo].[TbOptProvaGabarito] ADD  CONSTRAINT [PK_TbOptProvaGabarito] PRIMARY KEY CLUSTERED 
(
        [IdProva] ASC,
        [NumeroQuestao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO


ALTER TABLE [dbo].[TbOptProvaResposta]  WITH CHECK ADD  CONSTRAINT [FK_TbOptProvaResposta_TbOptProvaGabarito] FOREIGN KEY([IdProva], [NumeroQuestao])
REFERENCES [dbo].[TbOptProvaGabarito] ([IdProva], [NumeroQuestao])
GO

ALTER TABLE [dbo].[TbOptProvaResposta] CHECK CONSTRAINT [FK_TbOptProvaResposta_TbOptProvaGabarito]
GO




-- TbPagamentoLote
ALTER TABLE [dbo].[TbPagamento] DROP CONSTRAINT [FK_TbPagamento_TbPagamentoLote]
GO


ALTER TABLE [dbo].[TbPagamentoLote] DROP CONSTRAINT [PK_TbPagamentoArquivoRetorno]
GO


ALTER TABLE [dbo].[TbPagamentoLote] ADD  CONSTRAINT [PK_TbPagamentoLote] PRIMARY KEY CLUSTERED 
(
        [IdPagamentoLote] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO


ALTER TABLE [dbo].[TbPagamento] WITH CHECK ADD  CONSTRAINT [FK_TbPagamento_TbPagamentoLote] FOREIGN KEY([IdPagamentoLote]) REFERENCES [dbo].[TbPagamentoLote] ([IdPagamentoLote])                                                                                
GO
ALTER TABLE [dbo].[TbPagamento] CHECK CONSTRAINT [FK_TbPagamento_TbPagamentoLote]
GO





-- TbParcelaCobranca
ALTER TABLE [dbo].[TbExcecaoCobranca] DROP CONSTRAINT [FK_TbExcecaoCobranca_TbParcelaCobranca]
GO
ALTER TABLE [dbo].[TbLoteCobranca] DROP CONSTRAINT [FK_TbLoteCobranca_TbParcelaCobranca]
GO




ALTER TABLE [dbo].[TbParcelaCobranca] DROP CONSTRAINT [PK_TbParcelaCobranca]
GO

SET ANSI_PADDING ON
GO

ALTER TABLE [dbo].[TbParcelaCobranca] ADD  CONSTRAINT [PK_TbParcelaCobranca] PRIMARY KEY CLUSTERED 
(
        [IdUnidade] ASC,
        [ParcelaCobranca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO


ALTER TABLE [dbo].[TbExcecaoCobranca]  WITH CHECK ADD  CONSTRAINT [FK_TbExcecaoCobranca_TbParcelaCobranca] FOREIGN KEY([IdUnidade], [ParcelaCobranca])
REFERENCES [dbo].[TbParcelaCobranca] ([IdUnidade], [ParcelaCobranca])
GO
ALTER TABLE [dbo].[TbExcecaoCobranca] CHECK CONSTRAINT [FK_TbExcecaoCobranca_TbParcelaCobranca]
GO


ALTER TABLE [dbo].[TbLoteCobranca]  WITH CHECK ADD  CONSTRAINT [FK_TbLoteCobranca_TbParcelaCobranca] FOREIGN KEY([IdUnidade], [ParcelaCobranca])
REFERENCES [dbo].[TbParcelaCobranca] ([IdUnidade], [ParcelaCobranca])
GO
ALTER TABLE [dbo].[TbLoteCobranca] CHECK CONSTRAINT [FK_TbLoteCobranca_TbParcelaCobranca]
GO




-- TbProcedimentoMatricula        
ALTER TABLE [dbo].[TbAlunoTurmaProcedimentoMatricula] DROP CONSTRAINT [FK_TbAlunoTurmaProcedimentoMatricula_TbProcedimentoMatricula]
GO


ALTER TABLE [dbo].[TbProcedimentoMatricula] DROP CONSTRAINT [PK_TbProcedimentoMatricula]
GO


ALTER TABLE [dbo].[TbProcedimentoMatricula] ADD  CONSTRAINT [PK_TbProcedimentoMatricula] PRIMARY KEY CLUSTERED 
(
        [IdProcedimentoMatricula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO

                                                                                                                                                                                                                                                       
ALTER TABLE [dbo].[TbAlunoTurmaProcedimentoMatricula] WITH CHECK ADD  CONSTRAINT [FK_TbAlunoTurmaProcedimentoMatricula_TbProcedimentoMatricula] FOREIGN KEY([IdProcedimentoMatricula]) REFERENCES [dbo].[TbProcedimentoMatricula] ([IdProcedimentoMatricula])    
GO
ALTER TABLE [dbo].[TbAlunoTurmaProcedimentoMatricula] CHECK CONSTRAINT [FK_TbAlunoTurmaProcedimentoMatricula_TbProcedimentoMatricula]
GO




-- TbProfessorFoto
ALTER TABLE [dbo].[TbProfessorFoto] DROP CONSTRAINT [PK_TbProfessorFoto]
GO

ALTER TABLE [dbo].[TbProfessorFoto] ADD  CONSTRAINT [PK_TbProfessorFoto] PRIMARY KEY CLUSTERED 
(
        [IdProfessor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO




-- TbProfissao
ALTER TABLE [dbo].[TbResponsavel] DROP CONSTRAINT [FK_TbResponsavel_TbProfissao]
GO
ALTER TABLE [dbo].[TbSolicitacao] DROP CONSTRAINT [FK_TbSolicitacao_TbResponsavel_IdProfissao]
GO


ALTER TABLE [dbo].[TbProfissao] DROP CONSTRAINT [PK_TbProfissao]
GO


ALTER TABLE [dbo].[TbProfissao] ADD  CONSTRAINT [PK_TbProfissao] PRIMARY KEY CLUSTERED 
(
        [IdProfissao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO

                                                                                                                                                                                                                                            
ALTER TABLE [dbo].[TbResponsavel] WITH CHECK ADD  CONSTRAINT [FK_TbResponsavel_TbProfissao] FOREIGN KEY([IdProfissao]) REFERENCES [dbo].[TbProfissao] ([IdProfissao])                                                                                            
GO
ALTER TABLE [dbo].[TbResponsavel] CHECK CONSTRAINT [FK_TbResponsavel_TbProfissao]
GO

ALTER TABLE [dbo].[TbSolicitacao] WITH CHECK ADD  CONSTRAINT [FK_TbSolicitacao_TbResponsavel_IdProfissao] FOREIGN KEY([IdProfissao]) REFERENCES [dbo].[TbProfissao] ([IdProfissao])                                                                              
GO
ALTER TABLE [dbo].[TbSolicitacao] CHECK CONSTRAINT [FK_TbSolicitacao_TbResponsavel_IdProfissao]
GO



-- TbReligiao
ALTER TABLE [dbo].[TbAluno] DROP CONSTRAINT [FK_TbAluno_TbReligiao]
GO
ALTER TABLE [dbo].[TbProfessor] DROP CONSTRAINT [FK_TbProfessor_TbReligiao]
GO
ALTER TABLE [dbo].[TbResponsavel] DROP CONSTRAINT [FK_TbResponsavel_TbReligiao]
GO
ALTER TABLE [dbo].[TbSolicitacao] DROP CONSTRAINT [FK_TbSolicitacao_TbResponsavel_IdReligiao]
GO


ALTER TABLE [dbo].[TbReligiao] DROP CONSTRAINT [PK_TbReligiao]
GO


ALTER TABLE [dbo].[TbReligiao] ADD  CONSTRAINT [PK_TbReligiao] PRIMARY KEY CLUSTERED 
(
        [IdReligiao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO

                                                                                                                                                                                                                                           
ALTER TABLE [dbo].[TbAluno] WITH CHECK ADD  CONSTRAINT [FK_TbAluno_TbReligiao] FOREIGN KEY([IdReligiao]) REFERENCES [dbo].[TbReligiao] ([IdReligiao])                                                                                                            
GO
ALTER TABLE [dbo].[TbAluno] CHECK CONSTRAINT [FK_TbAluno_TbReligiao]
GO

ALTER TABLE [dbo].[TbProfessor] WITH CHECK ADD  CONSTRAINT [FK_TbProfessor_TbReligiao] FOREIGN KEY([IdReligiao]) REFERENCES [dbo].[TbReligiao] ([IdReligiao])                                                                                                    
GO
ALTER TABLE [dbo].[TbProfessor] CHECK CONSTRAINT [FK_TbProfessor_TbReligiao]
GO

ALTER TABLE [dbo].[TbResponsavel] WITH CHECK ADD  CONSTRAINT [FK_TbResponsavel_TbReligiao] FOREIGN KEY([IdReligiao]) REFERENCES [dbo].[TbReligiao] ([IdReligiao])                                                                                                
GO
ALTER TABLE [dbo].[TbResponsavel] CHECK CONSTRAINT [FK_TbResponsavel_TbReligiao]
GO

ALTER TABLE [dbo].[TbSolicitacao] WITH CHECK ADD  CONSTRAINT [FK_TbSolicitacao_TbResponsavel_IdReligiao] FOREIGN KEY([IdReligiao]) REFERENCES [dbo].[TbReligiao] ([IdReligiao])                                                                                  
GO
ALTER TABLE [dbo].[TbSolicitacao] CHECK CONSTRAINT [FK_TbSolicitacao_TbResponsavel_IdReligiao]
GO





-- TbResponsavelFoto
ALTER TABLE [dbo].[TbResponsavelFoto] DROP CONSTRAINT [PK_TbResponsavelFoto]
GO


ALTER TABLE [dbo].[TbResponsavelFoto] ADD  CONSTRAINT [PK_TbResponsavelFoto] PRIMARY KEY CLUSTERED 
(
        [IdResponsavel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO





-- TbSala
ALTER TABLE [dbo].[TbAtividadeDistribuicaoAluno] DROP CONSTRAINT [FK_TbAtividadeDistribuicaoAluno_TbSala]
GO
ALTER TABLE [dbo].[TbAtividadeSala] DROP CONSTRAINT [FK_TbAtividadeSala_TbSala]
GO
ALTER TABLE [dbo].[TbDisponibilidade] DROP CONSTRAINT [FK_TbDisponibilidade_TbSala]
GO
ALTER TABLE [dbo].[TbFreqQuadroHorario] DROP CONSTRAINT [FK_TbFreqQuadroHorario_TbSala]
GO
ALTER TABLE [dbo].[TbGradeHorario] DROP CONSTRAINT [FK_TbGradeHorario_TbSala]
GO
ALTER TABLE [dbo].[TbTurma] DROP CONSTRAINT [FK_TbTurma_TbSala]
GO

ALTER TABLE [dbo].[TbSala] DROP CONSTRAINT [PK_TbSala]
GO


ALTER TABLE [dbo].[TbSala] ADD  CONSTRAINT [PK_TbSala] PRIMARY KEY CLUSTERED 
(
        [IdSala] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO

                                                                                                                                                                                                                                                                 
ALTER TABLE [dbo].[TbAtividadeDistribuicaoAluno] WITH CHECK ADD  CONSTRAINT [FK_TbAtividadeDistribuicaoAluno_TbSala] FOREIGN KEY([IdSala]) REFERENCES [dbo].[TbSala] ([IdSala])                                                                                  
GO
ALTER TABLE [dbo].[TbAtividadeDistribuicaoAluno] CHECK CONSTRAINT [FK_TbAtividadeDistribuicaoAluno_TbSala]
GO

ALTER TABLE [dbo].[TbAtividadeSala] WITH CHECK ADD  CONSTRAINT [FK_TbAtividadeSala_TbSala] FOREIGN KEY([IdSala]) REFERENCES [dbo].[TbSala] ([IdSala])                                                                                                           
GO
ALTER TABLE [dbo].[TbAtividadeSala] CHECK CONSTRAINT [FK_TbAtividadeSala_TbSala]
GO

ALTER TABLE [dbo].[TbDisponibilidade] WITH CHECK ADD  CONSTRAINT [FK_TbDisponibilidade_TbSala] FOREIGN KEY([IdSala]) REFERENCES [dbo].[TbSala] ([IdSala])                                                                                                        
GO
ALTER TABLE [dbo].[TbDisponibilidade] CHECK CONSTRAINT [FK_TbDisponibilidade_TbSala]
GO

ALTER TABLE [dbo].[TbFreqQuadroHorario] WITH CHECK ADD  CONSTRAINT [FK_TbFreqQuadroHorario_TbSala] FOREIGN KEY([IdSala]) REFERENCES [dbo].[TbSala] ([IdSala])                                                                                                    
GO
ALTER TABLE [dbo].[TbFreqQuadroHorario] CHECK CONSTRAINT [FK_TbFreqQuadroHorario_TbSala]
GO

ALTER TABLE [dbo].[TbGradeHorario] WITH CHECK ADD  CONSTRAINT [FK_TbGradeHorario_TbSala] FOREIGN KEY([IdSala]) REFERENCES [dbo].[TbSala] ([IdSala])                                                                                                              
GO
ALTER TABLE [dbo].[TbGradeHorario] CHECK CONSTRAINT [FK_TbGradeHorario_TbSala]
GO

ALTER TABLE [dbo].[TbTurma] WITH CHECK ADD  CONSTRAINT [FK_TbTurma_TbSala] FOREIGN KEY([IdSala]) REFERENCES [dbo].[TbSala] ([IdSala])                                                                                                                           
GO
ALTER TABLE [dbo].[TbTurma] CHECK CONSTRAINT [FK_TbTurma_TbSala]
GO




-- TbServicoPrecoDesconto
ALTER TABLE [dbo].[TbServicoPrecoDesconto] DROP CONSTRAINT [PK_TbServicoPrecoDesconto]
GO

ALTER TABLE [dbo].[TbServicoPrecoDesconto] ADD  CONSTRAINT [PK_TbServicoPrecoDesconto] PRIMARY KEY CLUSTERED 
(
        [IdServicoPrecoDesconto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO





-- TbTipoOcorrencia
ALTER TABLE [dbo].[TbAlunoObs] DROP CONSTRAINT [FK_TbAlunoObs_TbTipoOcorrencia]
GO
ALTER TABLE [dbo].[TbProfessorObs] DROP CONSTRAINT [FK_TbProfessorObs_TbTipoOcorrencia]
GO
ALTER TABLE [dbo].[TbResponsavelObs] DROP CONSTRAINT [FK_TbResponsavelObs_TbTipoOcorrencia]
GO
ALTER TABLE [dbo].[TbUnidade] DROP CONSTRAINT [FK_TbUnidade_TbTipoOcorrencia]
GO


ALTER TABLE [dbo].[TbTipoOcorrencia] DROP CONSTRAINT [PK_TbTipoOcorrencia]
GO

ALTER TABLE [dbo].[TbTipoOcorrencia] ADD  CONSTRAINT [PK_TbTipoOcorrencia] PRIMARY KEY CLUSTERED 
(
        [IdTipoOcorrencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO



ALTER TABLE [dbo].[TbAlunoObs] WITH CHECK ADD  CONSTRAINT [FK_TbAlunoObs_TbTipoOcorrencia] FOREIGN KEY([IdTipoOcorrencia]) REFERENCES [dbo].[TbTipoOcorrencia] ([IdTipoOcorrencia])                                                                              
GO
ALTER TABLE [dbo].[TbAlunoObs] CHECK CONSTRAINT [FK_TbAlunoObs_TbTipoOcorrencia]
GO

ALTER TABLE [dbo].[TbProfessorObs] WITH CHECK ADD  CONSTRAINT [FK_TbProfessorObs_TbTipoOcorrencia] FOREIGN KEY([IdTipoOcorrencia]) REFERENCES [dbo].[TbTipoOcorrencia] ([IdTipoOcorrencia])                                                                      
GO
ALTER TABLE [dbo].[TbProfessorObs] CHECK CONSTRAINT [FK_TbProfessorObs_TbTipoOcorrencia]
GO

ALTER TABLE [dbo].[TbResponsavelObs] WITH CHECK ADD  CONSTRAINT [FK_TbResponsavelObs_TbTipoOcorrencia] FOREIGN KEY([IdTipoOcorrencia]) REFERENCES [dbo].[TbTipoOcorrencia] ([IdTipoOcorrencia])                                                                  
GO
ALTER TABLE [dbo].[TbResponsavelObs] CHECK CONSTRAINT [FK_TbResponsavelObs_TbTipoOcorrencia]
GO

ALTER TABLE [dbo].[TbUnidade] WITH CHECK ADD  CONSTRAINT [FK_TbUnidade_TbTipoOcorrencia] FOREIGN KEY([IdTipoOcorrenciaAlteracaoResponsavelTitulo]) REFERENCES [dbo].[TbTipoOcorrencia] ([IdTipoOcorrencia])                                                      
GO
ALTER TABLE [dbo].[TbUnidade] CHECK CONSTRAINT [FK_TbUnidade_TbTipoOcorrencia]
GO




-- TbTipoResponsavel
ALTER TABLE [dbo].[TbAluno] DROP CONSTRAINT [FK_TbAluno_TbTipoResponsavel]
GO
ALTER TABLE [dbo].[TbAlunoTurma] DROP CONSTRAINT [FK_TbAlunoTurma_TbTipoResponsavelFinanceiro]
GO
ALTER TABLE [dbo].[TbAlunoTurma] DROP CONSTRAINT [FK_TbAlunoTurma_TbTipoResponsavelSecundario]
GO
ALTER TABLE [dbo].[TbSolicitacao] DROP CONSTRAINT [FK_TbSolicitacao_TbResponsavel_IdTipoResponsavelSecundario]
GO
ALTER TABLE [dbo].[TbSolicitacao] DROP CONSTRAINT [FK_TbSolicitacao_TbTipoResponsavel_IdTipoResponsavel]
GO



ALTER TABLE [dbo].[TbTipoResponsavel] DROP CONSTRAINT [PK_TbTipoResponsavel]
GO



ALTER TABLE [dbo].[TbTipoResponsavel] ADD  CONSTRAINT [PK_TbTipoResponsavel] PRIMARY KEY CLUSTERED 
(
        [IdTipoResponsavel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO


                                                                                                                                                                                                                                                                 
ALTER TABLE [dbo].[TbAluno] WITH CHECK ADD  CONSTRAINT [FK_TbAluno_TbTipoResponsavel] FOREIGN KEY([IdTipoResponsavel]) REFERENCES [dbo].[TbTipoResponsavel] ([IdTipoResponsavel])                                                                                
GO
ALTER TABLE [dbo].[TbAluno] CHECK CONSTRAINT [FK_TbAluno_TbTipoResponsavel]
GO

ALTER TABLE [dbo].[TbAlunoTurma] WITH CHECK ADD  CONSTRAINT [FK_TbAlunoTurma_TbTipoResponsavelFinanceiro] FOREIGN KEY([IdTipoResponsavelFinanceiro]) REFERENCES [dbo].[TbTipoResponsavel] ([IdTipoResponsavel])                                                  
GO
ALTER TABLE [dbo].[TbAlunoTurma] CHECK CONSTRAINT [FK_TbAlunoTurma_TbTipoResponsavelFinanceiro]
GO

ALTER TABLE [dbo].[TbAlunoTurma] WITH CHECK ADD  CONSTRAINT [FK_TbAlunoTurma_TbTipoResponsavelSecundario] FOREIGN KEY([IdTipoResponsavelSecundario]) REFERENCES [dbo].[TbTipoResponsavel] ([IdTipoResponsavel])                                                  
GO
ALTER TABLE [dbo].[TbAlunoTurma] CHECK CONSTRAINT [FK_TbAlunoTurma_TbTipoResponsavelSecundario]
GO

ALTER TABLE [dbo].[TbSolicitacao] WITH CHECK ADD  CONSTRAINT [FK_TbSolicitacao_TbResponsavel_IdTipoResponsavelSecundario] FOREIGN KEY([IdTipoResponsavelSecundario]) REFERENCES [dbo].[TbTipoResponsavel] ([IdTipoResponsavel])                                  
GO
ALTER TABLE [dbo].[TbSolicitacao] CHECK CONSTRAINT [FK_TbSolicitacao_TbResponsavel_IdTipoResponsavelSecundario]
GO

ALTER TABLE [dbo].[TbSolicitacao] WITH CHECK ADD  CONSTRAINT [FK_TbSolicitacao_TbTipoResponsavel_IdTipoResponsavel] FOREIGN KEY([IdTipoResponsavel]) REFERENCES [dbo].[TbTipoResponsavel] ([IdTipoResponsavel])                                                  
GO
ALTER TABLE [dbo].[TbSolicitacao] CHECK CONSTRAINT [FK_TbSolicitacao_TbTipoResponsavel_IdTipoResponsavel]
GO




-- TbTurmaProfessor
ALTER TABLE [dbo].[TbTurmaProfessor] DROP CONSTRAINT [PK_TbTurmaProfessor]
GO


ALTER TABLE [dbo].[TbTurmaProfessor] ADD  CONSTRAINT [PK_TbTurmaProfessor] PRIMARY KEY CLUSTERED 
(
        [IdTurma] ASC,
        [IdDisciplina] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO





-- TbUsuarioGrupo
ALTER TABLE [dbo].[TbUsuarioGrupo] DROP CONSTRAINT [PK_TbUsuarioGrupo]
GO


ALTER TABLE [dbo].[TbUsuarioGrupo] ADD  CONSTRAINT [PK_TbUsuarioGrupo] PRIMARY KEY CLUSTERED 
(
        [IdUsuario] ASC,
        [IdGrupo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO







-- TbVerificacaoMatricula
ALTER TABLE [dbo].[TbCurso] DROP CONSTRAINT [FK_TbCurso_TbVerificacaoMatricula]
GO

ALTER TABLE [dbo].[TbVerificacaoMatricula] DROP CONSTRAINT [PK_TbVerificacaoMatricula_IdVerificacaoMatricula]
GO

ALTER TABLE [dbo].[TbVerificacaoMatricula] ADD  CONSTRAINT [PK_TbVerificacaoMatricula] PRIMARY KEY CLUSTERED 
(
        [IdVerificacaoMatricula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO



ALTER TABLE [dbo].[TbCurso] WITH CHECK ADD  CONSTRAINT [FK_TbCurso_TbVerificacaoMatricula] FOREIGN KEY([IdVerificacaoMatricula]) REFERENCES [dbo].[TbVerificacaoMatricula] ([IdVerificacaoMatricula])                                                            
GO

ALTER TABLE [dbo].[TbCurso] CHECK CONSTRAINT [FK_TbCurso_TbVerificacaoMatricula]
GO


*/
USE dbSigaRosaCamara;

--- USE dbSigaNSLourdesGravata;
-- USE dbSigaAuxilRecife;



-- TbProcedimentoMatricula        
ALTER TABLE [dbo].[TbAlunoTurmaProcedimentoMatricula] DROP CONSTRAINT [FK_TbAlunoTurmaProcedimentoMatricula_TbProcedimentoMatricula]
GO

ALTER TABLE [dbo].[TbSolicitacaoProcedimentoMatricula] DROP CONSTRAINT [FK_TbSolicitacaoProcedimentoMatricula_TbProcedimentoMatricula]
GO 
	

ALTER TABLE [dbo].[TbProcedimentoMatricula] DROP CONSTRAINT [PK_TbProcedimentoMatricula]
GO


ALTER TABLE [dbo].[TbProcedimentoMatricula] ADD  CONSTRAINT [PK_TbProcedimentoMatricula] PRIMARY KEY CLUSTERED 
(
        [IdProcedimentoMatricula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO

-- 26jul21
ALTER TABLE [dbo].[TbSolicitacaoProcedimentoMatricula] WITH CHECK ADD CONSTRAINT [FK_TbSolicitacaoProcedimentoMatricula_TbProcedimentoMatricula] FOREIGN KEY([IdProcedimentoMatricula]) REFERENCES [dbo].[TbProcedimentoMatricula] ([IdProcedimentoMatricula])
GO 
ALTER TABLE [dbo].[TbSolicitacaoProcedimentoMatricula] CHECK CONSTRAINT [FK_TbSolicitacaoProcedimentoMatricula_TbProcedimentoMatricula]
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

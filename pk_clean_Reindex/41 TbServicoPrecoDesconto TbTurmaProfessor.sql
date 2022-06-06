USE dbSigaAslan;

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

ALTER TABLE [dbo].[TbAluno] DROP CONSTRAINT [FK_TbAluno_TbTipoResponsavel_IdTipoResponsavelMae]
GO
ALTER TABLE [dbo].[TbAluno] DROP CONSTRAINT [FK_TbAluno_TbTipoResponsavel_IdTipoResponsavelPai]
GO
ALTER TABLE [dbo].[TbAlunoResponsavel] DROP CONSTRAINT [FK_TbAlunoResponsavel_TbTipoResponsavel]
GO



	ALTER TABLE [dbo].[TbTipoResponsavel] DROP CONSTRAINT [PK_TbTipoResponsavel]
	GO



	ALTER TABLE [dbo].[TbTipoResponsavel] ADD  CONSTRAINT [PK_TbTipoResponsavel] PRIMARY KEY CLUSTERED 
	(
	        [IdTipoResponsavel] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
	GO




ALTER TABLE [dbo].[TbAluno] WITH CHECK ADD CONSTRAINT [FK_TbAluno_TbTipoResponsavel_IdTipoResponsavelMae] FOREIGN KEY([IdTipoResponsavelMae])  REFERENCES [dbo].[TbTipoResponsavel] ([IdTipoResponsavel]); 
GO
ALTER TABLE [dbo].[TbAluno] CHECK CONSTRAINT [FK_TbAluno_TbTipoResponsavel_IdTipoResponsavelMae]
GO

ALTER TABLE [dbo].[TbAluno] WITH CHECK ADD CONSTRAINT [FK_TbAluno_TbTipoResponsavel_IdTipoResponsavelPai] FOREIGN KEY([IdTipoResponsavelPai])  REFERENCES [dbo].[TbTipoResponsavel] ([IdTipoResponsavel]); 
GO
ALTER TABLE [dbo].[TbAluno] CHECK CONSTRAINT [FK_TbAluno_TbTipoResponsavel_IdTipoResponsavelPai]
GO

ALTER TABLE [dbo].[TbAlunoResponsavel] WITH CHECK ADD CONSTRAINT [FK_TbAlunoResponsavel_TbTipoResponsavel] FOREIGN KEY([IdTipoResponsavel]) 	REFERENCES [dbo].[TbTipoResponsavel] ([IdTipoResponsavel]); 
GO
ALTER TABLE [dbo].[TbAlunoResponsavel] CHECK CONSTRAINT [FK_TbAlunoResponsavel_TbTipoResponsavel]
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
IF OBJECT_ID('dbo.FK_TbCurso_TbVerificacaoMatricula') IS NOT NULL
BEGIN
	ALTER TABLE [dbo].[TbCurso] DROP CONSTRAINT [FK_TbCurso_TbVerificacaoMatricula]
END

-- 20/jan
IF OBJECT_ID('dbo.PK_TbVerificacaoMatricula') IS NOT NULL
BEGIN
	ALTER TABLE [dbo].[TbVerificacaoMatricula] DROP CONSTRAINT [PK_TbVerificacaoMatricula]
END

IF OBJECT_ID('dbo.PK_TbVerificacaoMatricula_IdVerificacaoMatricula') IS NOT NULL
BEGIN
	ALTER TABLE [dbo].[TbVerificacaoMatricula] DROP CONSTRAINT [PK_TbVerificacaoMatricula_IdVerificacaoMatricula]
END

IF OBJECT_ID('dbo.TbVerificacaoMatricula') IS NOT NULL
BEGIN
	ALTER TABLE [dbo].[TbVerificacaoMatricula] ADD  CONSTRAINT [PK_TbVerificacaoMatricula] PRIMARY KEY CLUSTERED 
	(
			[IdVerificacaoMatricula] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
END



IF	EXISTS		( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbCurso'				AND COLUMN_NAME = 'IdVerificacaoMatricula' )
	AND	EXISTS	( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbVerificacaoMatricula'	AND COLUMN_NAME = 'IdVerificacaoMatricula' )
	BEGIN
		ALTER TABLE [dbo].[TbCurso] WITH CHECK ADD  CONSTRAINT [FK_TbCurso_TbVerificacaoMatricula] FOREIGN KEY([IdVerificacaoMatricula]) REFERENCES [dbo].[TbVerificacaoMatricula] ([IdVerificacaoMatricula])                                                            

		ALTER TABLE [dbo].[TbCurso] CHECK CONSTRAINT [FK_TbCurso_TbVerificacaoMatricula]
	END

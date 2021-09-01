 USE dbSigaSantaRosa;
-- USE dbSigaNSLourdesGravata;
-- USE dbSigaAuxilRecife;


-- TbEndereco
ALTER TABLE [dbo].[TbAluno] DROP CONSTRAINT [FK_TbAluno_TbEndereco]
GO
ALTER TABLE [dbo].[TbProfessor] DROP CONSTRAINT [FK_TbProfessor_TbEndereco]
GO
ALTER TABLE [dbo].[TbResponsavel] DROP CONSTRAINT [FK_TbResponsavel_TbEndereco]
GO


    ALTER TABLE [dbo].[TbEndereco] DROP CONSTRAINT [PK_TbEndereco]
    GO

    ALTER TABLE [dbo].[TbEndereco] ADD  CONSTRAINT [PK_TbEndereco] PRIMARY KEY CLUSTERED 
    (
            [IdEndereco] ASC
    )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
    GO




ALTER TABLE [dbo].[TbAluno] WITH CHECK ADD  CONSTRAINT [FK_TbAluno_TbEndereco] FOREIGN KEY([IdEndereco]) REFERENCES [dbo].[TbEndereco] ([IdEndereco])                                                                                                            
GO
ALTER TABLE [dbo].[TbAluno] CHECK CONSTRAINT [FK_TbAluno_TbEndereco]
GO

ALTER TABLE [dbo].[TbProfessor] WITH CHECK ADD  CONSTRAINT [FK_TbProfessor_TbEndereco] FOREIGN KEY([IdEndereco]) REFERENCES [dbo].[TbEndereco] ([IdEndereco])                                                                                                    
GO
ALTER TABLE [dbo].[TbProfessor] CHECK CONSTRAINT [FK_TbProfessor_TbEndereco]
GO

ALTER TABLE [dbo].[TbResponsavel] WITH CHECK ADD  CONSTRAINT [FK_TbResponsavel_TbEndereco] FOREIGN KEY([IdEndereco]) REFERENCES [dbo].[TbEndereco] ([IdEndereco])                                                                                                
GO
ALTER TABLE [dbo].[TbResponsavel] CHECK CONSTRAINT [FK_TbResponsavel_TbEndereco]
GO



-- TbEscola
ALTER TABLE [dbo].[TbUnidade] DROP CONSTRAINT [FK_TbUnidade_TbEscola]
GO


    ALTER TABLE [dbo].[TbEscola] DROP CONSTRAINT [PK_TbEscola]
    GO

    ALTER TABLE [dbo].[TbEscola] ADD  CONSTRAINT [PK_TbEscola] PRIMARY KEY CLUSTERED 
    (
            [IdEscola] ASC
    )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
    GO

                                                                                                                                                                                                                                                                 
ALTER TABLE [dbo].[TbUnidade] WITH CHECK ADD  CONSTRAINT [FK_TbUnidade_TbEscola] FOREIGN KEY([IdEscola]) REFERENCES [dbo].[TbEscola] ([IdEscola])                                                                                                                
GO
ALTER TABLE [dbo].[TbUnidade] CHECK CONSTRAINT [FK_TbUnidade_TbEscola]
GO




-- TbEstabelecimentoEnsino
ALTER TABLE [dbo].[TbAluno] DROP CONSTRAINT [FK_TbAluno_TbEstabelecimentoEnsino]
GO
ALTER TABLE [dbo].[TbAluno] DROP CONSTRAINT [FK_TbAluno_TbEstabelecimentoEnsino_ES]
GO

IF OBJECT_ID('dbo.FK_TbAlunoAproveitamentoDisciplina_TbEstabelecimentoEnsino') IS NOT NULL
BEGIN
	ALTER TABLE [dbo].[TbAlunoAproveitamentoDisciplina] DROP CONSTRAINT [FK_TbAlunoAproveitamentoDisciplina_TbEstabelecimentoEnsino]
END

ALTER TABLE [dbo].[TbAlunoTurma] DROP CONSTRAINT [FK_TbAlunoTurma_TbEstabelecimentoEnsino]
GO
ALTER TABLE [dbo].[TbHistorico] DROP CONSTRAINT [FK_TbHistorico_TbEstabelecimentoEnsino]
GO
ALTER TABLE [dbo].[TbHistoricoAproveitamento] DROP CONSTRAINT [FK_TbHistoricoAproveitamento_TbEEnsino]
GO
ALTER TABLE [dbo].[TbHistoricoEnsinoSuperior] DROP CONSTRAINT [FK_TbHistoricoEnsinoSuperior_TbEstabelecimentoEnsino]
GO
ALTER TABLE [dbo].[TbProfessorEscolaridade] DROP CONSTRAINT [FK_TbProfessorEscolaridade_TbEstabelecimentoEnsino]
GO
ALTER TABLE [dbo].[TbSerie] DROP CONSTRAINT [FK_TbSerie_TbEstabelecimentoEnsino]
GO
ALTER TABLE [dbo].[TbUnidade] DROP CONSTRAINT [FK_TbUnidade_TbEstabelecimentoEnsino]
GO


-- 17mai21
ALTER TABLE [dbo].[TbAlunoCurso] DROP CONSTRAINT [FK_TbAlunoCurso_TbEstabelecimentoEnsino]
	-- autom script -- ALTER TABLE [FK_TbAlunoCurso_TbEstabelecimentoEnsino].[TbEstabelecimentoEnsino] DROP CONSTRAINT [TbAlunoCurso] GO
GO

    ALTER TABLE [dbo].[TbEstabelecimentoEnsino] DROP CONSTRAINT [PK_TbEstabelecimentoEnsino]
    GO


    ALTER TABLE [dbo].[TbEstabelecimentoEnsino] ADD  CONSTRAINT [PK_TbEstabelecimentoEnsino] PRIMARY KEY CLUSTERED 
    (
            [IdEstabelecimentoEnsino] ASC
    )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
    GO


-- 17mai21
ALTER TABLE [dbo].[TbAlunoCurso] WITH CHECK ADD CONSTRAINT [FK_TbAlunoCurso_TbEstabelecimentoEnsino] FOREIGN KEY([IdEstabelecimentoEnsinoAnterior]) REFERENCES [dbo].[TbEstabelecimentoEnsino] ([IdEstabelecimentoEnsino]) 
GO 
ALTER TABLE [dbo].[TbAlunoCurso] CHECK CONSTRAINT [FK_TbAlunoCurso_TbEstabelecimentoEnsino]
GO


                                                                                                                                                                                                                                                                 
ALTER TABLE [dbo].[TbAluno] WITH CHECK ADD  CONSTRAINT [FK_TbAluno_TbEstabelecimentoEnsino] FOREIGN KEY([IdEstabelecimentoEnsinoAnterior]) REFERENCES [dbo].[TbEstabelecimentoEnsino] ([IdEstabelecimentoEnsino])                                                
GO
ALTER TABLE [dbo].[TbAluno] CHECK CONSTRAINT [FK_TbAluno_TbEstabelecimentoEnsino]
GO

ALTER TABLE [dbo].[TbAluno] WITH CHECK ADD  CONSTRAINT [FK_TbAluno_TbEstabelecimentoEnsino_ES] FOREIGN KEY([EnsinoMedio_IdEstabelecimentoEnsino]) REFERENCES [dbo].[TbEstabelecimentoEnsino] ([IdEstabelecimentoEnsino])                                         
GO
ALTER TABLE [dbo].[TbAluno] CHECK CONSTRAINT [FK_TbAluno_TbEstabelecimentoEnsino_ES]
GO

IF	EXISTS		( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbAlunoAproveitamentoDisciplina'	AND COLUMN_NAME = 'IdEstabelecimentoEnsino' )
	AND	EXISTS	( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbEstabelecimentoEnsino'			AND COLUMN_NAME = 'IdEstabelecimentoEnsino' )
	BEGIN
		ALTER TABLE [dbo].[TbAlunoAproveitamentoDisciplina] WITH CHECK ADD  CONSTRAINT [FK_TbAlunoAproveitamentoDisciplina_TbEstabelecimentoEnsino] FOREIGN KEY([IdEstabelecimentoEnsino]) REFERENCES [dbo].[TbEstabelecimentoEnsino] ([IdEstabelecimentoEnsino])        

		ALTER TABLE [dbo].[TbAlunoAproveitamentoDisciplina] CHECK CONSTRAINT [FK_TbAlunoAproveitamentoDisciplina_TbEstabelecimentoEnsino]
	END

ALTER TABLE [dbo].[TbAlunoTurma] WITH CHECK ADD  CONSTRAINT [FK_TbAlunoTurma_TbEstabelecimentoEnsino] FOREIGN KEY([IdEstabEnsinoInativacao]) REFERENCES [dbo].[TbEstabelecimentoEnsino] ([IdEstabelecimentoEnsino])                                              
GO
ALTER TABLE [dbo].[TbAlunoTurma] CHECK CONSTRAINT [FK_TbAlunoTurma_TbEstabelecimentoEnsino]
GO

ALTER TABLE [dbo].[TbHistorico] WITH CHECK ADD  CONSTRAINT [FK_TbHistorico_TbEstabelecimentoEnsino] FOREIGN KEY([IdEstabelecimentoEnsino]) REFERENCES [dbo].[TbEstabelecimentoEnsino] ([IdEstabelecimentoEnsino])                                                
GO
ALTER TABLE [dbo].[TbHistorico] CHECK CONSTRAINT [FK_TbHistorico_TbEstabelecimentoEnsino]
GO

ALTER TABLE [dbo].[TbHistoricoAproveitamento] WITH CHECK ADD  CONSTRAINT [FK_TbHistoricoAproveitamento_TbEEnsino] FOREIGN KEY([IdEstabelecimentoEnsino]) REFERENCES [dbo].[TbEstabelecimentoEnsino] ([IdEstabelecimentoEnsino])                                  
GO
ALTER TABLE [dbo].[TbHistoricoAproveitamento] CHECK CONSTRAINT [FK_TbHistoricoAproveitamento_TbEEnsino]
GO

ALTER TABLE [dbo].[TbHistoricoEnsinoSuperior] WITH CHECK ADD  CONSTRAINT [FK_TbHistoricoEnsinoSuperior_TbEstabelecimentoEnsino] FOREIGN KEY([IdEstabelecimentoEnsino]) REFERENCES [dbo].[TbEstabelecimentoEnsino] ([IdEstabelecimentoEnsino])                    
GO
ALTER TABLE [dbo].[TbHistoricoEnsinoSuperior] CHECK CONSTRAINT [FK_TbHistoricoEnsinoSuperior_TbEstabelecimentoEnsino]
GO

ALTER TABLE [dbo].[TbProfessorEscolaridade] WITH CHECK ADD  CONSTRAINT [FK_TbProfessorEscolaridade_TbEstabelecimentoEnsino] FOREIGN KEY([IdEstabelecimentoEnsino]) REFERENCES [dbo].[TbEstabelecimentoEnsino] ([IdEstabelecimentoEnsino])                        
GO
ALTER TABLE [dbo].[TbProfessorEscolaridade] CHECK CONSTRAINT [FK_TbProfessorEscolaridade_TbEstabelecimentoEnsino]
GO

ALTER TABLE [dbo].[TbSerie] WITH CHECK ADD  CONSTRAINT [FK_TbSerie_TbEstabelecimentoEnsino] FOREIGN KEY([IdEstabelecimentoEnsino]) REFERENCES [dbo].[TbEstabelecimentoEnsino] ([IdEstabelecimentoEnsino])                                                        
GO
ALTER TABLE [dbo].[TbSerie] CHECK CONSTRAINT [FK_TbSerie_TbEstabelecimentoEnsino]
GO

ALTER TABLE [dbo].[TbUnidade] WITH CHECK ADD  CONSTRAINT [FK_TbUnidade_TbEstabelecimentoEnsino] FOREIGN KEY([IdEstabelecimentoEnsino]) REFERENCES [dbo].[TbEstabelecimentoEnsino] ([IdEstabelecimentoEnsino])                                                    
GO
ALTER TABLE [dbo].[TbUnidade] CHECK CONSTRAINT [FK_TbUnidade_TbEstabelecimentoEnsino]
GO


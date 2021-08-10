-- RebuildPK - COMPLETO

USE dbSigaSalePetrolina
go


/*
-- TbAlunoFichaMedica
ALTER TABLE [dbo].[TbAlunoFichaMedica] DROP CONSTRAINT [PK_TbAlunoFichaMedica]
GO

ALTER TABLE [dbo].[TbAlunoFichaMedica] ADD  CONSTRAINT [PK_TbAlunoFichaMedica] PRIMARY KEY CLUSTERED 
(
        [IdAluno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO


-- TbAlunoImpressaoDigital
ALTER TABLE [dbo].[TbAlunoImpressaoDigital] DROP CONSTRAINT [PK_TbAlunoImpressaoDigital]
GO


ALTER TABLE [dbo].[TbAlunoImpressaoDigital] ADD  CONSTRAINT [PK_TbAlunoImpressaoDigital] PRIMARY KEY CLUSTERED 
(
        [IdAluno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO


-- TbAlunoObs
ALTER TABLE [dbo].[TbAlunoObs] DROP CONSTRAINT [PK_TbAlunoObs]
GO

ALTER TABLE [dbo].[TbAlunoObs] ADD  CONSTRAINT [PK_TbAlunoObs] PRIMARY KEY CLUSTERED 
(
        [IdAluno] ASC,
        [IdAlunoObs] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO


-- TbAlunoTurmaBolsa
ALTER TABLE [dbo].[TbAlunoTurmaBolsa] DROP CONSTRAINT [PK_TbAlunoServicoBolsa]
GO


ALTER TABLE [dbo].[TbAlunoTurmaBolsa] ADD  CONSTRAINT [PK_TbAlunoServicoBolsa] PRIMARY KEY CLUSTERED 
(
        [IdAlunoTurmaBolsa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO


-- TbBanco 
ALTER TABLE [dbo].[TbFormaRecebimento] DROP CONSTRAINT [FK_TbFormaRecebimento_TbBanco]
GO
ALTER TABLE [dbo].[TbResponsavel] DROP CONSTRAINT [FK_TbResponsavel_TbBanco]
GO


ALTER TABLE [dbo].[TbBanco] DROP CONSTRAINT [PK_TbBanco]
GO


ALTER TABLE [dbo].[TbBanco] ADD  CONSTRAINT [PK_TbBanco] PRIMARY KEY CLUSTERED 
(
        [CodigoBanco] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO


                                                                                                                                                                                                                                                                 
ALTER TABLE [dbo].[TbFormaRecebimento] WITH CHECK ADD  CONSTRAINT [FK_TbFormaRecebimento_TbBanco] FOREIGN KEY([DEB_NumeroBanco]) REFERENCES [dbo].[TbBanco] ([CodigoBanco])                                                                                      
GO
ALTER TABLE [dbo].[TbFormaRecebimento] CHECK CONSTRAINT [FK_TbFormaRecebimento_TbBanco]
GO

ALTER TABLE [dbo].[TbResponsavel] WITH CHECK ADD  CONSTRAINT [FK_TbResponsavel_TbBanco] FOREIGN KEY([DEB_CodigoBanco]) REFERENCES [dbo].[TbBanco] ([CodigoBanco])                                                                                                
GO
ALTER TABLE [dbo].[TbResponsavel] CHECK CONSTRAINT [FK_TbResponsavel_TbBanco]
GO



-- TbCaixa 
ALTER TABLE [dbo].[TbCaixaAbertura] DROP CONSTRAINT [FK_TbCaixaAbertura_TbCaixa]
GO
ALTER TABLE [dbo].[TbCaixaUsuario] DROP CONSTRAINT [FK_TbCaixaUsuario_TbCaixa]
GO

ALTER TABLE [dbo].[TbCaixa] DROP CONSTRAINT [PK_TbCaixa]
GO


ALTER TABLE [dbo].[TbCaixa] ADD  CONSTRAINT [PK_TbCaixa] PRIMARY KEY CLUSTERED 
(
        [IdCaixa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO

                                                                                                                                                                                                                                                                 
ALTER TABLE [dbo].[TbCaixaAbertura] WITH CHECK ADD  CONSTRAINT [FK_TbCaixaAbertura_TbCaixa] FOREIGN KEY([IdCaixa]) REFERENCES [dbo].[TbCaixa] ([IdCaixa])                                                                                                        
GO
ALTER TABLE [dbo].[TbCaixaAbertura] CHECK CONSTRAINT [FK_TbCaixaAbertura_TbCaixa]
GO

ALTER TABLE [dbo].[TbCaixaUsuario] WITH CHECK ADD  CONSTRAINT [FK_TbCaixaUsuario_TbCaixa] FOREIGN KEY([IdCaixa]) REFERENCES [dbo].[TbCaixa] ([IdCaixa])                                                                                                          
GO
ALTER TABLE [dbo].[TbCaixaUsuario] CHECK CONSTRAINT [FK_TbCaixaUsuario_TbCaixa]
GO



-- TbCaixaAbertura
ALTER TABLE [dbo].[TbCaixaAberturaSaldo] DROP CONSTRAINT [FK_TbCaixaAberturaSaldo_TbCaixaAbertura]
GO
ALTER TABLE [dbo].[TbCaixaMovimentacao] DROP CONSTRAINT [FK_TbCaixaMovimentacao_TbCaixaAbertura]
GO


ALTER TABLE [dbo].[TbCaixaAbertura] DROP CONSTRAINT [PK_TbCaixaAbertura]
GO



ALTER TABLE [dbo].[TbCaixaAbertura] ADD  CONSTRAINT [PK_TbCaixaAbertura] PRIMARY KEY CLUSTERED 
(
        [IdCaixaAbertura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO

                                                                                                                                                                                                                                                        
ALTER TABLE [dbo].[TbCaixaAberturaSaldo] WITH CHECK ADD  CONSTRAINT [FK_TbCaixaAberturaSaldo_TbCaixaAbertura] FOREIGN KEY([IdCaixaAbertura]) REFERENCES [dbo].[TbCaixaAbertura] ([IdCaixaAbertura])                                                              
GO
ALTER TABLE [dbo].[TbCaixaAberturaSaldo] CHECK CONSTRAINT [FK_TbCaixaAberturaSaldo_TbCaixaAbertura]
GO

ALTER TABLE [dbo].[TbCaixaMovimentacao] WITH CHECK ADD  CONSTRAINT [FK_TbCaixaMovimentacao_TbCaixaAbertura] FOREIGN KEY([IdCaixaAbertura]) REFERENCES [dbo].[TbCaixaAbertura] ([IdCaixaAbertura])                                                                
GO
ALTER TABLE [dbo].[TbCaixaMovimentacao] CHECK CONSTRAINT [FK_TbCaixaMovimentacao_TbCaixaAbertura]
GO



-- TbCaixaAberturaSaldo
ALTER TABLE [dbo].[TbCaixaAberturaSaldo] DROP CONSTRAINT [PK_TbCaixaAberturaSaldo]
GO

SET ANSI_PADDING ON
GO

ALTER TABLE [dbo].[TbCaixaAberturaSaldo] ADD  CONSTRAINT [PK_TbCaixaAberturaSaldo] PRIMARY KEY CLUSTERED 
(
        [IdCaixaAbertura] ASC,
        [CdTipoRecebimento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO



-- TbCaixaTipoRecebimento        SET PADDING ON no Create
ALTER TABLE [dbo].[TbCaixaAberturaSaldo] DROP CONSTRAINT [FK_TbCaixaAberturaSaldo_TbCaixaTipoRecebimento]
GO
ALTER TABLE [dbo].[TbCaixaLancamento] DROP CONSTRAINT [FK_TbCaixaLancamento_TbCaixaTipoRecebimento]
GO
ALTER TABLE [dbo].[TbCartaoMovimentacao] DROP CONSTRAINT [FK_TbCartaoMovimentacao_TbCaixaTipoRecebimento]
GO
ALTER TABLE [dbo].[TbLancamentoCobrancaRecebimento] DROP CONSTRAINT [FK_TbLancamentoCobrancaRecebimento_TbCaixaTipoRecebimento]
GO
ALTER TABLE [dbo].[TbTituloCobrancaRecebimento] DROP CONSTRAINT [FK_TbTituloCobrancaRecebimento_TbCaixaTipoRecebimento]
GO


ALTER TABLE [dbo].[TbCaixaTipoRecebimento] DROP CONSTRAINT [PK_TbCaixaTipoRecebimento]
GO

SET ANSI_PADDING ON
GO

ALTER TABLE [dbo].[TbCaixaTipoRecebimento] ADD  CONSTRAINT [PK_TbCaixaTipoRecebimento] PRIMARY KEY CLUSTERED 
(
        [CdTipoRecebimento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO


ALTER TABLE [dbo].[TbCaixaAberturaSaldo] WITH CHECK ADD  CONSTRAINT [FK_TbCaixaAberturaSaldo_TbCaixaTipoRecebimento] FOREIGN KEY([CdTipoRecebimento]) REFERENCES [dbo].[TbCaixaTipoRecebimento] ([CdTipoRecebimento])                                            
GO
ALTER TABLE [dbo].[TbCaixaAberturaSaldo] CHECK CONSTRAINT [FK_TbCaixaAberturaSaldo_TbCaixaTipoRecebimento]
GO

ALTER TABLE [dbo].[TbCaixaLancamento] WITH CHECK ADD  CONSTRAINT [FK_TbCaixaLancamento_TbCaixaTipoRecebimento] FOREIGN KEY([CdTipoRecebimento]) REFERENCES [dbo].[TbCaixaTipoRecebimento] ([CdTipoRecebimento])                                                  
GO
ALTER TABLE [dbo].[TbCaixaLancamento] CHECK CONSTRAINT [FK_TbCaixaLancamento_TbCaixaTipoRecebimento]
GO

ALTER TABLE [dbo].[TbCartaoMovimentacao] WITH CHECK ADD  CONSTRAINT [FK_TbCartaoMovimentacao_TbCaixaTipoRecebimento] FOREIGN KEY([CdTipoRecebimento]) REFERENCES [dbo].[TbCaixaTipoRecebimento] ([CdTipoRecebimento])                                            
GO
ALTER TABLE [dbo].[TbCartaoMovimentacao] CHECK CONSTRAINT [FK_TbCartaoMovimentacao_TbCaixaTipoRecebimento]
GO

ALTER TABLE [dbo].[TbLancamentoCobrancaRecebimento] WITH CHECK ADD  CONSTRAINT [FK_TbLancamentoCobrancaRecebimento_TbCaixaTipoRecebimento] FOREIGN KEY([CdTipoRecebimento]) REFERENCES [dbo].[TbCaixaTipoRecebimento] ([CdTipoRecebimento])                      
GO
ALTER TABLE [dbo].[TbLancamentoCobrancaRecebimento] CHECK CONSTRAINT [FK_TbLancamentoCobrancaRecebimento_TbCaixaTipoRecebimento]
GO

ALTER TABLE [dbo].[TbTituloCobrancaRecebimento] WITH CHECK ADD  CONSTRAINT [FK_TbTituloCobrancaRecebimento_TbCaixaTipoRecebimento] FOREIGN KEY([CdTipoRecebimento]) REFERENCES [dbo].[TbCaixaTipoRecebimento] ([CdTipoRecebimento])                              
GO
ALTER TABLE [dbo].[TbTituloCobrancaRecebimento] CHECK CONSTRAINT [FK_TbTituloCobrancaRecebimento_TbCaixaTipoRecebimento]
GO



-- TbCurso
IF OBJECT_ID('dbo.FK_TbAlunoCurso_TbCurso_Origem') IS NOT NULL
BEGIN
	ALTER TABLE [dbo].[TbAlunoCurso] DROP CONSTRAINT [FK_TbAlunoCurso_TbCurso_Origem]
END

ALTER TABLE [dbo].[TbAlunoCurso] DROP CONSTRAINT [FK_TbAlunoCurso_TbCurso]
GO
ALTER TABLE [dbo].[TbCurriculo] DROP CONSTRAINT [FK_TbCurriculo_TbCurso]
GO

IF OBJECT_ID('dbo.FK_TbCursoTipoCobranca02_TbCurso') IS NOT NULL
BEGIN
	ALTER TABLE [dbo].[TbCursoTipoCobranca02] DROP CONSTRAINT [FK_TbCursoTipoCobranca02_TbCurso]
END

IF OBJECT_ID('dbo.FK_TbCursoTipoCobranca06_TbCurso') IS NOT NULL
BEGIN
	ALTER TABLE [dbo].[TbCursoTipoCobranca06] DROP CONSTRAINT [FK_TbCursoTipoCobranca06_TbCurso]
END

IF OBJECT_ID('dbo.FK_TbRelatorioMatriculaCursoSuperior_TbCurso') IS NOT NULL
BEGIN
	ALTER TABLE [dbo].[TbRelatorioMatriculaCursoSuperior] DROP CONSTRAINT [FK_TbRelatorioMatriculaCursoSuperior_TbCurso]
END

ALTER TABLE [dbo].[TbSerie] DROP CONSTRAINT [FK_TbSerie_TbCurso]
GO

IF OBJECT_ID('dbo.FK_TbTurmaProfessorCursoAdicional_TbCurso') IS NOT NULL
BEGIN
	ALTER TABLE [dbo].[TbTurmaProfessorCursoAdicional] DROP CONSTRAINT [FK_TbTurmaProfessorCursoAdicional_TbCurso]
END


ALTER TABLE [dbo].[TbCurso] DROP CONSTRAINT [PK_TbCurso]
GO


ALTER TABLE [dbo].[TbCurso] ADD  CONSTRAINT [PK_TbCurso] PRIMARY KEY CLUSTERED 
(
        [IdCurso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO


IF	EXISTS		( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbAlunoCurso'	AND COLUMN_NAME = 'IdCurso' )
	AND	EXISTS	( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbCurso'		AND COLUMN_NAME = 'IdCurso' )
	BEGIN                                                                                                                                                                                                                                                             
		ALTER TABLE [dbo].[TbAlunoCurso] WITH CHECK ADD  CONSTRAINT [FK_TbAlunoCurso_TbCurso] FOREIGN KEY([IdCurso]) REFERENCES [dbo].[TbCurso] ([IdCurso])                                                                                                              

		ALTER TABLE [dbo].[TbAlunoCurso] CHECK CONSTRAINT [FK_TbAlunoCurso_TbCurso]
	END

IF	EXISTS		( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbAlunoCurso'	AND COLUMN_NAME = 'IdCurso_Origem' )
	AND	EXISTS	( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbCurso'		AND COLUMN_NAME = 'IdCurso' )
	BEGIN
		ALTER TABLE [dbo].[TbAlunoCurso] WITH CHECK ADD  CONSTRAINT [FK_TbAlunoCurso_TbCurso_Origem] FOREIGN KEY([IdCurso_Origem]) REFERENCES [dbo].[TbCurso] ([IdCurso])                                                                                                

		ALTER TABLE [dbo].[TbAlunoCurso] CHECK CONSTRAINT [FK_TbAlunoCurso_TbCurso_Origem]
	END

ALTER TABLE [dbo].[TbCurriculo] WITH CHECK ADD  CONSTRAINT [FK_TbCurriculo_TbCurso] FOREIGN KEY([IdCurso]) REFERENCES [dbo].[TbCurso] ([IdCurso])                                                                                                                
GO
ALTER TABLE [dbo].[TbCurriculo] CHECK CONSTRAINT [FK_TbCurriculo_TbCurso]
GO

IF	EXISTS		( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbCursoTipoCobranca02'	AND COLUMN_NAME = 'Aluno_IdCurso' )
	AND	EXISTS	( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbCurso'				AND COLUMN_NAME = 'IdCurso' )
	BEGIN
		ALTER TABLE [dbo].[TbCursoTipoCobranca02] WITH CHECK ADD  CONSTRAINT [FK_TbCursoTipoCobranca02_TbCurso] FOREIGN KEY([Aluno_IdCurso]) REFERENCES [dbo].[TbCurso] ([IdCurso])                                                                                      

		ALTER TABLE [dbo].[TbCursoTipoCobranca02] CHECK CONSTRAINT [FK_TbCursoTipoCobranca02_TbCurso]
	END


IF	EXISTS		( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbCursoTipoCobranca06'	AND COLUMN_NAME = 'Aluno_IdCurso' )
	AND	EXISTS	( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbCurso'				AND COLUMN_NAME = 'IdCurso' )
	BEGIN
		ALTER TABLE [dbo].[TbCursoTipoCobranca06] WITH CHECK ADD  CONSTRAINT [FK_TbCursoTipoCobranca06_TbCurso] FOREIGN KEY([Aluno_IdCurso]) REFERENCES [dbo].[TbCurso] ([IdCurso])                                                                                      

		ALTER TABLE [dbo].[TbCursoTipoCobranca06] CHECK CONSTRAINT [FK_TbCursoTipoCobranca06_TbCurso]
	END

ALTER TABLE [dbo].[TbRelatorioMatriculaCursoSuperior] WITH CHECK ADD  CONSTRAINT [FK_TbRelatorioMatriculaCursoSuperior_TbCurso] FOREIGN KEY([IdCurso]) REFERENCES [dbo].[TbCurso] ([IdCurso])                                                                    
GO
ALTER TABLE [dbo].[TbRelatorioMatriculaCursoSuperior] CHECK CONSTRAINT [FK_TbRelatorioMatriculaCursoSuperior_TbCurso]
GO

ALTER TABLE [dbo].[TbSerie] WITH CHECK ADD  CONSTRAINT [FK_TbSerie_TbCurso] FOREIGN KEY([IdCurso]) REFERENCES [dbo].[TbCurso] ([IdCurso])                                                                                                                        
GO
ALTER TABLE [dbo].[TbSerie] CHECK CONSTRAINT [FK_TbSerie_TbCurso]
GO

IF	EXISTS		( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbTurmaProfessorCursoAdicional'	AND COLUMN_NAME = 'IdCursoQueDevePermitirMatricula' )
	AND	EXISTS	( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbCurso'						AND COLUMN_NAME = 'IdCurso' )
	BEGIN
		ALTER TABLE [dbo].[TbTurmaProfessorCursoAdicional] WITH CHECK ADD  CONSTRAINT [FK_TbTurmaProfessorCursoAdicional_TbCurso] FOREIGN KEY([IdCursoQueDevePermitirMatricula]) REFERENCES [dbo].[TbCurso] ([IdCurso])                                                  

		ALTER TABLE [dbo].[TbTurmaProfessorCursoAdicional] CHECK CONSTRAINT [FK_TbTurmaProfessorCursoAdicional_TbCurso]
END




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

ALTER TABLE [dbo].[TbEstabelecimentoEnsino] DROP CONSTRAINT [PK_TbEstabelecimentoEnsino]
GO


ALTER TABLE [dbo].[TbEstabelecimentoEnsino] ADD  CONSTRAINT [PK_TbEstabelecimentoEnsino] PRIMARY KEY CLUSTERED 
(
        [IdEstabelecimentoEnsino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
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



-- TbFidUsuarioPontuacao
ALTER TABLE [dbo].[TbFidUsuarioPontuacao] DROP CONSTRAINT [PK_TbFidUsuarioPontuacao]
GO


ALTER TABLE [dbo].[TbFidUsuarioPontuacao] ADD  CONSTRAINT [PK_TbFidUsuarioPontuacao] PRIMARY KEY CLUSTERED 
(
        [IdFidUsuarioPontuacao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO


-- TbFormula
ALTER TABLE [dbo].[TbFaseNota] DROP CONSTRAINT [FK_TbFaseNota_TbFormula_FormulaFalta]
GO
ALTER TABLE [dbo].[TbFaseNota] DROP CONSTRAINT [FK_TbFaseNota_TbFormula_FormulaNota]
GO
ALTER TABLE [dbo].[TbFaseNota] DROP CONSTRAINT [FK_TbFaseNota_TbFormula_FormulaComposicaoNota]
GO
ALTER TABLE [dbo].[TbFaseNota] DROP CONSTRAINT [FK_TbFaseNota_TbFormula]
GO
ALTER TABLE [dbo].[TbFaseNota] DROP CONSTRAINT [FK_TbFaseNota_TbFormula_AprovacaoFrequencia]
GO
ALTER TABLE [dbo].[TbFaseNotaAluno] DROP CONSTRAINT [FK_TbFaseNotaAluno_TbFormula]
GO
ALTER TABLE [dbo].[TbFaseNotaDisciplina] DROP CONSTRAINT [FK_TbFaseNotaDisciplina_TbFormula]
GO
ALTER TABLE [dbo].[TbGradeCurricular] DROP CONSTRAINT [FK_TbGradeCurricular_TbFormula]
GO

ALTER TABLE [dbo].[TbFormula] DROP CONSTRAINT [PK_TbFormula]
GO


ALTER TABLE [dbo].[TbFormula] ADD  CONSTRAINT [PK_TbFormula] PRIMARY KEY CLUSTERED 
(
        [IdFormula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO


                                                                                                                                                                                                                                                                 
ALTER TABLE [dbo].[TbFaseNota] WITH CHECK ADD  CONSTRAINT [FK_TbFaseNota_TbFormula_FormulaFalta] FOREIGN KEY([IdFormulaFalta]) REFERENCES [dbo].[TbFormula] ([IdFormula])                                                                                        
GO
ALTER TABLE [dbo].[TbFaseNota] CHECK CONSTRAINT [FK_TbFaseNota_TbFormula_FormulaFalta]
GO

ALTER TABLE [dbo].[TbFaseNota] WITH CHECK ADD  CONSTRAINT [FK_TbFaseNota_TbFormula_FormulaNota] FOREIGN KEY([IdFormulaNota]) REFERENCES [dbo].[TbFormula] ([IdFormula])                                                                                          
GO
ALTER TABLE [dbo].[TbFaseNota] CHECK CONSTRAINT [FK_TbFaseNota_TbFormula_FormulaNota]
GO

ALTER TABLE [dbo].[TbFaseNota] WITH CHECK ADD  CONSTRAINT [FK_TbFaseNota_TbFormula_FormulaComposicaoNota] FOREIGN KEY([IdFormulaComposicaoNota]) REFERENCES [dbo].[TbFormula] ([IdFormula])                                                                      
GO
ALTER TABLE [dbo].[TbFaseNota] CHECK CONSTRAINT [FK_TbFaseNota_TbFormula_FormulaComposicaoNota]
GO

ALTER TABLE [dbo].[TbFaseNota] WITH CHECK ADD  CONSTRAINT [FK_TbFaseNota_TbFormula] FOREIGN KEY([IdFormulaAprovacao]) REFERENCES [dbo].[TbFormula] ([IdFormula])                                                                                                 
GO
ALTER TABLE [dbo].[TbFaseNota] CHECK CONSTRAINT [FK_TbFaseNota_TbFormula]
GO

ALTER TABLE [dbo].[TbFaseNota] WITH CHECK ADD  CONSTRAINT [FK_TbFaseNota_TbFormula_AprovacaoFrequencia] FOREIGN KEY([IdFormulaAprovacaoFrequencia]) REFERENCES [dbo].[TbFormula] ([IdFormula])                                                                   
GO
ALTER TABLE [dbo].[TbFaseNota] CHECK CONSTRAINT [FK_TbFaseNota_TbFormula_AprovacaoFrequencia]
GO

ALTER TABLE [dbo].[TbFaseNotaAluno] WITH CHECK ADD  CONSTRAINT [FK_TbFaseNotaAluno_TbFormula] FOREIGN KEY([IdFormulaComposicao]) REFERENCES [dbo].[TbFormula] ([IdFormula])                                                                                      
GO
ALTER TABLE [dbo].[TbFaseNotaAluno] CHECK CONSTRAINT [FK_TbFaseNotaAluno_TbFormula]
GO

ALTER TABLE [dbo].[TbFaseNotaDisciplina] WITH CHECK ADD  CONSTRAINT [FK_TbFaseNotaDisciplina_TbFormula] FOREIGN KEY([IdFormulaComposicaoNota]) REFERENCES [dbo].[TbFormula] ([IdFormula])                                                                        
GO
ALTER TABLE [dbo].[TbFaseNotaDisciplina] CHECK CONSTRAINT [FK_TbFaseNotaDisciplina_TbFormula]
GO

ALTER TABLE [dbo].[TbGradeCurricular] WITH CHECK ADD  CONSTRAINT [FK_TbGradeCurricular_TbFormula] FOREIGN KEY([IdFormulaComposicao]) REFERENCES [dbo].[TbFormula] ([IdFormula])                                                                                  
GO
ALTER TABLE [dbo].[TbGradeCurricular] CHECK CONSTRAINT [FK_TbGradeCurricular_TbFormula]
GO



-- Parte 2



-- TbGrupo ----------------------------------------------------------------------------------------------
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

IF OBJECT_ID('dbo.FK__TbOptProv__IdPro__043C47BD') IS NOT NULL
BEGIN
    ALTER TABLE [dbo].[TbOptProvaGabarito] DROP CONSTRAINT [FK__TbOptProv__IdPro__043C47BD]
END
--
IF OBJECT_ID('dbo.FK__TbOptProv__IdPro__7073AF84') IS NOT NULL
BEGIN
    ALTER TABLE [dbo].[TbOptProvaGabarito] DROP CONSTRAINT [FK__TbOptProv__IdPro__7073AF84]
END
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


IF OBJECT_ID('dbo.PK_TbPagamentoArquivoRetorno') IS NOT NULL
BEGIN
	ALTER TABLE [dbo].[TbPagamentoLote] DROP CONSTRAINT [PK_TbPagamentoArquivoRetorno]
END

IF OBJECT_ID('dbo.PK_TbPagamentoLote') IS NOT NULL
BEGIN
	ALTER TABLE [dbo].[TbPagamentoLote] DROP CONSTRAINT [PK_TbPagamentoLote]
END


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

-- 20/jan
IF OBJECT_ID('dbo.FK_TbFreqQuadroHorario_TbSala') IS NOT NULL
BEGIN
	ALTER TABLE [dbo].[TbFreqQuadroHorario] DROP CONSTRAINT [FK_TbFreqQuadroHorario_TbSala]
END

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

IF	EXISTS		( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbFreqQuadroHorario'	AND COLUMN_NAME = 'IdSala' )
	AND	EXISTS	( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbSala'					AND COLUMN_NAME = 'IdSala' )
	BEGIN
		ALTER TABLE [dbo].[TbFreqQuadroHorario] WITH CHECK ADD  CONSTRAINT [FK_TbFreqQuadroHorario_TbSala] FOREIGN KEY([IdSala]) REFERENCES [dbo].[TbSala] ([IdSala])                                                                                                    

		ALTER TABLE [dbo].[TbFreqQuadroHorario] CHECK CONSTRAINT [FK_TbFreqQuadroHorario_TbSala]
	END

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






------  SEGUNDO SCRIPT
------  SEGUNDO SCRIPT
------  SEGUNDO SCRIPT

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

IF OBJECT_ID('dbo.FK_TbAlunoTipoAvaliacao_TbAluno') IS NOT NULL
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

IF OBJECT_ID('dbo.FK_TbCaptacaoAlunoInteressado_TbAluno') IS NOT NULL
BEGIN
	ALTER TABLE [dbo].[TbCaptacaoAlunoInteressado] DROP CONSTRAINT [FK_TbCaptacaoAlunoInteressado_TbAluno]
END

ALTER TABLE [dbo].[TbDiarioAluno] DROP CONSTRAINT [FK_TbDiarioAluno_TbAluno]
GO

IF OBJECT_ID('dbo.FK_TbFaseNotaAluno_FilaProcessamento_TbAluno') IS NOT NULL
BEGIN
	ALTER TABLE [dbo].[TbFaseNotaAluno_FilaProcessamento] DROP CONSTRAINT [FK_TbFaseNotaAluno_FilaProcessamento_TbAluno]
END

IF OBJECT_ID('dbo.FK_TbFiesRepasse_TbAluno') IS NOT NULL
BEGIN
	ALTER TABLE [dbo].[TbFiesRepasse] DROP CONSTRAINT [FK_TbFiesRepasse_TbAluno]
END

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

-- 31Jul20
ALTER TABLE [dbo].[TbDiarioAulaChamadaOnline] DROP CONSTRAINT [FK_TbDiarioAulaChamadaOnline_TbAluno]
GO

-- 17JAN21
ALTER TABLE [dbo].[TbAlunoTurmaDocumento] DROP CONSTRAINT [FK__TbAlunoTu__IdAlu__55A3B66A]
GO


	ALTER TABLE [dbo].[TbAluno] DROP CONSTRAINT [PK_TbAluno]
	GO






-- checar AQUI 17JAN21 - DROP FK apos DROP  PK

------------ ÍNDICES FORA DO PADRÃO

IF EXISTS( SELECT * FROM sys.indexes WHERE name='IX_TbAlunoMatriculaUnidade' AND object_id = OBJECT_ID('dbo.TbAluno') )
	BEGIN
		DROP INDEX [IX_TbAlunoMatriculaUnidade] ON [dbo].[TbAluno] WITH ( ONLINE = OFF )
	END

--SET ANSI_PADDING ON
--GO
--CREATE UNIQUE nonCLUSTERED INDEX [IX_TbAlunoMatriculaUnidade] ON [dbo].[TbAluno]
--(
--	[Matricula] ASC,
--	[IdUnidade] ASC
--)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
--GO
------------





-- EXECUTADO EM 17JAN21
		ALTER TABLE [dbo].[TbAluno] ADD  CONSTRAINT [PK_TbAluno] PRIMARY KEY CLUSTERED 
		(
				[IdAluno] ASC
		)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
		GO
---

-- 31Jul20
ALTER TABLE [dbo].[TbDiarioAulaChamadaOnline]  WITH CHECK ADD  CONSTRAINT [FK_TbDiarioAulaChamadaOnline_TbAluno] FOREIGN KEY([IdAluno])
REFERENCES [dbo].[TbAluno] ([IdAluno])
GO

ALTER TABLE [dbo].[TbDiarioAulaChamadaOnline] CHECK CONSTRAINT [FK_TbDiarioAulaChamadaOnline_TbAluno]
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

IF	EXISTS		( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbAlunoTipoAvaliacao'	AND COLUMN_NAME = 'IdAluno' )
	AND	EXISTS	( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbAluno'					AND COLUMN_NAME = 'IdAluno' )
	BEGIN
		ALTER TABLE [dbo].[TbAlunoTipoAvaliacao] WITH CHECK ADD  CONSTRAINT [FK_TbAlunoTipoAvaliacao_TbAluno] FOREIGN KEY([IdAluno]) REFERENCES [dbo].[TbAluno] ([IdAluno])                                                                                              

		ALTER TABLE [dbo].[TbAlunoTipoAvaliacao] CHECK CONSTRAINT [FK_TbAlunoTipoAvaliacao_TbAluno]
	END

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

IF	EXISTS		( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbCaptacaoAlunoInteressado'	AND COLUMN_NAME = 'IdAlunoConvertido' )
	AND	EXISTS	( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbAluno'					AND COLUMN_NAME = 'IdAluno' )
	BEGIN
		ALTER TABLE [dbo].[TbCaptacaoAlunoInteressado] WITH CHECK ADD  CONSTRAINT [FK_TbCaptacaoAlunoInteressado_TbAluno] FOREIGN KEY([IdAlunoConvertido]) REFERENCES [dbo].[TbAluno] ([IdAluno])                                                                        

		ALTER TABLE [dbo].[TbCaptacaoAlunoInteressado] CHECK CONSTRAINT [FK_TbCaptacaoAlunoInteressado_TbAluno]
	END

ALTER TABLE [dbo].[TbDiarioAluno] WITH CHECK ADD  CONSTRAINT [FK_TbDiarioAluno_TbAluno] FOREIGN KEY([IdAluno]) REFERENCES [dbo].[TbAluno] ([IdAluno])                                                                                                            
GO
ALTER TABLE [dbo].[TbDiarioAluno] CHECK CONSTRAINT [FK_TbDiarioAluno_TbAluno]
GO

IF	EXISTS		( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbFaseNotaAluno_FilaProcessamento'	AND COLUMN_NAME = 'IdAluno' )
	AND	EXISTS	( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbAluno'							AND COLUMN_NAME = 'IdAluno' )
	BEGIN
		ALTER TABLE [dbo].[TbFaseNotaAluno_FilaProcessamento] WITH CHECK ADD  CONSTRAINT [FK_TbFaseNotaAluno_FilaProcessamento_TbAluno] FOREIGN KEY([IdAluno]) REFERENCES [dbo].[TbAluno] ([IdAluno])                                                                    

		ALTER TABLE [dbo].[TbFaseNotaAluno_FilaProcessamento] CHECK CONSTRAINT [FK_TbFaseNotaAluno_FilaProcessamento_TbAluno]
	END

IF	EXISTS		( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbFiesRepasse'	AND COLUMN_NAME = 'IdAluno' )
	AND	EXISTS	( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbAluno'							AND COLUMN_NAME = 'IdAluno' )
	BEGIN
		ALTER TABLE [dbo].[TbFiesRepasse] WITH CHECK ADD  CONSTRAINT [FK_TbFiesRepasse_TbAluno] FOREIGN KEY([IdAluno]) REFERENCES [dbo].[TbAluno] ([IdAluno])                                                                                                            

		ALTER TABLE [dbo].[TbFiesRepasse] CHECK CONSTRAINT [FK_TbFiesRepasse_TbAluno]
	END

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

IF OBJECT_ID('dbo.FK_TbSeriePeriodo_TbSerie') IS NOT NULL
BEGIN
	ALTER TABLE [dbo].[TbSeriePeriodo] DROP CONSTRAINT [FK_TbSeriePeriodo_TbSerie]
END

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

                                                                                                                                                                                                                                                                 
IF	EXISTS		( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbCaptacaoAlunoInteressado'	AND COLUMN_NAME = 'IdSerie' )
	AND	EXISTS	( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbSerie'					AND COLUMN_NAME = 'IdSerie' )
	BEGIN
		ALTER TABLE [dbo].[TbCaptacaoAlunoInteressado] WITH CHECK ADD  CONSTRAINT [FK_TbCaptacaoAlunoInteressado_TbSerie] FOREIGN KEY([IdSerie]) REFERENCES [dbo].[TbSerie] ([IdSerie])                                                                                  

		ALTER TABLE [dbo].[TbCaptacaoAlunoInteressado] CHECK CONSTRAINT [FK_TbCaptacaoAlunoInteressado_TbSerie]
	END

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

IF	EXISTS		( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbSeriePeriodo'	AND COLUMN_NAME = 'IdSerie' )
	AND	EXISTS	( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbSerie'		AND COLUMN_NAME = 'IdSerie' )
	BEGIN
		ALTER TABLE [dbo].[TbSeriePeriodo] WITH CHECK ADD  CONSTRAINT [FK_TbSeriePeriodo_TbSerie] FOREIGN KEY([IdSerie]) REFERENCES [dbo].[TbSerie] ([IdSerie])                                                                                                          

		ALTER TABLE [dbo].[TbSeriePeriodo] CHECK CONSTRAINT [FK_TbSeriePeriodo_TbSerie]
	END

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

IF OBJECT_ID('dbo.FK_TbAlunoTipoAvaliacao_TbTurma') IS NOT NULL
BEGIN
	ALTER TABLE [dbo].[TbAlunoTipoAvaliacao] DROP CONSTRAINT [FK_TbAlunoTipoAvaliacao_TbTurma]
END

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

IF OBJECT_ID('dbo.FK_TbCursoTipoCobranca05_TbTurma') IS NOT NULL
BEGIN
	ALTER TABLE [dbo].[TbCursoTipoCobranca05] DROP CONSTRAINT [FK_TbCursoTipoCobranca05_TbTurma]
END

ALTER TABLE [dbo].[TbDiario] DROP CONSTRAINT [FK_TbDiario_TbTurma]
GO

IF OBJECT_ID('dbo.FK_TbEventoTipoInscricao_TbTurma_Evento') IS NOT NULL
BEGIN
	ALTER TABLE [dbo].[TbEventoTipoInscricao] DROP CONSTRAINT [FK_TbEventoTipoInscricao_TbTurma_Evento]
END

IF OBJECT_ID('dbo.FK_TbFaseNotaAluno_FilaProcessamento_TbTurma') IS NOT NULL
BEGIN
	ALTER TABLE [dbo].[TbFaseNotaAluno_FilaProcessamento] DROP CONSTRAINT [FK_TbFaseNotaAluno_FilaProcessamento_TbTurma]
END


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

IF OBJECT_ID('dbo.FK_TbTurmaDisciplinaPlanoAula_TbTurma') IS NOT NULL
BEGIN
	ALTER TABLE [dbo].[TbTurmaDisciplinaPlanoAula] DROP CONSTRAINT [FK_TbTurmaDisciplinaPlanoAula_TbTurma]
END



ALTER TABLE [dbo].[TbTurmaProfessor] DROP CONSTRAINT [FK_TbTurmaProfessor_TbTurma]
GO

IF OBJECT_ID('dbo.FK_TbTurmaProfessorCursoAdicional_TbTurma') IS NOT NULL
BEGIN
	ALTER TABLE [dbo].[TbTurmaProfessorCursoAdicional] DROP CONSTRAINT [FK_TbTurmaProfessorCursoAdicional_TbTurma]
END

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

IF	EXISTS		( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbAlunoTipoAvaliacao'	AND COLUMN_NAME = 'IdTurma' )
	AND	EXISTS	( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbTurma'				AND COLUMN_NAME = 'IdTurma' )
	BEGIN
		ALTER TABLE [dbo].[TbAlunoTipoAvaliacao] WITH CHECK ADD  CONSTRAINT [FK_TbAlunoTipoAvaliacao_TbTurma] FOREIGN KEY([IdTurma]) REFERENCES [dbo].[TbTurma] ([IdTurma])                                                                                              

		ALTER TABLE [dbo].[TbAlunoTipoAvaliacao] CHECK CONSTRAINT [FK_TbAlunoTipoAvaliacao_TbTurma]
	END

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

IF	EXISTS		( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbCursoTipoCobranca05'	AND COLUMN_NAME = 'Turma_IdTurma' )
	AND	EXISTS	( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbSala'					AND COLUMN_NAME = 'IdSala' )
	BEGIN
		ALTER TABLE [dbo].[TbCursoTipoCobranca05] WITH CHECK ADD  CONSTRAINT [FK_TbCursoTipoCobranca05_TbTurma] FOREIGN KEY([Turma_IdTurma]) REFERENCES [dbo].[TbTurma] ([IdTurma])                                                                                      

		ALTER TABLE [dbo].[TbCursoTipoCobranca05] CHECK CONSTRAINT [FK_TbCursoTipoCobranca05_TbTurma]
	END

ALTER TABLE [dbo].[TbDiario] WITH CHECK ADD  CONSTRAINT [FK_TbDiario_TbTurma] FOREIGN KEY([IdTurma]) REFERENCES [dbo].[TbTurma] ([IdTurma])                                                                                                                      
GO
ALTER TABLE [dbo].[TbDiario] CHECK CONSTRAINT [FK_TbDiario_TbTurma]
GO

IF	EXISTS		( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbEventoTipoInscricao'	AND COLUMN_NAME = 'IdTurma_Evento' )
	AND	EXISTS	( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbTurma'				AND COLUMN_NAME = 'IdTurma' )
	BEGIN
		ALTER TABLE [dbo].[TbEventoTipoInscricao] WITH CHECK ADD  CONSTRAINT [FK_TbEventoTipoInscricao_TbTurma_Evento] FOREIGN KEY([IdTurma_Evento]) REFERENCES [dbo].[TbTurma] ([IdTurma])                                                                              

		ALTER TABLE [dbo].[TbEventoTipoInscricao] CHECK CONSTRAINT [FK_TbEventoTipoInscricao_TbTurma_Evento]
	END

IF	EXISTS		( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbFaseNotaAluno_FilaProcessamento'	AND COLUMN_NAME = 'IdTurma' )
	AND	EXISTS	( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbTurma'							AND COLUMN_NAME = 'IdTurma' )
	BEGIN
		ALTER TABLE [dbo].[TbFaseNotaAluno_FilaProcessamento] WITH CHECK ADD  CONSTRAINT [FK_TbFaseNotaAluno_FilaProcessamento_TbTurma] FOREIGN KEY([IdTurma]) REFERENCES [dbo].[TbTurma] ([IdTurma])                                                                    

		ALTER TABLE [dbo].[TbFaseNotaAluno_FilaProcessamento] CHECK CONSTRAINT [FK_TbFaseNotaAluno_FilaProcessamento_TbTurma]
	END

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

IF	EXISTS		( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbTurmaProfessorCursoAdicional'	AND COLUMN_NAME = 'IdTurma' )
	AND	EXISTS	( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbTurma'					AND COLUMN_NAME = 'IdTurma' )
	BEGIN
		ALTER TABLE [dbo].[TbTurmaProfessorCursoAdicional] WITH CHECK ADD  CONSTRAINT [FK_TbTurmaProfessorCursoAdicional_TbTurma] FOREIGN KEY([IdTurma]) REFERENCES [dbo].[TbTurma] ([IdTurma])                                                                          

		ALTER TABLE [dbo].[TbTurmaProfessorCursoAdicional] CHECK CONSTRAINT [FK_TbTurmaProfessorCursoAdicional_TbTurma]
	END

ALTER TABLE [dbo].[TbTurmaTurmaPrincipal] WITH CHECK ADD  CONSTRAINT [FK_TbTurmaTurmaPrincipal_TbTurma] FOREIGN KEY([IdTurmaPrincipal]) REFERENCES [dbo].[TbTurma] ([IdTurma])                                                                                   
GO
ALTER TABLE [dbo].[TbTurmaTurmaPrincipal] CHECK CONSTRAINT [FK_TbTurmaTurmaPrincipal_TbTurma]
GO





-- TbDisciplina ---------------------------------------------------------------------------------------------------

IF OBJECT_ID('dbo.FK_TbAlunoAproveitamentoDisciplina_TbDisciplina') IS NOT NULL
BEGIN
	ALTER TABLE [dbo].[TbAlunoAproveitamentoDisciplina] DROP CONSTRAINT [FK_TbAlunoAproveitamentoDisciplina_TbDisciplina]
END

IF OBJECT_ID('dbo.FK_TbAlunoTipoAvaliacao_TbDisciplina') IS NOT NULL
BEGIN
	ALTER TABLE [dbo].[TbAlunoTipoAvaliacao] DROP CONSTRAINT [FK_TbAlunoTipoAvaliacao_TbDisciplina]
END


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

IF OBJECT_ID('dbo.FK_TbFaseNotaAluno_FilaProcessamento_TbDisciplina') IS NOT NULL
BEGIN
	ALTER TABLE [dbo].[TbFaseNotaAluno_FilaProcessamento] DROP CONSTRAINT [FK_TbFaseNotaAluno_FilaProcessamento_TbDisciplina]
END

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

IF OBJECT_ID('dbo.FK__TbOptProv__IdDis__0718B468') IS NOT NULL
BEGIN
	ALTER TABLE [dbo].[TbOptProvaGabarito] DROP CONSTRAINT [FK__TbOptProv__IdDis__0718B468]
END

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

IF OBJECT_ID('dbo.FK_TbTurmaProfessorCursoAdicional_TbDisciplina') IS NOT NULL
BEGIN
	ALTER TABLE [dbo].[TbTurmaProfessorCursoAdicional] DROP CONSTRAINT [FK_TbTurmaProfessorCursoAdicional_TbDisciplina]
END



	ALTER TABLE [dbo].[TbDisciplina] DROP CONSTRAINT [PK_TbDisciplina]
	GO


	ALTER TABLE [dbo].[TbDisciplina] ADD  CONSTRAINT [PK_TbDisciplina] PRIMARY KEY CLUSTERED 
	(
			[IdDisciplina] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
	GO



                                                                                                                                                                                                                                                                 
IF	EXISTS		( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbAlunoAproveitamentoDisciplina'	AND COLUMN_NAME = 'IdDisciplina' )
	AND	EXISTS	( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbDisciplina'						AND COLUMN_NAME = 'IdDisciplina' )
	BEGIN
		ALTER TABLE [dbo].[TbAlunoAproveitamentoDisciplina] WITH CHECK ADD  CONSTRAINT [FK_TbAlunoAproveitamentoDisciplina_TbDisciplina] FOREIGN KEY([IdDisciplina]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina])                                                    

		ALTER TABLE [dbo].[TbAlunoAproveitamentoDisciplina] CHECK CONSTRAINT [FK_TbAlunoAproveitamentoDisciplina_TbDisciplina]
	END

IF	EXISTS		( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbAlunoTipoAvaliacao'	AND COLUMN_NAME = 'IdDisciplina' )
	AND	EXISTS	( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbDisciplina'			AND COLUMN_NAME = 'IdDisciplina' )
	BEGIN
		ALTER TABLE [dbo].[TbAlunoTipoAvaliacao] WITH CHECK ADD  CONSTRAINT [FK_TbAlunoTipoAvaliacao_TbDisciplina] FOREIGN KEY([IdDisciplina]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina])                                                                          

		ALTER TABLE [dbo].[TbAlunoTipoAvaliacao] CHECK CONSTRAINT [FK_TbAlunoTipoAvaliacao_TbDisciplina]
	END


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

IF	EXISTS		( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbFaseNotaAluno_FilaProcessamento'	AND COLUMN_NAME = 'IdDisciplina' )
	AND	EXISTS	( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbDisciplina'						AND COLUMN_NAME = 'IdDisciplina' )
	BEGIN
		ALTER TABLE [dbo].[TbFaseNotaAluno_FilaProcessamento] WITH CHECK ADD  CONSTRAINT [FK_TbFaseNotaAluno_FilaProcessamento_TbDisciplina] FOREIGN KEY([IdDisciplina]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina])                                                

		ALTER TABLE [dbo].[TbFaseNotaAluno_FilaProcessamento] CHECK CONSTRAINT [FK_TbFaseNotaAluno_FilaProcessamento_TbDisciplina]
	END

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

IF	EXISTS		( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbTurmaProfessorCursoAdicional'	AND COLUMN_NAME = 'IdDisciplina' )
	AND	EXISTS	( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbDisciplina'					AND COLUMN_NAME = 'IdDisciplina' )
	BEGIN
		ALTER TABLE [dbo].[TbTurmaProfessorCursoAdicional] WITH CHECK ADD  CONSTRAINT [FK_TbTurmaProfessorCursoAdicional_TbDisciplina] FOREIGN KEY([IdDisciplina]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina])                                                      

		ALTER TABLE [dbo].[TbTurmaProfessorCursoAdicional] CHECK CONSTRAINT [FK_TbTurmaProfessorCursoAdicional_TbDisciplina]
	END






-- TbPeriodo ----------------------------------------------------------------------------------------


IF OBJECT_ID('dbo.FK_TbAlunoCursoDesconto_TbPeriodo') IS NOT NULL
BEGIN
	ALTER TABLE [dbo].[TbAlunoCursoDesconto] DROP CONSTRAINT [FK_TbAlunoCursoDesconto_TbPeriodo]
END

ALTER TABLE [dbo].[TbAlunoCursoSuperior] DROP CONSTRAINT [FK_TbAlunoCursoSuperior_TbPeriodo]
GO
ALTER TABLE [dbo].[TbAlunoCursoSuperior] DROP CONSTRAINT [FK_TbAlunoCursoSuperior_TbPeriodo1]
GO
ALTER TABLE [dbo].[TbAlunoPeriodo] DROP CONSTRAINT [FK_TbAlunoPeriodo_TbPeriodo]
GO
ALTER TABLE [dbo].[TbAtividade] DROP CONSTRAINT [FK_TbAtividade_TbPeriodo]
GO

IF OBJECT_ID('dbo.FK_TbCursoTipoCobranca02_TbPeriodo') IS NOT NULL
BEGIN
	ALTER TABLE [dbo].[TbCursoTipoCobranca02] DROP CONSTRAINT [FK_TbCursoTipoCobranca02_TbPeriodo]
END

IF OBJECT_ID('dbo.FK_TbCursoTipoCobranca06_TbPeriodo') IS NOT NULL
BEGIN
	ALTER TABLE [dbo].[TbCursoTipoCobranca06] DROP CONSTRAINT [FK_TbCursoTipoCobranca06_TbPeriodo]
END

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

IF OBJECT_ID('dbo.FK_TbRelatorioMatriculaCursoSuperior_TbPeriodo') IS NOT NULL
BEGIN
	ALTER TABLE [dbo].[TbRelatorioMatriculaCursoSuperior] DROP CONSTRAINT [FK_TbRelatorioMatriculaCursoSuperior_TbPeriodo]
END

IF OBJECT_ID('dbo.FK_TbSeriePeriodo_TbPeriodo') IS NOT NULL
BEGIN
	ALTER TABLE [dbo].[TbSeriePeriodo] DROP CONSTRAINT [FK_TbSeriePeriodo_TbPeriodo]
END

ALTER TABLE [dbo].[TbSituacaoAlunoTurmaPagamento] DROP CONSTRAINT [FK_TbSituacaoAlunoTurmaPagamento_TbPeriodo]
GO
ALTER TABLE [dbo].[TbSolicitacaoDesconto] DROP CONSTRAINT [FK_TbSolicitacaoDesconto_TbPeriodo]
GO
ALTER TABLE [dbo].[TbTurma] DROP CONSTRAINT [FK_TbTurma_TbPeriodo]
GO

--- 22Out20
ALTER TABLE [dbo].[TbModeloContrato] DROP CONSTRAINT [FK_TbModeloContrato_TbPeriodo]
GO

---

	ALTER TABLE [dbo].[TbPeriodo] DROP CONSTRAINT [PK_TbPeriodo]
	GO


	ALTER TABLE [dbo].[TbPeriodo] ADD  CONSTRAINT [PK_TbPeriodo] PRIMARY KEY CLUSTERED 
	(
			[IdPeriodo] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
	GO


--- 22Out20
ALTER TABLE [dbo].[TbModeloContrato]  WITH CHECK ADD  CONSTRAINT [FK_TbModeloContrato_TbPeriodo] FOREIGN KEY([IdPeriodo])
REFERENCES [dbo].[TbPeriodo] ([IdPeriodo])
GO

ALTER TABLE [dbo].[TbModeloContrato] CHECK CONSTRAINT [FK_TbModeloContrato_TbPeriodo]
GO

---

                                                                                                                                                                                                                                                                 
IF	EXISTS		( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbAlunoCursoDesconto'	AND COLUMN_NAME = 'IdPeriodo' )
	AND	EXISTS	( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbPeriodo'				AND COLUMN_NAME = 'IdPeriodo' )
	BEGIN
		ALTER TABLE [dbo].[TbAlunoCursoDesconto] WITH CHECK ADD  CONSTRAINT [FK_TbAlunoCursoDesconto_TbPeriodo] FOREIGN KEY([IdPeriodo]) REFERENCES [dbo].[TbPeriodo] ([IdPeriodo])                                                                                      

		ALTER TABLE [dbo].[TbAlunoCursoDesconto] CHECK CONSTRAINT [FK_TbAlunoCursoDesconto_TbPeriodo]
	END

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

IF	EXISTS		( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbCursoTipoCobranca02'	AND COLUMN_NAME = 'Turma_IdPeriodo' )
	AND	EXISTS	( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbPeriodo'				AND COLUMN_NAME = 'IdPeriodo' )
	BEGIN
		ALTER TABLE [dbo].[TbCursoTipoCobranca02] WITH CHECK ADD  CONSTRAINT [FK_TbCursoTipoCobranca02_TbPeriodo] FOREIGN KEY([Turma_IdPeriodo]) REFERENCES [dbo].[TbPeriodo] ([IdPeriodo])                                                                              

		ALTER TABLE [dbo].[TbCursoTipoCobranca02] CHECK CONSTRAINT [FK_TbCursoTipoCobranca02_TbPeriodo]
	END

IF	EXISTS		( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbCursoTipoCobranca06'	AND COLUMN_NAME = 'Turma_IdPeriodo' )
	AND	EXISTS	( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbPeriodo'				AND COLUMN_NAME = 'IdPeriodo' )
	BEGIN
		ALTER TABLE [dbo].[TbCursoTipoCobranca06] WITH CHECK ADD  CONSTRAINT [FK_TbCursoTipoCobranca06_TbPeriodo] FOREIGN KEY([Turma_IdPeriodo]) REFERENCES [dbo].[TbPeriodo] ([IdPeriodo])                                                                              

		ALTER TABLE [dbo].[TbCursoTipoCobranca06] CHECK CONSTRAINT [FK_TbCursoTipoCobranca06_TbPeriodo]
	END

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


-- 22Out20
-- ALTER TABLE [dbo].[TbParametroInternet] WITH CHECK ADD  CONSTRAINT [FK_TbParametroInternet_TbPeriodo] FOREIGN KEY([SolicitacaoDesconto_IdPeriodo]) REFERENCES [dbo].[TbPeriodo] ([IdPeriodo])                                                                    
-- GO
-- ALTER TABLE [dbo].[TbParametroInternet] CHECK CONSTRAINT [FK_TbParametroInternet_TbPeriodo]
-- GO



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

IF	EXISTS		( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbRelatorioMatriculaCursoSuperior'	AND COLUMN_NAME = 'IdPeriodo' )
	AND	EXISTS	( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbPeriodo'							AND COLUMN_NAME = 'IdPeriodo' )
	BEGIN
		ALTER TABLE [dbo].[TbRelatorioMatriculaCursoSuperior] WITH CHECK ADD  CONSTRAINT [FK_TbRelatorioMatriculaCursoSuperior_TbPeriodo] FOREIGN KEY([IdPeriodo]) REFERENCES [dbo].[TbPeriodo] ([IdPeriodo])                                                            

		ALTER TABLE [dbo].[TbRelatorioMatriculaCursoSuperior] CHECK CONSTRAINT [FK_TbRelatorioMatriculaCursoSuperior_TbPeriodo]
	END

IF	EXISTS		( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbSeriePeriodo'	AND COLUMN_NAME = 'IdPeriodo' )
	AND	EXISTS	( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbPeriodo'							AND COLUMN_NAME = 'IdPeriodo' )
	BEGIN
		ALTER TABLE [dbo].[TbSeriePeriodo] WITH CHECK ADD  CONSTRAINT [FK_TbSeriePeriodo_TbPeriodo] FOREIGN KEY([IdPeriodo]) REFERENCES [dbo].[TbPeriodo] ([IdPeriodo])                                                                                                  

		ALTER TABLE [dbo].[TbSeriePeriodo] CHECK CONSTRAINT [FK_TbSeriePeriodo_TbPeriodo]
	END

IF	EXISTS		( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbSituacaoAlunoTurmaPagamento'	AND COLUMN_NAME = 'IdPeriodo' )
	AND	EXISTS	( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbPeriodo'						AND COLUMN_NAME = 'IdPeriodo' )
	BEGIN
		ALTER TABLE [dbo].[TbSituacaoAlunoTurmaPagamento] WITH CHECK ADD  CONSTRAINT [FK_TbSituacaoAlunoTurmaPagamento_TbPeriodo] FOREIGN KEY([IdPeriodo]) REFERENCES [dbo].[TbPeriodo] ([IdPeriodo])                                                                    

		ALTER TABLE [dbo].[TbSituacaoAlunoTurmaPagamento] CHECK CONSTRAINT [FK_TbSituacaoAlunoTurmaPagamento_TbPeriodo]
	END

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
--

	ALTER TABLE [dbo].[TbUsuario] DROP CONSTRAINT [PK_TbUsuario]
	GO


	ALTER TABLE [dbo].[TbUsuario] ADD  CONSTRAINT [PK_TbUsuario] PRIMARY KEY CLUSTERED 
	(
			[IdUsuario] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
	GO


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

--

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
	AND	EXISTS	( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbUsuario'					AND COLUMN_NAME = 'IdUsuario' )
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




----------------------------


-- TbProfessor


-- Novo
--ALTER TABLE [dbo].[TbAlunoCurso] DROP CONSTRAINT [FK_TbAlunoCurso_OrientadorMonografia]
--GO

IF OBJECT_ID('dbo.[FK_TbAlunoCurso_OrientadorMonografia]') IS NOT NULL 
	BEGIN
		ALTER TABLE dbo.[TbAlunoCurso] DROP CONSTRAINT FK_TbAlunoCurso_OrientadorMonografia
	END


IF OBJECT_ID('dbo.FK_TbAlunoRotinaEducacaoInfantil_TbProfessor') IS NOT NULL
BEGIN
	ALTER TABLE [dbo].[TbAlunoRotinaEducacaoInfantil] DROP CONSTRAINT [FK_TbAlunoRotinaEducacaoInfantil_TbProfessor]
END

IF OBJECT_ID('dbo.FK_TbAlunoTipoAvaliacao_TbProfessor') IS NOT NULL
BEGIN
	ALTER TABLE [dbo].[TbAlunoTipoAvaliacao] DROP CONSTRAINT [FK_TbAlunoTipoAvaliacao_TbProfessor]
END

IF OBJECT_ID('dbo.FK_TbArqArquivo_TbProfessor') IS NOT NULL
BEGIN
	ALTER TABLE [dbo].[TbArqArquivo] DROP CONSTRAINT [FK_TbArqArquivo_TbProfessor]
END

-- 16/jAN
IF OBJECT_ID('dbo.FK_TbProfessor_TbFaseNotaAluno_Auditoria') IS NOT NULL
BEGIN
	ALTER TABLE [dbo].[TbFaseNotaAluno_Auditoria] DROP CONSTRAINT [FK_TbProfessor_TbFaseNotaAluno_Auditoria]
END

IF OBJECT_ID('dbo.FK_TbFaseNotaAluno_FilaProcessamento_TbProfessor') IS NOT NULL
BEGIN
	ALTER TABLE [dbo].[TbFaseNotaAluno_FilaProcessamento] DROP CONSTRAINT [FK_TbFaseNotaAluno_FilaProcessamento_TbProfessor]
END

IF OBJECT_ID('dbo.FK_TbFreqProfessorPermissao_TbProfessor') IS NOT NULL
BEGIN
	ALTER TABLE [dbo].[TbFreqProfessorPermissao] DROP CONSTRAINT [FK_TbFreqProfessorPermissao_TbProfessor]
END

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

IF OBJECT_ID('dbo.FK_TbAlunoProfessor_TbProfessor_IdProfessorAlteracao') IS NOT NULL
BEGIN
	ALTER TABLE [dbo].[TbTurmaProfessor] DROP CONSTRAINT [FK_TbAlunoProfessor_TbProfessor_IdProfessorAlteracao]
END

-- 22Out20
ALTER TABLE [dbo].[TbModeloContrato] DROP CONSTRAINT [FK_TbModeloContrato_TbProfessor2]
GO

ALTER TABLE [dbo].[TbModeloContrato] DROP CONSTRAINT [FK_TbModeloContrato_TbProfessor1]
GO

ALTER TABLE [dbo].[TbModeloContrato] DROP CONSTRAINT [FK_TbModeloContrato_TbProfessor]
GO
--

	ALTER TABLE [dbo].[TbProfessor] DROP CONSTRAINT [PK_TbProfessor]
	GO


	ALTER TABLE [dbo].[TbProfessor] ADD  CONSTRAINT [PK_TbProfessor] PRIMARY KEY CLUSTERED 
	(
			[IdProfessor] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
	GO


-- 22Out20
ALTER TABLE [dbo].[TbModeloContrato]  WITH CHECK ADD  CONSTRAINT [FK_TbModeloContrato_TbProfessor2] FOREIGN KEY([IdColaboradorTestemunha2])
REFERENCES [dbo].[TbProfessor] ([IdProfessor])
GO

ALTER TABLE [dbo].[TbModeloContrato] CHECK CONSTRAINT [FK_TbModeloContrato_TbProfessor2]
GO


ALTER TABLE [dbo].[TbModeloContrato]  WITH CHECK ADD  CONSTRAINT [FK_TbModeloContrato_TbProfessor1] FOREIGN KEY([IdColaboradorTestemunha1])
REFERENCES [dbo].[TbProfessor] ([IdProfessor])
GO   

ALTER TABLE [dbo].[TbModeloContrato] CHECK CONSTRAINT [FK_TbModeloContrato_TbProfessor1]
GO


ALTER TABLE [dbo].[TbModeloContrato]  WITH CHECK ADD  CONSTRAINT [FK_TbModeloContrato_TbProfessor] FOREIGN KEY([IdColaboradorContratado])
REFERENCES [dbo].[TbProfessor] ([IdProfessor])
GO

ALTER TABLE [dbo].[TbModeloContrato] CHECK CONSTRAINT [FK_TbModeloContrato_TbProfessor]
GO

--

IF	EXISTS		( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbAlunoRotinaEducacaoInfantil'	AND COLUMN_NAME = 'IdProfessorResponsavel' )
	AND	EXISTS	( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbProfessor'					AND COLUMN_NAME = 'IdProfessor' )
	BEGIN
		ALTER TABLE [dbo].[TbAlunoRotinaEducacaoInfantil] WITH CHECK ADD  CONSTRAINT [FK_TbAlunoRotinaEducacaoInfantil_TbProfessor] FOREIGN KEY([IdProfessorResponsavel]) REFERENCES [dbo].[TbProfessor] ([IdProfessor])                                                 

		ALTER TABLE [dbo].[TbAlunoRotinaEducacaoInfantil] CHECK CONSTRAINT [FK_TbAlunoRotinaEducacaoInfantil_TbProfessor]
	END

IF	EXISTS		( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbAlunoTipoAvaliacao'	AND COLUMN_NAME = 'IdProfessor' )
	AND	EXISTS	( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbProfessor'					AND COLUMN_NAME = 'IdProfessor' )
	BEGIN
		ALTER TABLE [dbo].[TbAlunoTipoAvaliacao] WITH CHECK ADD  CONSTRAINT [FK_TbAlunoTipoAvaliacao_TbProfessor] FOREIGN KEY([IdProfessor]) REFERENCES [dbo].[TbProfessor] ([IdProfessor])                                                                              

		ALTER TABLE [dbo].[TbAlunoTipoAvaliacao] CHECK CONSTRAINT [FK_TbAlunoTipoAvaliacao_TbProfessor]
	END

ALTER TABLE [dbo].[TbArqArquivo] WITH CHECK ADD  CONSTRAINT [FK_TbArqArquivo_TbProfessor] FOREIGN KEY([IdProfessor]) REFERENCES [dbo].[TbProfessor] ([IdProfessor])                                                                                              
GO
ALTER TABLE [dbo].[TbArqArquivo] CHECK CONSTRAINT [FK_TbArqArquivo_TbProfessor]
GO

-- ALTER TABLE [dbo].[TbFaseNotaAluno_Auditoria] WITH CHECK ADD  CONSTRAINT [FK_TbProfessor_TbFaseNotaAluno_Auditoria] FOREIGN KEY([IdProfessor]) REFERENCES [dbo].[TbProfessor] ([IdProfessor])                                                                    
-- GO
-- ALTER TABLE [dbo].[TbFaseNotaAluno_Auditoria] CHECK CONSTRAINT [FK_TbProfessor_TbFaseNotaAluno_Auditoria]
-- GO



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

IF	EXISTS		( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbFreqProfessorPermissao'	AND COLUMN_NAME = 'IdProfessor' )
	AND	EXISTS	( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbProfessor'				AND COLUMN_NAME = 'IdProfessor' )
	BEGIN
		ALTER TABLE [dbo].[TbFreqProfessorPermissao] WITH CHECK ADD  CONSTRAINT [FK_TbFreqProfessorPermissao_TbProfessor] FOREIGN KEY([IdProfessor]) REFERENCES [dbo].[TbProfessor] ([IdProfessor])                                                                      

		ALTER TABLE [dbo].[TbFreqProfessorPermissao] CHECK CONSTRAINT [FK_TbFreqProfessorPermissao_TbProfessor]
	END

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

IF	EXISTS		( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbTurmaProfessor'	AND COLUMN_NAME = 'IdProfessorAlteracao' )
	AND	EXISTS	( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbProfessor'		AND COLUMN_NAME = 'IdProfessor' )
	BEGIN
		ALTER TABLE [dbo].[TbTurmaProfessor] WITH CHECK ADD  CONSTRAINT [FK_TbAlunoProfessor_TbProfessor_IdProfessorAlteracao] FOREIGN KEY([IdProfessorAlteracao]) REFERENCES [dbo].[TbProfessor] ([IdProfessor])                                                        

		ALTER TABLE [dbo].[TbTurmaProfessor] CHECK CONSTRAINT [FK_TbAlunoProfessor_TbProfessor_IdProfessorAlteracao]
	END



-- NOVO
IF	EXISTS		( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbAlunoCurso'	AND COLUMN_NAME = 'IdOrientadorMonografia' )
	AND	EXISTS	( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbProfessor'	AND COLUMN_NAME = 'IdProfessor' )
	BEGIN
		ALTER TABLE [dbo].[TbAlunoCurso]  WITH CHECK ADD  CONSTRAINT [FK_TbAlunoCurso_OrientadorMonografia] FOREIGN KEY([IdOrientadorMonografia])		REFERENCES [dbo].[TbProfessor] ([IdProfessor])

		ALTER TABLE [dbo].[TbAlunoCurso] CHECK CONSTRAINT [FK_TbAlunoCurso_OrientadorMonografia]
	END







------- TERCEIRO SCRIPT
------- TERCEIRO SCRIPT
------- TERCEIRO SCRIPT



IF OBJECT_ID('dbo.[FK_TbParametroInternet_InscrEvento_IdSituacaoAlunoTurmaParticipante]') IS NOT NULL 
	BEGIN
		ALTER TABLE dbo.[TbParametroInternet] DROP CONSTRAINT FK_TbParametroInternet_InscrEvento_IdSituacaoAlunoTurmaParticipante
	END


ALTER TABLE [dbo].[TbAlunoTurma] DROP CONSTRAINT [FK_TbAlunoTurma_TbSituacaoAlunoTurma]
GO
ALTER TABLE [dbo].[TbParametroInternet] DROP CONSTRAINT [FK_TbParametroInternet_InscrTurma_IdSituacaoAlunoTurmaComVaga]
GO
ALTER TABLE [dbo].[TbParametroInternet] DROP CONSTRAINT [FK_TbParametroInternet_InscrTurma_IdSituacaoAlunoTurmaSemVaga]
GO
ALTER TABLE [dbo].[TbParametroInternet] DROP CONSTRAINT [FK_TbParametroInternet_RMOnLine_TbSituacaoAlunoTurma]
GO
ALTER TABLE [dbo].[TbParametroInternet] DROP CONSTRAINT [FK_TbParametroInternet_FInscr_TbSituacaoAlunoTurma]
GO
ALTER TABLE [dbo].[TbSerie] DROP CONSTRAINT [FK_TbSerie_TbSituacaoAlunoTurma4]
GO
ALTER TABLE [dbo].[TbSerie] DROP CONSTRAINT [FK_TbSerie_TbSituacaoAlunoTurma3]
GO
ALTER TABLE [dbo].[TbSerie] DROP CONSTRAINT [FK_TbSerie_TbSituacaoAlunoTurma1]
GO
ALTER TABLE [dbo].[TbSerie] DROP CONSTRAINT [FK_TbSerie_TbSituacaoAlunoTurma2]
GO
ALTER TABLE [dbo].[TbSituacaoAlunoTurmaPagamento] DROP CONSTRAINT [FK_TbSituacaoAlunoTurmaPagamento_TbSituacaoAlunoTurmaDestino]
GO
ALTER TABLE [dbo].[TbSituacaoAlunoTurmaPagamento] DROP CONSTRAINT [FK_TbSituacaoAlunoTurmaPagamento_TbSituacaoAlunoTurmaOrigem]
GO
ALTER TABLE [dbo].[TbTurma] DROP CONSTRAINT [FK_TbTurma_TbSituacaoAlunoTurma]
GO

-- 22Out20
ALTER TABLE [dbo].[TbParametroInternet] DROP CONSTRAINT [FK_TbParametroInternet_InscrEvento_IdSituacaoAlunoTurmaParticipante]
GO

ALTER TABLE [dbo].[TbTurma] DROP CONSTRAINT [FK_TbTurma_TbSituacaoAlunoTurma]
GO

ALTER TABLE [dbo].[TbSituacaoAlunoTurmaPagamento] DROP CONSTRAINT [FK_TbSituacaoAlunoTurmaPagamento_TbSituacaoAlunoTurmaOrigem]
GO

ALTER TABLE [dbo].[TbSituacaoAlunoTurmaPagamento] DROP CONSTRAINT [FK_TbSituacaoAlunoTurmaPagamento_TbSituacaoAlunoTurmaDestino]
GO

ALTER TABLE [dbo].[TbSerie] DROP CONSTRAINT [FK_TbSerie_TbSituacaoAlunoTurma2]
GO

ALTER TABLE [dbo].[TbSerie] DROP CONSTRAINT [FK_TbSerie_TbSituacaoAlunoTurma1]
GO

ALTER TABLE [dbo].[TbSerie] DROP CONSTRAINT [FK_TbSerie_TbSituacaoAlunoTurma3]
GO

ALTER TABLE [dbo].[TbSerie] DROP CONSTRAINT [FK_TbSerie_TbSituacaoAlunoTurma4]
GO

ALTER TABLE [dbo].[TbParametroInternet] DROP CONSTRAINT [FK_TbParametroInternet_FInscr_TbSituacaoAlunoTurma]
GO

ALTER TABLE [dbo].[TbParametroInternet] DROP CONSTRAINT [FK_TbParametroInternet_RMOnLine_TbSituacaoAlunoTurma]
GO

ALTER TABLE [dbo].[TbParametroInternet] DROP CONSTRAINT [FK_TbParametroInternet_InscrTurma_IdSituacaoAlunoTurmaSemVaga]
GO

ALTER TABLE [dbo].[TbParametroInternet] DROP CONSTRAINT [FK_TbParametroInternet_InscrTurma_IdSituacaoAlunoTurmaComVaga]
GO

ALTER TABLE [dbo].[TbAlunoTurma] DROP CONSTRAINT [FK_TbAlunoTurma_TbSituacaoAlunoTurma]
GO

ALTER TABLE [dbo].[TbParametroAssinaturaEletronica] DROP CONSTRAINT [FK_TbModeloContrato_TbSituacaoAlunoTurma]
GO

--

	ALTER TABLE [dbo].[TbSituacaoAlunoTurma] DROP CONSTRAINT [PK_TbSituacaoAlunoTurma]
	GO


	ALTER TABLE [dbo].[TbSituacaoAlunoTurma] ADD  CONSTRAINT [PK_TbSituacaoAlunoTurma] PRIMARY KEY CLUSTERED 
	(
			[IdSituacaoAlunoTurma] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
	GO


-- 22222Out20
ALTER TABLE [dbo].[TbParametroAssinaturaEletronica]  WITH CHECK ADD  CONSTRAINT [FK_TbModeloContrato_TbSituacaoAlunoTurma] FOREIGN KEY([IdSituacaoAlunoTurmaDestino])
REFERENCES [dbo].[TbSituacaoAlunoTurma] ([IdSituacaoAlunoTurma])
GO

ALTER TABLE [dbo].[TbParametroAssinaturaEletronica] CHECK CONSTRAINT [FK_TbModeloContrato_TbSituacaoAlunoTurma]
GO


ALTER TABLE [dbo].[TbAlunoTurma]  WITH CHECK ADD  CONSTRAINT [FK_TbAlunoTurma_TbSituacaoAlunoTurma] FOREIGN KEY([IdSituacaoAlunoTurma])
REFERENCES [dbo].[TbSituacaoAlunoTurma] ([IdSituacaoAlunoTurma])
GO

ALTER TABLE [dbo].[TbAlunoTurma] CHECK CONSTRAINT [FK_TbAlunoTurma_TbSituacaoAlunoTurma]
GO


ALTER TABLE [dbo].[TbParametroInternet]  WITH CHECK ADD  CONSTRAINT [FK_TbParametroInternet_InscrTurma_IdSituacaoAlunoTurmaComVaga] FOREIGN KEY([InscrTurma_IdSituacaoAlunoTurmaComVaga])
REFERENCES [dbo].[TbSituacaoAlunoTurma] ([IdSituacaoAlunoTurma])
GO

ALTER TABLE [dbo].[TbParametroInternet] CHECK CONSTRAINT [FK_TbParametroInternet_InscrTurma_IdSituacaoAlunoTurmaComVaga]
GO


ALTER TABLE [dbo].[TbParametroInternet]  WITH CHECK ADD  CONSTRAINT [FK_TbParametroInternet_InscrTurma_IdSituacaoAlunoTurmaSemVaga] FOREIGN KEY([InscrTurma_IdSituacaoAlunoTurmaSemVaga])
REFERENCES [dbo].[TbSituacaoAlunoTurma] ([IdSituacaoAlunoTurma])
GO

ALTER TABLE [dbo].[TbParametroInternet] CHECK CONSTRAINT [FK_TbParametroInternet_InscrTurma_IdSituacaoAlunoTurmaSemVaga]
GO

ALTER TABLE [dbo].[TbParametroInternet]  WITH CHECK ADD  CONSTRAINT [FK_TbParametroInternet_RMOnLine_TbSituacaoAlunoTurma] FOREIGN KEY([RMOnLine_IdSituacaoAlunoTurma])
REFERENCES [dbo].[TbSituacaoAlunoTurma] ([IdSituacaoAlunoTurma])
GO

ALTER TABLE [dbo].[TbParametroInternet] CHECK CONSTRAINT [FK_TbParametroInternet_RMOnLine_TbSituacaoAlunoTurma]
GO


ALTER TABLE [dbo].[TbParametroInternet]  WITH CHECK ADD  CONSTRAINT [FK_TbParametroInternet_FInscr_TbSituacaoAlunoTurma] FOREIGN KEY([FInscr_IdSituacaoAlunoTurma])
REFERENCES [dbo].[TbSituacaoAlunoTurma] ([IdSituacaoAlunoTurma])
GO

ALTER TABLE [dbo].[TbParametroInternet] CHECK CONSTRAINT [FK_TbParametroInternet_FInscr_TbSituacaoAlunoTurma]
GO


ALTER TABLE [dbo].[TbParametroInternet]  WITH CHECK ADD  CONSTRAINT [FK_TbParametroInternet_InscrEvento_IdSituacaoAlunoTurmaParticipante] FOREIGN KEY([InscrEvento_IdSituacaoAlunoTurmaParticipante])
REFERENCES [dbo].[TbSituacaoAlunoTurma] ([IdSituacaoAlunoTurma])
GO

ALTER TABLE [dbo].[TbParametroInternet] CHECK CONSTRAINT [FK_TbParametroInternet_InscrEvento_IdSituacaoAlunoTurmaParticipante]
GO


ALTER TABLE [dbo].[TbTurma]  WITH CHECK ADD  CONSTRAINT [FK_TbTurma_TbSituacaoAlunoTurma] FOREIGN KEY([FInscr_IdSituacaoAlunoTurma])
REFERENCES [dbo].[TbSituacaoAlunoTurma] ([IdSituacaoAlunoTurma])
GO

ALTER TABLE [dbo].[TbTurma] CHECK CONSTRAINT [FK_TbTurma_TbSituacaoAlunoTurma]
GO


ALTER TABLE [dbo].[TbSituacaoAlunoTurmaPagamento]  WITH CHECK ADD  CONSTRAINT [FK_TbSituacaoAlunoTurmaPagamento_TbSituacaoAlunoTurmaOrigem] FOREIGN KEY([IdSituacaoAlunoTurmaOrigem])
REFERENCES [dbo].[TbSituacaoAlunoTurma] ([IdSituacaoAlunoTurma])
GO

ALTER TABLE [dbo].[TbSituacaoAlunoTurmaPagamento] CHECK CONSTRAINT [FK_TbSituacaoAlunoTurmaPagamento_TbSituacaoAlunoTurmaOrigem]
GO


ALTER TABLE [dbo].[TbSituacaoAlunoTurmaPagamento]  WITH CHECK ADD  CONSTRAINT [FK_TbSituacaoAlunoTurmaPagamento_TbSituacaoAlunoTurmaDestino] FOREIGN KEY([IdSituacaoAlunoTurmaDestino])
REFERENCES [dbo].[TbSituacaoAlunoTurma] ([IdSituacaoAlunoTurma])
GO

ALTER TABLE [dbo].[TbSituacaoAlunoTurmaPagamento] CHECK CONSTRAINT [FK_TbSituacaoAlunoTurmaPagamento_TbSituacaoAlunoTurmaDestino]
GO


ALTER TABLE [dbo].[TbSerie]  WITH CHECK ADD  CONSTRAINT [FK_TbSerie_TbSituacaoAlunoTurma2] FOREIGN KEY([IdSituacaoAlunoTurmaAprovado])
REFERENCES [dbo].[TbSituacaoAlunoTurma] ([IdSituacaoAlunoTurma])
GO

ALTER TABLE [dbo].[TbSerie] CHECK CONSTRAINT [FK_TbSerie_TbSituacaoAlunoTurma2]
GO



----

ALTER TABLE [dbo].[TbSerie]  WITH CHECK ADD  CONSTRAINT [FK_TbSerie_TbSituacaoAlunoTurma1] FOREIGN KEY([IdSituacaoAlunoTurmaCursando])
REFERENCES [dbo].[TbSituacaoAlunoTurma] ([IdSituacaoAlunoTurma])
GO

ALTER TABLE [dbo].[TbSerie] CHECK CONSTRAINT [FK_TbSerie_TbSituacaoAlunoTurma1]
GO

ALTER TABLE [dbo].[TbSerie]  WITH CHECK ADD  CONSTRAINT [FK_TbSerie_TbSituacaoAlunoTurma4] FOREIGN KEY([IdSituacaoAlunoTurmaReprovado])
REFERENCES [dbo].[TbSituacaoAlunoTurma] ([IdSituacaoAlunoTurma])
GO

ALTER TABLE [dbo].[TbSerie] CHECK CONSTRAINT [FK_TbSerie_TbSituacaoAlunoTurma4]
GO

ALTER TABLE [dbo].[TbSerie]  WITH CHECK ADD  CONSTRAINT [FK_TbSerie_TbSituacaoAlunoTurma3] FOREIGN KEY([IdSituacaoAlunoTurmaPParcial])
REFERENCES [dbo].[TbSituacaoAlunoTurma] ([IdSituacaoAlunoTurma])
GO

ALTER TABLE [dbo].[TbSerie] CHECK CONSTRAINT [FK_TbSerie_TbSituacaoAlunoTurma3]
GO
--
                                                                                                                                                                                                                                                                 
-- ALTER TABLE [dbo].[TbAlunoTurma] WITH CHECK ADD  CONSTRAINT [FK_TbAlunoTurma_TbSituacaoAlunoTurma] FOREIGN KEY([IdSituacaoAlunoTurma]) REFERENCES [dbo].[TbSituacaoAlunoTurma] ([IdSituacaoAlunoTurma])                                                          
-- GO
-- ALTER TABLE [dbo].[TbAlunoTurma] CHECK CONSTRAINT [FK_TbAlunoTurma_TbSituacaoAlunoTurma]
-- GO

-- ALTER TABLE [dbo].[TbParametroInternet] WITH CHECK ADD  CONSTRAINT [FK_TbParametroInternet_InscrTurma_IdSituacaoAlunoTurmaComVaga] FOREIGN KEY([InscrTurma_IdSituacaoAlunoTurmaComVaga]) REFERENCES [dbo].[TbSituacaoAlunoTurma] ([IdSituacaoAlunoTurma])        
-- GO
-- ALTER TABLE [dbo].[TbParametroInternet] CHECK CONSTRAINT [FK_TbParametroInternet_InscrTurma_IdSituacaoAlunoTurmaComVaga]
-- GO

-- ALTER TABLE [dbo].[TbParametroInternet] WITH CHECK ADD  CONSTRAINT [FK_TbParametroInternet_InscrTurma_IdSituacaoAlunoTurmaSemVaga] FOREIGN KEY([InscrTurma_IdSituacaoAlunoTurmaSemVaga]) REFERENCES [dbo].[TbSituacaoAlunoTurma] ([IdSituacaoAlunoTurma])        
-- GO
-- ALTER TABLE [dbo].[TbParametroInternet] CHECK CONSTRAINT [FK_TbParametroInternet_InscrTurma_IdSituacaoAlunoTurmaSemVaga]
-- GO

-- ALTER TABLE [dbo].[TbParametroInternet] WITH CHECK ADD  CONSTRAINT [FK_TbParametroInternet_RMOnLine_TbSituacaoAlunoTurma] FOREIGN KEY([RMOnLine_IdSituacaoAlunoTurma]) REFERENCES [dbo].[TbSituacaoAlunoTurma] ([IdSituacaoAlunoTurma])                          
-- GO
-- ALTER TABLE [dbo].[TbParametroInternet] CHECK CONSTRAINT [FK_TbParametroInternet_RMOnLine_TbSituacaoAlunoTurma]
-- GO

-- ALTER TABLE [dbo].[TbParametroInternet] WITH CHECK ADD  CONSTRAINT [FK_TbParametroInternet_FInscr_TbSituacaoAlunoTurma] FOREIGN KEY([FInscr_IdSituacaoAlunoTurma]) REFERENCES [dbo].[TbSituacaoAlunoTurma] ([IdSituacaoAlunoTurma])                              
-- GO
-- ALTER TABLE [dbo].[TbParametroInternet] CHECK CONSTRAINT [FK_TbParametroInternet_FInscr_TbSituacaoAlunoTurma]
-- GO


----

-- ALTER TABLE [dbo].[TbSerie] WITH CHECK ADD  CONSTRAINT [FK_TbSerie_TbSituacaoAlunoTurma4] FOREIGN KEY([IdSituacaoAlunoTurmaReprovado]) REFERENCES [dbo].[TbSituacaoAlunoTurma] ([IdSituacaoAlunoTurma])                                                          
-- GO
-- ALTER TABLE [dbo].[TbSerie] CHECK CONSTRAINT [FK_TbSerie_TbSituacaoAlunoTurma4]
-- GO

-- ALTER TABLE [dbo].[TbSerie] WITH CHECK ADD  CONSTRAINT [FK_TbSerie_TbSituacaoAlunoTurma3] FOREIGN KEY([IdSituacaoAlunoTurmaPParcial]) REFERENCES [dbo].[TbSituacaoAlunoTurma] ([IdSituacaoAlunoTurma])                                                           
-- GO
-- ALTER TABLE [dbo].[TbSerie] CHECK CONSTRAINT [FK_TbSerie_TbSituacaoAlunoTurma3]
-- GO

-- ALTER TABLE [dbo].[TbSerie] WITH CHECK ADD  CONSTRAINT [FK_TbSerie_TbSituacaoAlunoTurma1] FOREIGN KEY([IdSituacaoAlunoTurmaCursando]) REFERENCES [dbo].[TbSituacaoAlunoTurma] ([IdSituacaoAlunoTurma])                                                           
-- GO
-- ALTER TABLE [dbo].[TbSerie] CHECK CONSTRAINT [FK_TbSerie_TbSituacaoAlunoTurma1]
-- GO

-- ALTER TABLE [dbo].[TbSerie] WITH CHECK ADD  CONSTRAINT [FK_TbSerie_TbSituacaoAlunoTurma2] FOREIGN KEY([IdSituacaoAlunoTurmaAprovado]) REFERENCES [dbo].[TbSituacaoAlunoTurma] ([IdSituacaoAlunoTurma])                                                           
-- GO
-- ALTER TABLE [dbo].[TbSerie] CHECK CONSTRAINT [FK_TbSerie_TbSituacaoAlunoTurma2]
-- GO

-- ALTER TABLE [dbo].[TbSituacaoAlunoTurmaPagamento] WITH CHECK ADD  CONSTRAINT [FK_TbSituacaoAlunoTurmaPagamento_TbSituacaoAlunoTurmaDestino] FOREIGN KEY([IdSituacaoAlunoTurmaDestino]) REFERENCES [dbo].[TbSituacaoAlunoTurma] ([IdSituacaoAlunoTurma])          
-- GO
-- ALTER TABLE [dbo].[TbSituacaoAlunoTurmaPagamento] CHECK CONSTRAINT [FK_TbSituacaoAlunoTurmaPagamento_TbSituacaoAlunoTurmaDestino]
-- GO

-- ALTER TABLE [dbo].[TbSituacaoAlunoTurmaPagamento] WITH CHECK ADD  CONSTRAINT [FK_TbSituacaoAlunoTurmaPagamento_TbSituacaoAlunoTurmaOrigem] FOREIGN KEY([IdSituacaoAlunoTurmaOrigem]) REFERENCES [dbo].[TbSituacaoAlunoTurma] ([IdSituacaoAlunoTurma])            
-- GO
-- ALTER TABLE [dbo].[TbSituacaoAlunoTurmaPagamento] CHECK CONSTRAINT [FK_TbSituacaoAlunoTurmaPagamento_TbSituacaoAlunoTurmaOrigem]
-- GO

-- ALTER TABLE [dbo].[TbTurma] WITH CHECK ADD  CONSTRAINT [FK_TbTurma_TbSituacaoAlunoTurma] FOREIGN KEY([FInscr_IdSituacaoAlunoTurma]) REFERENCES [dbo].[TbSituacaoAlunoTurma] ([IdSituacaoAlunoTurma])                                                             
-- GO
-- ALTER TABLE [dbo].[TbTurma] CHECK CONSTRAINT [FK_TbTurma_TbSituacaoAlunoTurma]
-- GO
---

-- NOVO
-- IF	EXISTS		( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbParametroInternet'	AND COLUMN_NAME = 'InscrEvento_IdSituacaoAlunoTurmaParticipante' )
-- 	AND	EXISTS	( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbSituacaoAlunoTurma'	AND COLUMN_NAME = 'IdSituacaoAlunoTurma' )
-- 	BEGIN
-- 		ALTER TABLE [dbo].[TbParametroInternet]  WITH CHECK ADD  CONSTRAINT [FK_TbParametroInternet_InscrEvento_IdSituacaoAlunoTurmaParticipante] FOREIGN KEY([InscrEvento_IdSituacaoAlunoTurmaParticipante])
-- 		REFERENCES [dbo].[TbSituacaoAlunoTurma] ([IdSituacaoAlunoTurma])

-- 		ALTER TABLE [dbo].[TbParametroInternet] CHECK CONSTRAINT [FK_TbParametroInternet_InscrEvento_IdSituacaoAlunoTurmaParticipante]
-- 	END







------ QUARTO SCRIPT -- 22Out20 - - Continuar a partir de TbUnidade no Darwin


IF OBJECT_ID('dbo.[FK_TbCaptacaoParametro_TbUnidade]') IS NOT NULL 
	BEGIN
		ALTER TABLE dbo.[TbCaptacaoParametro] DROP CONSTRAINT FK_TbCaptacaoParametro_TbUnidade
	END
go


ALTER TABLE [dbo].[TbAbatimento] DROP CONSTRAINT [FK_TbAbatimento_TbUnidade]
GO
ALTER TABLE [dbo].[TbAluno] DROP CONSTRAINT [FK_TbAluno_TbUnidade]
GO
ALTER TABLE [dbo].[TbCaixa] DROP CONSTRAINT [FK_TbCaixa_TbUnidade]
GO
IF OBJECT_ID('dbo.FK_TbCaptacaoAlunoInteressado_TbUnidade') IS NOT NULL
BEGIN
	ALTER TABLE [dbo].[TbCaptacaoAlunoInteressado] DROP CONSTRAINT [FK_TbCaptacaoAlunoInteressado_TbUnidade]
END

ALTER TABLE [dbo].[TbCentroResultado] DROP CONSTRAINT [FK_TbCentroResultado_TbUnidade]
GO
ALTER TABLE [dbo].[TbConta] DROP CONSTRAINT [FK_TbConta_TbUnidade]
GO
ALTER TABLE [dbo].[TbCurso] DROP CONSTRAINT [FK_TbCurso_TbUnidade]
GO
ALTER TABLE [dbo].[TbCursoSuperior] DROP CONSTRAINT [FK_TbCursoSuperior_TbUnidade]
GO
IF OBJECT_ID('dbo.FK_TbDadosUso_TbUnidade') IS NOT NULL
BEGIN
	ALTER TABLE [dbo].[TbDadosUso] DROP CONSTRAINT [FK_TbDadosUso_TbUnidade]
END

ALTER TABLE [dbo].[TbEmpresa] DROP CONSTRAINT [FK_TbEmpresa_TbUnidade1]
GO
IF OBJECT_ID('dbo.FK_TbFaseNotaAluno_FilaProcessamento_TbUnidade') IS NOT NULL
BEGIN
	ALTER TABLE [dbo].[TbFaseNotaAluno_FilaProcessamento] DROP CONSTRAINT [FK_TbFaseNotaAluno_FilaProcessamento_TbUnidade]
END

ALTER TABLE [dbo].[TbFavorecido] DROP CONSTRAINT [FK_TbFavorecido_TbUnidade]
GO
ALTER TABLE [dbo].[TbFeriado] DROP CONSTRAINT [FK_TbFeriado_TbUnidade]
GO
ALTER TABLE [dbo].[TbFormula] DROP CONSTRAINT [FK_TbFormula_TbUnidade]
GO
ALTER TABLE [dbo].[TbInformativo] DROP CONSTRAINT [FK_TbInformativo_TbUnidade]
GO
ALTER TABLE [dbo].[TbNotaConceito] DROP CONSTRAINT [FK_TbNotaConceito_TbUnidade]
GO
ALTER TABLE [dbo].[TbParcelaCobranca] DROP CONSTRAINT [FK_TbParcelaCobranca_TbUnidade]
GO
ALTER TABLE [dbo].[TbPlanoContas] DROP CONSTRAINT [FK_TbPlanoContas_TbUnidade]
GO
ALTER TABLE [dbo].[TbProfessor] DROP CONSTRAINT [FK_TbProfessor_TbUnidade]
GO
ALTER TABLE [dbo].[TbResponsavel] DROP CONSTRAINT [FK_TbResponsavel_TbUnidade]
GO
ALTER TABLE [dbo].[TbSala] DROP CONSTRAINT [FK_TbSala_TbUnidade]
GO
ALTER TABLE [dbo].[TbTextoPersonalizado] DROP CONSTRAINT [FK_TbTextoPersonalizado_TbUnidade]
GO
IF OBJECT_ID('dbo.FK_TbUsuario_TbUnidade') IS NOT NULL
BEGIN
	ALTER TABLE [dbo].[TbUsuario] DROP CONSTRAINT [FK_TbUsuario_TbUnidade]
END

ALTER TABLE [dbo].[TbUsuarioUnidade] DROP CONSTRAINT [FK_TbUsuarioUnidade_TbUnidade]
GO

-- novo
IF OBJECT_ID('dbo.FK_TbCaptacaoCursoInteresse_TbUnidade') IS NOT NULL
BEGIN
	ALTER TABLE [dbo].[TbCaptacaoCursoInteresse] DROP CONSTRAINT [FK_TbCaptacaoCursoInteresse_TbUnidade]
END

IF OBJECT_ID('dbo.FK_TbAvaliacao_TbUnidade') IS NOT NULL
BEGIN
	ALTER TABLE [dbo].[TbAvaliacao] DROP CONSTRAINT [FK_TbAvaliacao_TbUnidade]
END

IF OBJECT_ID('dbo.FK_TbCaptacaoParametro_TbUnidade') IS NOT NULL
BEGIN
	ALTER TABLE [dbo].[TbCaptacaoParametro] DROP CONSTRAINT [FK_TbCaptacaoParametro_TbUnidade]
END

-- 12Maio20
IF OBJECT_ID('dbo.FK_TbAvaliacaoParametro_TbUnidade') IS NOT NULL
BEGIN
	ALTER TABLE [dbo].[TbAvaliacaoParametro] DROP CONSTRAINT [FK_TbAvaliacaoParametro_TbUnidade]
END

-- 31Jul
ALTER TABLE [dbo].[TbEducacensoUnidade] DROP CONSTRAINT [FK_TbEducacensoUnidade_TbUnidade]
GO




-- 17Jan21

ALTER TABLE [dbo].[TbDocumentoSignatario] DROP CONSTRAINT [FK_TbDocumentoSignatario_TbDocumento]
GO


ALTER TABLE [dbo].[TbParametroAssinaturaEletronica] DROP CONSTRAINT [FK_TbDocumentoSignatario_TbUnidade]
GO

ALTER TABLE [dbo].[TbDocumento] DROP CONSTRAINT [FK_TbDocumento_TbUnidade]
GO

-- NOME PK ERRADOS
ALTER TABLE [dbo].[TbUnidadeTermoConsentimento] DROP CONSTRAINT [FK__TbUnidade__IdUni__0C34D145]
GO


	ALTER TABLE [dbo].[TbUnidade] DROP CONSTRAINT [PK_TbUnidade]
	GO


	ALTER TABLE [dbo].[TbUnidade] ADD  CONSTRAINT [PK_TbUnidade] PRIMARY KEY CLUSTERED 
	(
			[IdUnidade] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
	GO

-- 22Out20
ALTER TABLE [dbo].[TbFavorecido]  WITH CHECK ADD  CONSTRAINT [FK_TbFavorecido_TbUnidade] FOREIGN KEY([IdUnidade])
REFERENCES [dbo].[TbUnidade] ([IdUnidade])
GO

ALTER TABLE [dbo].[TbFavorecido] CHECK CONSTRAINT [FK_TbFavorecido_TbUnidade]
GO

ALTER TABLE [dbo].[TbFeriado]  WITH CHECK ADD  CONSTRAINT [FK_TbFeriado_TbUnidade] FOREIGN KEY([IdUnidade])
REFERENCES [dbo].[TbUnidade] ([IdUnidade])
GO

ALTER TABLE [dbo].[TbFeriado] CHECK CONSTRAINT [FK_TbFeriado_TbUnidade]
GO



ALTER TABLE [dbo].[TbFormula]  WITH CHECK ADD  CONSTRAINT [FK_TbFormula_TbUnidade] FOREIGN KEY([IdUnidade])
REFERENCES [dbo].[TbUnidade] ([IdUnidade])
GO

ALTER TABLE [dbo].[TbFormula] CHECK CONSTRAINT [FK_TbFormula_TbUnidade]
GO



ALTER TABLE [dbo].[TbInformativo]  WITH CHECK ADD  CONSTRAINT [FK_TbInformativo_TbUnidade] FOREIGN KEY([IdUnidade])
REFERENCES [dbo].[TbUnidade] ([IdUnidade])
GO

ALTER TABLE [dbo].[TbInformativo] CHECK CONSTRAINT [FK_TbInformativo_TbUnidade]
GO


ALTER TABLE [dbo].[TbNotaConceito]  WITH CHECK ADD  CONSTRAINT [FK_TbNotaConceito_TbUnidade] FOREIGN KEY([IdUnidade])
REFERENCES [dbo].[TbUnidade] ([IdUnidade])
GO

ALTER TABLE [dbo].[TbNotaConceito] CHECK CONSTRAINT [FK_TbNotaConceito_TbUnidade]
GO


ALTER TABLE [dbo].[TbParcelaCobranca]  WITH CHECK ADD  CONSTRAINT [FK_TbParcelaCobranca_TbUnidade] FOREIGN KEY([IdUnidade])
REFERENCES [dbo].[TbUnidade] ([IdUnidade])
GO

ALTER TABLE [dbo].[TbParcelaCobranca] CHECK CONSTRAINT [FK_TbParcelaCobranca_TbUnidade]
GO


ALTER TABLE [dbo].[TbPlanoContas]  WITH CHECK ADD  CONSTRAINT [FK_TbPlanoContas_TbUnidade] FOREIGN KEY([IdUnidade])
REFERENCES [dbo].[TbUnidade] ([IdUnidade])
GO

ALTER TABLE [dbo].[TbPlanoContas] CHECK CONSTRAINT [FK_TbPlanoContas_TbUnidade]
GO

--


-- 31Jul
ALTER TABLE [dbo].[TbEducacensoUnidade]  WITH CHECK ADD  CONSTRAINT [FK_TbEducacensoUnidade_TbUnidade] FOREIGN KEY([IdUnidade]) REFERENCES [dbo].[TbUnidade] ([IdUnidade])
GO

ALTER TABLE [dbo].[TbEducacensoUnidade] CHECK CONSTRAINT [FK_TbEducacensoUnidade_TbUnidade]
GO


ALTER TABLE [dbo].[TbAbatimento] WITH CHECK ADD  CONSTRAINT [FK_TbAbatimento_TbUnidade] FOREIGN KEY([IdUnidade]) REFERENCES [dbo].[TbUnidade] ([IdUnidade])                                                                                                      
GO
ALTER TABLE [dbo].[TbAbatimento] CHECK CONSTRAINT [FK_TbAbatimento_TbUnidade]
GO

ALTER TABLE [dbo].[TbAluno] WITH CHECK ADD  CONSTRAINT [FK_TbAluno_TbUnidade] FOREIGN KEY([IdUnidade]) REFERENCES [dbo].[TbUnidade] ([IdUnidade])                                                                                                                
GO
ALTER TABLE [dbo].[TbAluno] CHECK CONSTRAINT [FK_TbAluno_TbUnidade]
GO

ALTER TABLE [dbo].[TbCaixa] WITH CHECK ADD  CONSTRAINT [FK_TbCaixa_TbUnidade] FOREIGN KEY([IdUnidade]) REFERENCES [dbo].[TbUnidade] ([IdUnidade])                                                                                                                
GO
ALTER TABLE [dbo].[TbCaixa] CHECK CONSTRAINT [FK_TbCaixa_TbUnidade]
GO

IF	EXISTS		( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbCaptacaoAlunoInteressado'	AND COLUMN_NAME = 'IdUnidade' )
	AND	EXISTS	( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbUnidade'					AND COLUMN_NAME = 'IdUnidade' )
	BEGIN
		ALTER TABLE [dbo].[TbCaptacaoAlunoInteressado] WITH CHECK ADD  CONSTRAINT [FK_TbCaptacaoAlunoInteressado_TbUnidade] FOREIGN KEY([IdUnidade]) REFERENCES [dbo].[TbUnidade] ([IdUnidade])                                                                          

		ALTER TABLE [dbo].[TbCaptacaoAlunoInteressado] CHECK CONSTRAINT [FK_TbCaptacaoAlunoInteressado_TbUnidade]
	END

ALTER TABLE [dbo].[TbCentroResultado] WITH CHECK ADD  CONSTRAINT [FK_TbCentroResultado_TbUnidade] FOREIGN KEY([IdUnidade]) REFERENCES [dbo].[TbUnidade] ([IdUnidade])                                                                                            
GO
ALTER TABLE [dbo].[TbCentroResultado] CHECK CONSTRAINT [FK_TbCentroResultado_TbUnidade]
GO

ALTER TABLE [dbo].[TbConta] WITH CHECK ADD  CONSTRAINT [FK_TbConta_TbUnidade] FOREIGN KEY([IdUnidade]) REFERENCES [dbo].[TbUnidade] ([IdUnidade])                                                                                                                
GO
ALTER TABLE [dbo].[TbConta] CHECK CONSTRAINT [FK_TbConta_TbUnidade]
GO

ALTER TABLE [dbo].[TbCurso] WITH CHECK ADD  CONSTRAINT [FK_TbCurso_TbUnidade] FOREIGN KEY([IdUnidade]) REFERENCES [dbo].[TbUnidade] ([IdUnidade])                                                                                                                
GO
ALTER TABLE [dbo].[TbCurso] CHECK CONSTRAINT [FK_TbCurso_TbUnidade]
GO

ALTER TABLE [dbo].[TbCursoSuperior] WITH CHECK ADD  CONSTRAINT [FK_TbCursoSuperior_TbUnidade] FOREIGN KEY([IdUnidade]) REFERENCES [dbo].[TbUnidade] ([IdUnidade])                                                                                                
GO
ALTER TABLE [dbo].[TbCursoSuperior] CHECK CONSTRAINT [FK_TbCursoSuperior_TbUnidade]
GO

IF	EXISTS		( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbDadosUso'	AND COLUMN_NAME = 'IdUnidade' )
	AND	EXISTS	( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbUnidade'	AND COLUMN_NAME = 'IdUnidade' )
	BEGIN
		ALTER TABLE [dbo].[TbDadosUso] WITH CHECK ADD  CONSTRAINT [FK_TbDadosUso_TbUnidade] FOREIGN KEY([IdUnidade]) REFERENCES [dbo].[TbUnidade] ([IdUnidade])                                                                                                          

		ALTER TABLE [dbo].[TbDadosUso] CHECK CONSTRAINT [FK_TbDadosUso_TbUnidade]
END

-- 17JAn21 AQUI


ALTER TABLE [dbo].[TbEmpresa] WITH CHECK ADD  CONSTRAINT [FK_TbEmpresa_TbUnidade1] FOREIGN KEY([IdUnidade]) REFERENCES [dbo].[TbUnidade] ([IdUnidade])                                                                                                           
GO
ALTER TABLE [dbo].[TbEmpresa] CHECK CONSTRAINT [FK_TbEmpresa_TbUnidade1]
GO

IF	EXISTS		( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbFaseNotaAluno_FilaProcessamento'	AND COLUMN_NAME = 'IdUnidade' )
	AND	EXISTS	( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbUnidade'							AND COLUMN_NAME = 'IdUnidade' )
	BEGIN
		ALTER TABLE [dbo].[TbFaseNotaAluno_FilaProcessamento] WITH CHECK ADD  CONSTRAINT [FK_TbFaseNotaAluno_FilaProcessamento_TbUnidade] FOREIGN KEY([IdUnidade]) REFERENCES [dbo].[TbUnidade] ([IdUnidade])                                                            

		ALTER TABLE [dbo].[TbFaseNotaAluno_FilaProcessamento] CHECK CONSTRAINT [FK_TbFaseNotaAluno_FilaProcessamento_TbUnidade]
	END



ALTER TABLE [dbo].[TbProfessor] WITH CHECK ADD  CONSTRAINT [FK_TbProfessor_TbUnidade] FOREIGN KEY([IdUnidade]) REFERENCES [dbo].[TbUnidade] ([IdUnidade])                                                                                                        
GO
ALTER TABLE [dbo].[TbProfessor] CHECK CONSTRAINT [FK_TbProfessor_TbUnidade]
GO

ALTER TABLE [dbo].[TbResponsavel] WITH CHECK ADD  CONSTRAINT [FK_TbResponsavel_TbUnidade] FOREIGN KEY([IdUnidade]) REFERENCES [dbo].[TbUnidade] ([IdUnidade])                                                                                                    
GO
ALTER TABLE [dbo].[TbResponsavel] CHECK CONSTRAINT [FK_TbResponsavel_TbUnidade]
GO

ALTER TABLE [dbo].[TbSala] WITH CHECK ADD  CONSTRAINT [FK_TbSala_TbUnidade] FOREIGN KEY([IdUnidade]) REFERENCES [dbo].[TbUnidade] ([IdUnidade])                                                                                                                  
GO
ALTER TABLE [dbo].[TbSala] CHECK CONSTRAINT [FK_TbSala_TbUnidade]
GO

ALTER TABLE [dbo].[TbTextoPersonalizado] WITH CHECK ADD  CONSTRAINT [FK_TbTextoPersonalizado_TbUnidade] FOREIGN KEY([IdUnidade]) REFERENCES [dbo].[TbUnidade] ([IdUnidade])                                                                                      
GO
ALTER TABLE [dbo].[TbTextoPersonalizado] CHECK CONSTRAINT [FK_TbTextoPersonalizado_TbUnidade]
GO

IF	EXISTS		( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbUsuario'	AND COLUMN_NAME = '_IdUnidade' )
	AND	EXISTS	( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbUnidade'	AND COLUMN_NAME = 'IdUnidade' )
	BEGIN
		ALTER TABLE [dbo].[TbUsuario] WITH CHECK ADD  CONSTRAINT [FK_TbUsuario_TbUnidade] FOREIGN KEY([_IdUnidade]) REFERENCES [dbo].[TbUnidade] ([IdUnidade])                                                                                                           

		ALTER TABLE [dbo].[TbUsuario] CHECK CONSTRAINT [FK_TbUsuario_TbUnidade]
	END

ALTER TABLE [dbo].[TbUsuarioUnidade] WITH CHECK ADD  CONSTRAINT [FK_TbUsuarioUnidade_TbUnidade] FOREIGN KEY([IdUnidade]) REFERENCES [dbo].[TbUnidade] ([IdUnidade])                                                                                              
GO
ALTER TABLE [dbo].[TbUsuarioUnidade] CHECK CONSTRAINT [FK_TbUsuarioUnidade_TbUnidade]
GO

IF	EXISTS		( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbCaptacaoParametro'	AND COLUMN_NAME = 'IdUnidade' )
	AND	EXISTS	( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbUnidade'				AND COLUMN_NAME = 'IdUnidade' )
	BEGIN
		ALTER TABLE [dbo].[TbCaptacaoParametro]  WITH CHECK ADD  CONSTRAINT [FK_TbCaptacaoParametro_TbUnidade] FOREIGN KEY([IdUnidade]) REFERENCES [dbo].[TbUnidade] ([IdUnidade])

		ALTER TABLE [dbo].[TbCaptacaoParametro] CHECK CONSTRAINT [FK_TbCaptacaoParametro_TbUnidade]
	END
GO



IF	EXISTS		( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbCaptacaoCursoInteresse'	AND COLUMN_NAME = 'IdUnidade' )
	AND	EXISTS	( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbUnidade'					AND COLUMN_NAME = 'IdUnidade' )
	BEGIN
		ALTER TABLE [dbo].[TbCaptacaoCursoInteresse]  WITH CHECK ADD  CONSTRAINT [FK_TbCaptacaoCursoInteresse_TbUnidade] FOREIGN KEY([IdUnidade]) REFERENCES [dbo].[TbUnidade] ([IdUnidade])

		ALTER TABLE [dbo].[TbCaptacaoCursoInteresse] CHECK CONSTRAINT [FK_TbCaptacaoCursoInteresse_TbUnidade]
	END

---
IF	EXISTS		( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbAvaliacao'	AND COLUMN_NAME = 'IdUnidade' )
	AND	EXISTS	( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbUnidade'		AND COLUMN_NAME = 'IdUnidade' )
	BEGIN
		ALTER TABLE [dbo].[TbAvaliacao]  WITH CHECK ADD  CONSTRAINT [FK_TbAvaliacao_TbUnidade] FOREIGN KEY([IdUnidade])	REFERENCES [dbo].[TbUnidade] ([IdUnidade])

		ALTER TABLE [dbo].[TbAvaliacao] CHECK CONSTRAINT [FK_TbAvaliacao_TbUnidade]
	END
---

-- 12Maio20
ALTER TABLE [dbo].[TbAvaliacaoParametro]  WITH CHECK ADD  CONSTRAINT [FK_TbAvaliacaoParametro_TbUnidade] FOREIGN KEY([IdUnidade]) REFERENCES [dbo].[TbUnidade] ([IdUnidade])

ALTER TABLE [dbo].[TbAvaliacaoParametro] CHECK CONSTRAINT [FK_TbAvaliacaoParametro_TbUnidade]


-- 17Jan21
ALTER TABLE [dbo].[TbDocumento]  WITH CHECK ADD  CONSTRAINT [FK_TbDocumento_TbUnidade] FOREIGN KEY([IdUnidade])
REFERENCES [dbo].[TbUnidade] ([IdUnidade])
GO

ALTER TABLE [dbo].[TbDocumento] CHECK CONSTRAINT [FK_TbDocumento_TbUnidade]
GO


ALTER TABLE [dbo].[TbParametroAssinaturaEletronica]  WITH CHECK ADD  CONSTRAINT [FK_TbDocumentoSignatario_TbUnidade] FOREIGN KEY([IdUnidade])
REFERENCES [dbo].[TbUnidade] ([IdUnidade])
GO

ALTER TABLE [dbo].[TbParametroAssinaturaEletronica] CHECK CONSTRAINT [FK_TbDocumentoSignatario_TbUnidade]
GO


ALTER TABLE [dbo].[TbDocumentoSignatario]  WITH CHECK 
	ADD  CONSTRAINT [FK_TbDocumentoSignatario_TbDocumento] FOREIGN KEY([IdDocumento])	
	REFERENCES [dbo].[TbDocumento] ([IdDocumento])
GO

ALTER TABLE [dbo].[TbDocumentoSignatario] CHECK CONSTRAINT [FK_TbDocumentoSignatario_TbDocumento]
GO





ALTER TABLE [dbo].[TbUnidadeTermoConsentimento]  WITH CHECK 
	ADD  CONSTRAINT [FK_TbUnidadeTermoConsentimento_TbUnidade]   FOREIGN KEY([IdUnidade])	
	REFERENCES [dbo].[TbUnidade] ([IdUnidade])
GO
ALTER TABLE [dbo].[TbUnidadeTermoConsentimento] CHECK CONSTRAINT [FK_TbUnidadeTermoConsentimento_TbUnidade]
GO

*/
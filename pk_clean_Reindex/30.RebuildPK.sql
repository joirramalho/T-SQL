USE dbSigaSantaRosa;
-- USE dbSigaNSLourdesGravata;
-- USE dbSigaAuxilRecife;

--sp_helpindex "TbLancamentoCobranca"


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
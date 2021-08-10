USE dbSigaSaleFalcao;
-- USE dbSigaDCCJR;

SELECT DB_NAME()



-- TbTurma 
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


ALTER TABLE [dbo].[TbTurmaDisciplina_GoogleForEducation] DROP CONSTRAINT [FK_TbTurmaDisciplina_GoogleForEducation_TbTurma]
GO

-- 21jul21
ALTER TABLE [dbo].[TbServicoAdicionalTurma] DROP CONSTRAINT [FK_TbServicoAdicionalTurma_TbTurma]
GO


-- The constraint 'PK_TbTurma' is being referenced by table 'TbServicoAdicionalTurma', foreign key constraint 'FK_TbServicoAdicionalTurma_TbTurma'.



	ALTER TABLE [dbo].[TbTurma] DROP CONSTRAINT [PK_TbTurma]
	GO





-- TbTurma reCREATE	
    
    ALTER TABLE [dbo].[TbTurma] ADD  CONSTRAINT [PK_TbTurma] PRIMARY KEY CLUSTERED 
	(
		[IdTurma] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
	GO


ALTER TABLE [dbo].[TbServicoAdicionalTurma] WITH CHECK ADD CONSTRAINT [FK_TbServicoAdicionalTurma_TbTurma] FOREIGN KEY([IdTurma]) 
REFERENCES [dbo].[TbTurma] ([IdTurma]) 
GO 
ALTER TABLE [dbo].[TbServicoAdicionalTurma] CHECK CONSTRAINT [FK_TbServicoAdicionalTurma_TbTurma]
GO
	


-- 15Fev21
ALTER TABLE [dbo].[TbTurmaDisciplina_GoogleForEducation] WITH CHECK ADD CONSTRAINT [FK_TbTurmaDisciplina_GoogleForEducation_TbTurma] FOREIGN KEY([IdTurma]) 
REFERENCES [dbo].[TbTurma] ([IdTurma]) 
GO
-- ALTER TABLE [dbo].[TbTurmaDisciplina_GoogleForEducation] CHECK CONSTRAINT [FK_TbTurmaDisciplina_GoogleForEducation_TbTurma]
-- GO


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

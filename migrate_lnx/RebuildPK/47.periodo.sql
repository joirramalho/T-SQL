USE dbSigaSaleFalcao;
-- USE dbSigaDCCJR;

SELECT DB_NAME()



-- TbPeriodo 
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

-- 21jul21
ALTER TABLE [dbo].[TbServicoAdicional] DROP CONSTRAINT [FK_TbServicoAdicional_TbPeriodo]
GO



---

	ALTER TABLE [dbo].[TbPeriodo] DROP CONSTRAINT [PK_TbPeriodo]
	GO


	ALTER TABLE [dbo].[TbPeriodo] ADD  CONSTRAINT [PK_TbPeriodo] PRIMARY KEY CLUSTERED 
	(
			[IdPeriodo] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
	GO



ALTER TABLE [dbo].[TbServicoAdicional] WITH CHECK ADD CONSTRAINT [FK_TbServicoAdicional_TbPeriodo] FOREIGN KEY([IdPeriodo]) 
REFERENCES [dbo].[TbPeriodo] ([IdPeriodo]) 
GO 
ALTER TABLE [dbo].[TbServicoAdicional] CHECK CONSTRAINT [FK_TbServicoAdicional_TbPeriodo]
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

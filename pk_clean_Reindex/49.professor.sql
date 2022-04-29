USE dbSigaIntegral;


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
ALTER TABLE [dbo].[TbAlunoObs] DROP CONSTRAINT [FK_TbAlunoObs_IdProfessorRegistro]


	ALTER TABLE [dbo].[TbProfessor] DROP CONSTRAINT [PK_TbProfessor];



	ALTER TABLE [dbo].[TbProfessor] ADD  CONSTRAINT [PK_TbProfessor] PRIMARY KEY CLUSTERED 
	(
			[IdProfessor] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
	GO


ALTER TABLE dbo.TbAlunoObs ADD CONSTRAINT FK_TbAlunoObs_IdProfessorRegistro FOREIGN KEY (IdProfessorRegistro) REFERENCES dbo.TbProfessor(IdProfessor);
	
ALTER TABLE [dbo].[TbAlunoObs] CHECK CONSTRAINT [FK_TbAlunoObs_IdProfessorRegistro]

	
	
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
USE dbSigaSaleFalcao;
-- USE dbSigaDCCJR;

SELECT DB_NAME()



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

ALTER TABLE [dbo].[TbDiarioAulaChamadaOnline] DROP CONSTRAINT [FK_TbDiarioAulaChamadaOnline_TbAluno]
GO



-- TbAluno (continuacao)

ALTER TABLE [dbo].[TbAlunoTurmaDocumento] DROP CONSTRAINT [FK__TbAlunoTu__IdAlu__3EA1EC2F]
GO
-- OU
IF OBJECT_ID('dbo.FK_TbAlunoTurmaDocumento_TbAluno') IS NOT NULL
BEGIN
	ALTER TABLE [dbo].[TbAlunoTurmaDocumento] DROP CONSTRAINT [FK_TbAlunoTurmaDocumento_TbAluno]
END






	ALTER TABLE [dbo].[TbAluno] DROP CONSTRAINT [PK_TbAluno]
	GO




------------ ÍNDICES FORA DO PADRÃO
IF EXISTS( SELECT * FROM sys.indexes WHERE name='IX_TbAlunoMatriculaUnidade' AND object_id = OBJECT_ID('dbo.TbAluno') )
	BEGIN
		DROP INDEX [IX_TbAlunoMatriculaUnidade] ON [dbo].[TbAluno] WITH ( ONLINE = OFF )
	END


-- rodar em Darvin e AuxilNatal

SET ANSI_PADDING ON
GO
CREATE UNIQUE nonCLUSTERED INDEX [IX_TbAlunoMatriculaUnidade] ON [dbo].[TbAluno]
(
	[Matricula] ASC,
	[IdUnidade] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO





-- TbAluno - recriando FKs

-- EXECUTADO EM 17JAN21
		ALTER TABLE [dbo].[TbAluno] ADD  CONSTRAINT [PK_TbAluno] PRIMARY KEY CLUSTERED 
		(
				[IdAluno] ASC
		)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
		GO
---




-- 15Fv21
ALTER TABLE [dbo].[TbAlunoTurmaDocumento] WITH CHECK ADD CONSTRAINT [FK_TbAlunoTurmaDocumento_TbAluno] FOREIGN KEY([IdAluno]) 
REFERENCES [dbo].[TbAluno] ([IdAluno]) 
GO
ALTER TABLE [dbo].[TbAlunoTurmaDocumento] CHECK CONSTRAINT [FK_TbAlunoTurmaDocumento_TbAluno]
GO

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

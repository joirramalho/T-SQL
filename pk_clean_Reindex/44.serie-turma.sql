USE dbSigaCELogos;
-- USE dbSigaNSLourdesGravata;
-- USE dbSigaAuxilRecife;



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

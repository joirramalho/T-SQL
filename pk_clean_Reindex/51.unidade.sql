USE dbSigaSantissimaTrindade;


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

IF OBJECT_ID('dbo.FK_TbAvaliacaoParametro_TbUnidade') IS NOT NULL
BEGIN
	ALTER TABLE [dbo].[TbAvaliacaoParametro] DROP CONSTRAINT [FK_TbAvaliacaoParametro_TbUnidade]
END

ALTER TABLE [dbo].[TbEducacensoUnidade] DROP CONSTRAINT [FK_TbEducacensoUnidade_TbUnidade]
GO


ALTER TABLE [dbo].[TbDocumentoSignatario] DROP CONSTRAINT [FK_TbDocumentoSignatario_TbDocumento]
GO


ALTER TABLE [dbo].[TbParametroAssinaturaEletronica] DROP CONSTRAINT [FK_TbDocumentoSignatario_TbUnidade]
GO

ALTER TABLE [dbo].[TbDocumento] DROP CONSTRAINT [FK_TbDocumento_TbUnidade]
GO



-- NOME PK ERRADOS
-- ALTER TABLE [dbo].[TbUnidadeTermoConsentimento] DROP CONSTRAINT [FK__TbUnidade__IdUni__1DD529EA];

-- NOME CORRETO
ALTER TABLE [dbo].[TbUnidadeTermoConsentimento] DROP CONSTRAINT [FK_TbUnidadeTermoConsentimento_TbUnidade]
GO


ALTER TABLE [dbo].[TbPosTransacao] DROP CONSTRAINT [FK_TbPosTransacao_TbUnidade];


ALTER TABLE [dbo].[TbCalendarioEvento] DROP CONSTRAINT [FK_TbCalendarioEvento_TbUnidade];

ALTER TABLE [dbo].[TbPlanoContasContabil] DROP CONSTRAINT [FK_TbPlanoContasContabil_TbUnidade];


ALTER TABLE [dbo].[TbCalendarioEvento] DROP CONSTRAINT [FK_TbCalendarioEvento_TbUnidade];

ALTER TABLE [dbo].[TbUnidadeTermoConsentimento] DROP CONSTRAINT [FK__TbUnidade__IdUni__761C3E4B];

ALTER TABLE [dbo].[TbPlanoContasContabil] DROP CONSTRAINT [FK_TbPlanoContasContabil_TbUnidade];

ALTER TABLE [dbo].[TbPosTransacao] DROP CONSTRAINT [FK_TbPosTransacao_TbUnidade];



-- TbUnidade 
    ALTER TABLE [dbo].[TbUnidade] DROP CONSTRAINT [PK_TbUnidade];



-- reCREATE

	ALTER TABLE [dbo].[TbUnidade] ADD  CONSTRAINT [PK_TbUnidade] PRIMARY KEY CLUSTERED 
	(
			[IdUnidade] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
	GO


ALTER TABLE [dbo].[TbPosTransacao] WITH CHECK ADD CONSTRAINT [FK_TbPosTransacao_TbUnidade] FOREIGN KEY([IdUnidade]) REFERENCES [dbo].[TbUnidade] ([IdUnidade]); 	
ALTER TABLE [dbo].[TbPosTransacao] CHECK CONSTRAINT [FK_TbPosTransacao_TbUnidade]
	
	
ALTER TABLE [dbo].[TbPlanoContasContabil] WITH CHECK ADD CONSTRAINT [FK_TbPlanoContasContabil_TbUnidade] FOREIGN KEY([IdUnidade]) REFERENCES [dbo].[TbUnidade] ([IdUnidade]); 
ALTER TABLE [dbo].[TbPlanoContasContabil] CHECK CONSTRAINT [FK_TbPlanoContasContabil_TbUnidade]
	
	
ALTER TABLE [dbo].[TbUnidadeTermoConsentimento] WITH CHECK ADD CONSTRAINT [FK__TbUnidade__IdUni__55C47D52] FOREIGN KEY([IdUnidade]) REFERENCES [dbo].[TbUnidade] ([IdUnidade]); 	
ALTER TABLE [dbo].[TbUnidadeTermoConsentimento] CHECK CONSTRAINT [FK__TbUnidade__IdUni__55C47D52]
	


ALTER TABLE [dbo].[TbCalendarioEvento] WITH CHECK ADD CONSTRAINT [FK_TbCalendarioEvento_TbUnidade] FOREIGN KEY([IdUnidade]) 	REFERENCES [dbo].[TbUnidade] ([IdUnidade]); 	
	
ALTER TABLE [dbo].[TbCalendarioEvento] CHECK CONSTRAINT [FK_TbCalendarioEvento_TbUnidade]
	
	
ALTER TABLE dbo.TbPlanoContasContabil ADD CONSTRAINT FK_TbPlanoContasContabil_TbUnidade FOREIGN KEY (IdUnidade) REFERENCES dbo.TbUnidade(IdUnidade);	
GO
ALTER TABLE [dbo].[TbPlanoContasContabil] CHECK CONSTRAINT [FK_TbPlanoContasContabil_TbUnidade]
GO


ALTER TABLE dbo.TbCalendarioEvento ADD CONSTRAINT FK_TbCalendarioEvento_TbUnidade FOREIGN KEY (IdUnidade) REFERENCES dbo.TbUnidade(IdUnidade);	

ALTER TABLE [dbo].[TbCalendarioEvento] CHECK CONSTRAINT [FK_TbCalendarioEvento_TbUnidade]



ALTER TABLE [dbo].[TbPosTransacao] WITH CHECK ADD CONSTRAINT [FK_TbPosTransacao_TbUnidade] FOREIGN KEY([IdUnidade]) 
		REFERENCES [dbo].[TbUnidade] ([IdUnidade])

ALTER TABLE [dbo].[TbPosTransacao] CHECK CONSTRAINT [FK_TbPosTransacao_TbUnidade]
GO




ALTER TABLE [dbo].[TbUnidadeTermoConsentimento] WITH CHECK ADD CONSTRAINT [FK_TbUnidadeTermoConsentimento_TbUnidade] FOREIGN KEY([IdUnidade]) 
	REFERENCES [dbo].[TbUnidade] ([IdUnidade])
	
ALTER TABLE [dbo].[TbUnidadeTermoConsentimento] CHECK CONSTRAINT [FK_TbUnidadeTermoConsentimento_TbUnidade]
GO





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



IF	EXISTS		( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbAvaliacao'	AND COLUMN_NAME = 'IdUnidade' )
	AND	EXISTS	( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbUnidade'		AND COLUMN_NAME = 'IdUnidade' )
	BEGIN
		ALTER TABLE [dbo].[TbAvaliacao]  WITH CHECK ADD  CONSTRAINT [FK_TbAvaliacao_TbUnidade] FOREIGN KEY([IdUnidade])	REFERENCES [dbo].[TbUnidade] ([IdUnidade])

		ALTER TABLE [dbo].[TbAvaliacao] CHECK CONSTRAINT [FK_TbAvaliacao_TbUnidade]
	END


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

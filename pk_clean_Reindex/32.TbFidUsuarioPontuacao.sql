USE dbSigaMariaStela;


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
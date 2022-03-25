USE dbSigaSantaGertrudes;

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

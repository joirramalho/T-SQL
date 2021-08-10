USE dbSigaSaleFalcao;
-- USE dbSigaDCCJR;

SELECT DB_NAME()



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

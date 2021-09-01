USE dbSigaSantaRosa;
--- USE dbSigaNSLourdesGravata;
-- USE dbSigaAuxilRecife;



-- TbParcelaCobranca
ALTER TABLE [dbo].[TbExcecaoCobranca] DROP CONSTRAINT [FK_TbExcecaoCobranca_TbParcelaCobranca]
GO
ALTER TABLE [dbo].[TbLoteCobranca] DROP CONSTRAINT [FK_TbLoteCobranca_TbParcelaCobranca]
GO



    ALTER TABLE [dbo].[TbParcelaCobranca] DROP CONSTRAINT [PK_TbParcelaCobranca]
    GO

    SET ANSI_PADDING ON
    GO

    ALTER TABLE [dbo].[TbParcelaCobranca] ADD  CONSTRAINT [PK_TbParcelaCobranca] PRIMARY KEY CLUSTERED 
    (
            [IdUnidade] ASC,
            [ParcelaCobranca] ASC
    )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
    GO


ALTER TABLE [dbo].[TbExcecaoCobranca]  WITH CHECK ADD  CONSTRAINT [FK_TbExcecaoCobranca_TbParcelaCobranca] FOREIGN KEY([IdUnidade], [ParcelaCobranca])
REFERENCES [dbo].[TbParcelaCobranca] ([IdUnidade], [ParcelaCobranca])
GO
ALTER TABLE [dbo].[TbExcecaoCobranca] CHECK CONSTRAINT [FK_TbExcecaoCobranca_TbParcelaCobranca]
GO


ALTER TABLE [dbo].[TbLoteCobranca]  WITH CHECK ADD  CONSTRAINT [FK_TbLoteCobranca_TbParcelaCobranca] FOREIGN KEY([IdUnidade], [ParcelaCobranca])
REFERENCES [dbo].[TbParcelaCobranca] ([IdUnidade], [ParcelaCobranca])
GO
ALTER TABLE [dbo].[TbLoteCobranca] CHECK CONSTRAINT [FK_TbLoteCobranca_TbParcelaCobranca]
GO

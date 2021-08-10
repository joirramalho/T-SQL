USE dbSigaSaleFalcao;
-- USE dbSigaDCCJR;

SELECT DB_NAME()


-- TbGrupo 
ALTER TABLE [dbo].[TbFuncionalidadeGrupo] DROP CONSTRAINT [FK_TbFuncionalidadeGrupo_TbGrupo]
GO
ALTER TABLE [dbo].[TbRelatorioGrupo] DROP CONSTRAINT [FK_TbRelatorioGrupo_TbGrupo]
GO
ALTER TABLE [dbo].[TbSerieGrupo] DROP CONSTRAINT [FK_TbSerieGrupo_TbGrupo]
GO
ALTER TABLE [dbo].[TbUsuarioGrupo] DROP CONSTRAINT [FK_TbUsuarioGrupo_TbGrupo]
GO

    ALTER TABLE [dbo].[TbGrupo] DROP CONSTRAINT [PK_TbGrupo]
    GO


    ALTER TABLE [dbo].[TbGrupo] ADD  CONSTRAINT [PK_TbGrupo] PRIMARY KEY CLUSTERED 
    (
            [IdGrupo] ASC
    )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
    GO


                                                                                                                                                                                                                                                                 
ALTER TABLE [dbo].[TbFuncionalidadeGrupo] WITH CHECK ADD  CONSTRAINT [FK_TbFuncionalidadeGrupo_TbGrupo] FOREIGN KEY([IdGrupo]) REFERENCES [dbo].[TbGrupo] ([IdGrupo])                                                                                            
GO
ALTER TABLE [dbo].[TbFuncionalidadeGrupo] CHECK CONSTRAINT [FK_TbFuncionalidadeGrupo_TbGrupo]
GO

ALTER TABLE [dbo].[TbRelatorioGrupo] WITH CHECK ADD  CONSTRAINT [FK_TbRelatorioGrupo_TbGrupo] FOREIGN KEY([IdGrupo]) REFERENCES [dbo].[TbGrupo] ([IdGrupo])                                                                                                      
GO
ALTER TABLE [dbo].[TbRelatorioGrupo] CHECK CONSTRAINT [FK_TbRelatorioGrupo_TbGrupo]
GO

ALTER TABLE [dbo].[TbSerieGrupo] WITH CHECK ADD  CONSTRAINT [FK_TbSerieGrupo_TbGrupo] FOREIGN KEY([IdGrupo]) REFERENCES [dbo].[TbGrupo] ([IdGrupo])                                                                                                              
GO
ALTER TABLE [dbo].[TbSerieGrupo] CHECK CONSTRAINT [FK_TbSerieGrupo_TbGrupo]
GO

ALTER TABLE [dbo].[TbUsuarioGrupo] WITH CHECK ADD  CONSTRAINT [FK_TbUsuarioGrupo_TbGrupo] FOREIGN KEY([IdGrupo]) REFERENCES [dbo].[TbGrupo] ([IdGrupo])                                                                                                          
GO
ALTER TABLE [dbo].[TbUsuarioGrupo] CHECK CONSTRAINT [FK_TbUsuarioGrupo_TbGrupo]
GO
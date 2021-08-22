USE dbSigaSaleJuvenal;
--- USE dbSigaNSLourdesGravata;
-- USE dbSigaAuxilRecife;


-- TbOptProvaGabarito
-- Obs.: FK COMPOSTA - DEVE GERAR SCRIPT MANUALMENTE
ALTER TABLE [dbo].[TbOptProvaResposta] DROP CONSTRAINT [FK_TbOptProvaResposta_TbOptProvaGabarito]                                                                                                                                                                
GO                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                

ALTER TABLE [dbo].[TbOptProvaGabarito] DROP CONSTRAINT [PK_TbOptProvaGabarito] WITH ( ONLINE = OFF )
GO

ALTER TABLE [dbo].[TbOptProvaGabarito] ADD  CONSTRAINT [PK_TbOptProvaGabarito] PRIMARY KEY CLUSTERED 
(
        [IdProva] ASC,
        [NumeroQuestao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO


ALTER TABLE [dbo].[TbOptProvaResposta]  WITH CHECK ADD  CONSTRAINT [FK_TbOptProvaResposta_TbOptProvaGabarito] FOREIGN KEY([IdProva], [NumeroQuestao])
REFERENCES [dbo].[TbOptProvaGabarito] ([IdProva], [NumeroQuestao])
GO

ALTER TABLE [dbo].[TbOptProvaResposta] CHECK CONSTRAINT [FK_TbOptProvaResposta_TbOptProvaGabarito]
GO
--USE [dbSigaGGE]
USE [dbSigaContemporaneo]
GO

/****** Object:  Index [IX_TbLancamentoCobranca_IdServico]    Script Date: 03/03/2020 15:08:00 ******/
DROP INDEX [IX_TbLancamentoCobranca_IdServico] ON [dbo].[TbLancamentoCobranca]
GO

/****** Object:  Index [IX_TbLancamentoCobranca_IdServico]    Script Date: 03/03/2020 15:08:00 ******/
--CREATE NONCLUSTERED INDEX [IX_TbLancamentoCobranca_IdServico] ON [dbo].[TbLancamentoCobranca]
--(
--	[IdServico] ASC
--)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
--GO



---
CREATE NONCLUSTERED INDEX [IX_TbLancamentoCobranca_IdServico-included] ON [dbo].[TbLancamentoCobranca]
(
	[IdServico] ASC
)
INCLUDE ( 	[IdTituloCobrancaGerado],
	[IdTurma],
	[DataFaturamento],
	[IdNotaFiscal]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)

GO




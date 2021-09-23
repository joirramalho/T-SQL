-- PK - CORRETA
ALTER TABLE [dbo].[TbAuditoria] ADD  CONSTRAINT [PK_TbAuditoria] PRIMARY KEY CLUSTERED 
(
	[IdAuditoria] ASC
)

-- MAIS UTILIZADA, 109 VEZES (SEEK  - índice ideal )
CREATE NONCLUSTERED INDEX [IX_TbAuditoriaTabelaDataHora] ON [dbo].[TbAuditoria]
(
	[Tabela] ASC,
	[DataHora] ASC,
	[ValorChave1] ASC,
	[ValorChave2] ASC,
	[ValorChave3] ASC,
	[ValorChave4] ASC,
	[ValorChave5] ASC
)---

-- 4061 VARREDURAS, ou seja, usada, mas não da forma ideal (SCAN TABLE)
CREATE NONCLUSTERED INDEX [IX_TbAuditoriaDataHora] ON [dbo].[TbAuditoria]
(
	[DataHora] ASC
)
---

-- SOFREU 5 SEEKs e 4 SCANs ( Muito pouco para justificar um índice )
CREATE NONCLUSTERED INDEX [IX_TbAuditoriaTabelaChave2] ON [dbo].[TbAuditoria]
(
	[Tabela] ASC,
	[ValorChave2] ASC
)
---


-- NUNCA UTILIZADO
CREATE NONCLUSTERED INDEX [IX_TbAuditoriaDataHoraDesc] ON [dbo].[TbAuditoria]
(
	[DataHora] DESC,
	[Tabela] ASC
)
---

-- NUNCA UTILIZADO
CREATE NONCLUSTERED INDEX [IX_TbAuditoriaTabelaChave] ON [dbo].[TbAuditoria]
(
	[Tabela] ASC,
	[ValorChave1] ASC,
	[ValorChave2] ASC,
	[ValorChave3] ASC,
	[ValorChave4] ASC,
	[ValorChave5] ASC,
	[DataHora] ASC
)

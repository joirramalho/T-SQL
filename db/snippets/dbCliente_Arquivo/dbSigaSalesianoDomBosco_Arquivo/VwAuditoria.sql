-- dbo.VwAuditoria source

ALTER VIEW dbo.VwAuditoria AS 
	SELECT	Tabela, IdUsuario, Operacao, DataHora, ValorChave1, ValorChave2, ValorChave3, ValorChave4, ValorChave5, DescricaoOperacao, IdAuditoria
	FROM	TbAuditoria
 	UNION ALL
 	SELECT	Tabela, IdUsuario, Operacao, DataHora, ValorChave1, ValorChave2, ValorChave3, ValorChave4, ValorChave5, DescricaoOperacao, IdAuditoria
 	FROM	dbSigaSalesianoDomBosco_Arquivo.dbo.TbAuditoria
-- 	UNION ALL
-- 	SELECT	Tabela, IdUsuario, Operacao, DataHora, ValorChave1, ValorChave2, ValorChave3, ValorChave4, ValorChave5, DescricaoOperacao, IdAuditoria
-- 	FROM	dbSigaSalesianoDomBosco_Arquivo02.dbo.TbAuditoria
-- 	UNION ALL
-- 	SELECT	Tabela, IdUsuario, Operacao, DataHora, ValorChave1, ValorChave2, ValorChave3, ValorChave4, ValorChave5, DescricaoOperacao, IdAuditoria
-- 	FROM	dbSigaSalesianoDomBosco_Arquivo03.dbo.TbAuditoria;
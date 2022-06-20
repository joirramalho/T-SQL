-- dbo.VwAuditoria source

ALTER  VIEW [dbo].[VwAuditoria] AS 
-- ALTER VIEW [dbo].[VwAuditoria] AS 
	SELECT	Tabela, IdAuditoria, IdUsuario, Operacao, DataHora, ValorChave1, ValorChave2, ValorChave3, ValorChave4, ValorChave5, DescricaoOperacao
	FROM	TbAuditoria
  UNION ALL  
    SELECT  Tabela, IdAuditoria, IdUsuario, Operacao, DataHora, ValorChave1, ValorChave2, ValorChave3, ValorChave4, ValorChave5, DescricaoOperacao  
    FROM 	dbSigaCoesi_Arquivo.dbo.TbAuditoria  
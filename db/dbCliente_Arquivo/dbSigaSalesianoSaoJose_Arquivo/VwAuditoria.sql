-- dbo.VwAuditoria source

-- dbo.VwAuditoria source

CREATE VIEW dbo.VwAuditoria AS   

 SELECT Tabela, IdUsuario, Operacao, DataHora, ValorChave1, ValorChave2, ValorChave3, ValorChave4, ValorChave5, DescricaoOperacao, IdAuditoria  

 FROM TbAuditoria  

UNION ALL  

SELECT Tabela, IdUsuario, Operacao, DataHora, ValorChave1, ValorChave2, ValorChave3, ValorChave4, ValorChave5, DescricaoOperacao, IdAuditoria  

FROM dbSigaSalesianoSaoJose_Arquivo.dbo.TbAuditoria  

--UNION ALL  
--
--SELECT Tabela, IdUsuario, Operacao, DataHora, ValorChave1, ValorChave2, ValorChave3, ValorChave4, ValorChave5, DescricaoOperacao, IdAuditoria  
--
--FROM dbSigaSalesianoSaoJose_Arquivo01.dbo.TbAuditoria  
--
--UNION ALL  
--
--SELECT Tabela, IdUsuario, Operacao, DataHora, ValorChave1, ValorChave2, ValorChave3, ValorChave4, ValorChave5, DescricaoOperacao, IdAuditoria  
--
--FROM dbSigaSalesianoSaoJose_Arquivo02.dbo.TbAuditoria  
--
--UNION ALL  
--
--SELECT Tabela, IdUsuario, Operacao, DataHora, ValorChave1, ValorChave2, ValorChave3, ValorChave4, ValorChave5, DescricaoOperacao, IdAuditoria  
--
--FROM dbSigaSalesianoSaoJose_Arquivo03.dbo.TbAuditoria  
--
--UNION ALL  
--
--SELECT Tabela, IdUsuario, Operacao, DataHora, ValorChave1, ValorChave2, ValorChave3, ValorChave4, ValorChave5, DescricaoOperacao, IdAuditoria  
--
--FROM dbSigaSalesianoSaoJose_Arquivo04.dbo.TbAuditoria  
--
--UNION ALL
--SELECT Tabela, IdUsuario, Operacao, DataHora, ValorChave1, ValorChave2, ValorChave3, ValorChave4, ValorChave5, DescricaoOperacao, IdAuditoria  
--
--FROM dbSigaSalesianoSaoJose_Arquivo05.dbo.TbAuditoria;
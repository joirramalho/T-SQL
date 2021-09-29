-- USE dbSigaNeves

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER VIEW [dbo].[VwAuditoria] AS   
    SELECT Tabela, IdUsuario, Operacao, DataHora, ValorChave1, ValorChave2, ValorChave3, ValorChave4, ValorChave5, DescricaoOperacao, IdAuditoria  
    FROM TbAuditoria
  UNION ALL  
    SELECT Tabela, IdUsuario, Operacao, DataHora, ValorChave1, ValorChave2, ValorChave3, ValorChave4, ValorChave5, DescricaoOperacao, IdAuditoria  
    FROM dbSigaNeves_Arquivo.dbo.TbAuditoria  

--   SELECT Tabela, IdUsuario, Operacao, DataHora, ValorChave1, ValorChave2, ValorChave3, ValorChave4, ValorChave5, DescricaoOperacao, IdAuditoria  
--   FROM dbSigaNeves_Arquivo01.dbo.TbAuditoria  

--   UNION ALL  

--   SELECT Tabela, IdUsuario, Operacao, DataHora, ValorChave1, ValorChave2, ValorChave3, ValorChave4, ValorChave5, DescricaoOperacao, IdAuditoria  
--   FROM dbSigaNeves_Arquivo02.dbo.TbAuditoria  

--   UNION ALL  

--   SELECT Tabela, IdUsuario, Operacao, DataHora, ValorChave1, ValorChave2, ValorChave3, ValorChave4, ValorChave5, DescricaoOperacao, IdAuditoria  
--   FROM dbSigaNeves_Arquivo03.dbo.TbAuditoria  

--   UNION ALL  

--   SELECT Tabela, IdUsuario, Operacao, DataHora, ValorChave1, ValorChave2, ValorChave3, ValorChave4, ValorChave5, DescricaoOperacao, IdAuditoria  
--   FROM dbSigaNeves_Arquivo04.dbo.TbAuditoria  

--   UNION ALL  

--   SELECT Tabela, IdUsuario, Operacao, DataHora, ValorChave1, ValorChave2, ValorChave3, ValorChave4, ValorChave5, DescricaoOperacao, IdAuditoria  
--   FROM dbSigaNeves_Arquivo05.dbo.TbAuditoria  

--   UNION ALL  

--   SELECT Tabela, IdUsuario, Operacao, DataHora, ValorChave1, ValorChave2, ValorChave3, ValorChave4, ValorChave5, DescricaoOperacao, IdAuditoria  
--   FROM dbSigaNeves_Arquivo06.dbo.TbAuditoria  
-- UNION ALL  
--   SELECT Tabela, IdUsuario, Operacao, DataHora, ValorChave1, ValorChave2, ValorChave3, ValorChave4, ValorChave5, DescricaoOperacao, IdAuditoria  

--   FROM dbSigaNeves_Arquivo07.dbo.TbAuditoria  

GO

-- EXEC sp_helpindex '[dbo].[TbDiarioFrequencia]'

SELECT TOP 5 OBJECT_NAME(parent_obj) [table name], NAME [triger name], OBJECT_DEFINITION(id) body
FROM    sysobjects
WHERE   xtype = 'TR' AND OBJECT_NAME(parent_obj) = 'TbHistorico' --TbDiarioFrequencia
    --AND name = 'TgDiarioFrequencia_Auditoria';

-- EXEC sp_columns 'TbFaseNota'
-- EXEC sp_helptext 'TgFaseNota_Auditoria'
-- EXEC sp_helptext 'TgDiarioFrequencia_Auditoria'

-- EXEC sp_helptext 'TgDiarioAula_Auditoria'
-- EXEC sp_helptext 'TgDiarioAula_AjustarNumeroAula'
-- EXEC sp_helptext 'TgDiarioAulaValidar'

-- EXEC sp_helptext 'TgAudit_TbHistoricoI'


SELECT Tabela, Year( DataHora), Count(*)
  FROM [TbAuditoria]
  GROUP by Tabela, Year( DataHora)
 order by Tabela, Year( DataHora)
   
   SELECT *  FROM [TbAuditoria] where Tabela = 'TbMetaSituacaoAlunoDisciplina' and Year(DataHora) = 2020

--    SELECT count(*)  FROM [CRM_203801].[dbo].[TbDiarioAula_Auditoria]

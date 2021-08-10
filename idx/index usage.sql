-- VERSION 1.01 - 07mai21

-- EXEC dbLogMonitor.dbo.sp_ServerName

    USE [dbCrmActivesoft];

-- exec sp_help 'TbOcorrencia'

SELECT  DB_NAME()

SELECT  OBJECT_NAME(I.object_id) As Tabela, I.Name As Indice,
    U.User_Seeks As Pesquisas, U.User_Scans As Varreduras, U.User_Lookups As LookUps,
    U.Last_User_Seek As UltimaPesquisa, U.Last_User_Scan As UltimaVarredura,
    U.Last_User_LookUp As UltimoLookUp, U.Last_User_Update As UltimaAtualizacao
FROM    sys.indexes As I
LEFT    OUTER JOIN sys.dm_db_index_usage_stats As U ON I.object_id = U.object_id AND I.index_id = U.index_id
WHERE DB_NAME(database_id) = DB_NAME()

    AND I.object_id = OBJECT_ID('TbOcorrenciaMovimentacao') --and I.Name IS NULL -- TbLancamentoCobranca-- TbAuditoria -- TbTituloCobranca -- TbOcorrenciaMovimentacao

ORDER BY 
----(U.User_Scans ) DESC
--OBJECT_NAME(I.object_id)
U.User_Lookups DESC

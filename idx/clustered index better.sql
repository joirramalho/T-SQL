-- Dirceu Resende

use dbSigaContemporaneo

SELECT DB_NAME()

SELECT  TableName = OBJECT_NAME(idx.object_id), NonUsefulClusteredIndex = idx.name, ShouldBeClustered = nc.nonclusteredname, Clustered_User_Seeks = c.user_seeks, NonClustered_User_Seeks = nc.user_seeks, Clustered_User_Lookups = c.user_lookups, DatabaseName = DB_NAME(c.database_id)
FROM    sys.indexes idx
LEFT JOIN sys.dm_db_index_usage_stats c ON idx.object_id = c.object_id AND idx.index_id = c.index_id
    JOIN (
          SELECT idx.object_id, nonclusteredname = idx.name, ius.user_seeks
          FROM   sys.indexes idx
          JOIN   sys.dm_db_index_usage_stats ius ON idx.object_id = ius.object_id AND idx.index_id = ius.index_id
          WHERE  idx.type_desc = 'nonclustered' AND ius.user_seeks = ( SELECT  MAX(user_seeks) FROM sys.dm_db_index_usage_stats WHERE object_id = ius.object_id AND type_desc = 'nonclustered' )
          GROUP BY idx.object_id, idx.name, ius.user_seeks
         ) nc ON nc.object_id = idx.object_id
WHERE idx.type_desc IN ( 'clustered', 'heap' )
    AND nc.user_seeks > ( c.user_seeks * 1.50 ) -- 150%
    AND nc.user_seeks >= ( c.user_lookups * 0.75 ) -- 75%
    
    AND OBJECT_NAME(idx.object_id) = 'TbSituacaoAlunoDisciplina' --TbLancamentoFinanceiro

ORDER BY  nc.user_seeks DESC
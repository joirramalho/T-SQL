-- 10ago21 - ALL DATABASE
-- EXEC dbLogMonitor.dbo.sp_Where

-- EXEC  sp_helpindex 'TbOcorrenciaMovimentacao'

SELECT TOP 20  CONVERT(int, (avg_total_user_cost * avg_user_impact * (user_seeks + user_scans)) ) AS Impacto,
				migs.user_seeks, migs.user_scans, mid.statement, mid.equality_columns, mid.inequality_columns, mid.included_columns, mid.index_handle
FROM sys.dm_db_missing_index_group_stats AS migs
JOIN sys.dm_db_missing_index_groups AS mig ON migs.group_handle = mig.index_group_handle 
JOIN sys.dm_db_missing_index_details AS mid ON mig.index_handle = mid.index_handle 

--  AND mid.statement LIKE '%TbNotaFiscal%'

order by Impacto DESC;
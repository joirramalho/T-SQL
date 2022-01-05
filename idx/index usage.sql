--25out21

--USE [dbCrmActivesoft];

--CREATE INDEX [IX_TbOcorrenciaMovimentacao_CdPrioridade] ON [dbCrmActivesoft].[dbo].[TbOcorrenciaMovimentacao] ([CdPrioridade]) INCLUDE ([IdOcorrenciaMovimentacao], [DataHoraLimite])

SELECT  OBJECT_NAME(I.object_id) As Tabela, I.Name As Indice,
	    U.User_Seeks As Pesquisas, U.User_Scans As Varreduras, U.User_Lookups As LookUps,
	    U.Last_User_Seek As UltimaPesquisa, U.Last_User_Scan As UltimaVarredura,
	    U.Last_User_LookUp As UltimoLookUp, U.Last_User_Update As UltimaAtualizacao
FROM    sys.indexes As I
LEFT    OUTER JOIN sys.dm_db_index_usage_stats As U ON I.object_id = U.object_id AND I.index_id = U.index_id
WHERE DB_NAME(database_id) = DB_NAME()

    AND I.object_id = OBJECT_ID('TbLancamentoCobranca') --and I.Name IS NULL -- TbLancamentoCobranca-- TbAuditoria -- TbTituloCobranca -- TbOcorrenciaMovimentacao

ORDER BY user_seeks + user_scans + user_lookups + user_updates DESC



	

--IF EXISTS( SELECT * FROM sys.indexes WHERE name='IX_TbOcorrencia_omUltima_IdOcorrenciaMovimentacao' AND object_id = OBJECT_ID('dbo.TbOcorrencia') )
--	BEGIN
--		DROP INDEX [IX_TbOcorrencia_omUltima_IdOcorrenciaMovimentacao] ON [dbo].[TbOcorrencia] WITH ( ONLINE = OFF )
--	END
--
--CREATE INDEX [IX_TbOcorrencia_omUltima_IdOcorrenciaMovimentacao] ON [dbCrmActivesoft].[dbo].[TbOcorrencia] ([omUltima_IdOcorrenciaMovimentacao]) 
--	INCLUDE ([IdCliente], [TituloOcorrencia], [IdTipoOcorrencia], [IdSistema], [omUltimaMudanca_IdOcorrenciaMovimentacao], [omUltimaMudanca_IdOperador])
	
	

--IF EXISTS( SELECT * FROM sys.indexes WHERE name='IX_TbOcorrenciaConclusao' AND object_id = OBJECT_ID('dbo.TbOcorrencia') )
--	BEGIN
--		DROP INDEX [IX_TbOcorrenciaConclusao] ON [dbo].[TbOcorrencia] WITH ( ONLINE = OFF )
--	END
--
--IF EXISTS( SELECT * FROM sys.indexes WHERE name='IX_TbOcorrenciaAbertura' AND object_id = OBJECT_ID('dbo.TbOcorrencia') )
--	BEGIN
--		DROP INDEX [IX_TbOcorrenciaAbertura] ON [dbo].[TbOcorrencia] WITH ( ONLINE = OFF )
--	END





--https://stackoverflow.com/questions/765867/list-of-all-index-index-columns-in-sql-server-db/765892

--SELECT 
--     TableName = t.name,
--     IndexName = ind.name,
--     IndexId = ind.index_id,
--     ColumnId = ic.index_column_id,
--     ColumnName = col.name,
--     ind.*,
--     ic.*,
--     col.* 
--FROM 
--     sys.indexes ind 
--INNER JOIN 
--     sys.index_columns ic ON  ind.object_id = ic.object_id and ind.index_id = ic.index_id 
--INNER JOIN 
--     sys.columns col ON ic.object_id = col.object_id and ic.column_id = col.column_id 
--INNER JOIN 
--     sys.tables t ON ind.object_id = t.object_id 
--WHERE 
--     ind.is_primary_key = 0 
--     AND ind.is_unique = 0 
--     AND ind.is_unique_constraint = 0 
--     AND t.is_ms_shipped = 0 
--ORDER BY 
--     t.name, ind.name, ind.index_id, ic.is_included_column, ic.key_ordinal;
--13fev22 - Adaptado para index filtered 
	--https://www.mssqltips.com/sqlservertip/1785/sql-server-filtered-indexes-what-they-are-how-to-use-and-performance-advantages/

--USE [dbCrmActivesoft];

DECLARE @TableName  sysname = NULL

--SET @TableName 	= 'TbSolicitacao'

--CREATE INDEX [IX_TbOcorrenciaMovimentacao_CdPrioridade] ON [dbCrmActivesoft].[dbo].[TbOcorrenciaMovimentacao] ([CdPrioridade]) INCLUDE ([IdOcorrenciaMovimentacao], [DataHoraLimite])

SELECT	DB_NAME(),  
		OBJECT_NAME(I.object_id) As [table],--		I.index_id,
		I.Name AS [index],
		IIF( is_primary_key = 1, 'sim', '' ) AS 'pk',
		IIF( type = 1, 'sim', '' ) AS 'cluster',
		IIF( is_unique = 1, 'sim', '' ) AS 'unique',
		IIF( is_unique_constraint = 1, 'sim', '' ) AS 'unique_ck',
		ISNULL(SUBSTRING(c.[indexed], 0, LEN(c.[indexed])), '') AS [indexed],
		IIF( type = 1, 'n/a', ISNULL(SUBSTRING(c.[included], 0, LEN(c.[included])), '') ) AS [included], --		ISNULL(SUBSTRING(c.[included], 0, LEN(c.[included])), '.') AS [included],
		ISNULL(i.filter_definition, '') AS [filtered],  -- Filtro utilizado pelo índice
		par.row_count,
	    U.User_Seeks As Pesquisas, U.User_Scans As Varreduras, U.User_Lookups As LookUps,
	    U.Last_User_Seek As UltimaPesquisa, U.Last_User_Scan As UltimaVarredura,
	    U.Last_User_LookUp As UltimoLookUp, U.Last_User_Update As UltimaAtualizacao,--	    par.reserved_page_count, par.used_page_count,
		i.fill_factor
FROM    sys.indexes AS I
LEFT    OUTER JOIN sys.dm_db_index_usage_stats As U ON I.object_id = U.object_id AND I.index_id = U.index_id
INNER JOIN sys.dm_db_partition_stats par ON par.object_id = i.object_id AND par.index_id = i.index_id

-- Relação de colunas que formam o índice
CROSS APPLY (
    SELECT (
        SELECT c.name + ', '
        FROM sys.columns c
        INNER JOIN sys.index_columns ic ON c.[object_id] = ic.[object_id] AND c.[column_id] = ic.[column_id]
        WHERE i.[object_id] = c.[object_id] AND ic.[index_id] = i.[index_id] AND ic.[is_included_column] = 0
        ORDER BY [key_ordinal]
        FOR XML PATH('')
    ) AS [indexed]
    ,(
        SELECT c.name + ', '
        FROM sys.columns c
        INNER JOIN sys.index_columns ic ON c.[object_id] = ic.[object_id] AND c.[column_id] = ic.[column_id]
        WHERE i.[object_id] = c.[object_id] AND ic.[index_id] = i.[index_id] AND ic.[is_included_column] = 1
        ORDER BY [key_ordinal]
        FOR XML PATH('')
    ) AS [included]
) AS c

WHERE DB_NAME(database_id) = DB_NAME()
	AND OBJECT_NAME(I.object_id) LIKE ISNULL( @TableName, OBJECT_NAME(I.object_id) ) 	--	AND OBJECT_NAME(i.object_id, database_id) LIKE ISNULL( @TableName, OBJECT_NAME(i.object_id, database_id) ) 	
	
--	AND I.object_id = OBJECT_ID('TbHistorico') --and I.Name IS NULL -- SET ANSI_NULL ON = TbTituloCobrancaRegistrada; TbTituloCobrancaVisualizacao
    
    -- IX_TituloCobrancaRegistradaAgente DE TbTituloCobrancaRegistrada NÃO USADO
    
ORDER BY is_primary_key DESC, user_seeks + user_scans + user_lookups + user_updates DESC
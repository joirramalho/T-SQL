-- Tabelas Índices Campos -- FILTER TABLE NAME - INCLUDED
USE dbSigaCristoRei

SELECT DB_NAME()

SELECT t.name as [table] -- s.name as [schema], 
 
-- Detalhes do índice
, i.[type_desc], i.[is_primary_key], i.[is_unique], i.[is_unique_constraint]
, ISNULL(i.name, '') AS [index]
, ISNULL(SUBSTRING(c.[indexed], 0, LEN(c.[indexed])), '') AS [indexed]
, ISNULL(SUBSTRING(c.[included], 0, LEN(c.[included])), '') AS [included]
, ISNULL(i.filter_definition, '') AS [filtered]  -- Filtro utilizado pelo índice
 
FROM sys.schemas s
INNER JOIN sys.tables t ON s.[schema_id] = t.[schema_id]
INNER JOIN sys.indexes i ON t.[object_id] = i.[object_id]
 
-- Relação de colunas que formam o índice
CROSS APPLY (
    SELECT (
        SELECT c.name + ', '
        FROM sys.columns c
        INNER JOIN sys.index_columns ic ON c.[object_id] = ic.[object_id] AND c.[column_id] = ic.[column_id]
        WHERE t.[object_id] = c.[object_id] AND ic.[index_id] = i.[index_id] AND ic.[is_included_column] = 0
        ORDER BY [key_ordinal]
        FOR XML PATH('')
    ) AS [indexed]
    ,(
        SELECT c.name + ', '
        FROM sys.columns c
        INNER JOIN sys.index_columns ic ON c.[object_id] = ic.[object_id] AND c.[column_id] = ic.[column_id]
        WHERE t.[object_id] = c.[object_id] AND ic.[index_id] = i.[index_id] AND ic.[is_included_column] = 1
        ORDER BY [key_ordinal]
        FOR XML PATH('')
    ) AS [included]
) AS c

WHERE t.name = 'TbLancamentoCobranca'

ORDER BY [table]  -- [schema], 
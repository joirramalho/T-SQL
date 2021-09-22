--20set21
--https://www.sqlshack.com/how-to-monitor-total-sql-server-indexes-size/

USE dbSigaPedacinhoCeuDF;

DECLARE @vname sysname
DECLARE @tmpTamTabela TABLE ( name sysname NULL,
ROWS int NULL,
reserved varchar(25) NULL,
DATA varchar(25) NULL,
index_size varchar(25) NULL,
unused varchar(25) NULL )

DECLARE cp1 CURSOR LOCAL fast_forward read_only FOR
    SELECT
	name
FROM
	sysobjects
WHERE
	TYPE = 'U'
	AND name NOT LIKE '40tena%'
ORDER BY
	name

OPEN cp1
    while 1 = 1
        BEGIN
            FETCH NEXT
FROM
	cp1
INTO
	@vname
            IF @@fetch_status <> 0 break
                INSERT
	INTO
	@tmpTamTabela (name,
	ROWS,
	reserved,
	DATA,
	index_size,
	unused)
                    EXEC sp_spaceused @vname
END
CLOSE cp1
DEALLOCATE cp1

SELECT
	name AS 'Nome'
       ,
	ROWS AS 'Linhas'
       ,
	CONVERT(int,
	replace(reserved,
	' KB',
	'')) AS 'Tamanho total KB'
       ,
	CONVERT(int,
	replace(DATA,
	' KB',
	''))AS 'Dados KB'
       ,
	CONVERT(int,
	replace(index_size,
	' KB',
	''))AS 'Index KB'
       ,
	CONVERT(int,
	replace(unused,
	' KB',
	''))AS 'Não utilizado KB'
FROM
	@tmpTamTabela
ORDER BY
	CONVERT(int, replace(ROWS, ' KB', '')) DESC
--	name
	
	

-- -- TAMANHO das tabelas
-- SELECT  t.NAME AS TableName, 
--     -- s.Name AS SchemaName, 
--     -- p.rows, SUM(a.total_pages) * 8 AS TotalSpaceKB, 
--     CAST(ROUND(((SUM(a.used_pages) * 8) / 1024.00), 2) AS NUMERIC(36, 2)) AS UsedSpaceMB, 
--     CAST(ROUND(((SUM(a.total_pages) * 8) / 1024.00), 2) AS NUMERIC(36, 2)) AS TotalSpaceMB,
--     -- SUM(a.used_pages) * 8 AS UsedSpaceKB, 
--     -- (SUM(a.total_pages) - SUM(a.used_pages)) * 8 AS UnusedSpaceKB,
--     CAST(ROUND(((SUM(a.total_pages) - SUM(a.used_pages)) * 8) / 1024.00, 2) AS NUMERIC(36, 2)) AS UnUsed_SpaceMB
-- FROM    sys.tables t
-- INNER JOIN  sys.indexes i ON t.OBJECT_ID = i.object_id
-- INNER JOIN  sys.partitions p ON i.object_id = p.OBJECT_ID AND i.index_id = p.index_id
-- INNER JOIN  sys.allocation_units a ON p.partition_id = a.container_id
-- LEFT OUTER JOIN sys.schemas s ON t.schema_id = s.schema_id
-- WHERE t.NAME NOT LIKE 'dt%' AND t.is_ms_shipped = 0  AND i.OBJECT_ID > 255 
-- GROUP BY t.Name, s.Name, p.Rows
-- -- ORDER BY t.Name
-- ORDER BY TotalSpaceMB DESC, t.Name
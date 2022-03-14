--20dez21
	--https://www.sqlshack.com/how-to-monitor-total-sql-server-indexes-size/

--USE db;

DECLARE @vname sysname
DECLARE @tmpTamTabela TABLE ( name sysname NULL,
								ROWS int NULL,
								reserved varchar(25) NULL,
								DATA varchar(25) NULL,
								index_size varchar(25) NULL,
								unused varchar(25) NULL )

DECLARE cp1 CURSOR LOCAL fast_forward read_only FOR
SELECT 	name
FROM	sysobjects
WHERE
		TYPE = 'U'
		AND name NOT LIKE '40tena%'
ORDER BY	name

OPEN cp1
    while 1 = 1
        BEGIN
            FETCH NEXT
FROM
	cp1
INTO
	@vname
            IF @@fetch_status <> 0 break
                INSERT	INTO @tmpTamTabela (name,
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
--	'INSERT INTO #TabelasExportacao (NomeTabela) VALUES (''' + name + ''')',
	name AS 'Nome', ROWS AS 'Linhas',
	CONVERT(int, replace(reserved, ' KB', '')) AS 'Tamanho total KB',
	CONVERT(int, replace(DATA, ' KB', '')) AS 'Dados KB',
	CONVERT(int, replace(index_size, ' KB', '')) AS 'Index KB',
	CONVERT(int, replace(unused, ' KB', '')) AS 'Não utilizado KB'
FROM
	@tmpTamTabela
ORDER BY
	CONVERT(int, replace(ROWS, ' KB', '')) DESC
--	name

	
	
/*
--03dez21

SELECT  
    t.NAME AS TableName,
--    s.Name AS SchemaName,
    p.rows,
--    SUM(a.total_pages) * 8 AS TotalSpaceKB, 
    CAST(ROUND(((SUM(a.total_pages) * 8) / 1024.00), 2) AS NUMERIC(36, 2)) AS TotalSpaceMB,	
--    SUM(a.used_pages) * 8 AS UsedSpaceKB, 
    CAST(ROUND(((SUM(a.used_pages) * 8) / 1024.00), 2) AS NUMERIC(36, 2)) AS UsedSpaceMB, 
--    (SUM(a.total_pages) - SUM(a.used_pages)) * 8 AS UnusedSpaceKB,
    
    
    CAST(ROUND(((SUM(a.total_pages) - SUM(a.used_pages)) * 8) / 1024.00, 2) AS NUMERIC(36, 2)) AS UnusedSpaceMB
FROM sys.tables t
INNER JOIN sys.indexes i 			ON t.OBJECT_ID = i.object_id
INNER JOIN sys.partitions p 		ON i.object_id = p.OBJECT_ID AND i.index_id = p.index_id
INNER JOIN sys.allocation_units a 	ON p.partition_id = a.container_id
--LEFT OUTER JOIN sys.schemas s 		ON t.schema_id = s.schema_id
WHERE 
    t.NAME NOT LIKE 'dt%' 
    AND t.is_ms_shipped = 0
    AND i.OBJECT_ID > 255 
GROUP BY 
    t.Name, p.Rows -- s.Name, 
ORDER BY 
--    t.Name
    TotalSpaceMB DESC, t.Name	
*/
	

	

/*
 WITH CteIndex
AS
(
SELECT 
     reservedpages = (reserved_page_count)
     ,usedpages = (used_page_count)
     ,pages = (
            CASE
                WHEN (s.index_id < 2) THEN (in_row_data_page_count + lob_used_page_count + row_overflow_used_page_count)
                ELSE lob_used_page_count + row_overflow_used_page_count
            END
            )    
     ,s.object_id   
     ,i.index_id        
     ,i.type_desc AS IndexType
     ,i.name AS indexname
    FROM sys.dm_db_partition_stats s
    INNER JOIN sys.indexes i ON s.[object_id] = i.[object_id] AND s.index_id = i.index_id   
)
SELECT DISTINCT
	DB_NAME(DB_ID()) AS DatabaseName
	,o.name AS TableName
	,o.object_id
	,ct.indexname
	,ct.IndexType
	,ct.index_id
	, IndexSpace = LTRIM (STR ((CASE WHEN usedpages > pages THEN CASE WHEN ct.index_id < 2 THEN  pages ELSE (usedpages - pages) END ELSE 0 END) * 8, 15, 0) + ' KB')
FROM CteIndex ct
INNER JOIN sys.objects o ON o.object_id = ct.object_id
INNER JOIN sys.dm_db_index_physical_stats (DB_ID(), NULL, NULL, NULL , NULL) ps ON ps.object_id = o.object_id
AND ps.index_id = ct.index_id
ORDER BY name ASC
*/
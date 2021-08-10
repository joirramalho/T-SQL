-- EXEC dbLogMonitor.dbo.sp_Where

USE dbSigaCPI

-- SELECT DB_NAME()

SET NOCOUNT ON

declare @vname sysname
declare @tmpTamTabela table ( name sysname null, rows       int         null, reserved   varchar(25) null, data       varchar(25) null, index_size varchar(25) null, unused     varchar(25) null )

declare cp1 cursor local fast_forward read_only for
    select name 
    from sysobjects 
    where type = 'U' AND name NOT LIKE '40tena%'
    order by name

open cp1
    while 1 = 1
        begin
            fetch next from cp1 into @vname
            if @@fetch_status <> 0 break
                insert into @tmpTamTabela (name, rows, reserved, data, index_size, unused)
                    exec sp_spaceused @vname
        end
close cp1
deallocate cp1

select name as 'Nome'
       , rows as 'Linhas'
       , convert(int, replace(reserved, ' KB','')) as 'Tamanho total KB'
       , convert(int, replace(data, ' KB',''))as 'Dados KB'
       , convert(int, replace(index_size, ' KB',''))as 'Index KB'
       , convert(int, replace(unused, ' KB',''))as 'Não utilizado KB'
from @tmpTamTabela
order by convert(int, replace(rows, ' KB','')) desc

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
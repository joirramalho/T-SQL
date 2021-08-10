-- ALL DATABASES 
    -- https://dba.stackexchange.com/questions/238288/query-to-see-index-fragmentation-on-all-databases-without-using-sp-or-temp-table

EXEC dbLogMonitor.dbo.stpServerName

DECLARE @Tbl table (DBName varchar(128), SchemaName varchar(128), TableName varchar (100), IndexName varchar (100), FragPercent float, IndexType tinyint, IsPrimaryKey bit);

INSERT INTO @Tbl
    EXEC SP_MSforeachdb @command1 = 'use [?];
                    SELECT  TOP 1 DB_NAME(), sc.name as SchemaName, object_name (s.object_id) as TableName, I.name, s.avg_fragmentation_in_percent, I.type, I.is_primary_key
                    FROM    sys.dm_db_index_physical_stats (DB_ID (), NULL, NULL, NULL, ''LIMITED'') as S
                            join sys.indexes as I on s.object_id = I.object_id and s.index_id = I.index_id
                            join sys.objects as O on s.object_id = O.object_id 
                            join sys.schemas as sc on O.schema_id = sc.schema_id
                    WHERE o.type = ''U'' and avg_fragmentation_in_percent > 20 and (I.name is not null) 

               --               AND DB_NAME() LIKE ''dbSigaNeves_Arquivo01%''

                    ORDER BY  avg_fragmentation_in_percent DESC'

SELECT * FROM @Tbl
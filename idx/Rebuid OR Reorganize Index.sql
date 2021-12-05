--22set21

	--USE dbSigaModuloAracaju

DECLARE @Database NVARCHAR(255)   
DECLARE @Table NVARCHAR(255)
DECLARE @Index NVARCHAR(255)
DECLARE @Fragmentation FLOAT
DECLARE @cmd NVARCHAR(1000)  


DECLARE TableCursor CURSOR READ_ONLY FOR 
    SELECT DB_NAME(), OBJECT_NAME(ind.OBJECT_ID), ind.name, indexstats.avg_fragmentation_in_percent
    FROM sys.dm_db_index_physical_stats(DB_ID(), NULL, NULL, NULL, NULL) indexstats 
    INNER JOIN sys.indexes ind ON ind.object_id = indexstats.object_id  AND ind.index_id = indexstats.index_id 
    WHERE indexstats.avg_fragmentation_in_percent > 5    
    		AND ind.Name is not null
--    		AND OBJECT_NAME(ind.OBJECT_ID) = 'TbAuditoria'
    ORDER BY indexstats.avg_fragmentation_in_percent DESC
    
    OPEN TableCursor   

   FETCH NEXT FROM TableCursor INTO @Database, @Table, @Index, @Fragmentation
   WHILE @@FETCH_STATUS = 0   
   BEGIN
      BEGIN TRY
        IF @Fragmentation > 30
            SET @cmd = 'ALTER INDEX [' + @Index + '] ON ' + @Database + '.dbo.' +@Table + ' REBUILD' 
        ELSE
            SET @cmd = 'ALTER INDEX [' + @Index + '] ON ' + @Database + '.dbo.' +@Table + ' REORGANIZE' 

          PRINT @cmd -- uncomment if you want to see commands
        --  EXEC (@cmd) 
      END TRY
      BEGIN CATCH
         PRINT '---'
         PRINT @cmd
         PRINT ERROR_MESSAGE() 
         PRINT '---'
      END CATCH

      FETCH NEXT FROM TableCursor INTO @Database, @Table, @Index, @Fragmentation
   END   

   CLOSE TableCursor   
   DEALLOCATE TableCursor
   
   
   
   
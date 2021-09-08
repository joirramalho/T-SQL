-- SQL to Rebuild Indexes, Update Statistics, and Shrink Databases
    -- https://cc.davelozinski.com/code/sql-code/rebuild-indexes-update-statistics-shrink-databases

--SQL to Rebuild Indexes, Update Statistics, and Shrink Databases on SQL Server
--Code from http://cc.davelozinski.com

-- This SQL Code will do the following:
--	1) get the names of all the databases on the current SQL server and loop through them
--	2) shrinking each database (if enabled. See <a href="https://msdn.microsoft.com/en-au/library/ms190488.aspx" target="_blank">DBCC SHRINKDATABASE</a>)
--	3) selecting all the tables in the current database
--	4) rebuilding all the indexes on each table (See <a href="https://msdn.microsoft.com/en-AU/library/ms188388.aspx" target="_blank">ALTER INDEX</a>)
--	5) rebuilding all the statistics on each table (See <a href="https://msdn.microsoft.com/en-us/library/ms187348.aspx" target="_blank">UPDATE STATISTICS</a>)

-- Adjust the values for the @indexFillFactor, @freeSpaceAfterShrink, @shrinkDatabases as appropriate for your needs.

DECLARE @indexFillFactor INT 
DECLARE @freeSpaceAfterShrink INT
DECLARE @shrinkDatabases BIT

SET @indexFillFactor = 95  -- the percentage fill factor when rebuilding indexes
SET @freeSpaceAfterShrink = 10  -- how much free space to leave after shrinking the database
SET @shrinkDatabases = 1  -- 0 = false; 1 = true.

------- nothing below here needs to be configured except maybe the databases to exclude ---------------------------------------

DECLARE @Database VARCHAR(255)   
DECLARE @TableName VARCHAR(512)  
DECLARE @IndexName VARCHAR(512) 
DECLARE @IsColumnStoreIndex BIT
DECLARE @cmd NVARCHAR(1024)  

DECLARE DatabaseCursor CURSOR FOR  
SELECT name FROM [master].[dbo].[sysdatabases]
WHERE name NOT IN ('master','msdb','tempdb','model','distribution')   
ORDER BY 1

OPEN DatabaseCursor

FETCH NEXT FROM DatabaseCursor INTO @Database  
WHILE @@FETCH_STATUS = 0  
BEGIN
	-- shrink the database if you want --------------------------
	IF (@shrinkDatabases = 1) 
	BEGIN
		print 'Shrinking database: ' + @Database
			-- DBCC SHRINKDATABASE (@Database, @freeSpaceAfterShrink)
	END
	
	--create the cursor for looping over the indexes by each table
	SET @cmd = 'DECLARE IndexCursor CURSOR FOR ' 
		+ 'SELECT ''['' + table_catalog + ''].['' + table_schema + ''].['' + table_name + '']'' as tableName '
		+ ',i.name as IndexName '
		+ ',CASE WHEN i.type_desc like ''%COLUMNSTORE%'' THEN 1 '
		+ '		ELSE 0 '
		+ '	END as IsColumnStoreIndex '
		+ 'FROM [' + @Database + '].[sys].[indexes] i '
		+ 'INNER JOIN [' + @Database + '].[sys].[all_objects] o on i.object_id = o.object_id '
		+ 'INNER JOIN [' + @Database + '].[INFORMATION_SCHEMA].[TABLES] t on o.name = t.TABLE_NAME '
		+ '	AND t.table_type = ''BASE TABLE'' '
		+ 'INNER JOIN [' + @Database + '].[sys].[schemas] AS s ON o.[schema_id] = s.[schema_id] '
		+ '	AND SCHEMA_NAME(o.[schema_id]) = t.TABLE_SCHEMA '
		+ 'ORDER BY o.name'
	--print (@cmd)
	EXECUTE sp_executesql @cmd  
	OPEN IndexCursor 
	FETCH NEXT FROM IndexCursor INTO @TableName, @IndexName, @IsColumnStoreIndex
	
	WHILE @@FETCH_STATUS = 0
	BEGIN
		--Update indexes --------------------------
--	IF (@@MICROSOFTVERSION / POWER(2, 24) >= 9)            --only uncomment these lines if this code used on an SQL2000 database
--	BEGIN	
--		-- SQL 2005 or higher command 
		print 'Started rebuilding Index: [' + @IndexName + '] on table: ' + @TableName + ' at ' + CAST(GetDate() as varchar)
		IF (@IsColumnStoreIndex = 0)	--non columnstore index. Can use FILLFACTOR
			SET @cmd = 'ALTER INDEX [' + @IndexName + '] ON ' + @TableName + ' REBUILD WITH (FILLFACTOR = ' + CONVERT(VARCHAR(3),@indexFillFactor) + ')' 
		ELSE	--ColumnStoreIndex, cannot use FILLFACTOR
			SET @cmd = 'ALTER INDEX [' + @IndexName + '] ON ' + @TableName + ' REBUILD' 

		print @cmd
		-- EXEC (@cmd)
		
		print 'Finished Rebuilding Index: [' + @IndexName + '] on table: ' + @TableName + ' at ' + CAST(GetDate() as varchar)
		print ' '
--	END
--	ELSE
--	BEGIN
--		-- SQL 2000 command kept just in case
--		DBCC DBREINDEX(@Table,' ',@indexFillFactor)  
--	END
		FETCH NEXT FROM IndexCursor INTO @TableName, @IndexName, @IsColumnStoreIndex
	END   
	
	CLOSE IndexCursor
	DEALLOCATE IndexCursor  

	-- Update statistics --------------------------
	print 'Start updating statistics on DB: ' + @Database + ' at ' + CAST(GetDate() as varchar)
	SET @cmd = 'USE [' + @Database +']' + CHAR(13) + 'EXEC sp_updatestats' + CHAR(13)
	--print @cmd  
	
	
	-- EXEC (@cmd)  


	print 'Finished updating statistics on DB: ' + @Database + ' at ' + CAST(GetDate() as varchar)
	print ' '

	FETCH NEXT FROM DatabaseCursor INTO @Database  
END  

CLOSE DatabaseCursor   
DEALLOCATE DatabaseCursor    
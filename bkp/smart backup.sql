--29set21
--https://www.tiagoneves.net/blog/deixando-sua-rotina-de-backup-mais-inteligente/
--https://docs.microsoft.com/en-us/archive/blogs/sql_server_team/sql-server-community-driven-enhancements-in-sql-server-2017


IF (OBJECT_ID('tempdb..#dm_db_file_space_usage') IS NOT NULL) DROP TABLE #dm_db_file_space_usage

CREATE TABLE #dm_db_file_space_usage ( database_id INT, modified_extent_page_count INT, mixed_extent_page_count INT, allocated_extent_page_count INT, percentageChangedPages NUMERIC(18, 4) )

EXEC SP_MSFOREACHDB 'USE [?]
	INSERT INTO #dm_db_file_space_usage
		SELECT  database_id, modified_extent_page_count, mixed_extent_page_count, allocated_extent_page_count, ( CAST((modified_extent_page_count + mixed_extent_page_count) * 1.00 / allocated_extent_page_count AS NUMERIC(18, 4)) ) * 1
		FROM sys.dm_db_file_space_usage;
'

SELECT DB_NAME(#dm_db_file_space_usage.database_id) DB_Name, #dm_db_file_space_usage.modified_extent_page_count, #dm_db_file_space_usage.mixed_extent_page_count, #dm_db_file_space_usage.allocated_extent_page_count, #dm_db_file_space_usage.percentageChangedPages
FROM sys.databases	
INNER JOIN #dm_db_file_space_usage ON sys.databases.database_id  = #dm_db_file_space_usage.database_id 
WHERE sys.databases.database_id > 4 AND name LIKE 'db%' AND state_desc = 'ONLINE' AND is_read_only = 0 --AND percentageChangedPages > 0.3
ORDER BY name

--EXEC dbLogMonitor.dbo.sp_foreachdb N'
--    USE [?];
--
--	SELECT DB_NAME();
--
--'
--,@print_command_only = 0 -- Obrigatório Gerar script
--,@print_dbname=1
--,@state_desc = N'ONLINE'
--,@user_only = 1
--,@suppress_quotename=1
-- ,@name_pattern='db';
----,@database_list = 'dbSigaAliceCoutinho'; 
--
--EXEC dbo.sp_foreachdb N'
--	USE [?]
--
----	SELECT DB_NAME(database_id) DB_Name,
----	       total_page_count TotalPaginas,
----	       modified_extent_page_count TotalExtent_Modificado,
----	       CAST((modified_extent_page_count + mixed_extent_page_count) * 1.00 / allocated_extent_page_count AS NUMERIC(18, 2)) [%_PagModificadas]
----	FROM sys.dm_db_file_space_usage;
--'
--,@print_command_only = 0 -- Obrigatório Gerar script
--,@print_dbname=1
--,@state_desc = N'ONLINE'
--,@user_only = 1
--,@suppress_quotename=1
----,@database_list = 'dbBibFACHO'
--,@name_pattern='db'

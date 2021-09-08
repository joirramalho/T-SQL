--07set21
-- https://www.tiagoneves.net/blog/deixando-sua-rotina-de-backup-mais-inteligente/

EXEC dbLogMonitor.dbo.sp_foreachdb N'
	USE [?]

	SELECT DB_NAME(database_id) DB_Name,
	       total_page_count TotalPaginas,
	       modified_extent_page_count TotalExtent_Modificado,
	       CAST((modified_extent_page_count + mixed_extent_page_count) * 1.00 / allocated_extent_page_count AS NUMERIC(18, 2)) [%_PagModificadas]
	FROM sys.dm_db_file_space_usage;
'
,@print_command_only = 0 -- Obrigatório Gerar script
,@print_dbname=1
,@state_desc = N'ONLINE'
,@user_only = 1
,@suppress_quotename=1
--,@database_list = 'dbSigaA'
 ,@name_pattern='dbCrm';

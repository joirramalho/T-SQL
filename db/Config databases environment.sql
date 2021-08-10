-- STATUS de configuração de Databases e Backups

SELECT 
	-- database_id,
	CONVERT(VARCHAR(1000), DB.name) AS dbName,
	state_desc,
	(SELECT SUM((size*8)/1024) FROM sys.master_files WHERE DB_NAME(database_id) = DB.name AND type_desc = 'rows') AS [Data MB],
	(SELECT SUM((size*8)/1024) FROM sys.master_files WHERE DB_NAME(database_id) = DB.name AND type_desc = 'log') AS [Log MB],	
	page_verify_option_desc AS [page verify option],	
	recovery_model_desc AS [Recovery model],
	is_read_only,	
	-- last backup
	ISNULL((SELECT TOP 1
		CASE type WHEN 'D' THEN 'Full' WHEN 'I' THEN 'Differential' WHEN 'L' THEN 'Transaction log' END + ' – ' +
		LTRIM(ISNULL(STR(ABS(DATEDIFF(DAY, GETDATE(),backup_finish_date))) + ' days ago', 'NEVER')) + ' – ' +
		CONVERT(VARCHAR(20), backup_start_date, 103) + ' ' + CONVERT(VARCHAR(20), backup_start_date, 108) + ' – ' +
		CONVERT(VARCHAR(20), backup_finish_date, 103) + ' ' + CONVERT(VARCHAR(20), backup_finish_date, 108) +
		' (' + CAST(DATEDIFF(second, BK.backup_start_date,	BK.backup_finish_date) AS VARCHAR(4)) + ' ' + 'seconds)'
		FROM msdb..backupset BK WHERE BK.database_name = DB.name ORDER BY backup_set_id DESC),'-') AS [Last backup],
	CASE WHEN is_auto_close_on = 1 THEN 'autoclose' ELSE '' END AS [autoclose],
	CASE WHEN is_auto_shrink_on = 1 THEN 'autoshrink' ELSE '' END AS [autoshrink],
	CASE WHEN is_auto_create_stats_on = 1 THEN 'auto create statistics' ELSE '' END AS [auto create statistics],
	CASE WHEN is_auto_update_stats_on = 1 THEN 'auto update statistics' ELSE '' END AS [auto update statistics],
	CASE compatibility_level
		WHEN 60 THEN '60 (SQL Server 6.0)'
		WHEN 65 THEN '65 (SQL Server 6.5)'
		WHEN 70 THEN '70 (SQL Server 7.0)'
		WHEN 80 THEN '80 (SQL Server 2000)'
		WHEN 90 THEN '90 (SQL Server 2005)'
		WHEN 100 THEN '100 (SQL Server 2008)'
		WHEN 110 THEN '110 (SQL Server 2012)'
		WHEN 120 THEN '120 (SQL Server 2014)'
		WHEN 130 THEN '130 (SQL Server 2016)'
		WHEN 140 THEN '140 (SQL Server 2017)'
	END AS [compatibility level],
	user_access_desc AS [User access],
	CONVERT(VARCHAR(20), create_date, 103) + ' ' + CONVERT(VARCHAR(20), create_date, 108) AS [Creation date],
	CASE WHEN is_fulltext_enabled = 1 THEN 'Fulltext enabled' ELSE '' END AS [fulltext]
FROM sys.databases DB

-- where DB.name LIKE 'dbSigaNeves%'

-- ORDER BY [Data MB] DESC, dbName, [Last backup] DESC, NAME
ORDER BY [Last backup] DESC
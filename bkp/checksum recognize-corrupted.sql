--15jan22 - adaptado
--How to recognize corrupted SQL backup files
	--https://www.sqlshack.com/how-to-recognize-corrupted-sql-backup-files/

SELECT database_name, backup_finish_date, 
	CASE 
		WHEN type = 'D' THEN 'full'
		WHEN type = 'I' THEN 'diff'
		ELSE 'log'
	END AS 'type',	
--	backup_size AS backup_size_in_bytes,
    CAST(ROUND((backup_size / 1024.00), 2) AS NUMERIC(36, 2)) AS UsedSpaceMB, 
	has_backup_checksums 
FROM msdb..backupset
ORDER BY backup_finish_date DESC
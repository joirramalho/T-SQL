-- 25nov21
--How to recognize corrupted SQL backup files
	--https://www.sqlshack.com/how-to-recognize-corrupted-sql-backup-files/

SELECT database_name, backup_finish_date, has_backup_checksums 
FROM msdb..backupset
ORDER BY backup_finish_date DESC
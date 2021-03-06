--25dez21
	--Backup History Details  -- udayarumilli
	    -- http://udayarumilli.com/sql-server-backup-and-restore-reports/

DECLARE @DBName VARCHAR(200),
	@Bkp_Type VARCHAR(20)

SET @DBName = NULL  
--SET @DBName = 'dbBibCeLogos'

SET @Bkp_Type = 'D' -- 'D' -- Full Backup; 'I' -- Differential Backup; 'L' -- Transaction Log Backup
--SET @Bkp_Type = NULL

SELECT	DISTINCT TOP 150
	bs.database_name	AS 'DB_Name'
	, CASE 
		WHEN bs.type = 'D' THEN 'FULL'
		WHEN bs.type = 'I' THEN 'Differential'
		ELSE 'Transactional_Log' 
		END		AS 'Backup_Type_Desc'
	, bs.backup_start_date	AS 'Bkp_Started_At'
	, bs.backup_finish_date	AS 'Bkp_Finished_At'
	, CONVERT(NVARCHAR(10),(bs.backup_finish_date-bs.backup_start_date),108)  AS 'Bkp_duration'
	, CASE 
		WHEN bmf.physical_device_name LIKE 'VN%' THEN 'TAPE DEVICE'
		ELSE UPPER(bmf.physical_device_name)
	  END			AS 'Bkp_location'
	-- , bs.type		AS 'Backup_Type'
	-- , CAST((bs.backup_size/(1024.00*1024.00)) AS DECIMAL(15,2))		AS 'Bkp_Size (MB)'
	, CAST((bs.backup_size/(1024.00*1024.00*1024.00)) AS DECIMAL(15,2))	AS 'Bkp_Size (GB)'
-- , bms.software_name	AS 'Backup_Software'
	  ,has_backup_checksums
	, CASE 
		WHEN bms.is_compressed = 1  THEN 'Yes'
		WHEN bms.is_compressed = 0 THEN 'No'
	  END			AS 'Is_Compressed'
	 ,CASE 
		WHEN bms.is_password_protected = 1 THEN 'Yes'
		WHEN bms.is_password_protected = 0 THEN 'No'
	  END			AS 'Is_Password_Protected'
FROM	msdb..backupset bs
	JOIN msdb..backupmediafamily bmf ON bs.media_set_id = bmf.media_set_id
	JOIN msdb..backupmediaset bms ON bms.media_set_id = bmf.media_set_id
WHERE	bs.database_name = ISNULL(@DBName,bs.database_name)  
		AND bs.type = ISNULL( @Bkp_Type, bs.type )
ORDER BY bs.backup_start_date desc, bs.database_name;
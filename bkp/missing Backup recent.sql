--26set21
--03Nov20
    -- http://udayarumilli.com/sql-server-backup-and-restore-reports/

DECLARE @Backup_Type CHAR(1),
		@Days SMALLINT,
		@DBName VARCHAR(64)


--SET @DBName  = NULL;
--SET @DBName  = 'dbActiveBibCNSA'


SET @Backup_Type = 'D' -- D - Full; I - Differential; L- Transaction Log

-- Ex: -1: Reports all DB without backup in last 24 hours
-- Ex: -30 - Reports all DB without any backup from last 30 Days
SET @Days = -7

--Database with no Backup in the given period
SELECT 
	bs.database_name		AS 'Database_Name',
	bs.type,
	MAX(bs.backup_finish_date)	AS 'Last_Backup_Date', 
	DATEDIFF(DD, MAX(bs.backup_finish_date), GETDATE()) AS 'Backup_Age(days)'
    ,state_desc, recovery_model_desc, is_read_only, user_access_desc, create_date,
	
	Bs.has_backup_checksums,
    Bs.is_damaged

FROM	msdb.dbo.backupset bs
LEFT JOIN sys.databases ON bs.database_name = sys.databases.name
WHERE   bs.type = ISNULL( @Backup_Type, bs.type )
	AND bs.database_name = ISNULL(@DBName,bs.database_name)    
    AND EXISTS( SELECT * FROM sys.databases WHERE bs.database_name = sys.databases.name )

GROUP BY	bs.database_name, bs.type, state_desc, recovery_model_desc, is_read_only, user_access_desc, create_date, has_backup_checksums, is_damaged
HAVING		(MAX(bs.backup_finish_date) < DATEADD(DD, @Days, GETDATE()))  
ORDER BY	bs.database_name; 
-- ORDER BY	MAX(bs.backup_finish_date) --bs.database_name; 

-- UNION

-- Databases with no backup history 
-- SELECT      
-- 	sd.name				AS 'Database_Name', 
-- 	NULL				AS 'Last_Backup_Date',  
-- 	9999				AS 'Backup_Age(Hrs)'
--     -- sd.state_desc, recovery_model_desc, is_read_only, user_access_desc, create_date
-- FROM	master.dbo.sysdatabases sd
-- LEFT JOIN msdb.dbo.backupset bs ON sd.name  = bs.database_name 
-- WHERE	bs.database_name IS NULL AND sd.name <> 'tempdb' 
-- ORDER BY	bs.database_name; 
--26set21
--12Fev21

SELECT  name AS 'Database_Name', state_desc, recovery_model_desc, is_read_only, user_access_desc, create_date, is_auto_close_on, is_auto_shrink_on, compatibility_level, collation_name
FROM    sys.databases d
WHERE   database_id > 5
        AND NOT EXISTS( SELECT * FROM msdb.dbo.backupset bs WHERE bs.database_name = d.name )

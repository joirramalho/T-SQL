-- 20ago21
-- 20jul21

-- https://sqlperformance.com/2020/05/system-configuration/0-to-60-switching-to-indirect-checkpoints

-- https://docs.microsoft.com/pt-br/sql/relational-databases/logs/change-the-target-recovery-time-of-a-database-sql-server?view=sql-server-ver15

-- https://www.mssqltips.com/sqlservertip/4541/adjust-targetrecoverytime-to-reduce-sql-server-io-spikes/

DECLARE @sql nvarchar(max) = N'';
 
SELECT @sql += N'ALTER DATABASE ' + QUOTENAME(name) + ' SET TARGET_RECOVERY_TIME = 60 SECONDS;' 
  FROM sys.databases AS d 
  WHERE target_recovery_time_in_seconds = 0
    AND database_id > 4 
  --  AND name LIKE 'dbSigaCo%'
    AND [state] = 0
    AND is_read_only = 0
    AND NOT EXISTS 
    (
      SELECT 1 FROM sys.dm_hadr_availability_replica_states AS s
        INNER JOIN sys.availability_databases_cluster AS c
             ON s.group_id  = c.group_id 
          WHERE c.database_name = d.name
            AND (s.role_desc <> 'PRIMARY' OR s.is_local = 0) 
    );
 
SELECT DatabaseCount = @@ROWCOUNT, Version = @@VERSION, cmd = @sql;

--EXEC sys.sp_executesql @sql;


SELECT QUOTENAME(name), target_recovery_time_in_seconds
  FROM sys.databases AS d 
 WHERE target_recovery_time_in_seconds = 0
    AND name LIKE 'dbSiga%'


  
  -- DBCC CHECKDB(dbSigaMoreiraXavier) WITH TABLERESULTS

  
  -- dbSiga
  
  
  
  
  
  
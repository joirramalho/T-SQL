-- 21jul21 - SQL09, SQL08 & SQL07

-- EXEC dbLogMonitor.dbo.sp_Where

DECLARE @DateBefore DATETIME 
SET @DateBefore = DATEADD(DAY, -7, GETDATE())

EXEC msdb.dbo.sp_purge_jobhistory @oldest_date = @DateBefore




DECLARE @DateBefore DATETIME 
SET @DateBefore = DATEADD(DAY, -30, GETDATE())

EXEC msdb.dbo.sp_delete_backuphistory @oldest_date = @DateBefore
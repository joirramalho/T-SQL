-- EXEC dbLogMonitor.dbo.sp_ServerName
  
EXEC msdb.dbo.sp_delete_job
    @job_name = N'Job_SimpleCheckDb'


EXEC msdb.dbo.sp_delete_job
    @job_name = N'Job_Kill-Session'

EXEC msdb.dbo.sp_detach_schedule @job_id=N'366c0e33-14d8-4d88-b26c-bbd36fe88b43', @schedule_id=8, @delete_unused_schedule=1
GO

EXEC msdb.dbo.sp_delete_job
    @job_name = N'Job_LogMonitor_Uptime';


EXEC msdb.dbo.sp_delete_job
    @job_name = N'Job_LogMonitor_Uptime_Update';
    -- @step_id = 5;

--29ago21

EXEC dbLogMonitor.dbo.sp_foreachdb N'
    ALTER DATABASE [?] SET ONLINE;

    DROP DATABASE [?];
'
,@print_command_only = 0 -- Obrigatório Gerar script
,@print_dbname=1
,@state_desc = N'OFFLINE'
,@user_only = 1
,@suppress_quotename=1
-- ,@name_pattern='db';
,@database_list = 'dbBibFACHO, dbSigaFACHO'
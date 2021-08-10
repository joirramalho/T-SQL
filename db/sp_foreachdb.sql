-- EXEC dbLogMonitor.dbo.sp_Where

EXEC dbLogMonitor.dbo.sp_foreachdb N'
    IF EXISTS( SELECT name, state_desc, recovery_model_desc, is_read_only, user_access_desc, create_date
                FROM sys.databases d
                WHERE name = ''?'' 
                AND recovery_model <> 1        -- SIMPLE
            )
    BEGIN
        ALTER DATABASE [?] SET RECOVERY FULL WITH NO_WAIT
    END
'
,@print_command_only = 1 -- Obrigatório Gerar script
,@print_dbname=1
,@state_desc = N'ONLINE'
,@user_only = 1
,@suppress_quotename=1
,@name_pattern='dbSiga';
-- ,@database_list = 'dbSigaA'



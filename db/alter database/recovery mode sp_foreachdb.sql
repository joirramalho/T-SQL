EXEC dbLogMonitor.dbo.sp_foreachdb N'
    IF EXISTS( SELECT name, state_desc, recovery_model_desc, is_read_only, user_access_desc, create_date
                FROM sys.databases d
                WHERE name = ''?'' 
                -- AND recovery_model = 3  -- 1-FULL 3-simple
            )
    BEGIN
        SELECT DB_NAME();

        -- ALTER DATABASE [?] SET RECOVERY SIMPLE WITH NO_WAIT;
        ALTER DATABASE [?] SET RECOVERY FULL WITH NO_WAIT;
    END
'
,@print_command_only = 0 -- Obrigatório Gerar script
,@print_dbname=1
,@state_desc = N'ONLINE'
,@user_only = 1
,@suppress_quotename=1
-- ,@name_pattern='';
,@database_list = 'dbBibAuxilRecife'
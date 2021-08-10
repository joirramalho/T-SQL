-- 31jul21

-- EXEC dbLogMonitor.dbo.sp_where

EXEC dbLogMonitor.dbo.sp_foreachdb N' 
    USE [?]

    IF EXISTS(  select *
                    from sys.database_principals
                    where type not in (''A'', ''G'', ''R'', ''X'') 
                        and sid is not null 
                        and name != ''guest''

                        -- AND name LIKE ''userSisController%''
                        -- AND name LIKE ''%GPA%''
                        -- AND name = ''user''
                        -- AND name LIKE ''%EEM%''

                        -- AND name = ''active.backup''
                        -- AND name = ''activeuser''
                        AND name = ''sigauser''
                )
    BEGIN
        SELECT DB_NAME()

        -- CREATE  USER [active.backup]        FOR LOGIN   [active.backup] WITH DEFAULT_SCHEMA=[dbo]
        -- ALTER   ROLE [db_backupoperator]    ADD MEMBER  [active.backup]

-- OR
        -- exec sp_droprolemember ''db_backupoperator'', 	''active.backup''
        -- DROP USER [active.backup];

-- OR
        DROP USER [activeuser];

-- OR
        --         exec sp_droprolemember ''db_owner'', 	''sigauser'';
        DROP SCHEMA [sigauser];
        DROP USER [sigauser];
    END
'
,@print_command_only = 0 -- Obrigatório Gerar script
,@print_dbname=1
-- ,@state_desc = N'OFFLINE'
,@user_only = 1
,@suppress_quotename=1
,@name_pattern='db';
-- ,@database_list = 'dbSigaAldeiaPE'

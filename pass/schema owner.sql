--12jan22

EXEC dbo.sp_foreachdb N' 
    USE [?]

    SELECT  s.Name AS SchemaName, u.*
    FROM    sys.schemas s
    INNER   JOIN sys.sysusers u ON u.uid = s.principal_id
    -- WHERE   s.Name IN (''db_owner'')
'
,@print_command_only = 0 -- Obrigatório Gerar script
,@print_dbname=1
-- ,@state_desc = N'OFFLINE'
,@user_only = 1
,@suppress_quotename=1
,@name_pattern='dbSigaPauloFreire';
-- ,@database_list = 'dbSigaAldeiaPE'
-- LIST USERS IN DATABASE WITH SPECIFIC ROLES -- 18DEZ20 - Adaptado

EXEC dbLogMonitor.dbo.sp_foreachdb N'
    USE ?

    IF NOT EXISTS(
         SELECT 
        User_Type = 
           CASE mmbrp.[type] 
           WHEN ''G'' THEN ''Windows Group''
           WHEN ''S'' THEN ''SQL User'' 
           WHEN ''U'' THEN ''Windows User'' 
           END,
         Database_User_Name = mmbrp.[name],
         Login_Name = ul.[name],
         DB_Role = rolp.[name]
      FROM sys.database_role_members mmbr, -- The Role OR members associations table
         sys.database_principals rolp,     -- The DB Roles names table
         sys.database_principals mmbrp,    -- The Role members table (database users)
         sys.server_principals ul          -- The Login accounts table
      WHERE Upper (mmbrp.[type]) IN ( ''S'', ''U'', ''G'' )
         AND Upper (mmbrp.[name]) NOT IN (''SYS'',''INFORMATION_SCHEMA'')
         AND rolp.[principal_id] = mmbr.[role_principal_id]
         AND mmbrp.[principal_id] = mmbr.[member_principal_id]
         AND ul.[sid] = mmbrp.[sid]
         AND rolp.[name] LIKE ''%roleOperacaoRestore%''
    )
         SELECT DB_NAME()

'
,@print_command_only = 0 -- Obrigatório Gerar script
,@print_dbname=0
,@state_desc = N'ONLINE'
,@user_only = 1
,@suppress_quotename=1
,@name_pattern='dbLogRestore';
-- ,@database_list = 'dbSigaEscolaNovaCruz,dbSigaDom'
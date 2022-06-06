--05jan21

EXEC dbo.sp_foreachdb N'
	USE [?] 

SELECT DB_NAME()

	IF EXISTS (SELECT * FROM sysobjects WHERE name=''_database_smells'' AND xtype=''U'')
		DROP TABLE dbo._database_smells
'
,@print_command_only = 0 -- Obrigatório Gerar script
,@print_dbname=0
,@state_desc = N'ONLINE'
,@user_only = 1
,@suppress_quotename=1
,@name_pattern='Bd'
-- ,@database_list = 'dbSigaOliviaLima' --06 
    
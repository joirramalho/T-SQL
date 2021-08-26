--25ago21

EXEC dbLogMonitor.dbo.sp_foreachdb N' 
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
,@name_pattern='dbSigaSaleFAlcao';
-- ,@database_list = 'dbSigaAldeiaPE'



--USE dbSigaCONFHICSaoJose;
--ALTER AUTHORIZATION ON SCHEMA::[db_owner] TO [db_owner];
--ALTER AUTHORIZATION ON SCHEMA::[db_datareader] TO [db_datareader];
--ALTER AUTHORIZATION ON SCHEMA::[db_accessadmin] TO [db_accessadmin]

--ALTER AUTHORIZATION ON SCHEMA::[sigainternet] TO [sigainternet];


--DROP SCHEMA [sactive];
--DROP USER [active];

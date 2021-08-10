-- CREATE INDEX  pelo sp_foreachdb - 10abr21 -- PASSAR PARA ANDERSON

-- SQL06; SQL07; SQL04; SQL03; SQl02; SQL01, VPS8 & VPS7 - 30abr21
-- SQL05

EXEC dbLogMonitor.dbo.sp_foreachdb N'
    USE ?

    IF NOT EXISTS( SELECT * FROM sys.indexes WHERE name=''IX_TbAuditoria_Tabela_DataHora'' AND object_id = OBJECT_ID(''dbo.TbAuditoria'') )
        BEGIN
        CREATE INDEX [IX_TbAuditoria_Tabela_DataHora] 
            ON [?].[dbo].[TbAuditoria] ([Tabela],[DataHora]) INCLUDE ([ValorChave1])

            SELECT DB_NAME()  

            WAITFOR DELAY ''00:00:30'';
        END
    ELSE
        BEGIN
            SELECT ''JÁ EXISTE IX_TbAuditoria_Tabela_DataHora EM ?''
        END
'
,@print_command_only = 0 -- Obrigatório Gerar script
,@print_dbname=0
,@state_desc = N'ONLINE'
,@user_only = 1
,@suppress_quotename=1
-- ,@database_list = 'dbSigaOmegaBelem' -- dbSigaExitoNatal -- dbSigaMickeylandia -- dbSigaCEAMOMossoro -- dbSigaSagradoCoracao -- dbSigaCordCNSD
,@name_pattern='dbSiga';     
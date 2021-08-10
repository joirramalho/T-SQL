-- CREATE INDEX TbTurma pelo sp_foreachdb - 15Dez20 -- PASSAR PARA ANDERSON

-- APLICADO EM
-- SQL03 - 01Fev21 
-- SQL04 - 01Fev21 - 5 bancos, inclusive Dom Bosco e São José
-- SQL05 - 01Fev21 - 5 bancos, inclusive Dom Bosco e São José


EXEC dbLogMonitor.dbo.sp_foreachdb N'
    USE ?

--    DROP INDEX [IX_TbAuditoria_IdUsuario]
--                ON [?].[dbo].[TbAuditoria]

    IF NOT EXISTS( SELECT * FROM sys.indexes WHERE name=''IX_TbAuditoria_IdUsuario'' AND object_id = OBJECT_ID(''dbo.TbAuditoria'') )
        BEGIN

            CREATE INDEX [IX_TbAuditoria_IdUsuario] 
                ON [?].[dbo].[TbAuditoria] ([IdUsuario]) 

            SELECT DB_NAME()  
        END
    ELSE
        BEGIN
            SELECT ''EXISTE IX_TbAuditoria_IdUsuario EM ?''
        END
'
,@print_command_only = 0 -- Obrigatório Gerar script
,@print_dbname=0
,@state_desc = N'ONLINE'
,@user_only = 1
,@suppress_quotename=1
-- ,@database_list = 'dbSigaOmegaBelem'
,@name_pattern='dbSiga';        
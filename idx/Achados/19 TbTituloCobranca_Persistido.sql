-- 24Nov21 -- PASSAR PARA ANDERSON

-- SQL11, 10, 09, 08, 07, 06, 05, 04

EXEC dbLogMonitor.dbo.sp_foreachdb N'
    USE ?

    IF NOT EXISTS( SELECT * FROM sys.indexes WHERE name=''IX_TbTituloCobranca_Persistido_DataHora_UltimaAlteracao'' AND object_id = OBJECT_ID(''dbo.TbTituloCobranca_Persistido'') )
        BEGIN
            CREATE INDEX [IX_TbTituloCobranca_Persistido_DataHora_UltimaAlteracao] 
                ON [?].[dbo].[TbTituloCobranca_Persistido] ([DataHora_UltimaAlteracao])

            PRINT DB_NAME()  
        END
	 ELSE
	     BEGIN
	         SELECT ''JÁ EXISTE IX_TbTituloCobranca_Persistido_DataHora_UltimaAlteracao EM ?''
	     END

--    IF NOT EXISTS( SELECT * FROM sys.indexes WHERE name=''IX_TbTituloCobranca_Persistido_DataHora_UltimaAlteracao'' AND object_id = OBJECT_ID(''dbo.TbTituloCobranca_Persistido'') )
--        BEGIN
--            PRINT DB_NAME()  
--        END

'
,@print_command_only = 0 -- Obrigatório Gerar script
,@print_dbname=0
,@state_desc = N'ONLINE'
,@user_only = 1
,@suppress_quotename=1
-- ,@database_list = 'dbSigaOmegaBelem' 
,@name_pattern='dbSiga';     

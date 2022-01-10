-- 07dez22 -- Passado PARA ANDERSON via slack em 07dez21

-- SQL08, 09, 10, 11, 07, 06, 05 04, 03, 02

EXEC dbo.sp_foreachdb N'
    USE ?

    IF EXISTS( SELECT * FROM sys.indexes WHERE name=''IX_TbTituloCobranca_Persistido_DataHora_UltimaAlteracao'' AND object_id = OBJECT_ID(''dbo.TbTituloCobranca_Persistido'') )
        BEGIN
            DROP INDEX [IX_TbTituloCobranca_Persistido_DataHora_UltimaAlteracao] 
                ON [?].[dbo].[TbTituloCobranca_Persistido]

            PRINT DB_NAME()  
        END
	 ELSE
	     BEGIN
	         SELECT ''NÃO EXISTE IX_TbTituloCobranca_Persistido_DataHora_UltimaAlteracao EM ?''
	     END


'
,@print_command_only = 0 -- Obrigatório Gerar script
,@print_dbname=0
,@state_desc = N'ONLINE'
,@user_only = 1
,@suppress_quotename=1
-- ,@database_list = 'dbSigaOmegaBelem' 
,@name_pattern='dbSiga';     

--18mai22
-- 31mar22 -- Executado em todos e passado PARA ANDERSON ...


-- VPS08; VPS04; VPS06; VPS11; VPS07; VPS12;	VPS01; VPS02; VPS03; VPS05; VPS09; VPS10

EXEC dbo.sp_foreachdb N'
    USE ?

	PRINT DB_NAME()

		IF EXISTS( SELECT * FROM sys.indexes WHERE name=''IX_TbTituloCobranca_IdFormaRecebimento'' AND object_id = OBJECT_ID(''dbo.TbTituloCobranca'') )
		    BEGIN
		    	DROP INDEX [IX_TbTituloCobranca_IdFormaRecebimento] ON [?].[dbo].[TbTituloCobranca]

		    	PRINT ''	DROP INDEX [IX_TbTituloCobranca_IdFormaRecebimento] ''
		    END

--
--		-- wait for 1 second
--		WAITFOR DELAY ''00:00:05''
'
,@print_command_only = 0 -- Obrigatório Gerar script
,@print_dbname=0
,@state_desc = N'ONLINE'
,@user_only = 1
,@suppress_quotename=1
-- ,@database_list = 'dbSigaGGE, dbSigaISO, dbSigaAraraAzul, dbSigaPH3CV, dbSigaENSVitoriasRN, dbSigaConectivoCE, dbSigaOpcaoPE, dbSigaCEEsCrianca';
,@name_pattern='dbSigaPadraoInst_0505';  --   dbActive -- dbBib
--
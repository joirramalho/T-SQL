-- 07abr22 -- Executado em todos e passado PARA ANDERSON ...


-- VPS08; VPS04; VPS06...

EXEC dbo.sp_foreachdb N'
    USE ?

	PRINT DB_NAME()
--					
		IF EXISTS( SELECT * FROM sys.indexes WHERE name=''IX_TbAuditoriaDataHora'' AND object_id = OBJECT_ID(''dbo.TbAuditoria'') )
		    BEGIN
		      DROP INDEX [IX_TbAuditoriaDataHora] ON [?].[dbo].[TbAuditoria]

				PRINT ''DROP  IX_TbAuditoriaDataHora''
		    END


		IF EXISTS( SELECT * FROM sys.indexes WHERE name=''IX_TbAuditoria_Tabela_DataHora'' AND object_id = OBJECT_ID(''dbo.TbAuditoria'') )
		    BEGIN
		      DROP INDEX [IX_TbAuditoria_Tabela_DataHora] ON [?].[dbo].[TbAuditoria]

				PRINT ''DROP IX_TbAuditoria_Tabela_DataHora''
		    END


		IF NOT EXISTS( SELECT * FROM sys.indexes WHERE name=''IX_TbAuditoria_Tabela_DataHora-ValorChave1'' AND object_id = OBJECT_ID(''dbo.TbAuditoria'') )
			BEGIN
				CREATE INDEX [IX_TbAuditoria_Tabela_DataHora-ValorChave1] ON [?].[dbo].[TbAuditoria]	([Tabela],[DataHora])	INCLUDE ([ValorChave1])	WITH (FILLFACTOR=90)
			END
		ELSE
      	PRINT  '' já tem IX_TbAuditoria_Tabela_DataHora-ValorChave1''



		IF NOT EXISTS( SELECT * FROM sys.indexes WHERE name=''IX_TbAuditoria_IdUsuario'' AND object_id = OBJECT_ID(''dbo.TbAuditoria'') )
			BEGIN
				CREATE INDEX [IX_TbAuditoria_IdUsuario] ON [?].[dbo].[TbAuditoria]	([IdUsuario])	WITH (FILLFACTOR=90)
			END
		ELSE
      	PRINT  '' já tem IX_TbAuditoria_IdUsuario''




--
--		-- wait for 1 second
		WAITFOR DELAY ''00:00:01''



'
,@print_command_only = 0 -- Obrigatório Gerar script
,@print_dbname=0
,@state_desc = N'ONLINE'
,@user_only = 1
,@suppress_quotename=1
-- ,@database_list = 'dbSigaGGE, dbSigaISO, dbSigaAraraAzul, dbSigaPH3CV, dbSigaENSVitoriasRN, dbSigaConectivoCE, dbSigaOpcaoPE, dbSigaCEEsCrianca';
,@name_pattern='dbSiga';  --   dbActive -- dbBib
--
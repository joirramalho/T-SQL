--18mai22
-- 31mar22 -- Executado em todos e passado PARA ANDERSON ...


-- VPS04; VPS06; VPS08; VPS11; VPS09; VPS05, VPS07, VPS10; VPS12; VPS01; VPS02; VPS03.

EXEC dbo.sp_foreachdb N'
    USE ?

--					

		IF NOT EXISTS( SELECT * FROM sys.indexes WHERE name=''IX_TbTurma_IdSerie_IdPeriodo_TipoTurma'' AND object_id = OBJECT_ID(''dbo.TbTurma'') )
		    BEGIN
				PRINT DB_NAME()

				CREATE INDEX IX_TbTurma_IdSerie_IdPeriodo_TipoTurma ON [dbo].[TbTurma]	([IdSerie], [IdPeriodo], [TipoTurma])	WITH (FILLFACTOR=90)
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
,@name_pattern='dbSiga';  --   dbActive -- dbBib
--
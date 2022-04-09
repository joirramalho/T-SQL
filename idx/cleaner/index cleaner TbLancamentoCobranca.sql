-- 31mar22 -- Executado em todos e passado PARA ANDERSON ...


-- VPS08; VPS04; VPS06; VPS11; VPS07; VPS12; VPS03; VPS02; VPS01; VPS05; VPS09; VPS10


EXEC dbo.sp_foreachdb N'
    USE ?

	PRINT DB_NAME()

		IF EXISTS( SELECT * FROM sys.indexes WHERE name=''IX_TbLancamentoCobrancaParcelaServico'' AND object_id = OBJECT_ID(''dbo.TbLancamentoCobranca'') )
		    BEGIN
		      DROP INDEX [IX_TbLancamentoCobrancaParcelaServico] ON [?].[dbo].[TbLancamentoCobranca]
		    END
					
		IF EXISTS( SELECT * FROM sys.indexes WHERE name=''IX_TbLancamentoCobranca_IdAlunoTaxa'' AND object_id = OBJECT_ID(''dbo.TbLancamentoCobranca'') )
		    BEGIN
		      DROP INDEX [IX_TbLancamentoCobranca_IdAlunoTaxa] ON [?].[dbo].[TbLancamentoCobranca]
		    END
					
		IF EXISTS( SELECT * FROM sys.indexes WHERE name=''IX_TbLancamentoCobranca_IdTurma'' AND object_id = OBJECT_ID(''dbo.TbLancamentoCobranca'') )
		    BEGIN
		      DROP INDEX [IX_TbLancamentoCobranca_IdTurma] ON [?].[dbo].[TbLancamentoCobranca]
		    END
					

--					

		IF EXISTS( SELECT * FROM sys.indexes WHERE name=''IX_TbLancamentoCobranca_IdServico'' AND object_id = OBJECT_ID(''dbo.TbLancamentoCobranca'') )
		    BEGIN
		      DROP INDEX [IX_TbLancamentoCobranca_IdServico] ON [?].[dbo].[TbLancamentoCobranca]
		    END

			IF NOT EXISTS( SELECT * FROM sys.indexes WHERE name=''IX_TbLancamentoCobranca_IdServico-included'' AND object_id = OBJECT_ID(''dbo.TbLancamentoCobranca'') )
				BEGIN
					CREATE INDEX [IX_TbLancamentoCobranca_IdServico-included] ON [dbo].[TbLancamentoCobranca]	([IdServico])	INCLUDE ([IdTituloCobrancaGerado], [IdTurma], [DataFaturamento], [IdNotaFiscal])	WITH (FILLFACTOR=90)
				END

--



--
--		-- wait for 1 second
--		WAITFOR DELAY ''00:00:10''



'
,@print_command_only = 0 -- Obrigatório Gerar script
,@print_dbname=0
,@state_desc = N'ONLINE'
,@user_only = 1
,@suppress_quotename=1
-- ,@database_list = 'dbSigaGGE, dbSigaISO, dbSigaAraraAzul, dbSigaPH3CV, dbSigaENSVitoriasRN, dbSigaConectivoCE, dbSigaOpcaoPE, dbSigaCEEsCrianca';
,@name_pattern='dbSiga';  --   dbActive -- dbBib

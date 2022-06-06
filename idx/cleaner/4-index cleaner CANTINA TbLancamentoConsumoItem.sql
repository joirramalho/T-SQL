--27mai22 -- passado PARA ANDERSON hoje

-- VPS05; VPS06

EXEC dbo.sp_foreachdb N'
    USE ?

		PRINT DB_NAME()

		IF NOT EXISTS( SELECT * FROM sys.indexes WHERE name=''IX_TbLancamentoConsumoItem_IdLancamentoConsumo-Quantidade_PrecoUnitario'' AND object_id = OBJECT_ID(''dbo.TbLancamentoConsumoItem'') )
		    BEGIN
				CREATE INDEX [IX_TbLancamentoConsumoItem_IdLancamentoConsumo-Quantidade_PrecoUnitario] ON [dbo].[TbLancamentoConsumoItem]	([IdLancamentoConsumo])	INCLUDE ([Quantidade], [PrecoUnitario]) WITH (FILLFACTOR=90)

				PRINT ''IX_TbLancamentoConsumoItem_IdLancamentoConsumo-Quantidade_PrecoUnitario''
		    END



		IF NOT EXISTS( SELECT * FROM sys.indexes WHERE name=''IX_TbLancamentoCredito_IdCaixaMovimentacao'' AND object_id = OBJECT_ID(''dbo.TbLancamentoCredito'') )
		    BEGIN
				CREATE INDEX IX_TbLancamentoCredito_IdCaixaMovimentacao ON [dbo].[TbLancamentoCredito]	([IdCaixaMovimentacao])	WITH (FILLFACTOR=90)

				PRINT ''IX_TbLancamentoCredito_IdCaixaMovimentacao''
		    END


		IF NOT EXISTS( SELECT * FROM sys.indexes WHERE name=''IX_TbCaixaLancamento_IdCaixaMovimentacao_CdTipoRecebimento-Valor'' AND object_id = OBJECT_ID(''dbo.TbCaixaLancamento'') )
		    BEGIN
				CREATE INDEX [IX_TbCaixaLancamento_IdCaixaMovimentacao_CdTipoRecebimento-Valor] ON [dbo].[TbCaixaLancamento]	([IdCaixaMovimentacao], [CdTipoRecebimento])	INCLUDE ([Valor])	WITH (FILLFACTOR=90)

				PRINT ''IX_TbCaixaLancamento_IdCaixaMovimentacao_CdTipoRecebimento-Valor''
		    END


		IF NOT EXISTS( SELECT * FROM sys.indexes WHERE name=''IX_TbCaixaMovimentacao_IdCaixaAbertura'' AND object_id = OBJECT_ID(''dbo.TbCaixaMovimentacao'') )
		    BEGIN
				CREATE INDEX IX_TbCaixaMovimentacao_IdCaixaAbertura ON [dbo].[TbCaixaMovimentacao]	([IdCaixaAbertura])	WITH (FILLFACTOR=90)

				PRINT ''IX_TbCaixaMovimentacao_IdCaixaAbertura''
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
,@name_pattern='dbVendas';  --  dbCantina	 dbActiveCantina	dbVendas
--
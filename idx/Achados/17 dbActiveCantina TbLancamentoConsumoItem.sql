-- CREATE INDEX  pelo sp_foreachdb - NÃO PASSAR PARA ANDERSON

--09set21 SQL06 dbActiveCantinaFenix; SQL07

EXEC dbLogMonitor.dbo.sp_foreachdb N'
    USE [?]

--TbLancamentoConsumoItem
    IF EXISTS( SELECT * FROM sys.indexes WHERE name=''IX_TbLancamentoConsumoItem_IdLancamentoConsumo'' AND object_id = OBJECT_ID(''dbo.TbLancamentoConsumoItem'') )
            DROP INDEX [IX_TbLancamentoConsumoItem_IdLancamentoConsumo] ON [dbo].[TbLancamentoConsumoItem]


    IF NOT EXISTS( SELECT * FROM sys.indexes WHERE name=''IX_TbLancamentoConsumoItem_IdLancamentoConsumo'' AND object_id = OBJECT_ID(''dbo.TbLancamentoConsumoItem'') )
        BEGIN
			CREATE INDEX [IX_TbLancamentoConsumoItem_IdLancamentoConsumo] ON 
				[?].[dbo].[TbLancamentoConsumoItem] ([IdLancamentoConsumo]) INCLUDE ([Quantidade], [PrecoUnitario])
    	END

--  

--TbLancamentoCredito
    IF EXISTS( SELECT * FROM sys.indexes WHERE name=''IX_TbLancamentoCredito_IdLancamentoConsumo'' AND object_id = OBJECT_ID(''dbo.TbLancamentoCredito'') )
            DROP INDEX [IX_TbLancamentoCredito_IdLancamentoConsumo] ON [dbo].[TbLancamentoCredito]
	

    IF NOT EXISTS( SELECT * FROM sys.indexes WHERE name=''IX_TbLancamentoConsumoItem_IdLancamentoConsumo'' AND object_id = OBJECT_ID(''dbo.TbLancamentoCredito'') )
        BEGIN
			CREATE INDEX [IX_TbLancamentoCredito_IdLancamentoConsumo] ON [?].[dbo].[TbLancamentoCredito] ([IdLancamentoConsumo])
    	END


	SELECT DB_NAME()  

--            WAITFOR DELAY ''00:00:05'';
--      ELSE
--        BEGIN
--            SELECT ''JÁ EXISTE EM ?''
--        END
'
,@print_command_only = 0 -- Obrigatório Gerar script
,@print_dbname=0
,@state_desc = N'ONLINE'
,@user_only = 1
,@suppress_quotename=1
--,@database_list = 'dbActiveCantinaFenix' -- dbSigaExitoNatal -- dbSigaMickeylandia -- dbSigaCEAMOMossoro -- dbSigaSagradoCoracao -- dbSigaCordCNSD
,@name_pattern='dbCantina';     


-- [dbSigaSantaRosa].[dbo].[TbMobileMensagem]
-- CREATE INDEX [IX_TbMobileMensagem_IdMobileTipoMensagem_IdPessoaRelacionada_TipoPessoaRelacionada] ON [dbSigaSantaRosa].[dbo].[TbMobileMensagem] ([IdMobileTipoMensagem], [IdPessoaRelacionada], [TipoPessoaRelacionada]) INCLUDE ([IdAutor], [TipoAutor], [DataHora], [Mensagem], [DataHoraLeitura], [TipoPessoaLeitura], [IdPessoaLeitura])


--USE dbActiveCantinaFenix 
--EXEC sp_helpindex 'TbLancamentoConsumoItem'
--EXEC sp_helpindex 'TbLancamentoCredito'
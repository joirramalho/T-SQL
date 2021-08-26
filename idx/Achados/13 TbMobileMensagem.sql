-- CREATE INDEX  pelo sp_foreachdb - 03mai21 -- PASSAR PARA ANDERSON

-- 25ago21 SQL04 - dbSigaSaleJuvenal; bancos novos ou migrados para nuvem
-- 09ago21 dbSigaPadraoInsES 
-- 06ago21 dbSigaPadraoInst v150
-- 05ago21 - SQL09, SQL08, SQL07, SQL06, SQL05, SQL04, SQL03, SQL02, SQL01.
-- SQL07, SQL06, SQL05, SQL04, SQL03, SQL02, SQL01, VPS8, VPS7

-- EXEC dbLogMonitor.dbo.sp_Where

EXEC dbLogMonitor.dbo.sp_foreachdb N'
    USE ?

    IF NOT EXISTS( SELECT * FROM sys.indexes WHERE name=''IX_TbMobileMensagem_IdMobileTipoMensagem_IdPessoaRelacionada_TipoPessoaRelacionada'' AND object_id = OBJECT_ID(''dbo.TbMobileMensagem'') )
        BEGIN
            CREATE INDEX [IX_TbMobileMensagem_IdMobileTipoMensagem_IdPessoaRelacionada_TipoPessoaRelacionada] ON 
                [?].[dbo].[TbMobileMensagem] ([IdMobileTipoMensagem], [IdPessoaRelacionada], [TipoPessoaRelacionada]) INCLUDE ([IdAutor], [TipoAutor], [DataHora], [Mensagem], [DataHoraLeitura], [TipoPessoaLeitura], [IdPessoaLeitura])

            SELECT DB_NAME()  

            -- WAITFOR DELAY ''00:00:10'';
        END
    -- ELSE
    --     BEGIN
    --         SELECT ''Tem ?''
    --     END
'
,@print_command_only = 0 -- Obrigatório Gerar script
,@print_dbname=0
,@state_desc = N'ONLINE'
,@user_only = 1
,@suppress_quotename=1
-- ,@database_list = 'dbSigaOmegaBelem' -- dbSigaExitoNatal -- dbSigaMickeylandia -- dbSigaCEAMOMossoro -- dbSigaSagradoCoracao -- dbSigaCordCNSD
,@name_pattern='dbSiga';     


-- [dbSigaSantaRosa].[dbo].[TbMobileMensagem]
-- CREATE INDEX [IX_TbMobileMensagem_IdMobileTipoMensagem_IdPessoaRelacionada_TipoPessoaRelacionada] ON [dbSigaSantaRosa].[dbo].[TbMobileMensagem] ([IdMobileTipoMensagem], [IdPessoaRelacionada], [TipoPessoaRelacionada]) INCLUDE ([IdAutor], [TipoAutor], [DataHora], [Mensagem], [DataHoraLeitura], [TipoPessoaLeitura], [IdPessoaLeitura])
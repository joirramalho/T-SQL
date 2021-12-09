-- CREATE INDEX  pelo sp_foreachdb - 07mai21 -- NÃO PASSAR PARA ANDERSON - APENAS BANCOS_ARQUIVO

-- 26ago21 SQL04 dbSigaSalesianoSaoJose
-- 21jul21 SQL08 GGE  

EXEC dbLogMonitor.dbo.sp_foreachdb N'
    USE [?]


	IF (OBJECT_ID(''TbTituloCobranca_Persistido'') IS  NULL )
        BEGIN
            SELECT ''não EXISTE EM ?''
        END
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


-- use dbSigaGGE;

-- exec sp_helpindex 'TbAuditoria'

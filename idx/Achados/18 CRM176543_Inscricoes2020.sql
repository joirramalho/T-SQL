-- CREATE INDEX  pelo sp_foreachdb - 07mai21 -- NÃO PASSAR PARA ANDERSON - APENAS BANCOS_ARQUIVO

-- 26ago21 SQL04 dbSigaSalesianoSaoJose
-- 21jul21 SQL08 GGE  

EXEC dbLogMonitor.dbo.sp_foreachdb N'
    USE [?]


	IF EXISTS (	SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N''[dbo].[CRM176543_Inscricoes2020]'') AND TYPE IN (N''U''))
            DROP TABLE [?].[dbo].[CRM176543_Inscricoes2020]
    ELSE
        BEGIN
            SELECT ''não EXISTE EM ?''
        END
'
,@print_command_only = 1 -- Obrigatório Gerar script
,@print_dbname=0
,@state_desc = N'ONLINE'
,@user_only = 1
,@suppress_quotename=1
-- ,@database_list = 'dbSigaOmegaBelem' -- dbSigaExitoNatal -- dbSigaMickeylandia -- dbSigaCEAMOMossoro -- dbSigaSagradoCoracao -- dbSigaCordCNSD
,@name_pattern='dbSigaABORN';     


-- [dbSigaSantaRosa].[dbo].[TbMobileMensagem]
-- CREATE INDEX [IX_TbMobileMensagem_IdMobileTipoMensagem_IdPessoaRelacionada_TipoPessoaRelacionada] ON [dbSigaSantaRosa].[dbo].[TbMobileMensagem] ([IdMobileTipoMensagem], [IdPessoaRelacionada], [TipoPessoaRelacionada]) INCLUDE ([IdAutor], [TipoAutor], [DataHora], [Mensagem], [DataHoraLeitura], [TipoPessoaLeitura], [IdPessoaLeitura])


-- use dbSigaGGE;

-- exec sp_helpindex 'TbAuditoria'

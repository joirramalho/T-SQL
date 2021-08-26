-- CREATE INDEX  pelo sp_foreachdb - 07mai21 -- NÃO PASSAR PARA ANDERSON - APENAS BANCOS_ARQUIVO

-- 26ago21 SQL04 dbSigaSalesianoSaoJose
-- 21jul21 SQL08 GGE  

EXEC dbLogMonitor.dbo.sp_foreachdb N'
    USE [?]

    IF EXISTS( SELECT * FROM sys.indexes WHERE name=''IX_TbAuditoria_Tabela_DataHora'' AND object_id = OBJECT_ID(''dbo.TbAuditoria'') )
            DROP INDEX [IX_TbAuditoria_Tabela_DataHora] ON [dbo].[TbAuditoria]

    ALTER TABLE [dbo].[TbAuditoria] ADD  CONSTRAINT [PK_TbAuditoria] PRIMARY KEY CLUSTERED 
    (
            [IdAuditoria] ASC
    )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 100) ON [PRIMARY]


    IF NOT EXISTS( SELECT * FROM sys.indexes WHERE name=''IX_TbAuditoria_Tabela_DataHora'' AND object_id = OBJECT_ID(''dbo.TbAuditoria'') )
        BEGIN
            CREATE INDEX [IX_TbAuditoria_Tabela_DataHora] ON 
                [?].[dbo].[TbAuditoria] ([Tabela],[DataHora]) INCLUDE ([IdUsuario], [ValorChave1])

            SELECT DB_NAME()  

            WAITFOR DELAY ''00:00:05'';
        END
--    ELSE
--        BEGIN
--            SELECT ''JÁ EXISTE EM ?''
--        END
'
,@print_command_only = 0 -- Obrigatório Gerar script
,@print_dbname=0
,@state_desc = N'ONLINE'
,@user_only = 1
,@suppress_quotename=1
-- ,@database_list = 'dbSigaOmegaBelem' -- dbSigaExitoNatal -- dbSigaMickeylandia -- dbSigaCEAMOMossoro -- dbSigaSagradoCoracao -- dbSigaCordCNSD
,@name_pattern='dbSigaSalesianoSaoJose_Arquivo';     


-- [dbSigaSantaRosa].[dbo].[TbMobileMensagem]
-- CREATE INDEX [IX_TbMobileMensagem_IdMobileTipoMensagem_IdPessoaRelacionada_TipoPessoaRelacionada] ON [dbSigaSantaRosa].[dbo].[TbMobileMensagem] ([IdMobileTipoMensagem], [IdPessoaRelacionada], [TipoPessoaRelacionada]) INCLUDE ([IdAutor], [TipoAutor], [DataHora], [Mensagem], [DataHoraLeitura], [TipoPessoaLeitura], [IdPessoaLeitura])


-- use dbSigaGGE;

-- exec sp_helpindex 'TbAuditoria'

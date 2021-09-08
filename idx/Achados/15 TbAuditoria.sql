-- CREATE INDEX  pelo sp_foreachdb - 07mai21 -- PASSAR PARA ANDERSON

--06set21 dbSigaCELogos
--25ago21 SQL04 - dbSigaSaleJuvenal; bancos novos ou migrados para nuvem
-- 09ago21 dbSigaPadraoInsES 
-- 06ago21 dbSigaPadraoInst
-- 05ago21 SQL09 & SQL04 - dbSigaSaleFalcao; bancos novos ou migrados para nuvem
-- SQL02, SQL01, SQL09.
-- SQL06, SQL05, SQL04, SQL03
-- 12jul21 SQL07, SQL08

-- EXEC dbLogMonitor.dbo.sp_Where

EXEC dbLogMonitor.dbo.sp_foreachdb N'
    USE ?

    IF EXISTS( SELECT * FROM sys.indexes WHERE name=''IX_TbAuditoria_IdUsuario'' AND object_id = OBJECT_ID(''dbo.TbAuditoria'') )
        DROP INDEX [IX_TbAuditoria_IdUsuario] ON [dbo].[TbAuditoria]

    IF EXISTS( SELECT * FROM sys.indexes WHERE name=''IX_TbAuditoriaDataHora'' AND object_id = OBJECT_ID(''dbo.TbAuditoria'') )
        DROP INDEX [IX_TbAuditoriaDataHora] ON [dbo].[TbAuditoria]

    IF EXISTS( SELECT * FROM sys.indexes WHERE name=''IX_TbAuditoria_Tabela_DataHora'' AND object_id = OBJECT_ID(''dbo.TbAuditoria'') )
        DROP INDEX [IX_TbAuditoria_Tabela_DataHora] ON [dbo].[TbAuditoria]

    IF NOT EXISTS( SELECT * FROM sys.indexes WHERE name=''IX_TbAuditoria_Tabela_DataHora'' AND object_id = OBJECT_ID(''dbo.TbAuditoria'') )
        BEGIN
            CREATE INDEX [IX_TbAuditoria_Tabela_DataHora] ON 
                [?].[dbo].[TbAuditoria] ([Tabela],[DataHora]) INCLUDE ([IdUsuario], [ValorChave1])

            SELECT DB_NAME()  

            WAITFOR DELAY ''00:00:05'';
        END
--    ELSE
--        BEGIN
--            SELECT ''EXISTE ?''
--        END
'
,@print_command_only = 0 -- Obrigatório Gerar script
,@print_dbname=0
,@state_desc = N'ONLINE'
,@user_only = 1
,@suppress_quotename=1
 ,@database_list = 'dbSigaCELogos' -- dbSigaExitoNatal -- dbSigaMickeylandia -- dbSigaCEAMOMossoro -- dbSigaSagradoCoracao -- dbSigaCordCNSD
--,@name_pattern='dbSiga';     


-- [dbSigaSantaRosa].[dbo].[TbMobileMensagem]
-- CREATE INDEX [IX_TbMobileMensagem_IdMobileTipoMensagem_IdPessoaRelacionada_TipoPessoaRelacionada] ON [dbSigaSantaRosa].[dbo].[TbMobileMensagem] ([IdMobileTipoMensagem], [IdPessoaRelacionada], [TipoPessoaRelacionada]) INCLUDE ([IdAutor], [TipoAutor], [DataHora], [Mensagem], [DataHoraLeitura], [TipoPessoaLeitura], [IdPessoaLeitura])
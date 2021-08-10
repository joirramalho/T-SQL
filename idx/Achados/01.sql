-- CREATE INDEX USEFUL sp_foreachdb - 08Jul20

-- CREATE INDEX [IX_TbMobileMensagem_IdMobileTipoMensagem_IdPessoaRelacionada_TipoPessoaRelacionada_TipoAutor_IdPessoaLeitura_IdAutor] 
--     ON [dbSigaMickeylandia].[dbo].[TbMobileMensagem]    ([IdMobileTipoMensagem], [IdPessoaRelacionada], [TipoPessoaRelacionada], [TipoAutor], [IdPessoaLeitura], [IdAutor])

EXEC dbLogMonitor.dbo.sp_ServerName

EXEC dbLogMonitor.dbo.sp_foreachdb N'
    USE ?

    IF NOT EXISTS( SELECT * FROM sys.indexes WHERE name=''IX_TbMobileMensagem_IdMobileTipoMensagem_IdPessoaRelacionada_TipoPessoaRelacionada'' AND object_id = OBJECT_ID(''dbo.TbMobileMensagem'') )
        BEGIN
            CREATE INDEX [IX_TbMobileMensagem_IdMobileTipoMensagem_IdPessoaRelacionada_TipoPessoaRelacionada] 
                ON [?].[dbo].[TbMobileMensagem]    ([IdMobileTipoMensagem], [IdPessoaRelacionada], [TipoPessoaRelacionada]) 
                    INCLUDE ([IdAutor], [TipoAutor], [DataHora], [Mensagem], [DataHoraLeitura], [TipoPessoaLeitura], [IdPessoaLeitura])

            SELECT DB_NAME()
        END
    -- ELSE
    --     BEGIN
    --         SELECT ''JA EXISTE IX_TbMobileMensagem_IdMobileTipoMensagem_IdPessoaRelacionada_TipoPessoaRelacionada EM ?''
    --     END
'
,@print_command_only = 0 -- Obrigatório Gerar script
,@print_dbname=0
,@state_desc = N'ONLINE'
,@user_only = 1
,@suppress_quotename=1
,@database_list = 'dbSiga'
-- ,@name_pattern='dbSiga';

-- EXEC em VPS-6, VPS-7 e VPS-8 TODOS os dbSiga - 09Jul20
-- CREATE INDEX  pelo sp_foreachdb - 01Fev21 -- PASSAR PARA ANDERSON

-- 25ago21 SQL04 - dbSigaSaleJuvenal; bancos novos ou migrados para nuvem
-- 09ago21 dbSigaPadraoInsES 
-- 06ago21 - dbSigaPadraoInst v150
-- 05ago21 - SQL09
-- APLICADO em 01Fev21
-- SQL03 - 01Fev21
-- SQL04 - 01Fev21 - ? bancos, inclusive Dom Bosco e São José
-- SQL05 - 01Fev21 - 5 bancos, inclusive Dom Bosco e São José


EXEC dbLogMonitor.dbo.sp_foreachdb N'
    USE ?

    IF NOT EXISTS( SELECT * FROM sys.indexes WHERE name=''IX_TbTituloCobranca_SituacaoTituloCobranca'' AND object_id = OBJECT_ID(''dbo.TbTituloCobranca'') )
        BEGIN
        CREATE INDEX [IX_TbTituloCobranca_SituacaoTituloCobranca] 
            ON [?].[dbo].[TbTituloCobranca] ([SituacaoTituloCobranca]) INCLUDE ([IdFormaRecebimento])

            SELECT DB_NAME()  
        END
    -- ELSE
    --     BEGIN
    --         SELECT ''JÁ EXISTE IX_TbTituloCobranca_SituacaoTituloCobranca EM ?''
    --     END
'
,@print_command_only = 0 -- Obrigatório Gerar script
,@print_dbname=0
,@state_desc = N'ONLINE'
,@user_only = 1
,@suppress_quotename=1
-- ,@database_list = 'dbSigaOmegaBelem' -- dbSigaExitoNatal -- dbSigaMickeylandia -- dbSigaCEAMOMossoro -- dbSigaSagradoCoracao -- dbSigaCordCNSD
,@name_pattern='dbSigaCELogos';     
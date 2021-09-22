-- CREATE INDEX TbTurma pelo sp_foreachdb - 04Jan21 -- PASSAR PARA ANDERSON


-- 25ago21 SQL04 - dbSigaSaleJuvenal; bancos novos ou migrados para nuvem
-- 09ago21 dbSigaPadraoInsES 
-- 06ago21 dbSigaPadraoInst v150
-- SQL03 - 01Fev21 
-- SQL04 - 01Fev21 - 7 bancos, inclusive Dom Bosco e São José
-- SQL05 - 01Fev21 - 5 bancos, inclusive Dom Bosco e São José



EXEC dbLogMonitor.dbo.sp_foreachdb N'
    USE ?

    IF NOT EXISTS( SELECT * FROM sys.indexes WHERE name=''IX_TbCaixaRecebimento_IdCaixaMovimentacao'' AND object_id = OBJECT_ID(''dbo.TbCaixaRecebimento'') )
        BEGIN
            CREATE INDEX [IX_TbCaixaRecebimento_IdCaixaMovimentacao] 
                ON [?].[dbo].[TbCaixaRecebimento] ([IdCaixaMovimentacao])

            SELECT DB_NAME()  
        END
    -- ELSE
    --     BEGIN
    --         SELECT ''JÁ EXISTE IX_TbCaixaRecebimento_IdCaixaMovimentacao EM ?''
    --     END
'
,@print_command_only = 0 -- Obrigatório Gerar script
,@print_dbname=0
,@state_desc = N'ONLINE'
,@user_only = 1
,@suppress_quotename=1
-- ,@database_list = 'dbSigaOmegaBelem' 
,@name_pattern='dbSigaCELogos';     
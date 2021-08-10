-- CREATE INDEX TbTurma pelo sp_foreachdb - 15Dez20 -- TODOS os Bancos - PASSADO para Anderson

-- APLICADO EM
-- SQL03 - 01Fev21 - 5 bancos, inclusive Dom Bosco e São José
-- SQL04 - 01Fev21 - 5 bancos, inclusive Dom Bosco e São José
-- SQL05 - 01Fev21 - 5 bancos, inclusive Dom Bosco e São José
-- dbSigaPadraoInst - 3Fev21

EXEC dbLogMonitor.dbo.sp_foreachdb N'
    USE ?

    IF NOT EXISTS( SELECT * FROM sys.indexes WHERE name=''IX_TbCaixaLancamento_IdCaixaMovimentacao_CdTipoRecebimento'' AND object_id = OBJECT_ID(''dbo.TbCaixaLancamento'') )
        BEGIN

            CREATE INDEX [IX_TbCaixaLancamento_IdCaixaMovimentacao_CdTipoRecebimento] 
                ON [?].[dbo].[TbCaixaLancamento] ([IdCaixaMovimentacao], [CdTipoRecebimento]) INCLUDE ([Valor])

            SELECT DB_NAME()  
        END
    ELSE
        BEGIN
            SELECT ''EXISTE ? IX_TbCaixaLancamento_IdCaixaMovimentacao_CdTipoRecebimento''
        END

---

    IF NOT EXISTS( SELECT * FROM sys.indexes WHERE name=''IX_TbCaixaMovimentacao_IdCaixaAbertura'' AND object_id = OBJECT_ID(''dbo.TbCaixaMovimentacao'') )
        BEGIN

            CREATE INDEX [IX_TbCaixaMovimentacao_IdCaixaAbertura] 
                ON [?].[dbo].[TbCaixaMovimentacao] ([IdCaixaAbertura])

            SELECT DB_NAME()  
        END
    ELSE
        BEGIN
            SELECT ''EXISTE ? IX_TbCaixaMovimentacao_IdCaixaAbertura''
        END
'
,@print_command_only = 0 -- Obrigatório Gerar script
,@print_dbname=0
,@state_desc = N'ONLINE'
,@user_only = 1
,@suppress_quotename=1
-- ,@database_list = 'dbSigaOmegaBelem' 
,@name_pattern='dbSiga';        
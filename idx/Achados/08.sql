-- CREATE INDEX TbTurma pelo sp_foreachdb - 04JAN21 -- PASSAR PARA ANDERSON

-- 09ago21 dbSigaPadraoInsES 
-- 06ago21 dbSigaPadraoInst v150
-- SQL03 - 01Fev21 
-- SQL04 - 01Fev21 - 5 bancos, inclusive Dom Bosco e São José
-- SQL05 - 01Fev21 - 5 bancos, inclusive Dom Bosco e São José



EXEC dbLogMonitor.dbo.sp_foreachdb N'
    USE ?

    IF EXISTS( SELECT * FROM sys.indexes WHERE name=''IX_TbLancamentoFinanceiroContaData'' AND object_id = OBJECT_ID(''dbo.TbLancamentoFinanceiro'') )
        BEGIN

        DROP INDEX [IX_TbLancamentoFinanceiroContaData]
                    ON [?].[dbo].[TbLancamentoFinanceiro]

            SELECT DB_NAME()  
        END
    ELSE
        BEGIN
            SELECT ''NÃO EXISTE IX_TbLancamentoFinanceiroContaData EM ?''
        END

    IF NOT EXISTS( SELECT * FROM sys.indexes WHERE name=''IX_TbLancamentoFinanceiro_IdConta-IdLancamentoFinanceiro_ValorLancamento'' AND object_id = OBJECT_ID(''dbo.TbLancamentoFinanceiro'') )
        BEGIN
            CREATE INDEX [IX_TbLancamentoFinanceiro_IdConta-IdLancamentoFinanceiro_ValorLancamento] 
                ON [?].[dbo].[TbLancamentoFinanceiro] ([IdConta]) INCLUDE ([IdLancamentoFinanceiro], [ValorLancamento])

            SELECT DB_NAME()  
        END
    ELSE
        BEGIN
            SELECT ''JÁ EXISTE IX_TbAuditoria_IdUsuario EM ?''
        END
'
,@print_command_only = 0 -- Obrigatório Gerar script
,@print_dbname=0
,@state_desc = N'ONLINE'
,@user_only = 1
,@suppress_quotename=1
-- ,@database_list = 'dbSigaOmegaBelem' 
,@name_pattern='dbSigaPadraoInsES';     
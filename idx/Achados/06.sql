-- CREATE INDEX TbLancamentoCobranca pelo sp_foreachdb - 14Dez20 - Aplicado em TODOS os BANCOS --  PASSAR PARA ANDERSON

-- 25ago21 SQL04 - dbSigaSaleJuvenal; bancos novos ou migrados para nuvem
-- 09ago21 dbSigaPadraoInsES 
-- 06ago21 dbSigaPadraoInst v150
-- SQL03 - 01Fev21 
-- SQL04 - 01Fev21 - 5 bancos, inclusive Dom Bosco e São José
-- SQL05 - 01Fev21 - 5 bancos, inclusive Dom Bosco e São José


EXEC dbLogMonitor.dbo.sp_foreachdb N'
    USE ?

    IF NOT EXISTS( SELECT * FROM sys.indexes WHERE name=''IX_TbLancamentoCobranca_DataFaturamento-IdTituloCobrancaGerado'' AND object_id = OBJECT_ID(''dbo.TbLancamentoCobranca'') )
        BEGIN

            IF EXISTS( SELECT * FROM sys.indexes WHERE name=''IX_TbLancamentoCobranca_DataFaturamento'' AND object_id = OBJECT_ID(''dbo.TbLancamentoCobranca'') )
               DROP INDEX [IX_TbLancamentoCobranca_DataFaturamento] ON [dbo].[TbLancamentoCobranca]

            IF EXISTS( SELECT * FROM sys.indexes WHERE name=''IX_LancamentoCobrancaDataFaturamento'' AND object_id = OBJECT_ID(''dbo.TbLancamentoCobranca'') )
               DROP INDEX [IX_LancamentoCobrancaDataFaturamento] ON [dbo].[TbLancamentoCobranca]

            
            CREATE NONCLUSTERED INDEX [IX_TbLancamentoCobranca_DataFaturamento-IdTituloCobrancaGerado] 
                ON [?].[dbo].[TbLancamentoCobranca] ( [DataFaturamento] ) INCLUDE ( [IdTituloCobrancaGerado]) 

            SELECT DB_NAME()  
        END
--    ELSE
--        BEGIN
--            SELECT ''EXISTE ? IX_TbLancamentoCobranca_DataFaturamento-IdTituloCobrancaGerado''
--        END
'
,@print_command_only = 0 -- Obrigatório Gerar script
,@print_dbname=0
,@state_desc = N'ONLINE'
,@user_only = 1
,@suppress_quotename=1
-- ,@database_list = 'dbSigaOmegaBelem' 
,@name_pattern='dbSiga';        
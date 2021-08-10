-- REPLACE INDEX USEFUL sp_foreachdb - 08Jul20

EXEC dbLogMonitor.dbo.sp_foreachdb N'USE ?
    IF NOT EXISTS( SELECT * FROM sys.indexes AS i 
                    INNER JOIN sys.index_columns AS ic ON i.object_id = ic.object_id AND i.index_id = ic.index_id 
                    WHERE i.object_id = OBJECT_ID(''dbo.TbLancamentoCobranca'') 
                        AND name = ''IX_TbLancamentoCobranca_IdServico''
                        AND COL_NAME(ic.object_id,ic.column_id) = ''IdTituloCobrancaGerado''
                        AND ic.is_included_column = 1 )
        BEGIN
            IF EXISTS( SELECT * FROM sys.indexes WHERE name=''IX_TbLancamentoCobranca_IdServico'' AND object_id = OBJECT_ID(''dbo.TbLancamentoCobranca'') )
                BEGIN
                    DROP INDEX [IX_TbLancamentoCobranca_IdServico] ON [dbo].[TbLancamentoCobranca] WITH ( ONLINE = OFF )

                    CREATE INDEX [IX_TbLancamentoCobranca_IdServico] 
                        ON [?].[dbo].[TbLancamentoCobranca] ([IdServico]) 
                            INCLUDE ([IdTituloCobrancaGerado], [IdTurma], [DataFaturamento], [IdNotaFiscal])

                    SELECT DB_NAME()
                END
            -- ELSE
            --     BEGIN
            --         SELECT ''NAO EXISTE IX_TbLancamentoCobranca_IdServico EM ?''
            --     END
        END
    -- ELSE
    --     BEGIN
    --         SELECT ''JA RECRIADO IX_TbLancamentoCobranca_IdServico EM ?''
    --     END'
,@print_command_only = 0 -- Obrigatório Gerar script
,@print_dbname=0
,@state_desc = N'ONLINE'
,@user_only = 1
,@suppress_quotename=1
-- ,@database_list = 'dbSigaCONFHICSaoJose'
,@name_pattern='dbSiga';
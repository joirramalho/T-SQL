-- CREATE INDEX TbTurma sp_foreachdb - 15Dez20 - Aplicado TODOS os BANCOS

-- 25ago21 SQL04 - dbSigaSaleJuvenal; bancos novos ou migrados para nuvem
-- 09ago21 dbSigaPadraoInsES 
-- SQL03 - 01Fev21 
-- SQL04 - 01Fev21 - 5 bancos, inclusive Dom Bosco e São José
-- SQL05 - 01Fev21 - 5 bancos, inclusive Dom Bosco e São José


EXEC dbLogMonitor.dbo.sp_foreachdb N'
    USE ?

    IF NOT EXISTS( SELECT * FROM sys.indexes WHERE name=''IX_TbTurma_IdSerie_IdPeriodo_TipoTurma'' AND object_id = OBJECT_ID(''dbo.TbTurma'') )
        BEGIN

            CREATE INDEX [IX_TbTurma_IdSerie_IdPeriodo_TipoTurma] 
                ON [?].[dbo].[TbTurma] ([IdSerie], [IdPeriodo], [TipoTurma])

            SELECT DB_NAME()  
        END
--    ELSE
--        BEGIN
--            SELECT ''Existe ? IX_TbTurma_IdSerie_IdPeriodo_TipoTurma''
--        END
'
,@print_command_only = 0 -- Obrigatório Gerar script
,@print_dbname=0
,@state_desc = N'ONLINE'
,@user_only = 1
,@suppress_quotename=1
-- ,@database_list = 'dbSigaOmegaBelem' -- dbSigaExitoNatal -- dbSigaMickeylandia -- dbSigaCEAMOMossoro -- dbSigaSagradoCoracao -- dbSigaCordCNSD
,@name_pattern='dbSiga';
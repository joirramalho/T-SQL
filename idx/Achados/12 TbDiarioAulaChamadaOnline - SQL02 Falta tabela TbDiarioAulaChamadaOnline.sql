-- CREATE INDEX  pelo sp_foreachdb - 30abr21 -- PASSAR PARA ANDERSON

-- 25ago21 SQL04 - dbSigaSaleJuvenal; bancos novos ou migrados para nuvem
-- 09ago21 dbSigaPadraoInsES 
-- 06ago21 dbSigaPadraoInst v150
-- 05ago21 - SQL09, SQL08, SQL07, SQl06, SQL05, SQL04, SQL03, SQL02, SQL01
-- 30abr21 - SQL07, SQL06, SQl05, SQL04, SQL03, 02, VPS7 & VPS8
-- 03mai21 - SQL01 

-- EXEC dbLogMonitor.dbo.sp_Where

EXEC dbLogMonitor.dbo.sp_foreachdb N'
    USE ?

    IF NOT EXISTS( SELECT * FROM sys.indexes WHERE name=''IX_TbDiarioAulaChamadaOnline_IdDiarioAula_IdAluno'' AND object_id = OBJECT_ID(''dbo.TbDiarioAulaChamadaOnline'') )
        BEGIN
            CREATE INDEX [IX_TbDiarioAulaChamadaOnline_IdDiarioAula_IdAluno]
                 ON [?].[dbo].[TbDiarioAulaChamadaOnline] ([IdDiarioAula], [IdAluno])

            SELECT DB_NAME()  

            -- WAITFOR DELAY ''00:00:10'';
        END
    -- ELSE
    --     BEGIN
    --         SELECT ''Tem ?''
    --     END
'
,@print_command_only = 0 -- Obrigatório Gerar script
,@print_dbname=0
,@state_desc = N'ONLINE'
,@user_only = 1
,@suppress_quotename=1
-- ,@database_list = 'dbSigaOmegaBelem' -- dbSigaExitoNatal -- dbSigaMickeylandia -- dbSigaCEAMOMossoro -- dbSigaSagradoCoracao -- dbSigaCordCNSD
,@name_pattern='dbSiga';     


-- SQL01
-- Cannot find the object "dbSigaCEAPE.dbo.TbDiarioAulaChamadaOnline" because it does not exist or you do not have permissions. 

-- SQL02
-- Cannot find the object "dbSigaAquarelaCE.dbo.TbDiarioAulaChamadaOnline" because it does not exist or you do not have permissions

-- Cannot find the object "dbSigaModeloAgendaEdu.dbo.TbDiarioAulaChamadaOnline" because it does not exist or you do not have permissions. 
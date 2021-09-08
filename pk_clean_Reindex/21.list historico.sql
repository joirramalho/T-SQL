-- Parte 1

EXEC dbLogMonitor.dbo.sp_foreachdb N'
    USE [?]

    SELECT DB_NAME()

    SELECT Tabela, year( DataHora ), count(*)	FROM ?.dbo.TbAuditoria  WHERE   Tabela IN (''Sistema_Login'',''Sistema_LogOut'',''TbDiarioFrequencia'',''TbDiarioAula'',''TbDiario'',''TbFaseNota'',''TbDiarioAluno'') group by Tabela, year( DataHora )        order by year( DataHora ) DESC


 SELECT year(DataHora), COUNT(*)             FROM ?.dbo.TbFaseNotaAluno_Auditoria    group by year(DataHora)
    -- SELECT year(DataHora), COUNT(*)             FROM ?.dbo.TbSituacaoAlunoDisciplina_Auditoria  group by year(DataHora)         
-- SELECT year(DataHora), COUNT(*)             FROM ?.dbo.TbMetaSituacaoAlunoDisciplina_Auditoria  group by year(DataHora)         

    -- SELECT year(DataAtualizacao), COUNT(*)      FROM ?.dbo.TbAlunoTurmaProcedimentoMatriculaHistorico  group by year(DataAtualizacao)         
    -- SELECT year(DataHora), COUNT(*)             FROM ?.dbo.TbLogWeb  group by year(DataHora)         
    -- SELECT year(DataHoraLogin), COUNT(*)		FROM ?.dbo.TbLogMobile        group by year(DataHoraLogin)         ORDER by year(DataHoraLogin) 
    -- SELECT year(DataHoraInsercao), COUNT(*)	    FROM TbMensagemCaixaSaida        group by year(DataHoraInsercao)         ORDER by year(DataHoraInsercao) 
'
,@print_command_only = 0 -- 0 Exec direto
,@print_dbname=0
,@state_desc = N'ONLINE'
,@user_only = 1
,@suppress_quotename=1
-- ,@database_list = 'dbSiga'
,@name_pattern='dbSigaCELogos'; -- dbSigaNeves_Arquivo05

--SELECT year(DataHora), COUNT(*)             FROM dbSigaSaleFalcao.dbo.TbMetaSituacaoAlunoDisciplina_Auditoria  group by year(DataHora)

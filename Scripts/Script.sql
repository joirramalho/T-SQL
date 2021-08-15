/* For dbSigaSaleFalcao: */


    USE [dbSigaSaleFalcao]

    SELECT DB_NAME()

--    SELECT Tabela, year( DataHora ), count(*)	FROM dbSigaSaleFalcao.dbo.TbAuditoria  WHERE   Tabela IN ('Sistema_Login','Sistema_LogOut','TbDiarioFrequencia','TbDiarioAula','TbDiario','TbFaseNota','TbDiarioAluno') group by Tabela, year( DataHora )        order by year( DataHora ) DESC


    -- SELECT year(DataHora), COUNT(*)             FROM dbSigaSaleFalcao.dbo.TbFaseNotaAluno_Auditoria    group by year(DataHora)
    -- SELECT year(DataHora), COUNT(*)             FROM dbSigaSaleFalcao.dbo.TbSituacaoAlunoDisciplina_Auditoria  group by year(DataHora)         
 SELECT year(DataHora), COUNT(*)             FROM dbSigaSaleFalcao.dbo.TbMetaSituacaoAlunoDisciplina_Auditoria  group by year(DataHora)         

    -- SELECT year(DataAtualizacao), COUNT(*)      FROM dbSigaSaleFalcao.dbo.TbAlunoTurmaProcedimentoMatriculaHistorico  group by year(DataAtualizacao)         
    -- SELECT year(DataHora), COUNT(*)             FROM dbSigaSaleFalcao.dbo.TbLogWeb  group by year(DataHora)         
    -- SELECT year(DataHoraLogin), COUNT(*)		FROM dbSigaSaleFalcao.dbo.TbLogMobile        group by year(DataHoraLogin)         ORDER by year(DataHoraLogin) 
    -- SELECT year(DataHoraInsercao), COUNT(*)	    FROM TbMensagemCaixaSaida        group by year(DataHoraInsercao)         ORDER by year(DataHoraInsercao) 



/* For dbSigaSaleFalcao: */


    USE [dbSigaSaleFalcao]

    SELECT DB_NAME()

    SELECT Tabela, year( DataHora ), count(*)	FROM dbSigaSaleFalcao.dbo.TbAuditoria  WHERE   Tabela IN ('Sistema_Login','Sistema_LogOut','TbDiarioFrequencia','TbDiarioAula','TbDiario','TbFaseNota','TbDiarioAluno') group by Tabela, year( DataHora )        order by year( DataHora ) DESC


    -- SELECT year(DataHora), COUNT(*)             FROM dbSigaSaleFalcao.dbo.TbFaseNotaAluno_Auditoria    group by year(DataHora)
    -- SELECT year(DataHora), COUNT(*)             FROM dbSigaSaleFalcao.dbo.TbSituacaoAlunoDisciplina_Auditoria  group by year(DataHora)         
 SELECT year(DataHora), COUNT(*)             FROM dbSigaSaleFalcao.dbo.TbMetaSituacaoAlunoDisciplina_Auditoria  group by year(DataHora)         

    -- SELECT year(DataAtualizacao), COUNT(*)      FROM dbSigaSaleFalcao.dbo.TbAlunoTurmaProcedimentoMatriculaHistorico  group by year(DataAtualizacao)         
    -- SELECT year(DataHora), COUNT(*)             FROM dbSigaSaleFalcao.dbo.TbLogWeb  group by year(DataHora)         
    -- SELECT year(DataHoraLogin), COUNT(*)		FROM dbSigaSaleFalcao.dbo.TbLogMobile        group by year(DataHoraLogin)         ORDER by year(DataHoraLogin) 
    -- SELECT year(DataHoraInsercao), COUNT(*)	    FROM TbMensagemCaixaSaida        group by year(DataHoraInsercao)         ORDER by year(DataHoraInsercao) 



/* For dbSigaSaleFalcao: */


    USE [dbSigaSaleFalcao]

    SELECT DB_NAME()

--    SELECT Tabela, year( DataHora ), count(*)	FROM dbSigaSaleFalcao.dbo.TbAuditoria  WHERE   Tabela IN ('Sistema_Login','Sistema_LogOut','TbDiarioFrequencia','TbDiarioAula','TbDiario','TbFaseNota','TbDiarioAluno') group by Tabela, year( DataHora )        order by year( DataHora ) DESC


    -- SELECT year(DataHora), COUNT(*)             FROM dbSigaSaleFalcao.dbo.TbFaseNotaAluno_Auditoria    group by year(DataHora)
    -- SELECT year(DataHora), COUNT(*)             FROM dbSigaSaleFalcao.dbo.TbSituacaoAlunoDisciplina_Auditoria  group by year(DataHora)         
 SELECT year(DataHora), COUNT(*)             FROM dbSigaSaleFalcao.dbo.TbMetaSituacaoAlunoDisciplina_Auditoria  group by year(DataHora)         

    -- SELECT year(DataAtualizacao), COUNT(*)      FROM dbSigaSaleFalcao.dbo.TbAlunoTurmaProcedimentoMatriculaHistorico  group by year(DataAtualizacao)         
    -- SELECT year(DataHora), COUNT(*)             FROM dbSigaSaleFalcao.dbo.TbLogWeb  group by year(DataHora)         
    -- SELECT year(DataHoraLogin), COUNT(*)		FROM dbSigaSaleFalcao.dbo.TbLogMobile        group by year(DataHoraLogin)         ORDER by year(DataHoraLogin) 
    -- SELECT year(DataHoraInsercao), COUNT(*)	    FROM TbMensagemCaixaSaida        group by year(DataHoraInsercao)         ORDER by year(DataHoraInsercao) 




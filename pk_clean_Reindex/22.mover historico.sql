--SELECT  * FROM dbSigaSaleFalcao.dbo.TbFaseNotaAluno_Auditoria WHERE year(DataHora) < 2019

EXEC dbLogMonitor.dbo.sp_foreachdb N'
--    BEGIN TRAN
        SELECT  * INTO SQL10_20210906_Dados2018.dbo.?_TbFaseNotaAluno_Auditoria FROM ?.dbo.TbFaseNotaAluno_Auditoria WHERE year(DataHora) < ( year( getdate() ) - 2 )

        DELETE  FROM ?.dbo.TbFaseNotaAluno_Auditoria  WHERE year(DataHora) < ( year( getdate() ) - 2 )
--    COMMIT


--    BEGIN TRAN
        SELECT  * INTO SQL10_20210906_Dados2018.dbo.?_TbSituacaoAlunoDisciplina_Auditoria FROM ?.dbo.TbSituacaoAlunoDisciplina_Auditoria WHERE year(DataHora) < ( year( getdate() ) - 2 );

        DELETE  FROM ?.dbo.TbSituacaoAlunoDisciplina_Auditoria  WHERE year(DataHora) < ( year( getdate() ) - 2 );
--    COMMIT
--
--
--
--    BEGIN TRAN
        SELECT  * INTO SQL10_20210906_Dados2018.dbo.?_TbMetaSituacaoAlunoDisciplina_Auditoria FROM ?.dbo.TbMetaSituacaoAlunoDisciplina_Auditoria WHERE year(DataHora) < ( year( getdate() ) - 2 );

        DELETE  FROM ?.dbo.TbMetaSituacaoAlunoDisciplina_Auditoria  WHERE year(DataHora) < ( year( getdate() ) - 2 );
--    COMMIT
--
--
--    BEGIN TRAN
        SELECT  * INTO SQL10_20210906_Dados2018.dbo.?_TbAuditoria FROM ?.dbo.TbAuditoria WHERE Tabela IN (''Sistema_Login'',''Sistema_LogOut'',''TbDiarioFrequencia'',''TbDiarioAula'',''TbDiario'',''TbFaseNota'',''TbDiarioAluno'') AND year(DataHora) < ( year( getdate() ) - 2 )

        DELETE  FROM ?.dbo.TbAuditoria  WHERE Tabela IN (''Sistema_Login'',''Sistema_LogOut'',''TbDiarioFrequencia'',''TbDiarioAula'',''TbDiario'',''TbFaseNota'',''TbDiarioAluno'') AND year(DataHora) < ( year( getdate() ) - 2 )
--    COMMIT
--
--    BEGIN TRAN
        SELECT  * INTO SQL10_20210906_Dados2018.dbo.?_TbAlunoTurmaProcedimentoMatriculaHistorico FROM ?.dbo.TbAlunoTurmaProcedimentoMatriculaHistorico WHERE year(DataAtualizacao) < ( year( getdate() ) - 2 )

        DELETE  FROM ?.dbo.TbAlunoTurmaProcedimentoMatriculaHistorico  WHERE year(DataAtualizacao) < ( year( getdate() ) - 2 )
--    COMMIT
--
--
--    BEGIN TRAN
        SELECT  * INTO SQL10_20210906_Dados2018.dbo.?_TbLogWeb FROM ?.dbo.TbLogWeb WHERE year(DataHora) < ( year( getdate() ) - 2 )

        DELETE  FROM ?.dbo.TbLogWeb  WHERE year(DataHora) < ( year( getdate() ) - 2 )
--    COMMIT
--
--    BEGIN TRAN
        SELECT  * INTO SQL10_20210906_Dados2018.dbo.?_TbLogMobile FROM ?.dbo.TbLogMobile WHERE year(DataHoraLogin) < ( year( getdate() ) - 2 )

        DELETE  FROM ?.dbo.TbLogMobile  WHERE year(DataHoraLogin) < ( year( getdate() ) - 2 )
--    COMMIT
--
--    BEGIN TRAN
        SELECT  * INTO SQL10_20210906_Dados2018.dbo.?_TbMensagemCaixaSaida FROM ?.dbo.TbMensagemCaixaSaida WHERE year(DataHoraInsercao) < ( year( getdate() ) - 2 )

        DELETE  FROM ?.dbo.TbMensagemCaixaSaida  WHERE year(DataHoraInsercao) < ( year( getdate() ) - 2 )
--    COMMIT
'
,@print_command_only = 1 -- NAO Exec direto
,@print_dbname=0
,@state_desc = N'ONLINE'
,@user_only = 1
,@suppress_quotename=1
,@name_pattern='dbSigaRosaCamara';
-- ,@database_list = 'dbSigaSaleINSA, dbSigaNSLourdesGravata, dbSigaAuxilRecife'

--10abr22

--CREATE DATABASE VPS04_20220410_Dados2019_Arquivo; NAO ARCHIVED

--ALTER DATABASE [VPS04_20220410_Dados2019_Arquivo] SET RECOVERY SIMPLE WITH NO_WAIT;



-- Script SELECT
EXEC dbo.sp_foreachdb N'
    USE [?]

	SELECT DB_NAME()

    SELECT Tabela, year( DataHora ), count(*)	FROM ?.dbo.TbAuditoria  WHERE   Tabela IN (''Sistema_Login'',''Sistema_LogOut'',''TbDiarioFrequencia'',''TbDiarioAula'',''TbDiario'',''TbFaseNota'',''TbDiarioAluno'') AND year(DataHora) < ( year( getdate() ) - 1 ) group by Tabela, year( DataHora )        order by year( DataHora ) DESC
'
,@print_command_only = 0
,@print_dbname=0
,@state_desc = N'ONLINE'
,@user_only = 1
,@suppress_quotename=1
,@name_pattern='dbSigaNeves';
-- ,@database_list = 'dbSigaNeves';




EXEC dbo.sp_foreachdb N'
--    BEGIN TRAN
--        SELECT  * INTO VPS04_20220410_Dados2019_Arquivo.dbo.?_TbFaseNotaAluno_Auditoria FROM ?.dbo.TbFaseNotaAluno_Auditoria WHERE year(DataHora) < ( year( getdate() ) - 2 )
--
--        DELETE  FROM ?.dbo.TbFaseNotaAluno_Auditoria  WHERE year(DataHora) < ( year( getdate() ) - 2 )
--    COMMIT


--    BEGIN TRAN
--        SELECT  * INTO VPS04_20220410_Dados2019_Arquivo.dbo.?_TbSituacaoAlunoDisciplina_Auditoria FROM ?.dbo.TbSituacaoAlunoDisciplina_Auditoria WHERE year(DataHora) < ( year( getdate() ) - 2 );
--
--        DELETE  FROM ?.dbo.TbSituacaoAlunoDisciplina_Auditoria  WHERE year(DataHora) < ( year( getdate() ) - 2 );
--    COMMIT
--
--
--
--    BEGIN TRAN
--        SELECT  * INTO VPS04_20220410_Dados2019_Arquivo.dbo.?_TbMetaSituacaoAlunoDisciplina_Auditoria FROM ?.dbo.TbMetaSituacaoAlunoDisciplina_Auditoria WHERE year(DataHora) < ( year( getdate() ) - 2 );
--
--        DELETE  FROM ?.dbo.TbMetaSituacaoAlunoDisciplina_Auditoria  WHERE year(DataHora) < ( year( getdate() ) - 2 );
--    COMMIT
--
--
    BEGIN TRAN
        SELECT  * INTO VPS04_20220410_Dados2019_Arquivo.dbo.?_TbAuditoria FROM ?.dbo.TbAuditoria WHERE Tabela IN (''Sistema_Login'',''Sistema_LogOut'',''TbDiarioFrequencia'',''TbDiarioAula'',''TbDiario'',''TbFaseNota'',''TbDiarioAluno'') AND year(DataHora) < ( year( getdate() ) - 2 )

        DELETE  FROM ?.dbo.TbAuditoria  WHERE Tabela IN (''Sistema_Login'',''Sistema_LogOut'',''TbDiarioFrequencia'',''TbDiarioAula'',''TbDiario'',''TbFaseNota'',''TbDiarioAluno'') AND year(DataHora) < ( year( getdate() ) - 2 )
    COMMIT



    BEGIN TRAN
        SELECT  * INTO VPS04_20220410_Dados2019_Arquivo.dbo.?_TbAlunoTurmaProcedimentoMatriculaHistorico FROM ?.dbo.TbAlunoTurmaProcedimentoMatriculaHistorico WHERE year(DataAtualizacao) < ( year( getdate() ) - 2 )

        DELETE  FROM ?.dbo.TbAlunoTurmaProcedimentoMatriculaHistorico  WHERE year(DataAtualizacao) < ( year( getdate() ) - 2 )
    COMMIT


    BEGIN TRAN
        SELECT  * INTO VPS04_20220410_Dados2019_Arquivo.dbo.?_TbLogWeb FROM ?.dbo.TbLogWeb WHERE year(DataHora) < ( year( getdate() ) - 2 )

        DELETE  FROM ?.dbo.TbLogWeb  WHERE year(DataHora) < ( year( getdate() ) - 2 )
    COMMIT

    BEGIN TRAN
        SELECT  * INTO VPS04_20220410_Dados2019_Arquivo.dbo.?_TbLogMobile FROM ?.dbo.TbLogMobile WHERE year(DataHoraLogin) < ( year( getdate() ) - 2 )

        DELETE  FROM ?.dbo.TbLogMobile  WHERE year(DataHoraLogin) < ( year( getdate() ) - 2 )
    COMMIT

    BEGIN TRAN
        SELECT  * INTO VPS04_20220410_Dados2019_Arquivo.dbo.?_TbMensagemCaixaSaida FROM ?.dbo.TbMensagemCaixaSaida WHERE year(DataHoraInsercao) < ( year( getdate() ) - 2 )

        DELETE  FROM ?.dbo.TbMensagemCaixaSaida  WHERE year(DataHoraInsercao) < ( year( getdate() ) - 2 )
    COMMIT
'
,@print_command_only = 0 -- NAO Exec direto
,@print_dbname=0
,@state_desc = N'ONLINE'
,@user_only = 1
,@suppress_quotename=1
-- ,@database_list = 'dbSigaSaleINSA, dbSigaNSLourdesGravata, dbSigaAuxilRecife'
,@name_pattern='dbSigaLiceu_Arquivo01';

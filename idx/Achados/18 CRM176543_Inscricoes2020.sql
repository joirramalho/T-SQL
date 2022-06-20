-- CREATE INDEX  pelo sp_foreachdb - 07mai21 -- NÃO PASSAR PARA ANDERSON - APENAS BANCOS_ARQUIVO

-- 15jun22 VPS01a; VPS02a; VPS03; VPS04; VPS05; VPS06, VPS07; VPS07; VPS08; VPS09; VPS10; VPS11; VPS12; VPS14

-- 26ago21 SQL04 dbSigaSalesianoSaoJose
-- 21jul21 SQL08 GGE  

EXEC dbLogMonitor.dbo.sp_foreachdb N'
    USE [?]


	IF EXISTS (	SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N''[dbo].[CRM176543_Inscricoes2020]'') AND TYPE IN (N''U''))
            DROP TABLE [?].[dbo].[CRM176543_Inscricoes2020]

	IF EXISTS (	SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N''[dbo].[_CRM176543_AlunoTurmaExisteSolicitacao1]'') AND TYPE IN (N''U''))
            DROP TABLE [?].[dbo].[_CRM176543_AlunoTurmaExisteSolicitacao1]

	IF EXISTS (	SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N''[dbo].[_CRM176543_AlunoTurmaExisteSolicitacao1b]'') AND TYPE IN (N''U''))
            DROP TABLE [?].[dbo].[_CRM176543_AlunoTurmaExisteSolicitacao1b]

	IF EXISTS (	SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N''[dbo].[_CRM176543_AlunoTurmaExisteSolicitacao2]'') AND TYPE IN (N''U''))
            DROP TABLE [?].[dbo].[_CRM176543_AlunoTurmaExisteSolicitacao2]

	IF EXISTS (	SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N''[dbo].[_CRM176543_AlunoTurmaExisteSolicitacao2b]'') AND TYPE IN (N''U''))
            DROP TABLE [?].[dbo].[_CRM176543_AlunoTurmaExisteSolicitacao2b]

	IF EXISTS (	SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N''[dbo].[_CRM176543_Inscricoes2020]'') AND TYPE IN (N''U''))
            DROP TABLE [?].[dbo].[_CRM176543_Inscricoes2020]

	IF EXISTS (	SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N''[dbo].[tbIntegracaoComercialFaturas]'') AND TYPE IN (N''U''))
            DROP TABLE [?].[dbo].[tbIntegracaoComercialFaturas]

'
,@print_command_only = 0 -- Obrigatório Gerar script
,@print_dbname=0
,@state_desc = N'ONLINE'
,@user_only = 1
,@suppress_quotename=1
-- ,@database_list = 'dbSigaOmegaBelem' -- dbSigaExitoNatal -- dbSigaMickeylandia -- dbSigaCEAMOMossoro -- dbSigaSagradoCoracao -- dbSigaCordCNSD
,@name_pattern='dbSiga';
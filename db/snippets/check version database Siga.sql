--16set21
--13mai21

IF (OBJECT_ID('tempdb..#TmpVersion') IS NOT NULL) 
    DROP TABLE #TmpVersion

CREATE TABLE [dbo].[#TmpVersion]    ([DatabaseName] VARCHAR(32) NULL, [Version] VARCHAR(16) NULL );

EXEC dbo.sp_foreachdb N'
    USE [?]

    INSERT INTO #TmpVersion ([DatabaseName], [Version])
        SELECT DB_NAME(), [AtualizadorVersaoBD] 
		FROM [TbParametroGlobal]
-- 		WHERE TipoCliente IN (''A'')
-- 		AND VersaoDB_Atual NOT IN (1001200,1064990,1065089,1065092)
'
,@print_command_only = 0 -- Obrigatório Gerar script
,@print_dbname=1
,@state_desc = N'ONLINE'
,@user_only = 1
,@suppress_quotename=1
,@name_pattern='dbSiga';
-- ,@database_list = 'dbSigaA'

SELECT Version, COUNT(*)        FROM #TmpVersion GROUP BY [Version]

SELECT DatabaseName, Version    FROM #TmpVersion 

-- SELECT * FROM #TmpVersion WHERE [Version] <> '1065118'
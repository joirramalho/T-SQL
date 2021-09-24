SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- sp_ExibirBancos
-- sp_ExibirBancos 'Ajuda'
-- sp_ExibirBancos 'Banco', 'dbSigaCEEsCrianca'
-- sp_ExibirBancos 'CRM', '188119'

-- sp_ExibirBancos 'Login', 'active.bruno'

-- sp_ExibirBancos 'CRMOriginal', '166784'

ALTER PROCEDURE [dbo].[sp_ExibirBancos] 
@Filtro		VARCHAR (32) = NULL,
@Filtro2	VARCHAR (32) = NULL
AS

-- VERSION 1.03 15Mar21 - xp_readerrorlog
-- VERSION 1.02 1Out20 -- rollback
-- VERSION 1.01 30Set20 -- Exibir USERs a partir dos Bancos
-- VERSION 1.00 25Set20


IF	@Filtro = 'Banco'
	BEGIN
		;WITH latestRecord
		AS
		(
			SELECT  DataRestauracao, NomeDatabase, R.CRM, CRMOriginal, DataOffline, SobrescreverEmail, BancoLocal, LoginUsuario, AutorizadoPor, AutorizadoEm, version_id_full, version_id_diff, R.DataRemocao,
					ROW_NUMBER() OVER (PARTITION BY R.CRM
										ORDER BY DataRestauracao DESC, AutorizadoEm ) rn
			FROM    TbLogRestore R
			LEFT	JOIN TbLogUsuario U ON R.CRM = U.CRM
--			WHERE	EXISTS( SELECT NAME FROM sys.databases WHERE NAME = ( 'CRM_' + R.CRM ) )
		)
		SELECT	IIF( rn = 1, CONVERT(nvarchar, DataRestauracao, 100), '') AS 'Restaurado em', IIF( rn = 1, NomeDatabase, '') AS Banco, CRM, IIF( CRM <> CRMOriginal, ISNULL( CRMOriginal, '' ),'') AS 'CRM Original', DataOffline, IIF( rn = 1, IIF( SobrescreverEmail = 1, 'Sim', 'Não'), '') AS 'xxx@active', IIF( BancoLocal = 1, 'Local', 'Nuvem') AS 'Banco', IIF( rn = 1, ( 'sp_delete ' + QUOTENAME(NomeDatabase, '''') + ', ' + QUOTENAME(CRM, '''') ), '' ) AS [Comando Delete], DataRemocao AS 'Removido em', LEFT( LoginUsuario, 20 ) AS 'Login', LEFT( AutorizadoPor, 20 ) AS 'Autorizado Por', CONVERT(nvarchar, AutorizadoEm, 100) AS 'Autorizado em', IIF( rn = 1, ISNULL( version_id_full, '' ), '' ) AS version_id_full, IIF( rn = 1, ISNULL(  version_id_diff, '' ), '' ) AS version_id_diff
		FROM    latestRecord
		WHERE   NomeDatabase = @Filtro2
		ORDER BY DataRestauracao DESC, AutorizadoEm 
	END

ELSE IF	@Filtro = 'CRM'
	BEGIN
		;WITH latestRecord
		AS
		(
			SELECT  DataRestauracao, NomeDatabase, R.CRM, CRMOriginal, DataOffline, SobrescreverEmail, BancoLocal, LoginUsuario, AutorizadoPor, AutorizadoEm, version_id_full, version_id_diff, 
					ROW_NUMBER() OVER (PARTITION BY R.CRM
										ORDER BY DataRestauracao DESC, AutorizadoEm) rn
			FROM    TbLogRestore R
			LEFT	JOIN TbLogUsuario U ON R.CRM = U.CRM
--			WHERE	EXISTS( SELECT NAME FROM sys.databases WHERE NAME = ( 'CRM_' + R.CRM ) )
		)
		SELECT	IIF( rn = 1, CONVERT(nvarchar, DataRestauracao, 100), '') AS 'Restaurado em', IIF( rn = 1, NomeDatabase, '') AS Banco, CRM, IIF( CRM <> CRMOriginal, ISNULL( CRMOriginal, '' ),'') AS 'CRM Original', DataOffline, IIF( rn = 1, IIF( SobrescreverEmail = 1, 'Sim', 'Não'), '') AS 'xxx@active', IIF( BancoLocal = 1, 'Local', 'Nuvem') AS 'Banco', IIF( rn = 1, ( 'sp_delete ' + QUOTENAME(NomeDatabase, '''') + ', ' + QUOTENAME(CRM, '''') ), '' ) AS [Comando Delete], LEFT( LoginUsuario, 20 ) AS 'Login', LEFT( AutorizadoPor, 20 ) AS 'Autorizado Por', CONVERT(nvarchar, AutorizadoEm, 100) AS 'Autorizado em', IIF( rn = 1, ISNULL( version_id_full, '' ), '' ) AS version_id_full, IIF( rn = 1, ISNULL(  version_id_diff, '' ), '' ) AS version_id_diff
		FROM    latestRecord
		WHERE   CRM = @Filtro2
--		ORDER BY CRM DESC

		-- Listar mensagens
		SELECT	DataLogMensagem AS 'Data da mensagem (DESC)', IIF( Erro = 0, 'Aviso', 'Erro') AS Tipo, Mensagem
		FROM	TbLogMensagem
		WHERE   CRM = @Filtro2
		ORDER BY DataLogMensagem DESC

	END

--ELSE IF	@Filtro = 'CRMOriginal'
--	BEGIN
--		IF @Filtro2 IS NOT NULL
--			BEGIN
--				SET		@strSQL = @strSQL + 'AND CRMOriginal = ' + QUOTENAME(@Filtro2, '''')
--			END
--		SET		@strSQL = @strSQL + 'ORDER	BY CRMOriginal ' 
--	END

ELSE IF	@Filtro = 'Login'
	BEGIN
		;WITH latestRecord
		AS
		(
			SELECT  DataRestauracao, NomeDatabase, R.CRM, CRMOriginal, SobrescreverEmail, BancoLocal, LoginUsuario, AutorizadoPor, AutorizadoEm, version_id_full, version_id_diff,
					ROW_NUMBER() OVER (PARTITION BY R.CRM
										ORDER BY DataRestauracao, AutorizadoEm ) rn
			FROM    TbLogRestore R
			LEFT	JOIN TbLogUsuario U ON R.CRM = U.CRM
			WHERE	EXISTS( SELECT NAME FROM sys.databases WHERE NAME = ( 'CRM_' + R.CRM ) ) AND LoginUsuario = @Filtro2
		)
		SELECT	CONVERT(nvarchar, DataRestauracao, 100) AS 'Restaurado em', CRM, IIF( CRM <> CRMOriginal, ISNULL( CRMOriginal, '' ),'') AS 'CRM Original', NomeDatabase AS Banco, ( SELECT COUNT(*) FROM TbLogUsuario WHERE CRM = latestRecord.CRM ) AS 'Usuários', IIF( rn = 1, IIF( SobrescreverEmail = 1, 'Sim', 'Não'), '') AS 'xxx@active', IIF( BancoLocal = 1, 'Local', 'Nuvem') AS 'Banco', IIF( rn = 1, ( 'sp_delete ' + QUOTENAME(NomeDatabase, '''') + ', ' + QUOTENAME(CRM, '''') ), '' ) AS [Comando Delete], LEFT( LoginUsuario, 20 ) AS 'Login', LEFT( AutorizadoPor, 20 ) AS 'Autorizado Por', CONVERT(nvarchar, AutorizadoEm, 100) AS 'Autorizado em', IIF( rn = 1, ISNULL( version_id_full, '' ), '' ) AS version_id_full, IIF( rn = 1, ISNULL(  version_id_diff, '' ), '' ) AS version_id_diff
		FROM    latestRecord
		WHERE   LoginUsuario = @Filtro2
		ORDER BY DataRestauracao DESC
	END

ELSE -- SEM FILTRO

	BEGIN
		;WITH latestRecord
		AS
		(
			SELECT  DataRestauracao, NomeDatabase, R.CRM, CRMOriginal, DataOffline, BackupSizeInMB, SobrescreverEmail, BancoLocal, LoginUsuario, AutorizadoPor, AutorizadoEm, version_id_full, version_id_diff,
					ROW_NUMBER() OVER (PARTITION BY R.CRM
										ORDER BY DataRestauracao DESC, AutorizadoEm ) rn
			FROM    TbLogRestore R
			LEFT	JOIN TbLogUsuario U ON R.CRM = U.CRM
			WHERE	EXISTS( SELECT NAME FROM sys.databases WHERE NAME = ( 'CRM_' + R.CRM ) )
		)
		SELECT	IIF( rn = 1, CONVERT(nvarchar, DataRestauracao, 100), '') AS 'Restaurado em (DESC)', CRM, IIF( CRM <> CRMOriginal, ISNULL( CRMOriginal, '' ),'') AS 'CRM Original', IIF( rn = 1, NomeDatabase, '') AS Banco, DataOffline, IIF( rn = 1, ISNULL( RTRIM(CAST( BackupSizeInMB AS char) ) + ' MB',''), '') AS Tamanho, IIF( rn = 1, IIF( SobrescreverEmail = 1, 'Sim', 'Não'), '') AS 'xxx@active', IIF( rn = 1, IIF( BancoLocal = 1, 'Local', 'Nuvem'), '') AS 'Banco', IIF( rn = 1, ( 'sp_delete ' + QUOTENAME(NomeDatabase, '''') + ', ' + QUOTENAME(CRM, '''') ), '' ) AS [Comando Delete], LEFT( LoginUsuario, 20 ) AS 'Login', LEFT( AutorizadoPor, 20 ) AS 'Autorizado Por', IIF( rn = 1, ISNULL( version_id_full, '' ), '' ) AS version_id_full, IIF( rn = 1, ISNULL(  version_id_diff, '' ), '' ) AS version_id_diff
		FROM    latestRecord
		ORDER BY DataRestauracao DESC, AutorizadoEm 


		-- RESTORE pendente
		IF EXISTS( 	SELECT	*	FROM	TbLogRestore R	WHERE   DataRestauracao IS NULL )
			BEGIN
				SELECT	DataLogRestore AS 'Restaurar...', R.CRM, NomeDatabase AS Banco, IIF( SobrescreverEmail = 1, 'Sim', 'Não') AS 'xxx@activesoft', IIF( BancoLocal = 1, 'Local', 'Nuvem') AS 'Banco', LEFT( LoginUsuario, 20 ) AS 'Login', LEFT( AutorizadoPor, 20 ) AS 'Autorizado Por', ISNULL( version_id_full, '' ) AS version_id_full, ISNULL( version_id_diff, '' ) AS version_id_diff
				FROM    TbLogRestore R
				LEFT	JOIN TbLogUsuario U ON R.CRM = U.CRM
				WHERE   DataRestauracao IS NULL
				ORDER BY DataLogRestore DESC 
			END 

		-- DELETE pendente
		IF EXISTS( 	SELECT	*	FROM	TbLogRestore R	WHERE   DataSolicitacaoDelete IS NOT NULL AND R.DataRemocao IS NULL )
			BEGIN
				SELECT	DataSolicitacaoDelete AS 'Apagar...', R.CRM, NomeDatabase AS Banco, IIF( SobrescreverEmail = 1, 'Sim', 'Não') AS 'xxx@activesoft', LEFT( LoginUsuario, 20 ) AS 'Login', LEFT( LoginSolicitanteDelete, 20 ) AS 'DELETE Solicitado Por'
				FROM    TbLogRestore R
				LEFT	JOIN TbLogUsuario U ON R.CRM = U.CRM
				WHERE   DataSolicitacaoDelete IS NOT NULL 
						AND R.DataRemocao IS NULL
				ORDER BY DataSolicitacaoDelete DESC 
			END

		-- Listar últimas 15 mensagens
		SELECT	DataLogMensagem AS 'Últimas mensagens (DESC)', CRM AS '-  CRM  -', IIF( Erro = 0, 'Aviso', 'Erro') AS Tipo, Mensagem
		FROM	TbLogMensagem
		WHERE	cast(DataLogMensagem as Date) = cast(getdate() as Date)
		ORDER BY DataLogMensagem DESC
	END



IF (OBJECT_ID('tempdb..#TmpErrorLog') IS NOT NULL) DROP TABLE #TmpErrorLog

CREATE TABLE [dbo].[#TmpErrorLog]
    ([LogDate] DATETIME NULL,
    [ProcessInfo] VARCHAR(20) NULL,
    [Text] VARCHAR(MAX) NULL ) ;

INSERT INTO #TmpErrorLog ([LogDate], [ProcessInfo], [Text])
    EXEC master.dbo.xp_readerrorlog 0, 1, N'backup', N'failed', NULL, NULL, N'desc'

SELECT * FROM #TmpErrorLog

-- /*
-- ALTER FUNCTION Usuarios ( @CRM VARCHAR( 16 ) )
-- RETURNS VARCHAR(512)
-- AS
-- BEGIN
-- 	DECLARE @csv VARCHAR(1024)

-- 	SELECT @csv = COALESCE(@csv + ';  ', '') + LoginUsuario + ' por ' + AutorizadoPor + ' em ' +  CONVERT( VARCHAR, AutorizadoEm , 103)  + IIF( CRMOriginal IS NOT NULL, ' pelo CRM ' + CRMOriginal, '' )
-- 	FROM TbLogUsuario
-- 	WHERE CRM = @CRM
--    RETURN @csv;
-- END;
-- */



-- GO


GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--SET NOCOUNT ON
--GO

-- sp_Restore 'dbSigaCordUNECIM', 'j123ff', 'active.teste', 'NAO', 'NAO'

-- sp_Restore 'dbSigaFMCT', 'j1', 'active.joir', 'd5m2GVJ8FGG9q._7DxQHpfyUgJbqalKv', 'dbzT5M7QRG1nnF64eYBdmt.WeYTsjGpD'

-- sp_Restore 'dbSigaFaculdadeJardins', '170735', 'active.jonas', 'dnL18AQyNQ_3ae8ZYj5bRnQePByQX4Qn', '' 

ALTER PROCEDURE [dbo].[sp_Restore] 
@NomeDatabase		VARCHAR(64) = NULL,
@CRM				VARCHAR(16) = NULL,
@LoginUsuario		VARCHAR(20) = NULL,
@Compartilhado		CHAR(03)	= 'sim',
@SobrescreverEmail	CHAR(03)	= 'sim',
@OrigemDoBanco		CHAR(05)	= 'nuvem',
@Version_id_full	VARCHAR(32) = NULL,
@Version_id_diff	VARCHAR(32) = NULL
AS

-- VERSION 1.01 19abr21
-- VERSION 1.00 26fev21

IF ( @NomeDatabase IS NULL ) OR ( @CRM IS NULL ) OR ( @LoginUsuario IS NULL )
	BEGIN
		SELECT 'Ajuda...' AS '.'

		SELECT 'sp_Restore '  + QUOTENAME('dbSiga', '''') + ', ' + QUOTENAME('CRM', '''') + ', ' + QUOTENAME('active.usuario', '''') AS 'Sintaxe simples'

		SELECT 'sp_Restore '  + QUOTENAME('dbSiga', '''') + ', ' + QUOTENAME('CRM', '''') + ', ' + QUOTENAME('active.usuario', '''') + ', ' + QUOTENAME('Compartilhado [sim]', '''') + ', ' + QUOTENAME('Sobrescrever e-mail [sim]', '''') + ', ' + QUOTENAME('Origem do Banco [nuvem]', '''') + ', ' + QUOTENAME('Version_id_full', '''') + ', ' + QUOTENAME('Version_id_diff', '''') AS 'Sintaxe completa'

		RETURN
	END

DECLARE	@CRMCompartilhado	VARCHAR(16)


SET		@CRM			= RTRIM(LTRIM(@CRM))
SET		@LoginUsuario	= RTRIM(LTRIM(@LoginUsuario))


IF	EXISTS( SELECT CRM FROM TbLogRestore	WHERE	CRM = @CRM )
	BEGIN
		PRINT 'ATENÇÃO'
		PRINT ''
		PRINT 'Banco [' + @NomeDatabase + '] já restaurado com CRM ' + @CRM

		--EXEC dbLogRestore.dbo.sp_AdicionarUsuario @NomeDatabase, @CRM, @LoginUsuario

		--PRINT 'Usuario [' + @LoginUsuario + '] autorizado ao banco restaurado com CRM ' + @CRM

		RETURN
	END
ELSE IF	LEFT( @NomeDatabase, 6 ) <> 'dbSiga' AND LEFT( @NomeDatabase, 5 ) <> 'dbCrm' AND LEFT( @NomeDatabase, 5 ) <> 'dbBib' AND LEFT( @NomeDatabase, 9 ) <> 'dbCantina' AND LEFT( @NomeDatabase, 7 ) <> 'db_Siga' AND LEFT( @NomeDatabase, 8 ) <> 'dbVendas' 
	BEGIN
		PRINT 'ATENÇÃO'
		PRINT ''
		PRINT 'Banco [' + @NomeDatabase + '] não pode ser restaurado'

		PRINT ''
		PRINT 'Prefixo do Banco [' + @NomeDatabase + '] deve ser dbSiga, dbCrm, dbBib ou dbCantina'

		RETURN
	END

-- Obter CRM do banco solicitado com versão mais recente
SELECT TOP	1 @CRMCompartilhado = RTRIM(LTRIM(CRM)) 
FROM		dbLogRestore.dbo.TbLogRestore 
WHERE		NomeDatabase = @NomeDatabase 
ORDER BY	DataRestauracao DESC

-- LOGAR PERMISSÃO atribuída a usuário
IF	( @CRMCompartilhado IS NOT NULL ) AND ( EXISTS( SELECT NAME FROM sys.databases WHERE NAME = ( 'CRM_' + @CRMCompartilhado ) ) ) AND ( @Compartilhado = 'SIM' )
	BEGIN	
		INSERT INTO TbLogUsuario ( CRM, LoginUsuario, CRMOriginal   )	VALUES ( @CRMCompartilhado, @LoginUsuario, @CRM )

		PRINT ''
		PRINT 'Restore compartilhado Banco de [' + @NomeDatabase + '] com CRM ' + @CRMCompartilhado + ' solicitado com sucesso'


		-- Logar operação em TbLogMensagem
		INSERT INTO [dbLogRestore].[dbo].[TbLogMensagem]
					([CRM]
					,[Erro]
					,[Mensagem])
				VALUES
					(@CRM
					,0 -- Warnig
					,'Solicitado Restore do Banco [' + @NomeDatabase + '] com CRM compartilhado ' + @CRMCompartilhado )
	END
ELSE
	BEGIN
		INSERT INTO TbLogRestore	( NomeDatabase,					CRM,				Version_id_full,				Version_id_diff,				SobrescreverEmail,							BancoLocal							)
			VALUES					( RTRIM(LTRIM(@NomeDatabase)),	RTRIM(LTRIM(@CRM)),	RTRIM(LTRIM(@Version_id_full)), RTRIM(LTRIM(@Version_id_diff)),	IIF( @SobrescreverEmail = 'SIM', 1, 0 ),	IIF( @OrigemDoBanco = 'nuvem', 0, 1 )	)   


		INSERT INTO TbLogUsuario ( CRM, LoginUsuario  )	VALUES ( @CRM, @LoginUsuario )


		PRINT ''
		PRINT 'Restore do Banco de [' + @NomeDatabase + '] com CRM ' + @CRM + ' solicitado com sucesso'

		-- Logar operação em TbLogMensagem
		INSERT INTO [dbLogRestore].[dbo].[TbLogMensagem]
					([CRM]
					,[Erro]
					,[Mensagem])
				VALUES
					(@CRM
					,0 -- Warnig
					,'Solicitado Restore do Banco [' + @NomeDatabase + '] para [' + @LoginUsuario + '] por [' + suser_sname() + ']' )


		IF	@Version_id_full IS NOT NULL
			BEGIN
				PRINT ''
				PRINT 'Version_id_full [' + @Version_id_full + ']'

				PRINT ''
				PRINT 'Version_id_diff [' + @Version_id_diff + ']'
			END
	END




GO

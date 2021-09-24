SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- sp_JobOffline

ALTER PROCEDURE [dbo].[sp_JobOffline] 
AS

DECLARE @CRM			VARCHAR(16)
DECLARE @NomeDatabase	VARCHAR(64)
DECLARE @OfflinePor	    VARCHAR(20)
DECLARE @DataOffline	DATETIME

DECLARE @strSQL			VARCHAR(1024)


SELECT	TOP 1	@CRM = O.CRM, @NomeDatabase = NomeDatabase, @OfflinePor = OfflinePor, @DataOffline = DataOffline
--SELECT	TOP 1	O.CRM, NomeDatabase, OfflinePor, OfflineEm, DataOffline
FROM	dbLogRestore.dbo.TbLogOffline O
LEFT	JOIN dbLogRestore.dbo.TbLogRestore R ON R.CRM = O.CRM
WHERE	OfflineEm IS  NULL
ORDER	BY DatalogOffline DESC


SET		@strSQL = 'USE [master];'

IF @DataOffline IS NULL
	BEGIN
		SET  @strSQL = @strSQL + 'ALTER DATABASE  [CRM_' + @CRM + '] SET OFFLINE; ' 
	END
ELSE
	BEGIN
		SET  @strSQL = @strSQL + 'ALTER DATABASE  [CRM_' + @CRM + '] SET ONLINE; ' 
	END

PRINT @strSQL

IF @CRM IS NOT NULL
	BEGIN

		BEGIN TRY   
			EXEC	(@strSQL)

			-- Logar operação em TbLogMensagem
			INSERT INTO [dbLogRestore].[dbo].[TbLogMensagem]
						([CRM]
						,[Erro]
						,[Mensagem])
					VALUES
						(@CRM
						,0 -- Warning
						,'[' + @NomeDatabase + '] ' + IIF( @DataOffline IS NULL, 'offline', 'online' ) + ' por [' +  @OfflinePor + ']' )

				UPDATE	dbLogRestore.dbo.TbLogOffline	SET		OfflineEm = GETDATE()	WHERE	CRM = @CRM AND OfflineEm IS NULL

				IF @DataOffline IS NULL
					UPDATE	dbLogRestore.dbo.TbLogRestore	SET		DataOffline = GETDATE()	WHERE	CRM = @CRM
				ELSE
					UPDATE	dbLogRestore.dbo.TbLogRestore	SET		DataOffline = NULL		WHERE	CRM = @CRM
		END TRY
			BEGIN CATCH

				INSERT INTO [dbLogRestore].[dbo].[TbLogMensagem]
							([CRM]
							,[Erro]
							,[Mensagem])
						VALUES
							(@CRM
							,1 -- Erro
							,OBJECT_NAME(@@PROCID) + ' -01-> ' + ERROR_MESSAGE())

				UPDATE	dbLogRestore.dbo.TbLogOffline	SET		OfflineEm = '1900-01-01 00:01'	WHERE	CRM = @CRM

			RETURN
			END CATCH
		END


GO

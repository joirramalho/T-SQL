USE dbLogRestore

IF (OBJECT_ID('dbo.sp_JobRecoveryTruncate') IS NOT NULL) DROP PROCEDURE sp_JobRecoveryTruncate
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- sp_RecoveryTruncate '174660'

CREATE PROCEDURE [dbo].[sp_JobRecoveryTruncate] 
@CRM		VARCHAR (16)
AS
-- VERSION 1.01 - 07Out20

DECLARE	@Database		VARCHAR(32)
DECLARE @NomeDatabase	VARCHAR(32)


SELECT		@NomeDatabase = NomeDatabase
FROM		dbLogRestore.dbo.TbLogRestore 
WHERE		CRM = @CRM

SET @Database = 'CRM_' + @CRM


IF EXISTS(SELECT * FROM sys.databases WHERE NAME = @Database )
	BEGIN
		BEGIN TRY   

			EXEC('ALTER DATABASE ' + @Database + ' SET RECOVERY SIMPLE WITH NO_WAIT')

			IF SUBSTRING( @NomeDatabase, 1, 6 ) = 'dbSiga'
				BEGIN
					EXEC('USE ' + @Database + '; DBCC SHRINKFILE(' + 'dbSiga_Data' + ', 5, TRUNCATEONLY);' )

					EXEC('USE ' + @Database + '; DBCC SHRINKFILE(' + 'dbSiga_Log' + ', 5, TRUNCATEONLY);' )

					-- EXEC('USE ' + @Database + '; DBCC SHRINKDATABASE( @Database );' )  -- DBCC SHRINKDATABASE(?)
				END
			ELSE IF SUBSTRING( @NomeDatabase, 1, 5 ) = 'dbBib'
				BEGIN
					EXEC('USE ' + @Database + '; DBCC SHRINKFILE(' + 'dbSiga_Log' + ', 5, TRUNCATEONLY);' )
				END
			ELSE IF @NomeDatabase = 'dbCrmActivesoft'
				BEGIN
					EXEC('USE ' + @Database + '; DBCC SHRINKFILE(' + 'dbActiveCRM2_Log' + ', 5, TRUNCATEONLY);' )
				END

			-- Logar operação em TbLogMensagem
			INSERT INTO [dbLogRestore].[dbo].[TbLogMensagem]
					   ([CRM]
					   ,[Erro]
					   ,[Mensagem])
				 VALUES
					   (@CRM
					   ,0 -- Warning
					   ,'Recovery mode e Truncate Data & Log de [' + @NomeDatabase + ']' )
		END TRY
			BEGIN CATCH
				
				INSERT INTO [dbLogRestore].[dbo].[TbLogMensagem]
						   ([CRM]
						   ,[Erro]
						   ,[Mensagem])
					 VALUES
						   (@CRM
						   ,1 -- Erro
							,OBJECT_NAME(@@PROCID) + ' --> ' + ERROR_MESSAGE())

				RETURN
			END CATCH
	END
ELSE
	BEGIN
		INSERT INTO [dbLogRestore].[dbo].[TbLogMensagem]
				   ([CRM]
				   ,[Erro]
				   ,[Mensagem])
			 VALUES
				   (@CRM
				   ,0 -- Warnig
				   ,'Banco [' + @Database + '] não existe para Recovery mode & Truncate')
	END

GO

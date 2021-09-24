SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- sp_JobResetSenha -- Script consulta solicitações de DELETE em TbLogRestore e apaga uma de cada vez...

ALTER PROCEDURE [dbo].[sp_JobResetSenha] 
AS

DECLARE	@IdLogResetSenha	INT
DECLARE	@LoginUsuario		VARCHAR (20)

SELECT	TOP 1	@IdLogResetSenha = IdLogResetSenha, @LoginUsuario = LoginUsuario
FROM	dbLogRestore.dbo.TblogResetSenha
WHERE	ResetSenhaEm IS NULL
ORDER BY IdLogResetSenha DESC


IF @LoginUsuario IS NOT NULL
	BEGIN
		EXEC('UPDATE dbLogRestore.dbo.TbLogResetSenha SET ResetSenhaEm = GETDATE() WHERE IdLogResetSenha = ' + @IdLogResetSenha  )

		BEGIN TRY   

			EXEC( 'ALTER LOGIN [' + @LoginUsuario + '] WITH PASSWORD = ''Active.p@ss'' MUST_CHANGE, CHECK_EXPIRATION = ON, CHECK_POLICY = ON; '  )

			-- Logar operação em TbLogMensagem
			INSERT INTO [dbLogRestore].[dbo].[TbLogMensagem]
					   ([CRM]
					   ,[Erro]
					   ,[Mensagem])
				 VALUES
					   (''
					   ,0 -- Warning
					   ,'SENHA padrão [Active.p@ss] definida para usuário(a) ' + @LoginUsuario )

		END TRY
			BEGIN CATCH

--				UPDATE dbLogRestore.dbo.TbLogResetSenha	SET		MensagemErro = ERROR_MESSAGE() 	WHERE	IdLogResetSenha = @IdLogResetSenha
				INSERT INTO [dbLogRestore].[dbo].[TbLogMensagem]
							([CRM]
							,[Erro]
							,[Mensagem])
						VALUES
							(''
							,1 -- Erro
							,OBJECT_NAME(@@PROCID) + ' --> ' + ERROR_MESSAGE())

				RETURN
			END CATCH
	END


GO

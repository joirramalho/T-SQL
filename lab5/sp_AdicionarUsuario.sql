SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- sp_AdicionarUsuario '01Filipe', 'active.CRM'
-- dbLogRestore..sp_AdicionarUsuario 'dbSigaModelo', 'active.marley'

ALTER PROCEDURE [dbo].[sp_AdicionarUsuario] 
@CRM			VARCHAR(16) = NULL,
@LoginUsuario	VARCHAR(20) = NULL
AS

-- VERSION 1.00 2Set20

DECLARE @NomeDatabase	VARCHAR (64)

IF ( @CRM IS NULL ) OR ( @LoginUsuario IS NULL ) -- ( @NomeDatabase IS NULL ) OR 
	BEGIN
		PRINT 'Ajuda'

		PRINT ''
		PRINT 'sp_AdicionarUsuario '  + QUOTENAME('CRM', '''') + ', ' + QUOTENAME('active.nome', '''')

		PRINT ''

		RETURN
	END


SET		@CRM			= RTRIM(LTRIM(@CRM))
SET		@LoginUsuario	= RTRIM(LTRIM(@LoginUsuario))


-- Banco dbSigaModelo
IF	@CRM = 'dbSigaModelo'
	SET	@NomeDatabase = 'dbSigaModelo'
ELSE	
	SET	@NomeDatabase = 'CRM_' + @CRM



-- LOGAR PERMISSÃO atribuída a usuário
IF	EXISTS( SELECT NAME FROM sys.databases WHERE NAME = @NomeDatabase  )
	BEGIN	

		IF NOT EXISTS( SELECT	TOP 1	* FROM	dbLogRestore.dbo.TbLogUsuario U	WHERE	CRM = @CRM AND LoginUsuario = @LoginUsuario	 AND AutorizadoEm IS NULL )
			BEGIN
				INSERT INTO TbLogUsuario ( CRM, LoginUsuario, CRMOriginal )	VALUES ( @CRM, @LoginUsuario, @CRM )

				PRINT ''
				PRINT 'Usuário ' + @LoginUsuario + ' adicionado ao banco ' + @NomeDatabase
			END
		ELSE
			BEGIN
				PRINT ''
				PRINT 'Adição do usuário ' + @LoginUsuario + ' ao banco ' + @NomeDatabase + ' já solicitada. Favor aguardar.' 
			END
	END
ELSE
	BEGIN
		PRINT ''

		PRINT 'Não existe o banco ' + @NomeDatabase
	END

GO

USE dbLogRestore

IF (OBJECT_ID('dbo.sp_DesmascararBanco') IS NOT NULL) DROP PROCEDURE sp_DesmascararBanco
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_DesmascararBanco] 
    @CRM			VARCHAR (16),
    @LoginMascara	VARCHAR (20)
AS
-- VERSION 1.00 - 3Set20

IF ( @CRM IS NULL ) OR ( @LoginMascara IS NULL )
	BEGIN
		PRINT 'Ajuda'

		PRINT ''
		PRINT 'sp_DesmascararBanco ' + QUOTENAME('CRM', '''') + ', ' + QUOTENAME('active.xxx', '''')

		RETURN
	END


BEGIN TRY   
    INSERT INTO dbLogRestore..TbLogMascara ( CRM, LoginMascara , Tabela, Campo ) VALUES ( @CRM, @LoginMascara, 'Todas as tabelas', 'Todos os campos' )

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

        UPDATE	dbLogRestore.dbo.TbLogMascara	SET		DesmascaradoEm = '1900-01-01 00:01'	WHERE	CRM = @CRM

    RETURN
    END CATCH
GO

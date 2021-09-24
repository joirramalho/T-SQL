SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- sp_Offline '0181429'

ALTER PROCEDURE [dbo].[sp_Offline] 
@CRM		VARCHAR (16)
AS

IF ( @CRM IS NULL ) 
	BEGIN
		PRINT 'Ajuda'

		PRINT ''
		PRINT 'sp_Offline ' + QUOTENAME('CRM', '''')

		RETURN
	END


BEGIN TRY   
    INSERT INTO dbLogRestore..TbLogOffline ( CRM ) VALUES ( @CRM )

        -- Logar operação em TbLogMensagem
    INSERT INTO [dbLogRestore].[dbo].[TbLogMensagem]
                ([CRM]
                ,[Erro]
                ,[Mensagem])
            VALUES
                (@CRM
                ,0 -- Warnig
                ,'Solicitado Banco Online/Offline [CRM_' + @CRM + ']')

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

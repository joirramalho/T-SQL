SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- sp_JobDelete -- Script consulta solicitações de DELETE em TbLogRestore e apaga uma de cada vez...

ALTER PROCEDURE [dbo].[sp_JobDelete] 
AS

DECLARE @IdLogRestore			INT
DECLARE @CRM					VARCHAR(16)
DECLARE @Database				VARCHAR(32)
DECLARE @NomeDatabase			VARCHAR(64)
DECLARE @LoginSolicitanteDelete	VARCHAR(32)

--DECLARE @EspacoLivre	TABLE 
--	(
--		 Disco nvarchar(16)
--		,EspacoLivreInMB int
--	);

-- VERSION 1.00 26Nov20 -- UPDATE fechar comando DELETE se banco não existe


SELECT	TOP 1	@IdLogRestore = IdLogRestore, @CRM = CRM, @NomeDatabase = NomeDatabase, @LoginSolicitanteDelete = LoginSolicitanteDelete
FROM	dbLogRestore.dbo.TbLogRestore 
WHERE	DataSolicitacaoDelete IS NOT NULL AND DataRemocao IS NULL 
ORDER	BY DataSolicitacaoDelete DESC

-- Algum banco para ser removido? 
IF @CRM	IS NULL
	BEGIN
		RETURN
	END

SET @Database = 'CRM_' + @CRM


IF EXISTS(SELECT * FROM sys.databases WHERE NAME = @Database )
	BEGIN
		BEGIN TRY   
			EXEC('DROP DATABASE [' + @Database + ']')

			-- Coletar espaço livre no disco
			--INSERT INTO @EspacoLivre
			--	SELECT  DISTINCT dovs.volume_mount_point AS Drive,
			--	CONVERT(INT,dovs.available_bytes/1048576.0) AS FreeSpaceInMB
			--	FROM sys.master_files mf
			--	CROSS APPLY sys.dm_os_volume_stats(mf.database_id, mf.FILE_ID) dovs
			--	ORDER BY FreeSpaceInMB ASC

			-- Logar operação em TbLogMensagem
			INSERT INTO [dbLogRestore].[dbo].[TbLogMensagem]
					   ([CRM]
					   ,[Erro]
					   ,[Mensagem])
				 VALUES
					   (@CRM
					   ,0 -- Warnig
					   ,'[' + @NomeDatabase + '] removido por [' + @LoginSolicitanteDelete + ']' )

		
			-- Gerar mensagem com pequeno delay
			--WAITFOR DELAY '00:00:01';


			-- Logar operação em TbLogMensagem
			--INSERT INTO [dbLogRestore].[dbo].[TbLogMensagem]
			--		   ([CRM]
			--		   ,[Erro]
			--		   ,[Mensagem])
			--	 VALUES
			--		   (@CRM
			--		   ,0 -- Warnig
			--		   ,'Espaço livre em disco ' + ( SELECT ISNULL( RTRIM(CAST( EspacoLivreInMB AS char) ) + ' MB','') FROM @EspacoLivre ) )

			SET @CRM = QUOTENAME( @CRM, '''' )


			EXEC('UPDATE dbLogRestore.dbo.TbLogRestore SET DataRemocao = GETDATE() WHERE CRM = ' + @CRM  )

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

				RETURN
			END CATCH

        -- Logar espaço livre em disco após DELETE
        EXEC dbo.sp_JobEspacoLivreInMB

	END
ELSE
	BEGIN
		INSERT INTO [dbLogRestore].[dbo].[TbLogMensagem]
				   ([CRM]
				   ,[Erro]
				   ,[Mensagem])
			 VALUES
				   (@CRM
				   ,0 -- Warning
				   ,'Banco [' + @Database + '] não existe para ser removido. Solicitação de DELETE encerrada')

        EXEC('UPDATE dbLogRestore.dbo.TbLogRestore SET DataRemocao = GETDATE() WHERE IdLogRestore = ' + @IdLogRestore  )

	END


GO

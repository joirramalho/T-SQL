SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dbo].[sp_JobRestore]
	@Verbose	BIT = 0
AS

-- 1.09 -- DbVendas
-- 1.08 -- db_SIGA -- dbSigaAuxil logical_name
-- 1.07 -- db_SIGA
-- VERSION 1.06 - 06Out20 -- N restore Banco Local
-- VERSION 1.05 - 30Set20 -- Restore only FULL retroativo ou não
-- VERSION 1.04 - 29Set20 -- Restore only FULL retroativo
-- VERSION 1.03 - 3Set20
-- VERSION 1.02 - 25Ago20 -- LoginalName NOT DEFAULT
-- VERSION 1.01 - 24Jun20

DECLARE @CRM				VARCHAR(16)
DECLARE @Database			VARCHAR(32)
DECLARE @NomeDatabase		VARCHAR(64)
DECLARE @BancoLocal			BIT = 0
DECLARE @Version_id_full	VARCHAR(32) = NULL
DECLARE @Version_id_diff	VARCHAR(32) = NULL


DECLARE @strSQL			VARCHAR(1024)
DECLARE @strSQLDiff		VARCHAR(1024) = NULL


-- SELECT	TOP 1	CRM, NomeDatabase
SELECT	TOP 1	@CRM = CRM, @NomeDatabase = NomeDatabase, @BancoLocal = BancoLocal, @Version_id_full = Version_id_full, @Version_id_diff = Version_id_diff
FROM	dbLogRestore.dbo.TbLogRestore 
WHERE	DataLogDownload IS NOT NULL AND DataRestauracao IS NULL
ORDER	BY DataLogRestore DESC


-- Algum banco para ser restaurado? 
IF @CRM	IS NULL
	BEGIN
		PRINT 'Nenhum banco para restaurar'

		RETURN
	END

SET @Database = 'CRM_' + @CRM

IF @Verbose = 1 SELECT 'Entrou'

SELECT @NomeDatabase
		
IF	@NomeDatabase = 'dbSigaAuxilNatal' -- banco NUVEM  -- LoginalName NOT DEFAULT
	BEGIN
		-- RESTORE FILELISTONLY	FROM DISK = 'C:\Restore\dbSigaACBV.bak'
		-- RESTORE FILELISTONLY	FROM DISK = 'C:\Restore\dbSigaAuxilNatal_full.bak'


		-- RESTORE DATABASE CRM_242053v5 
		-- FROM DISK = 'C:\Restore\dbSigaAuxilNatal_full.bak' 
		-- WITH FILE = 1, 
		-- MOVE N'teste2_Data' TO N'C:\SQL\dbSigaAuxilNatal_242053v5.mdf', 
		-- MOVE N'teste2_log' TO N'C:\SQL\dbSigaAuxilNatal_242053v5_log.ldf', NORECOVERY,  NOUNLOAD,  STATS = 25

		-- RESTORE DATABASE CRM_242053v5 FROM DISK = 'C:\Restore\dbSigaAuxilNatal_diff.bak' WITH RECOVERY


			-- DECLARE @Table TABLE (
			--     LogicalName varchar(128),
			--     PhysicalName varchar(128),
			--      [Type] varchar, [FileGroupName] varchar(128), [Size] varchar(128), 
			--             [MaxSize] varchar(128), [FileId]varchar(128), [CreateLSN]varchar(128), [DropLSN]varchar(128), [UniqueId]varchar(128), [ReadOnlyLSN]varchar(128), [ReadWriteLSN]varchar(128), 
			--             [BackupSizeInBytes]varchar(128), [SourceBlockSize]varchar(128), [FileGroupId]varchar(128), [LogGroupGUID]varchar(128), [DifferentialBaseLSN]varchar(128), [DifferentialBaseGUID]varchar(128), [IsReadOnly]varchar(128), [IsPresent]varchar(128), [TDEThumbprint]varchar(128)
			-- )
			-- DECLARE @Path varchar(1000)='C:\Restore\dbSigaAuxilNatal_full.bak'
			-- DECLARE @LogicalNameData varchar(128),@LogicalNameLog varchar(128)
			-- INSERT INTO @table
			-- EXEC('
			-- RESTORE FILELISTONLY 
			--    FROM DISK=''' +@Path+ '''
			--    ')

			--    SET @LogicalNameData =   (SELECT LogicalName FROM @Table WHERE Type='D')
			--    SET @LogicalNameLog  =    (SELECT LogicalName FROM @Table WHERE Type='L')

			-- SELECT @LogicalNameData,@LogicalNameLog




		IF @Verbose = 1 SELECT 'Entrou-LoginalName'
		
  		SET	@strSQL = 	'RESTORE DATABASE ' + @Database + ' FROM DISK = ' + 
						QUOTENAME('C:\Restore\' + @NomeDatabase + '.bak', '''') + ' WITH FILE = 1, MOVE N' + 
						QUOTENAME('teste2_Data', '''') + ' TO N' +
						QUOTENAME('C:\SQL\' + @NomeDatabase + '_' + @CRM + '.mdf', '''') + ', MOVE N' + 
						QUOTENAME('teste2_log', '''') +' TO N' + 
						QUOTENAME('C:\SQL\' + @NomeDatabase + '_' + @CRM + '_log.ldf', '''') + ', ' + 
						'RECOVERY,  NOUNLOAD,  STATS = 25'

  		SET	@strSQLDiff = 'RESTORE DATABASE ' + @Database + ' FROM DISK = ' + QUOTENAME('C:\Restore\' + @NomeDatabase + '_diff.bak', '''') + ' WITH RECOVERY'
	END



ELSE	IF	LEFT( @NomeDatabase, 6 ) = 'dbSiga' AND @BancoLocal = 0 -- banco NUVEM
    AND	@Version_id_full IS NOT NULL	-- banco RETROATIVO 
    AND	@Version_id_diff IS  NULL		-- SEM Arquivo Diff
	BEGIN
  		SET	@strSQL = 	'RESTORE DATABASE ' + @Database + ' FROM DISK = ' + 
						QUOTENAME('C:\Restore\' + @NomeDatabase + '_full.bak', '''') + ' WITH FILE = 1, MOVE N' + 
						QUOTENAME('dbSiga_Data', '''') + ' TO N' +
						QUOTENAME('C:\SQL\' + @NomeDatabase + '_' + @CRM + '.mdf', '''') + ', MOVE N' + 
						QUOTENAME('dbSiga_log', '''') +' TO N' + 
						QUOTENAME('C:\SQL\' + @NomeDatabase + '_' + @CRM + '_log.ldf', '''') + ', ' + 
						'RECOVERY,  NOUNLOAD,  STATS = 25'
	END



ELSE	IF	LEFT( @NomeDatabase, 6 ) = 'dbSiga' AND @BancoLocal = 1 -- banco LOCAL
    OR
    LEFT( @NomeDatabase, 7 ) = 'db_SIGA' AND @BancoLocal = 1 -- banco NUVEM -- COM Arquivo Diff
	BEGIN
  		SET	@strSQL = 	'RESTORE DATABASE ' + @Database + ' FROM DISK = ' + 
						QUOTENAME('C:\Restore\' + @NomeDatabase + '.bak', '''') + ' WITH FILE = 1, MOVE N' + 
						QUOTENAME('dbSiga_Data', '''') + ' TO N' +
						QUOTENAME('C:\SQL\' + @NomeDatabase + '_' + @CRM + '.mdf', '''') + ', MOVE N' + 
						QUOTENAME('dbSiga_log', '''') +' TO N' + 
						QUOTENAME('C:\SQL\' + @NomeDatabase + '_' + @CRM + '_log.ldf', '''') + ', ' + 
						'RECOVERY,  NOUNLOAD,  STATS = 25'
	END



ELSE	IF	LEFT( @NomeDatabase, 6 ) = 'dbSiga' AND @BancoLocal = 0 -- banco NUVEM -- COM Arquivo Diff
    OR
    LEFT( @NomeDatabase, 10 ) = 'BackupSIGA' AND @BancoLocal = 0 -- banco NUVEM -- COM Arquivo Diff
	BEGIN
  		SET	@strSQL = 	'RESTORE DATABASE ' + @Database + ' FROM DISK = ' + 
						QUOTENAME('C:\Restore\' + @NomeDatabase + '_full.bak', '''') + ' WITH FILE = 1, MOVE N' + 
						QUOTENAME('dbSiga_Data', '''') + ' TO N' +
						QUOTENAME('C:\SQL\' + @NomeDatabase + '_' + @CRM + '.mdf', '''') + ', MOVE N' + 
						QUOTENAME('dbSiga_log', '''') +' TO N' + 
						QUOTENAME('C:\SQL\' + @NomeDatabase + '_' + @CRM + '_log.ldf', '''') + ', ' + 
						'NORECOVERY,  NOUNLOAD,  STATS = 25'

  		SET	@strSQLDiff = 'RESTORE DATABASE ' + @Database + ' FROM DISK = ' + QUOTENAME('C:\Restore\' + @NomeDatabase + '_diff.bak', '''') + ' WITH RECOVERY'
	END



ELSE	IF	LEFT( @NomeDatabase, 5 ) = 'dbCrm' -- banco CRM
	BEGIN
  		SET	@strSQL = 	'RESTORE DATABASE ' + @Database + ' FROM DISK = ' + 
						QUOTENAME('C:\Restore\' + @NomeDatabase + '_full.bak', '''') + ' WITH FILE = 1, MOVE N' + 
						QUOTENAME('dbActiveCRM2_Data', '''') + ' TO N' +
						QUOTENAME('C:\SQL\' + @NomeDatabase + '_' + @CRM + '.mdf', '''') + ', MOVE N' + 
						QUOTENAME('dbActiveCRM2_Log', '''') +' TO N' + 
						QUOTENAME('C:\SQL\' + @NomeDatabase + '_' + @CRM + '_log.ldf', '''') + ', ' + 
						'NORECOVERY,  NOUNLOAD,  STATS = 25'

  		SET	@strSQLDiff = 'RESTORE DATABASE ' + @Database + ' FROM DISK = ' + QUOTENAME('C:\Restore\' + @NomeDatabase + '_diff.bak', '''') + ' WITH RECOVERY'
	END



ELSE	IF	LEFT( @NomeDatabase, 5 ) = 'dbBib' AND @BancoLocal = 1 -- banco LOCAL -- SEM Arquivo Diff -- banco Biblioteca
	BEGIN
  		SET	@strSQL = 	'RESTORE DATABASE ' + @Database + ' FROM DISK = ' + 
						QUOTENAME('C:\Restore\' + @NomeDatabase + '.bak', '''') + ' WITH FILE = 1, MOVE N' + 
						QUOTENAME('dbSigaBiblioteca_Data', '''') + ' TO N' +
						QUOTENAME('C:\SQL\' + @NomeDatabase + '_' + @CRM + '.mdf', '''') + ', MOVE N' + 
						QUOTENAME('dbSigaBiblioteca_log', '''') +' TO N' + 
						QUOTENAME('C:\SQL\' + @NomeDatabase + '_' + @CRM + '_log.ldf', '''') + ', ' + 
						'RECOVERY,  NOUNLOAD,  STATS = 25'

		IF @Verbose = 1 SELECT 'Biblioteca - LOCAL'
	END



ELSE	IF	LEFT( @NomeDatabase, 5 ) = 'dbBib' -- banco Biblioteca
	BEGIN
  		SET	@strSQL = 	'RESTORE DATABASE ' + @Database + ' FROM DISK = ' + 
						QUOTENAME('C:\Restore\' + @NomeDatabase + '_full.bak', '''') + ' WITH FILE = 1, MOVE N' + 
						QUOTENAME('dbSigaBiblioteca_Data', '''') + ' TO N' +
						QUOTENAME('C:\SQL\' + @NomeDatabase + '_' + @CRM + '.mdf', '''') + ', MOVE N' + 
						QUOTENAME('dbSigaBiblioteca_log', '''') +' TO N' + 
						QUOTENAME('C:\SQL\' + @NomeDatabase + '_' + @CRM + '_log.ldf', '''') + ', ' + 
						'NORECOVERY,  NOUNLOAD,  STATS = 25'

  		SET	@strSQLDiff = 'RESTORE DATABASE ' + @Database + ' FROM DISK = ' + QUOTENAME('C:\Restore\' + @NomeDatabase + '_diff.bak', '''') + ' WITH RECOVERY'
	END



ELSE	IF	( LEFT( @NomeDatabase, 9 ) = 'dbCantina' OR LEFT( @NomeDatabase, 8 ) = 'dbVendas' )
	BEGIN
		SET	@strSQL = 	'RESTORE DATABASE ' + @Database + ' FROM DISK = ' + 
				QUOTENAME('C:\Restore\' + @NomeDatabase + '_full.bak', '''') + ' WITH FILE = 1, MOVE N' + 
				QUOTENAME('dbCantinaActive', '''') + ' TO N' +
				QUOTENAME('C:\SQL\' + @NomeDatabase + '_' + @CRM + '.mdf', '''') + ', MOVE N' + 
				QUOTENAME('dbCantinaActive_log', '''') +' TO N' + 
				QUOTENAME('C:\SQL\' + @NomeDatabase + '_' + @CRM + '_log.ldf', '''') + ', ' + 
				'NORECOVERY,  NOUNLOAD,  STATS = 25'

  		SET	@strSQLDiff = 'RESTORE DATABASE ' + @Database + ' FROM DISK = ' + QUOTENAME('C:\Restore\' + @NomeDatabase + '_diff.bak', '''') + ' WITH RECOVERY'
	END


IF @Verbose = 1 SELECT @strSQL; SELECT @strSQLDiff



IF NOT EXISTS(SELECT * FROM sys.databases WHERE NAME = @Database )
	BEGIN


		IF @Verbose = 1 SELECT 'Entrou-LoginalName-RESTORE'



		-- sp_JobBackupSizeInMB
		BEGIN TRY
			EXEC dbLogRestore.dbo.sp_JobBackupSizeInMB @NomeDatabase, @CRM
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

		IF @Verbose = 1 SELECT 'sp_JobBackupSizeInMB'

		-- sp_JobEspacoLivreInMB -- Logar espaço livre em disco após DELETE
		BEGIN TRY
			EXEC dbo.sp_JobEspacoLivreInMB
		END TRY
			BEGIN CATCH
				-- Gerar log em TbLogMensagem
				INSERT INTO [dbLogRestore].[dbo].[TbLogMensagem]
							([CRM]
							,[Erro]
							,[Mensagem])
						VALUES
							(@CRM
							,1 -- Erro
							,OBJECT_NAME(@@PROCID) + ' -02-> ' + ERROR_MESSAGE())

				RETURN
			END CATCH

		IF @Verbose = 1 SELECT 'sp_JobEspacoLivreInMB'
		
		-- RESTORE
		-- Logar operação em TbLogMensagem
		INSERT INTO [dbLogRestore].[dbo].[TbLogMensagem]
					([CRM]
					,[Erro]
					,[Mensagem])
				VALUES
					(@CRM
					,0 -- Warnig
					,'Restaurando [' + @NomeDatabase + ']...')

		BEGIN TRY
 			EXEC( @strSQL )
			-- Logar operação em TbLogMensagem

			INSERT INTO [dbLogRestore].[dbo].[TbLogMensagem]
					   ([CRM]
					   ,[Erro]
					   ,[Mensagem])
				 VALUES
					   (@CRM
					   ,0 -- Warnig
					   ,'[' + @NomeDatabase + '_full] restaurado')

            IF @strSQLDiff IS NULL
                BEGIN
                    -- UPDATE DataRestauracao ao final do RESTORE
                    UPDATE	dbLogRestore.dbo.TbLogRestore	SET		DataRestauracao = GETDATE()	WHERE	CRM = @CRM
                END
		END TRY
			BEGIN CATCH
				INSERT INTO [dbLogRestore].[dbo].[TbLogMensagem]
							([CRM]
							,[Erro]
							,[Mensagem])
						VALUES
							(@CRM
							,1 -- Erro
							,OBJECT_NAME(@@PROCID) + ' -03-> ' + ERROR_MESSAGE())

				UPDATE dbLogRestore.dbo.TbLogRestore SET DataRestauracao    = '1900-01-01 03:00' WHERE CRM = @CRM
				UPDATE dbLogRestore.dbo.TbLogUsuario SET AutorizadoEm       = '1900-01-01 03:01' WHERE CRM = @CRM

				RETURN
			END CATCH

		IF @Verbose = 1 SELECT 'RESTORE FULL'
--
		IF @strSQLDiff IS NOT NULL
			BEGIN
				BEGIN TRY
					EXEC( @strSQLDiff )

					-- Logar operação em TbLogMensagem
					INSERT INTO [dbLogRestore].[dbo].[TbLogMensagem]
								([CRM]
								,[Erro]
								,[Mensagem])
							VALUES
								(@CRM
								,0 -- Warnig
								,'[' + @NomeDatabase + '_diff] restaurado')


                -- UPDATE DataRestauracao ao final do RESTORE
                UPDATE	dbLogRestore.dbo.TbLogRestore	SET		DataRestauracao = GETDATE()	WHERE	CRM = @CRM

				END TRY
					BEGIN CATCH
						INSERT INTO [dbLogRestore].[dbo].[TbLogMensagem]
									([CRM]
									,[Erro]
									,[Mensagem])
								VALUES
									(@CRM
									,1 -- Erro
									,OBJECT_NAME(@@PROCID) + ' -03a-> ' + ERROR_MESSAGE())

						UPDATE dbLogRestore.dbo.TbLogRestore SET DataRestauracao    = '1900-01-01 03:01' WHERE CRM = @CRM
						UPDATE dbLogRestore.dbo.TbLogUsuario SET AutorizadoEm       = '1900-01-01 03:01' WHERE CRM = @CRM

						RETURN
					END CATCH
				END

--
		IF @Verbose = 1 SELECT 'RESTORE DIFF'



		-- sp_RecoveryTruncate
		BEGIN TRY
			EXEC dbLogRestore.dbo.sp_JobRecoveryTruncate  @CRM
		END TRY
			BEGIN CATCH
				INSERT INTO [dbLogRestore].[dbo].[TbLogMensagem]
							([CRM]
							,[Erro]
							,[Mensagem])
						VALUES
							(@CRM
							,1 -- Erro
							,OBJECT_NAME(@@PROCID) + ' -04-> ' + ERROR_MESSAGE())

				RETURN
			END CATCH

		IF @Verbose = 1 SELECT 'sp_RecoveryTruncate'


		-- sp_MascararDados
		BEGIN TRY
			EXEC dbLogRestore.dbo.sp_JobMascararDados  @CRM
		END TRY
			BEGIN CATCH
				INSERT INTO [dbLogRestore].[dbo].[TbLogMensagem]
							([CRM]
							,[Erro]
							,[Mensagem])
						VALUES
							(@CRM
							,1 -- Erro
							,OBJECT_NAME(@@PROCID) + ' -05-> ' + ERROR_MESSAGE())

				RETURN
			END CATCH

		IF @Verbose = 1 SELECT 'sp_MascararDados'


		-- sp_SobrescreverEmail
		BEGIN TRY
			EXEC dbLogRestore.dbo.sp_JobSobrescreverEmail  @CRM
		END TRY
			BEGIN CATCH
				INSERT INTO [dbLogRestore].[dbo].[TbLogMensagem]
							([CRM]
							,[Erro]
							,[Mensagem])
						VALUES
							(@CRM
							,1 -- Erro
							,OBJECT_NAME(@@PROCID) + ' -06-> ' + ERROR_MESSAGE())

				RETURN
			END CATCH

		IF @Verbose = 1 SELECT 'sp_SobrescreverEmail'


		-- Logar operação em TbLogMensagem
		INSERT INTO [dbLogRestore].[dbo].[TbLogMensagem]
					([CRM]
					,[Erro]
					,[Mensagem])
				VALUES
					(@CRM
					,0 -- Warnig
					,'Restore de [' + @NomeDatabase + '] concluído')

		IF @Verbose = 1 SELECT 'Restore concluído'


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
				   ,1 -- Erro
				   ,'Banco ' + @Database + ' já existe')

			UPDATE dbLogRestore.dbo.TbLogRestore SET DataRestauracao = '1900-01-01 00:00' WHERE CRM = @CRM
	END



GO

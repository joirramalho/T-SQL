-- https://www.mssqltips.com/sqlservertip/3209/understanding-sql-server-log-sequence-numbers-for-backups/

DECLARE @Database		VARCHAR(64) = 'dbSigaAbba' -- dbSigaAbba -- dbBibMapleBearNatal -- dbCantinaContempCV  - dbCrmActivesoft
DECLARE @CRM			VARCHAR(16) = 'A12345'

DECLARE @CRM_Database	VARCHAR(64) = 'CRM_' + @CRM

DECLARE @BancoLocal		BIT = 0

DECLARE	@Verbose		BIT = 1

DECLARE @cmd			VARCHAR(512)
DECLARE @strSQL			VARCHAR(1024)

DECLARE @BackupHeader	TABLE 
	(
		 BackupName nvarchar(128)
		,BackupDescription nvarchar(255)
		,BackupType smallint
		,ExpirationDate datetime
		,Compressed tinyint
		,Position smallint
		,DeviceType tinyint
		,UserName nvarchar(128)
		,ServerName nvarchar(128)
		,DatabaseName nvarchar(128)
		,DatabaseVersion int
		,DatabaseCreationDate datetime
		,BackupSize numeric(20,0)
		,FirstLSN numeric(25,0)
		,LastLSN numeric(25,0)
		,CheckpointLSN numeric(25,0)
		,DatabaseBackupLSN numeric(25,0)
		,BackupStartDate datetime
		,BackupFinishDate datetime
		,SortOrder smallint
		,CodePage smallint
		,UnicodeLocaleId int
		,UnicodeComparisonStyle int
		,CompatibilityLevel tinyint
		,SoftwareVendorId int
		,SoftwareVersionMajor int
		,SoftwareVersionMinor int
		,SoftwareVersionBuild int
		,MachineName nvarchar(128)
		,Flags int
		,BindingID uniqueidentifier
		,RecoveryForkID uniqueidentifier
		 --following columns introduced in SQL 2008
		,Collation nvarchar(128)
		,FamilyGUID uniqueidentifier
		,HasBulkLoggedData bit
		,IsSnapshot bit
		,IsReadOnly bit
		,IsSingleUser bit
		,HasBackupChecksums bit
		,IsDamaged bit
		,BeginsLogChain bit
		,HasIncompleteMetaData bit
		,IsForceOffline bit
		,IsCopyOnly bit
		,FirstRecoveryForkID uniqueidentifier
		,ForkPointLSN numeric(25,0)
		,RecoveryModel nvarchar(60)
		,DifferentialBaseLSN numeric(25,0)
		,DifferentialBaseGUID uniqueidentifier
		,BackupTypeDescription nvarchar(60)
		,BackupSetGUID uniqueidentifier NULL 
		,CompressedBackupSize bigint
		--following columns introduced in SQL 2012
		,Containment tinyint 
		--following columns introduced in SQL 2014
		,KeyAlgorithm nvarchar(32)
		,EncryptorThumbprint varbinary(20)
		,EncryptorType nvarchar(32)
	);


DECLARE @DiscoGB 		DECIMAL(19, 2)
DECLARE @DiscoLivreGB	DECIMAL(19, 2)
DECLARE @BackupSize		DECIMAL(19, 2)

SELECT DISTINCT TOP 1
	@DiscoGB = VS.total_bytes / 1024 / 1024 / 1024,
	@DiscoLivreGB = CAST( VS.available_bytes AS DECIMAL(19, 2) ) / 1024 / 1024 / 1024

FROM    sys.master_files AS MF
	CROSS APPLY [sys].[dm_os_volume_stats](MF.database_id, MF.file_id) AS VS
WHERE   CAST(VS.available_bytes AS DECIMAL(19, 2)) / CAST(VS.total_bytes AS DECIMAL(19, 2)) * 100 < 100



SET		@Database = LTRIM( RTRIM( @Database ) )

-- SELECT	@BancoLocal = BancoLocal FROM TbLogRestore WHERE CRM = @CRM

SET NOCOUNT ON


IF NOT EXISTS(SELECT * FROM sys.databases WHERE NAME = @CRM_Database ) -- Nao existe database
	BEGIN

		-- full	HEADERONLY
		BEGIN TRY
			-- SET	@strSQLFull = 'RESTORE HEADERONLY FROM DISK=' + QUOTENAME( @strSQLFull, '''')
			SET	@cmd = 'RESTORE HEADERONLY FROM DISK=' + QUOTENAME( 'C:\Restore\' + @Database + '_full.bak', '''')

			INSERT INTO @BackupHeader
				EXEC ( @cmd );
		END TRY
			BEGIN CATCH
				PRINT ERROR_MESSAGE()
			END CATCH

		
		-- SELECT BackupSize / 1024 / 1024 / 1024 FROM @BackupHeader


		IF EXISTS( SELECT * FROM @BackupHeader WHERE BackupType = 1 ) -- Tem full
			BEGIN

				SELECT @BackupSize = ( BackupSize / 1024 / 1024 / 1024 ) FROM @BackupHeader  

				IF 	( @BackupSize * 2 ) > @DiscoLivreGB
					BEGIN
						INSERT INTO [dbLogRestore].[dbo].[TbLogMensagem]
								([CRM]
								,[Erro]
								,[Mensagem])
							VALUES
								(@CRM
								,1 -- Erro
								,'Espaço livre insuficiente (' + CAST( @DiscoLivreGB AS VARCHAR(10) ) + 'GB) para restaurar banco com (' + CAST( @BackupSize AS VARCHAR(10) ) + 'GB) de tamanho')

						UPDATE dbLogRestore.dbo.TbLogRestore SET DataRestauracao = '1900-01-01 00:00' WHERE CRM = @CRM

						RETURN
					END


				IF	@BancoLocal = 0 -- banco na nuvem PODE ter diff e log
					BEGIN
						-- Diff
						BEGIN TRY
							-- SET	@strSQLDiff = 'RESTORE HEADERONLY FROM DISK=' + QUOTENAME( @strSQLDiff, '''')
							SET	@cmd = 'RESTORE HEADERONLY FROM DISK=' + QUOTENAME( 'C:\Restore\' + @Database + '_diff.bak', '''')

							INSERT INTO @BackupHeader
								EXEC ( @cmd );
						END TRY
							BEGIN CATCH
								PRINT ERROR_MESSAGE()
							END CATCH




						-- log
						DECLARE @Counter INT = 5

						WHILE ( @Counter <= 21)
							BEGIN
								BEGIN TRY
									SET	@cmd = 'RESTORE HEADERONLY FROM DISK=' + QUOTENAME( 'C:\Restore\' + @Database + '_' + FORMAT( @Counter,'0#') + 'h_log.bak', '''')

									INSERT INTO @BackupHeader
										EXEC ( @cmd );
								END TRY
									BEGIN CATCH
										PRINT ERROR_MESSAGE()
									END CATCH

								SET @Counter = @Counter  + 2
							END




						-- DELETE .bak anteriores ao último full ou diff
						DELETE  @BackupHeader
						WHERE   ( BackupType = 5 AND BackupFinishDate < ( SELECT BackupFinishDate FROM @BackupHeader WHERE BackupType = 1 ) ) -- Diff < Full
								OR
								( BackupType = 2 AND BackupFinishDate < ( SELECT BackupFinishDate FROM @BackupHeader WHERE BackupType = 5 ) ) -- Log < Diff
								OR
								( BackupType = 2 AND BackupFinishDate < ( SELECT BackupFinishDate FROM @BackupHeader WHERE BackupType = 1 ) ) -- Log < Full

						-- -- DELETE Diff SEM full
						-- DELETE  @BackupHeader
						-- WHERE   ( BackupType = 5 AND NOT EXISTS ( SELECT * FROM @BackupHeader WHERE BackupType = 1 ) ) 


							-- 	-- DELETE  @BackupHeader
							-- 	-- WHERE   ( BackupType = 2 AND NOT EXISTS ( SELECT * FROM @BackupHeader WHERE BackupType = 5 ) ) -- Log SEM diff

					END -- banco na nuvem PODE ter diff e log



				-- full	RESTORE
				BEGIN TRY
					IF	LEFT( @Database, 6 ) = 'dbSiga' AND @BancoLocal = 0 -- banco NUVEM -- SEMPRE COM sufixo _full
						BEGIN
							SET	@strSQL = 	'RESTORE DATABASE [' + @CRM_Database + '] FROM DISK = ' + 
											QUOTENAME('C:\Restore\' + @Database + '_full.bak', '''') + ' WITH FILE = 1, MOVE N' + 
											QUOTENAME('dbSiga_Data', '''') + ' TO N' +
											QUOTENAME('C:\SQL\' + @Database + '_' + @CRM + '.mdf', '''') + ', MOVE N' + 
											QUOTENAME('dbSiga_log', '''') + ' TO N' + 
											QUOTENAME('C:\SQL\' + @Database + '_' + @CRM + '_log.ldf', '''') + ', ' + 
											'NORECOVERY;'
						END
					ELSE IF	LEFT( @Database, 5 ) = 'dbBib' -- banco Biblioteca
						BEGIN
							SET	@strSQL = 	'RESTORE DATABASE [' + @CRM_Database + '] FROM DISK = ' + 
											QUOTENAME('C:\Restore\' + @Database + '_full.bak', '''') + ' WITH FILE = 1, MOVE N' + 
											QUOTENAME('dbSigaBiblioteca_Data', '''') + ' TO N' +
											QUOTENAME('C:\SQL\' + @Database + '_' + @CRM + '.mdf', '''') + ', MOVE N' + 
											QUOTENAME('dbSigaBiblioteca_log', '''') +' TO N' + 
											QUOTENAME('C:\SQL\' + @Database + '_' + @CRM + '_log.ldf', '''') + ', ' + 
											'NORECOVERY;'
						END

					ELSE IF	LEFT( @Database, 9 ) = 'dbCantina' 
						BEGIN
							SET	@strSQL = 	'RESTORE DATABASE [' + @CRM_Database + '] FROM DISK = ' + 
											QUOTENAME('C:\Restore\' + @Database + '_full.bak', '''') + ' WITH FILE = 1, MOVE N' + 
											QUOTENAME('dbCantinaActive', '''') + ' TO N' +
											QUOTENAME('C:\SQL\' + @Database + '_' + @CRM + '.mdf', '''') + ', MOVE N' + 
											QUOTENAME('dbCantinaActive_log', '''') +' TO N' + 
											QUOTENAME('C:\SQL\' + @Database + '_' + @CRM + '_log.ldf', '''') + ', ' + 
											'NORECOVERY;'
						END

					ELSE IF	LEFT( @Database, 5 ) = 'dbCrm' 
						BEGIN
							SET	@strSQL = 	'RESTORE DATABASE [' + @CRM_Database + '] FROM DISK = ' + 
											QUOTENAME('C:\Restore\' + @Database + '_full.bak', '''') + ' WITH FILE = 1, MOVE N' + 
											QUOTENAME('dbActiveCRM2_Data', '''') + ' TO N' +
											QUOTENAME('C:\SQL\' + @Database + '_' + @CRM + '.mdf', '''') + ', MOVE N' + 
											QUOTENAME('dbActiveCRM2_Log', '''') +' TO N' + 
											QUOTENAME('C:\SQL\' + @Database + '_' + @CRM + '_log.ldf', '''') + ', ' + 
											'NORECOVERY;'
						END


					IF @Verbose = 1
						PRINT	@strSQL
					ELSE
						EXEC( @strSQL )
				END TRY
					BEGIN CATCH
						PRINT ERROR_MESSAGE()
					END CATCH


				-- Diff RESTORE
				IF EXISTS( SELECT * FROM @BackupHeader WHERE BackupType = 5 ) -- Tem diff
					BEGIN
						BEGIN TRY
							SET	@strSQL = 'RESTORE DATABASE [' + @CRM_Database + '] FROM DISK = ''' + 'C:\Restore\' + @Database + '_diff.bak' + ''' WITH NORECOVERY;'

							IF @Verbose = 1
								PRINT @strSQL
							ELSE
								EXEC( @strSQL )
						END TRY
							BEGIN CATCH
								PRINT ERROR_MESSAGE()
							END CATCH
					END



				IF EXISTS( SELECT * FROM @BackupHeader WHERE BackupType = 2 ) -- Tem log
					BEGIN
						DECLARE @LogName 			VARCHAR(128)
						DECLARE	@BackupStartDate 	DATETIME

						DECLARE DatabaseName CURSOR FOR  
						SELECT 	DatabaseName, BackupStartDate
						FROM 	@BackupHeader 
						WHERE 	BackupType = 2	-- LOGs

						
						OPEN DatabaseName  
						FETCH NEXT FROM DatabaseName INTO @LogName, @BackupStartDate

						WHILE @@FETCH_STATUS = 0  
						BEGIN
							BEGIN TRY
								SET @cmd = 'RESTORE LOG [' + @CRM_Database + '] FROM DISK = ''' + 'C:\Restore\' + @LogName + '_' + FORMAT( DATEPART(HOUR, @BackupStartDate),'0#') + 'h_log.bak' + ''' WITH NORECOVERY;' 

								IF @Verbose = 1
									PRINT @cmd
								ELSE
									EXEC ( @cmd ) 
							END TRY
								BEGIN CATCH
									PRINT ERROR_MESSAGE()
								END CATCH

						FETCH NEXT FROM DatabaseName INTO @LogName, @BackupStartDate
						END 

						CLOSE DatabaseName  
						DEALLOCATE DatabaseName  
					END


				-- WITH RECOVERY
				SET @cmd = 'RESTORE DATABASE [' + @CRM_Database + '] WITH RECOVERY;' 

				IF @Verbose = 1
					PRINT @cmd
				ELSE
					EXEC ( @cmd ) 

			END -- Tem full
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

		UPDATE dbLogRestore.dbo.TbLogRestore SET DataRestauracao = '1900-01-01 09:00' WHERE CRM = @CRM
	END

-- SELECT DatabaseName, BackupType, * FROM @BackupHeader
-- ORDER by BackupFinishDate

-- EXEC dbLogMonitor.dbo.stpServerName

-- DROP DATABASE CRM_A12345

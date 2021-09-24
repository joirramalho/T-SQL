SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- sp_JobBackupSizeInMB 'dbSigaFenix', '177373' 

ALTER PROCEDURE [dbo].[sp_JobBackupSizeInMB] 
@Database	VARCHAR(64) = NULL,
@CRM		VARCHAR(16) = NULL
AS

DECLARE @BancoLocal		BIT = 0
DECLARE @SufixoNome		CHAR(5)

DECLARE @strSQL			VARCHAR(1024)

declare @isExists int;

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


SET		@Database = LTRIM( RTRIM( @Database ) )

SELECT	@BancoLocal = BancoLocal FROM TbLogRestore WHERE CRM = @CRM


IF	@BancoLocal = 0 -- Nuvem - Adicionar sufixo ao nome do arquivo fisico se estiver na NUVEM
	SET	@strSQL = 'C:\Restore\' + @Database + '_full.bak'
ELSE
	SET	@strSQL = 'C:\Restore\' + @Database + '.bak'
 


-- Logar operação em TbLogMensagem
INSERT INTO [dbLogRestore].[dbo].[TbLogMensagem]
			([CRM]
			,[Erro]
			,[Mensagem])
		VALUES
			(@CRM
			,0 -- Warnig
			,'Coletando o tamanho do banco [' + @Database + ']')



-- Checar se existe arquivo .BAK na pasta C:\Restore em LAB4
EXEC xp_fileexist @strSQL, @isExists OUT
IF @isExists = 0
	BEGIN
		INSERT INTO [dbLogRestore].[dbo].[TbLogMensagem]
					([CRM]
					,[Erro]
					,[Mensagem])
				VALUES
					(@CRM
					,1 -- Erro
					,'Arquivo ['+ IIF( @BancoLocal = 0, @Database + '_full.bak', @Database + '.bak' ) + ']' + ' não existe para ser restaurado')
		
		-- Setar valor em DataRestauracao para evitar LOOP de tentativa de restauração
		UPDATE dbLogRestore.dbo.TbLogRestore SET DataRestauracao = '1900-01-01 00:00' WHERE CRM = @CRM

		RETURN
	END


SET	@strSQL = 'RESTORE HEADERONLY FROM DISK=' + QUOTENAME( @strSQL, '''')



BEGIN TRY
	-- Coletar informações sobre banco de dados
	INSERT INTO @BackupHeader
		EXEC ( @strSQL );

	-- Gravar tamanho do banco (.bak) em TbLogRestore
	UPDATE	TbLogRestore 
	SET		BackupSizeInMB = (SELECT CEILING( BackupSize / 1024 / 1024 ) AS BackupSizeInMB FROM @BackupHeader ), BackupFinishDate = (SELECT BackupFinishDate FROM @BackupHeader )
	WHERE	CRM = @CRM

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
					,OBJECT_NAME(@@PROCID) + ' -01-> ' + ERROR_MESSAGE())

		RETURN
	END CATCH

GO

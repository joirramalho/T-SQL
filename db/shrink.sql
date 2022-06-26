--06mar22

EXEC dbo.sp_foreachdb N'
    ALTER DATABASE [?] SET RECOVERY SIMPLE WITH NO_WAIT;

    USE [?];

	SELECT DB_NAME();

--	DBCC SHRINKFILE(N''dbSiga_Data'', 0); 
--	DBCC SHRINKFILE(N''dbSigaSantaRosa_Arquivo01'', 0);  
	
	DBCC SHRINKDATABASE(?,0);


		EXEC sp_MSforeachtable @command1="ALTER INDEX ALL ON $ REBUILD WITH (ONLINE=OFF)", @replacechar="$"; -- NAO funciona com dbCrmActivesoft

			EXEC sp_updatestats;

			--	IF CHARINDEX( ''dbSiga'', ''?'') > 0
			--		DBCC SHRINKFILE (dbSiga_Log , 0, TRUNCATEONLY);
			--
			--	ELSE IF ( CHARINDEX( ''dbActiveBib'', ''?'') > 0 ) OR ( CHARINDEX( ''dbBib'', ''?'') > 0 )
			--		DBCC SHRINKFILE (dbSigaBiblioteca_Log , 0, TRUNCATEONLY); 
			--
			--	ELSE IF ( CHARINDEX( ''dbCantina'', ''?'') > 0 ) OR ( CHARINDEX( ''dbActive'', ''?'') > 0 )
			--		DBCC SHRINKFILE (dbCantinaActive_log , 0, TRUNCATEONLY);
			--
			--	ELSE IF ( CHARINDEX( ''dbCrmActivesoft'', ''?'') > 0 ) 
			--		DBCC SHRINKFILE (dbActiveCRM2_Log , 0, TRUNCATEONLY);
			--	ELSE 
			--		SELECT file_id, name as [logical_file_name],physical_name from sys.database_files;
			
			
			--			DBCC SHRINKFILE (dbSigaSantaRosa_Arquivo01_log , 0, TRUNCATEONLY);


	ALTER DATABASE [?] SET RECOVERY FULL WITH NO_WAIT;
'
,@print_command_only = 0 -- Obrigatório Gerar script
,@print_dbname=1
,@state_desc = N'ONLINE'
,@user_only = 1
,@suppress_quotename=1
-- ,@name_pattern='dbSigaParthenon';
,@database_list = 'dbSigaSaleMazzarello' 



-- Fazer backup 
--./backup.sh dbSigaSaleMazzarello && ./backup.sh dbSigaSaleMazzarello_Arquivo && ./backup.sh dbSigaParthenon				 	&& ./backup.sh dbSigaCeEdIntegracao 	&& ./backup.sh dbSigaCoesi 	&& ./backup.sh dbSigaCristoRedentor

--	DBCC CHECKDB([dbSigaParthenon]); -- WITH TABLERESULTS

--USE SampleDataBase;
--EXEC sp_spaceused;
-- Shrink the mdf file
--DBCC SHRINKFILE(N'dbSiga_Data', 0);
---- Shrink the log.ldf file
--ALTER DATABASE [dbSigaCognitivo] SET RECOVERY SIMPLE WITH NO_WAIT;
--DBCC SHRINKFILE(N'dbSiga_Log', 0);
--ALTER DATABASE [dbSigaCognitivo] SET RECOVERY FULL WITH NO_WAIT;


--ALTER DATABASE [dbCrmActivesoft] SET RECOVERY SIMPLE WITH NO_WAIT;
--DBCC SHRINKFILE (dbActiveCRM2_Data_ColetaDados , 0, TRUNCATEONLY);
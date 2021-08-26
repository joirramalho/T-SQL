-- 23jun20 REBUILD INDEX ALL TABLES IN ALL DATABASES

EXEC dbLogMonitor.dbo.sp_foreachdb N'
    ALTER DATABASE [?] SET RECOVERY SIMPLE WITH NO_WAIT;

    USE [?];

    SELECT DB_NAME();

      DBCC SHRINKDATABASE(?);

         EXEC sp_MSforeachtable @command1="ALTER INDEX ALL ON $ REBUILD WITH (ONLINE=OFF)", @replacechar="$"; -- NAO funciona com dbCrmActivesoft

            EXEC sp_updatestats;

--    IF CHARINDEX( ''dbSiga'', ''?'') > 0
--       DBCC SHRINKFILE (dbSiga_Log , 0, TRUNCATEONLY);
--    ELSE IF ( CHARINDEX( ''dbActiveBib'', ''?'') > 0 ) OR ( CHARINDEX( ''dbBib'', ''?'') > 0 )
--       DBCC SHRINKFILE (dbSigaBiblioteca_Log , 0, TRUNCATEONLY); 
--    ELSE IF ( CHARINDEX( ''dbCantina'', ''?'') > 0 ) OR ( CHARINDEX( ''dbActive'', ''?'') > 0 )
--       DBCC SHRINKFILE (dbCantinaActive_log , 0, TRUNCATEONLY);
--    ELSE IF ( CHARINDEX( ''dbCrmActivesoft'', ''?'') > 0 ) 
--       DBCC SHRINKFILE (dbActiveCRM2_Log , 0, TRUNCATEONLY);
--    ELSE IF ( CHARINDEX( ''dbSigaSalesianoSaoJose_Arquivo'', ''?'') > 0 ) 
--       DBCC SHRINKFILE (dbSigaSalesianoSaoJose_Arquivo02_Log , 0, TRUNCATEONLY);
--   ELSE 
--      SELECT file_id, name as [logical_file_name],physical_name from sys.database_files;

  DBCC SHRINKFILE (dbSigaSalesianoSaoJose_Arquivo01_log , 0, TRUNCATEONLY);


   ALTER DATABASE [?] SET RECOVERY FULL WITH NO_WAIT;
'
,@print_command_only = 0 -- Obrigatório Gerar script
,@print_dbname=1
,@state_desc = N'ONLINE'
,@user_only = 1
,@suppress_quotename=1
-- ,@name_pattern='dbSigaSalePetrolina_Arquivo0';
,@database_list = 'dbSigaSalesianoSaoJose_Arquivo'; -- , dbSigaSaleINSA, dbSigaNSLourdesGravata, dbSigaAuxilRecife 


   
-- DBCC CHECKDB([dbSigaSaleJuvenal]) -- WITH TABLERESULTS




-- 03ago21
-- 29abr21
-- VERSION 1.01 23Jun20

   -- Não funciona no dbCrmActivesoft -- 31Out20

-- ALTER DATABASE [dbSigaContemporaneo_Arquivo01] SET  READ_WRITE WITH NO_WAIT

EXEC dbLogMonitor.dbo.sp_foreachdb N'
    ALTER DATABASE [?] SET RECOVERY SIMPLE WITH NO_WAIT

    USE [?]

    EXEC sp_MSforeachtable @command1="ALTER INDEX ALL ON $ REBUILD WITH (ONLINE=OFF)", @replacechar="$"; -- NAO funciona com dbCrmActivesoft

    EXEC sp_updatestats

    IF CHARINDEX( ''dbSiga'', ''?'') > 0
       DBCC SHRINKFILE (dbSiga_Log , 0, TRUNCATEONLY) 
    ELSE IF ( CHARINDEX( ''dbActiveBib'', ''?'') > 0 ) OR ( CHARINDEX( ''dbBib'', ''?'') > 0 )
       DBCC SHRINKFILE (dbSigaBiblioteca_Log , 0, TRUNCATEONLY) 
    ELSE IF ( CHARINDEX( ''dbCantina'', ''?'') > 0 ) OR ( CHARINDEX( ''dbActive'', ''?'') > 0 )
       DBCC SHRINKFILE (dbCantinaActive_log , 0, TRUNCATEONLY) 
    ELSE IF ( CHARINDEX( ''dbCrmActivesoft'', ''?'') > 0 ) 
       DBCC SHRINKFILE (dbActiveCRM2_Log , 0, TRUNCATEONLY) 

   ALTER DATABASE [?] SET RECOVERY FULL WITH NO_WAIT
'
,@print_command_only = 0 -- Obrigatório Gerar script
,@print_dbname=1
,@state_desc = N'ONLINE'
,@user_only = 1
,@suppress_quotename=1
,@name_pattern='dbSigaPadraoInsES'; 
-- ,@database_list = 'dbSigaAprendiz' -- exceto dbCRMActivesoft

-- ALTER DATABASE [dbSigaContemporaneo_Arquivo01] SET  READ_ONLY WITH NO_WAIT
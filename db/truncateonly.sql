--05jan21

-- use dbCrmActivesoft

-- DBCC SHRINKFILE (dbActiveCRM2_Log , 0, TRUNCATEONLY)

EXEC dbo.sp_foreachdb N'
    --IF DB_NAME() NOT IN  (''dbCantinaActive'', ''dbActivePainelEletronico'' )
        USE ?

        SELECT file_id, name as [logical_file_name],physical_name from sys.database_files

                --    DBCC SHRINKFILE ( dbLogMonitor_log , 0, TRUNCATEONLY)


    IF DB_NAME() NOT IN  (''dbSigaEvolucao'' ,'''' )
    BEGIN
        ALTER DATABASE [?] SET RECOVERY SIMPLE WITH NO_WAIT

        SELECT DB_NAME()

    
        IF CHARINDEX( ''dbSigaAuxilNatal'', ''?'') > 0
        DBCC SHRINKFILE (teste2_Log , 0, TRUNCATEONLY) 

        ELSE IF CHARINDEX( ''dbSigaNeves_Arquivo'', ''?'') > 0
            DBCC SHRINKFILE (dbSigaNeves_Arquivo_log , 0, TRUNCATEONLY) 

        ELSE IF CHARINDEX( ''dbSiga'', ''?'') > 0
            DBCC SHRINKFILE (dbSiga_Log , 0, TRUNCATEONLY) 

        ELSE IF ( CHARINDEX( ''dbActiveBib'', ''?'') > 0 ) OR ( CHARINDEX( ''dbBib'', ''?'') > 0 )
            DBCC SHRINKFILE (dbSigaBiblioteca_Log , 0, TRUNCATEONLY) 
        
        ELSE IF ( CHARINDEX( ''dbCantina'', ''?'') > 0 ) OR ( CHARINDEX( ''dbActive'', ''?'') > 0 )
            DBCC SHRINKFILE (dbCantinaActive_log , 0, TRUNCATEONLY) 
        
        ELSE IF ( CHARINDEX( ''dbCrmActivesoft'', ''?'') > 0 ) 
            DBCC SHRINKFILE (dbActiveCRM2_Log , 0, TRUNCATEONLY) 
        
        ELSE IF CHARINDEX( ''CRM_'', ''?'') > 0
            DBCC SHRINKFILE (dbSiga_Log , 0, TRUNCATEONLY) 

        
                -- ALTER DATABASE [?] SET  READ_ONLY WITH NO_WAIT
 
--DBCC SHRINKFILE ( dbSigaGGE_Arquivo_log , 0, TRUNCATEONLY)

                -- DBCC SHRINKFILE (dbSigaSalePetrolina_Arquivo03_log, 0, TRUNCATEONLY) 
                 

                -- DBCC SHRINKFILE (dbCantinaActive_log, 0, TRUNCATEONLY) 
                

 		ALTER DATABASE [?] SET RECOVERY FULL WITH NO_WAIT

    END
'
,@print_command_only = 0 -- Obrigatório Gerar script
,@print_dbname=0
,@state_desc = N'ONLINE'
,@user_only = 1
,@suppress_quotename=1
--,@name_pattern='dbSigaIES_Amadeus'
 ,@database_list = 'dbSigaContemporaneo' --06 

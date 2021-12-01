--25set21

--ONLINE
	--ALTER DATABASE dbSigaImcCorMariaRS SET ONLINE;
	
	--ALTER DATABASE dbSigaArvoreSaber SET OFFLINE;
                            

	--DROP
		--DROP DATABASE dbSigaSalesianoSaoJose_Arquivo05



--SINGLE_USER & MULTI_USER
	--ALTER DATABASE [dbBibCELogos] SET  SINGLE_USER WITH ROLLBACK IMMEDIATE;

	--ALTER DATABASE [dbSigaCeja] SET  MULTI_USER WITH ROLLBACK IMMEDIATE;



--READ_WRITE & READ_ONLY
	--ALTER DATABASE dbSigaImcCorMariaRS    SET  READ_WRITE WITH NO_WAIT

	--ALTER DATABASE dbSigaEcoVillePE    SET  READ_ONLY WITH NO_WAIT



--SET RECOVERY
	--ALTER DATABASE [dbSigaGGE_Arquivo] SET RECOVERY SIMPLE WITH NO_WAIT;

	--ALTER DATABASE [dbBibNSLourdes] SET RECOVERY FULL WITH NO_WAIT



--ENABLE & DISABLE TRIGGER
	--DISABLE TRIGGER dbo.TgAudit_TbAlunoD ON dbo.TbAluno
	
	--ENABLE TRIGGER dbo.TgAudit_TbAlunoD  ON dbo.TbAluno



--sys.database_files
	-- USE dbSigaDiocCaruaru;
	-- SELECT file_id, name as [logical_file_name],physical_name from sys.database_files



--RESTORE FILELISTONLY
	-- RESTORE FILELISTONLY	FROM DISK = '/TEMP/dbSigaMaristella_Arquivo01_full.bak'
	-- RESTORE FILELISTONLY	FROM DISK = 'C:\TEMP\dbSigaDiocesanoMossoro_backup_2021_11_15_220600_9714394.bak'

--RESTORE HEADERONLY
	--RESTORE HEADERONLY	FROM DISK = 'C:\Restore\dbSigaDiocesanoMossoro_backup_2021_11_15_220600_9714394.bak'




--COLLATE SQL_Latin1_General_CP1_CI_AI
	--ALTER DATABASE dbCantinaTerceiroMilenio COLLATE SQL_Latin1_General_CP1_CI_AI;

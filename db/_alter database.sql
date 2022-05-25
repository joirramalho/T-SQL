--11fev22

--obtain a Query Execution Plan
	--https://stackoverflow.com/questions/7359702/how-do-i-obtain-a-query-execution-plan-in-sql-server

	--SHOWPLAN
		--SET SHOWPLAN_ALL ON
		--SET SHOWPLAN_ALL OFF
	
	
		--SELECT p.query_plan
		--FROM sys.dm_exec_requests AS r
		--OUTER APPLY sys.dm_exec_text_query_plan(
		--                r.plan_handle,
		--                r.statement_start_offset,
		--                r.statement_end_offset) AS p


--ONLINE
	--ALTER DATABASE dbSigaLiceu_Arquivo01 SET ONLINE;
	
	--ALTER DATABASE dbCantinaContempUnd3 SET OFFLINE;

		--DROP
			--DROP DATABASE dbSigaRaizes


--SINGLE_USER & MULTI_USER
	--ALTER DATABASE [dbBibCELogos] SET  SINGLE_USER WITH ROLLBACK IMMEDIATE;

	--ALTER DATABASE [dbSigaMariaStela] SET  MULTI_USER WITH ROLLBACK IMMEDIATE;



--READ_WRITE & READ_ONLY
	--ALTER DATABASE dbSigaOverdose_Arquivo    SET  READ_WRITE WITH NO_WAIT

	--ALTER DATABASE dbSigaOverdose_Arquivo    SET  READ_ONLY WITH NO_WAIT



--SET RECOVERY
	--ALTER DATABASE [dbSigaOverdose_Arquivo] SET RECOVERY SIMPLE WITH NO_WAIT;

	--ALTER DATABASE [dbSigaSantissimaTrindade] SET RECOVERY FULL WITH NO_WAIT



--ENABLE & DISABLE TRIGGER
--	DISABLE TRIGGER dbo.TgContaPagar_AnoMesCompetencia ON dbo.TbContaPagar;
--DISABLE TRIGGER dbo.TgContaPagar_ContaParcelada ON dbo.TbContaPagar;
--	DISABLE TRIGGER dbo.TgContaPagar_ExcluirConta ON dbo.TbContaPagar;
--	DISABLE TRIGGER dbo.TgContaPagarDataBloqueio ON dbo.TbContaPagar;
--	
--	ENABLE TRIGGER dbo.TgContaPagar_AnoMesCompetencia  ON dbo.TbContaPagar;
--ENABLE TRIGGER dbo.TgContaPagar_ContaParcelada  ON dbo.TbContaPagar;
--	ENABLE TRIGGER dbo.TgContaPagar_ExcluirConta  ON dbo.TbContaPagar;
--	ENABLE TRIGGER dbo.TgContaPagarDataBloqueio  ON dbo.TbContaPagar;



--sys.database_files
	-- USE dbSigaLiceu_Arquivo;
	-- SELECT file_id, name as [logical_file_name],physical_name from sys.database_files



--RESTORE FILELISTONLY
	-- RESTORE FILELISTONLY	FROM DISK = '/TEMP/bkp_dbSigaModuloAracaju_Arquivo01.bak'
	-- RESTORE FILELISTONLY	FROM DISK = 'C:\TEMP\dbSigaDiocesanoMossoro_backup_2021_11_15_220600_9714394.bak'

--RESTORE HEADERONLY
	--RESTORE HEADERONLY	FROM DISK = 'C:\Restore\dbSigaDiocesanoMossoro_backup_2021_11_15_220600_9714394.bak'



--COLLATE SQL_Latin1_General_CP1_CI_AI
	--ALTER DATABASE dbCantinaTerceiroMilenio COLLATE SQL_Latin1_General_CP1_CI_AI;

--07set21
-- https://www.mssqltips.com/sqlservertip/5645/sql-server-database-corruption-and-impact-of-running-checkdb-repair-with-allow-data-loss/


--use master;

--ALTER DATABASE dbSigaCELogos SET SINGLE_USER WITH ROLLBACK IMMEDIATE;


	-- DBCC CHECKDB(N'dbSigaCELogos', REPAIR_REBUILD)
		-- or
	    ---- DBCC CHECKDB(N'dbSigaCELogos', REPAIR_ALLOW_DATA_LOSS) -- dbSigaCEJUVPIAMARTA


-- ALTER DATABASE dbSigaCELogos SET MULTI_USER;


--CHECK
--DBCC CHECKDB([dbSigaCELogos]) --WITH TABLERESULTS

	--	DBCC CHECKALLOC (dbSigaCEJUVPIAMARTA)
	--	DBCC CHECKCATALOG (dbSigaCEJUVPIAMARTA)

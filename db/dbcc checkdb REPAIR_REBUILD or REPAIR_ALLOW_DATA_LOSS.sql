-- https://www.mssqltips.com/sqlservertip/5645/sql-server-database-corruption-and-impact-of-running-checkdb-repair-with-allow-data-loss/


-- ALTER DATABASE CRM_189836 SET SINGLE_USER WITH ROLLBACK IMMEDIATE;

    -- DBCC CHECKDB(N'dbSigaCEJUVPIAMARTA',REPAIR_REBUILD)
-- or
    ---- DBCC CHECKDB(N'dbSigaCEJUVPIAMARTA', REPAIR_ALLOW_DATA_LOSS)

-- ALTER DATABASE CRM_189836 SET MULTI_USER;


DBCC CHECKDB([dbSigaCEJUVPIAMARTA]) WITH TABLERESULTS
DBCC CHECKALLOC (dbSigaCEJUVPIAMARTA)
DBCC CHECKCATALOG (dbSigaCEJUVPIAMARTA)

DBCC CHECKDB([dbSigaCEMaximo]) --WITH TABLERESULTS
DBCC CHECKALLOC (dbSigaCEMaximo)
DBCC CHECKCATALOG (dbSigaCEMaximo)


CHECKDB found 0 allocation errors and 0 consistency errors in database 'dbSigaCEMaximo'.
CHECKDB found 0 allocation errors and 0 consistency errors in database 'dbSigaCEJUVPIAMARTA'.
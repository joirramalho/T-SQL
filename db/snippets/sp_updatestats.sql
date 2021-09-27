--22abr21

DECLARE @TSQL NVARCHAR(MAX)

-- Filtering system databases and user databases from execution
SET @TSQL = '
IF (
    DB_ID(''?'') > 4
    AND ''?'' LIKE (''dbSigaRosaCamara%'')
   )
    BEGIN
        USE [?]; 
        -- SELECT DB_NAME();
        exec sp_updatestats;

        -- DBCC CHECKDB([?]);
        -- EXEC sp_MSforeachtable @command1="ALTER INDEX ALL ON $ REBUILD WITH (ONLINE=OFF)", @replacechar="$"; -- NAO funciona com dbCrmActivesoft
    END
'
EXEC sp_MSforeachdb @TSQL

-- EXEC sp_MSforeachtable @command1="ALTER INDEX ALL ON ? REBUILD WITH (ONLINE=OFF)"

-- use dbSigaAprendiz;

-- SELECT DB_NAME()

-- DBCC CHECKDB([dbSigaAprendiz])

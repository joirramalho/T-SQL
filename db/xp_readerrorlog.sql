-- 03ago21

-- https://www.sqlshack.com/how-to-implement-error-handling-in-sql-server/

IF (OBJECT_ID('tempdb..#TmpErrorLog') IS NOT NULL) DROP TABLE #TmpErrorLog

CREATE TABLE [dbo].[#TmpErrorLog]
    ([LogDate] DATETIME NULL,
    [ProcessInfo] VARCHAR(20) NULL,
    [Text] VARCHAR(MAX) NULL );

INSERT INTO #TmpErrorLog ([LogDate], [ProcessInfo], [Text])
    EXEC master.dbo.xp_readerrorlog 0, 1, N'Login', N'failed', NULL, NULL, N'desc'

    -- EXEC master.dbo.xp_readerrorlog 0, 1, N'backup', N'successfully', NULL, NULL, N'desc'
    -- EXEC master.dbo.xp_readerrorlog 0, 
    -- EXEC master.dbo.xp_readerrorlog 0, 1, N'backup', N'error', NULL, NULL, N'desc'

    
SELECT * FROM #TmpErrorLog
-- where Text LIKE '%userFACHO%'
order by LogDate DESC



-- BackupDiskFile::CreateMedia: Backup device 'C:\BKPSIGA\dbSigaMadreDeusUnd2_2021-03-14_19h00m.bak' failed to create. Operating system error 3(The system cannot find the path specified.).
-- BackupDiskFile::OpenMedia: Backup device 'C:\TEMP\dbSigaPadrao.bak' failed to open. Operating system error 2(The system cannot find the file specified.).



-- BEGIN TRY
-- -- Generate a divide-by-zero error  
--   SELECT
--     1 / 1 AS Error;

-- -- RESTORE DATABASE [dbSigaPadraoInst]  FROM  DISK = N'C:\TEMP\dbSigaPadrao.bak'

--   SELECT
--     ERROR_NUMBER() AS ErrorNumber,
--     ERROR_STATE() AS ErrorState
-- END TRY
-- BEGIN CATCH
--   SELECT
--     ERROR_NUMBER() AS ErrorNumber,
--     ERROR_STATE() AS ErrorState,
--     ERROR_SEVERITY() AS ErrorSeverity,
--     ERROR_PROCEDURE() AS ErrorProcedure,
--     ERROR_LINE() AS ErrorLine,
--     ERROR_MESSAGE() AS ErrorMessage;
-- END CATCH;
-- GO



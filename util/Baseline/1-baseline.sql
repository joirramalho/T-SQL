-- What is Batch Requests/sec?
    -- https://www.brentozar.com/archive/2017/02/what-is-batch-requests-per-second/


-- How to detect SQL Server performance issues using baselines – Part 1 – Introduction
    -- https://solutioncenter.apexsql.com/how-to-monitor-your-sql-server-instances-and-databases/

-- How to detect SQL Server performance issues using baselines – Part 2 – Collecting metrics and reporting
    -- https://solutioncenter.apexsql.com/how-to-detect-sql-server-performance-issues-using-baselines-part-2-collecting-metrics-and-reporting/


-- CREATE DATABASE [PerformanceBaselines] 
-- ON PRIMARY 
-- ( NAME = N'PerformanceBaselines', 
--   FILENAME = N'E:\Data\PerformanceBaselines.mdf', 
--   SIZE = 128MB, 
--   FILEGROWTH = 512MB
-- ) LOG ON 
-- ( NAME = N'PerformanceBaselines_log', 
--   FILENAME = N'E:\Data\PerformanceBaselines_log.ldf', 
--   SIZE = 128MB, 
--   FILEGROWTH = 512MB
-- );



    USE dbLogMonitor;

    -- DROP TABLE [dbo].[BatchRequestsSec];

    -- CREATE TABLE [dbo].[BatchRequestsSec]
    -- (   [Date] SMALLDATETIME NOT NULL DEFAULT GETDATE(), 
    --     [BatchRequestsPerSec] decimal(5,2) NULL, 
    --     [1stStDev] decimal(5,2) NULL, 
    --     [2ndStDev] decimal(5,2) NULL, 
    --     [Mean] decimal(5,2) NULL
    --     , CONSTRAINT PK_BatchRequestsSec PRIMARY KEY CLUSTERED (Date) ) 
    -- ON [PRIMARY];


-- TRUNCATE TABLE BatchRequestsSec


DECLARE @DaysDiff SMALLINT

DECLARE @Agora      SMALLDATETIME = '2021-04-14 10:00:00'

SELECT TOP 1 @DaysDiff = DATEDIFF( DAY, Date, @Agora )  FROM [dbLogMonitor].[dbo].[BatchRequestsSec]

SELECT BatchRequestsPerSec, [1stStDev], [2ndStDev], Mean, [DATE] FROM [dbLogMonitor].[dbo].[BatchRequestsSec] WHERE Date = @Agora - @DaysDiff


-- SELECT COUNT(*) FROM [dbLogMonitor].[dbo].[BatchRequestsSec]


DECLARE @Agora      SMALLDATETIME = GETDATE() --'2021-04-14 11:40:00'

    DECLARE @DaysDiff SMALLINT, @MinutesDiff TINYINT, @stStDev DECIMAL, @ndStDev DECIMAL, @Mean DECIMAL

SELECT TOP 1 @DaysDiff = DATEDIFF( DAY, Date, @Agora ), @MinutesDiff=( DATEDIFF( MINUTE, Date, @Agora ) % 5 ) FROM [dbLogMonitor].[dbo].[BatchRequestsSec]

    SELECT @DaysDiff, @MinutesDiff, @Agora - @DaysDiff, DATEADD( MINUTE, ( @MinutesDiff * -1), @Agora )

    SELECT * FROM [dbLogMonitor].[dbo].[BatchRequestsSec] WHERE Date = DATEADD( MINUTE, ( @MinutesDiff * -1), @Agora ) - @DaysDiff


-- UPDATE [dbLogMonitor].[dbo].[BatchRequestsSec]
--     SET [1stStDev] = NULL, [2ndStDev] = NULL

-- UPDATE [dbLogMonitor].[dbo].[BatchRequestsSec]
--     SET date = date + 1
--     where DAY(date) = 11

-- DELETE [dbLogMonitor].[dbo].[BatchRequestsSec]   where DATE = '2021-04-13 22:25:00'



    DECLARE @DaysDiff SMALLINT, @stStDev DECIMAL, @ndStDev DECIMAL, @Mean DECIMAL

    SELECT TOP 1 @DaysDiff = DATEDIFF( DAY, Date, GETDATE() )  FROM [dbLogMonitor].[dbo].[BatchRequestsSec]

    SELECT [1stStDev], [2ndStDev], Mean FROM [dbLogMonitor].[dbo].[BatchRequestsSec] WHERE Date = GETDATE() - @DaysDiff
    IF @@ROWCOUNT = 0
        SELECT 1
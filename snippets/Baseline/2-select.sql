USE PerformanceBaselines;

DECLARE @first_cntr_value INT;
DECLARE @first_sample_time DATETIME;


    SELECT @first_cntr_value = cntr_value, @first_sample_time = getdate()
    FROM sys.dm_os_performance_counters
    WHERE LTRIM(RTRIM(OBJECT_NAME)) LIKE '%:SQL Statistics' AND counter_name='Batch Requests/sec';

    -- Wait time before collecting the second sample

    WAITFOR DELAY '00:05:00'

    -- Collecting the second sample, calculating per-second value, and inserting into a table

    INSERT INTO dbo.BatchRequestsSec
    (
        dbo.BatchRequestsSec.BatchRequestsPerSec,
        dbo.BatchRequestsSec.[Date]
    )
    SELECT (cntr_value - @first_cntr_value) / DATEDIFF(ss,@first_sample_time, GETDATE()) as BatchRequestsPerSec, GETDATE() AS [Date]
    FROM sys.dm_os_performance_counters 
    WHERE LTRIM(RTRIM(OBJECT_NAME)) LIKE '%:SQL Statistics' AND counter_name='Batch Requests/sec'
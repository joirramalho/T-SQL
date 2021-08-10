SET NOCOUNT ON;
DECLARE @Alert TABLE
(
BatchPersec decimal(5,2),
[2ndStDev] decimal(5,2),
[Date] datetime
);
DECLARE
@BatchRequestsPerSec decimal(5,2),
@2ndStDev AS decimal(5,2),
@date as datetime

DECLARE Treshold CURSOR FOR
SELECT brs.BatchRequestsPerSec, brs.[2ndStDev], brs.[Date]
FROM dbo.BatchRequestsSec brs
ORDER BY brs.[Date]

OPEN Treshold;

FETCH NEXT FROM Treshold INTO @BatchRequestsPerSec, @2ndStDev, @date;
WHILE @@FETCH_STATUS = 0
BEGIN
IF @BatchRequestsPerSec > @2ndStDev

INSERT INTO @Alert VALUES(@BatchRequestsPerSec, @2ndStDev, @date);
FETCH NEXT FROM Treshold INTO @BatchRequestsPerSec, @2ndStDev, @date;
END
CLOSE Treshold;
DEALLOCATE Treshold;


SELECT
[@Alert].BatchPersec,
[@Alert].[2ndStDev],
[@Alert].[Date]
FROM @Alert  
ORDER BY [@Alert].[Date]
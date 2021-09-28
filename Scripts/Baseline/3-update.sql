USE dbLogMonitor;

DECLARE @i int
SET @i = 23
WHILE @i>=0
BEGIN

--Calculate mean per hour and populate the Mean column

UPDATE dbLogMonitor.dbo.BatchRequestsSec
SET dbo.BatchRequestsSec.Mean = (SELECT AVG(BatchRequestsPerSec) AS Mean
FROM dbo.BatchRequestsSec brs
WHERE DATEPART(hh, brs.[Date])= @i)
WHERE DATEPART(hh, dbo.BatchRequestsSec.[Date])= @i;

--Calculate 1st standard deviation per hour and populate the 1stStDev column

UPDATE dbLogMonitor.dbo.BatchRequestsSec
SET dbo.BatchRequestsSec.[1stStDev] = (
    (SELECT AVG(BatchRequestsPerSec) + (SELECT STDEV(BatchRequestsPerSec))
FROM dbo.BatchRequestsSec brs
WHERE DATEPART(hh, brs.[Date])= @i)
)
WHERE DATEPART(hh, dbo.BatchRequestsSec.[Date])= @i;

--Calculate 2nd standard deviation per hour and populate the 2ndStDevr column

UPDATE dbLogMonitor.dbo.BatchRequestsSec
SET dbo.BatchRequestsSec.[2ndStDev] = ((SELECT AVG(BatchRequestsPerSec) + 2*(SELECT STDEV(BatchRequestsPerSec)) AS [2ndStDev]
FROM dbo.BatchRequestsSec brs
WHERE DATEPART(hh, brs.[Date])= @i))
WHERE DATEPART(hh, dbo.BatchRequestsSec.[Date])= @i;

SET @i = @i - 1
END
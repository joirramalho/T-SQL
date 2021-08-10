use dbLogMonitor;

DECLARE @i int, @m int
DECLARE @data DATETIME = '2021-04-11 00:00:00'

SET @i = 23
WHILE @i>=0
BEGIN
        SET @m = 12
        WHILE @m>=1
        BEGIN

            --select @i, @m, DATEADD( MINUTE, @m*5, @data ), ( SELECT CAST(RAND() * 200 AS INT ) )

            INSERT INTO dbLogMonitor.dbo.BatchRequestsSec ( [Date], BatchRequestsPerSec )
                SELECT DATEADD( MINUTE, @m*5, @data ), ( SELECT CAST(RAND() * 200 AS INT ) )

            SET @m = @m - 1

    
        END

        SET @data = ( SELECT DATEADD( HOUR, 1, @data ) )

    SET @i = @i - 1

END
-- https://www.mssqltips.com/sqlservertip/1476/how-to-read-log-file-in-sql-server-using-tsql/

-- If this extended stored procedure is called directly the parameters are as follows:

    -- Value of error log file you want to read: 0 = current, 1 = Archive #1, 2 = Archive #2, etc...

    -- Log file type: 1 or NULL = error log, 2 = SQL Agent log

    -- Search string 1: String one you want to search for

    -- Search string 2: String two you want to search for to further refine the results

    -- Search from start time

    -- Search to end time

    -- Sort order for results: N'asc' = ascending, N'desc' = descending


    EXEC master.dbo.xp_readerrorlog 0, 1, N'backup', N'failed', NULL, NULL, N'desc'



-- EXEC master.dbo.xp_readerrorlog 0, 1, N'password', N'failed', NULL, NULL, N'asc'
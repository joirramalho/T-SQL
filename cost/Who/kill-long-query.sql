DECLARE @user_spid  INT
DECLARE CurSPID CURSOR FAST_FORWARD
FOR
SELECT SPID
FROM master.dbo.sysprocesses (NOLOCK)
WHERE spid > 50 AND loginame NOT IN ('NT SERVICE\SQLSERVERAGENT') -- avoid system threads
    AND status = 'sleeping' -- only sleeping threads
    AND spid <> @@spid -- ignore current spid
    AND 
    ( 
        ( PROGRAM_NAME IN ('jTDS', 'SIGAWEB' ) AND DATEDIFF( MINUTE,last_batch,GETDATE() ) >= 45 )
        OR 
        ( PROGRAM_NAME LIKE ('ADO_SIGA%' ) AND DATEDIFF( MINUTE,last_batch,GETDATE() ) >= 90 )
        OR 
        ( DATEDIFF( MINUTE,last_batch,GETDATE() ) >= 120 )
    )
    
ORDER BY last_batch DESC

OPEN CurSPID
FETCH NEXT FROM CurSPID INTO @user_spid
WHILE (@@FETCH_STATUS=0)
BEGIN
    EXEC( 'KILL ' + @user_spid )
    FETCH NEXT FROM CurSPID INTO @user_spid
END
CLOSE CurSPID
DEALLOCATE CurSPID
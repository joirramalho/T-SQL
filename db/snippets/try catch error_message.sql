--13set21
--https://dba.stackexchange.com/questions/77298/how-to-make-sqlcmd-return-an-errorlevel-other-than-0-when-the-sql-script-fails/

:ON ERROR EXIT
BEGIN TRY
    /* creates error 3147 Backup and restore operations 
            are not allowed on database tempdb */
    BACKUP DATABASE tempdb; 
END TRY
BEGIN CATCH
    DECLARE @msg NVARCHAR(255);
    SET @msg = 'An error occurred: ' + ERROR_MESSAGE();
    RAISERROR (50002, 10, 127);
END CATCH
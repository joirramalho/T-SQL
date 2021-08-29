-- Reset SQL user account guids 

USE  dbSigaEducativo;

DECLARE @UserName nvarchar(255) 

DECLARE orphanuser_cur cursor for 
      SELECT UserName = su.name 
      FROM sysusers su JOIN sys.server_principals sp ON sp.name = su.name     COLLATE SQL_Latin1_General_CP1_CI_AI
      WHERE issqluser = 1 AND (su.sid IS NOT NULL AND su.sid <> 0x0) AND suser_sname(su.sid) is null 
      ORDER BY su.name 
OPEN orphanuser_cur 
FETCH NEXT FROM orphanuser_cur INTO @UserName 

WHILE (@@fetch_status = 0)
BEGIN 
        PRINT @UserName + ' user name being resynced' 
        EXEC sp_change_users_login 'Update_one', @UserName, @UserName 
FETCH NEXT FROM orphanuser_cur INTO @UserName 
END 

CLOSE orphanuser_cur 
DEALLOCATE orphanuser_cur
EXEC sp_configure 'show advanced options', 1
GO
RECONFIGURE
GO


EXEC sp_configure 'Agent XPs', 0
GO
RECONFIGURE
GO
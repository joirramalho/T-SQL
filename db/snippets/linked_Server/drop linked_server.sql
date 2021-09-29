USE [master]
GO


EXEC sp_helplinkedsrvlogin
   @rmtsrvname = N'CRM'


--    EXEC sp_linkedservers

--    EXEC sp_linkedservers


-- EXEC sp_helplinkedsrvlogin
--    @rmtsrvname = N'CRM'


EXEC master.dbo.sp_dropserver @server=N'CRM', @droplogins='droplogins'
GO

-- 28jun21 - Migraçao do Linked Server do VPS7 para SQL09 para acesso do Siga Desktop de GESTÃO a pedido de Jader.

/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2016 (13.0.4259)
    Source Database Engine Edition : Microsoft SQL Server Express Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2016
    Target Database Engine Edition : Microsoft SQL Server Express Edition
    Target Database Engine Type : Standalone SQL Server
*/

USE [master]
GO

/****** Object:  LinkedServer [CRM]    Script Date: 28/06/2021 10:48:34 ******/
EXEC master.dbo.sp_addlinkedserver @server = N'CRM', @srvproduct=N'CRM', @provider=N'SQLNCLI11', @datasrc=N'172.31.22.23,1435', @provstr=N'Password=*****Vide_kee*****;Persist Security Info=True;User ID=userActiveCrmLeitura;Data Source=172.31.31.200,1435;Tag with column collation when possible=False', @catalog=N'dbCrmActivesoft'
 /* For security reasons the linked server remote logins password is changed with ######## */
EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname=N'CRM',@useself=N'False',@locallogin=NULL,@rmtuser=N'userActiveCrmSigaGestao',@rmtpassword='*****Vide_kee*****'
GO

EXEC master.dbo.sp_serveroption @server=N'CRM', @optname=N'collation compatible', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'CRM', @optname=N'data access', @optvalue=N'true'
GO

EXEC master.dbo.sp_serveroption @server=N'CRM', @optname=N'dist', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'CRM', @optname=N'pub', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'CRM', @optname=N'rpc', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'CRM', @optname=N'rpc out', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'CRM', @optname=N'sub', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'CRM', @optname=N'connect timeout', @optvalue=N'15'
GO

EXEC master.dbo.sp_serveroption @server=N'CRM', @optname=N'collation name', @optvalue=null
GO

EXEC master.dbo.sp_serveroption @server=N'CRM', @optname=N'lazy schema validation', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'CRM', @optname=N'query timeout', @optvalue=N'20'
GO

EXEC master.dbo.sp_serveroption @server=N'CRM', @optname=N'use remote collation', @optvalue=N'true'
GO

EXEC master.dbo.sp_serveroption @server=N'CRM', @optname=N'remote proc transaction promotion', @optvalue=N'true'
GO



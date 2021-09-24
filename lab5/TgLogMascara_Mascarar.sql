SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

--
-- Activesoft Consultoria 
-- TRIGGER criada pelo Activesoft Service Pack em 21/01/2020 durante atualização para versão 1.065.xxx.
--

-- CREATE TRIGGER [dbo].[TgLogMascara_Mascarar] ON [dbo].[TbLogMascara]
ALTER TRIGGER [dbo].[TgLogMascara_Mascarar] ON [dbo].[TbLogMascara]
FOR INSERT
AS
BEGIN
    -- EXEC dbLogRestore.dbo.sp_JobDesmascararBanco
    PRINT 1
END



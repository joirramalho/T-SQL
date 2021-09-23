SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

--
-- Activesoft Consultoria 
-- TRIGGER criada pelo Activesoft Service Pack em 21/01/2020 durante atualização para versão 1.065.xxx.
--

ALTER TRIGGER [dbo].[TgFaseNota_Auditoria_DU] ON [dbo].[TbFaseNota_Auditoria]
--ALTER TRIGGER [dbo].[TgFaseNota_Auditoria_DU] ON [dbo].[TbFaseNota_Auditoria]
FOR UPDATE, DELETE
AS
BEGIN
	SET NOCOUNT ON

	ROLLBACK TRANSACTION 
	RAISERROR ('Dados não podem ser excluídos ou alterados (trigger de auditoria TgFaseNota_Auditoria_DU inválida)', 16, 1) 
	RETURN 
	
END


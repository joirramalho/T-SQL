USE [CRM_J162300]
GO
/****** Object:  Trigger [dbo].[TgDiarioAula_Auditoria_DU]    Script Date: 21/01/2020 16:35:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

--
-- Activesoft Consultoria 
-- TRIGGER criada pelo Activesoft Service Pack em 21/01/2020 durante atualização para versão 1.065.xxx.
--

ALTER TRIGGER [dbo].[TgFaseNotaAluno_Auditoria_DU] ON [dbo].[TbFaseNotaAluno_Auditoria]
--ALTER TRIGGER [dbo].[TgFaseNotaAluno_Auditoria_DU] ON [dbo].[TbFaseNotaAluno_Auditoria]
FOR UPDATE, DELETE
AS
BEGIN
	SET NOCOUNT ON

	ROLLBACK TRANSACTION 
	RAISERROR ('Dados não podem ser excluídos ou alterados (trigger de auditoria TgFaseNotaAluno_Auditoria_DU inválida)', 16, 1) 
	RETURN 
	
END


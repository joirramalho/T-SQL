--
-- Activesoft Consultoria 
-- TRIGGER criada pelo Activesoft Service Pack em 17/08/2011 durante atualização para versão 1.062.760.
--


CREATE TRIGGER [dbo].[TgFaseNotaDisciplina_Auditoria] ON [dbo].[TbFaseNotaDisciplina]
-- ALTER TRIGGER dbo.TgFaseNotaDisciplina_Auditoria ON dbo.TbFaseNotaDisciplina 
FOR INSERT, UPDATE, DELETE
AS
BEGIN
	SET NOCOUNT ON
	
	DECLARE @TipoOperacao CHAR(1) = 'I' -- Insert by default.
	IF EXISTS(SELECT * FROM DELETED)
	BEGIN
		SET @TipoOperacao = 
		    CASE
			WHEN EXISTS(SELECT * FROM INSERTED) THEN 'U' ELSE 'D' 
		    END
	END
	ELSE 
		IF NOT EXISTS(SELECT * FROM INSERTED) RETURN -- Nem updated nem inserted. Pode ter sido um "failed delete".

		
	IF	NOT EXISTS(	SELECT * FROM inserted
					EXCEPT
					SELECT * FROM deleted ) AND  @TipoOperacao <> 'D'
		RETURN
		

	IF ( SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS c WHERE DATA_TYPE NOT IN ( 'text', 'image' ) AND TABLE_NAME = 'TbFaseNotaDisciplina' AND LEFT(COLUMN_NAME,1) <> '_' ) <> 4 
	BEGIN
		RAISERROR ('Dados não podem ser alterados (trigger de auditoria TgFaseNotaDisciplina_Auditoria inválida)', 16, 1) 
		ROLLBACK TRANSACTION 
		RETURN 
	END 


	DECLARE @IdUsuario INTEGER
	IF OBJECT_ID( 'tempdb..#TempTable' ) IS NOT NULL
	BEGIN	
		SELECT @IdUsuario = IdUsuario FROM #TempTable

        IF @IdUsuario IS NULL
          BEGIN
            RAISERROR ('A auditoria não está funcionando corretamente. Entre em contato com o suporte técnico.', 16, 1 )
            ROLLBACK TRANSACTION
            RETURN
          END
	END
	ELSE
	BEGIN
		SET @IdUsuario = NULL
	END


	IF ( @TipoOperacao = 'D' )
		INSERT	TbFaseNotaDisciplina_Auditoria ( 	DataHora, Operacao, IdUsuario, IdFaseNotaDisciplina, IdFaseNota, IdDisciplina, IdFormulaComposicaoNota )
			SELECT									GETDATE(), @TipoOperacao, @IdUsuario, IdFaseNotaDisciplina, IdFaseNota, IdDisciplina, IdFormulaComposicaoNota
			FROM	deleted
	ELSE
		INSERT	TbFaseNotaDisciplina_Auditoria ( 	DataHora, Operacao, IdUsuario, IdFaseNotaDisciplina, IdFaseNota, IdDisciplina, IdFormulaComposicaoNota )
			SELECT									GETDATE(), @TipoOperacao, @IdUsuario, IdFaseNotaDisciplina, IdFaseNota, IdDisciplina, IdFormulaComposicaoNota
			FROM	inserted
		EXCEPT
			SELECT									GETDATE(), @TipoOperacao, @IdUsuario, IdFaseNotaDisciplina, IdFaseNota, IdDisciplina, IdFormulaComposicaoNota
			FROM	deleted
END


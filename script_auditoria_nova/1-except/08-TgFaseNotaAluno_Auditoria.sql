
--
-- Activesoft Consultoria 
-- TRIGGER criada pelo Activesoft Service Pack em 12/11/2021 durante atualização para versão 1.065.183.
--

CREATE TRIGGER [dbo].[TgFaseNotaAluno_Auditoria] ON [dbo].[TbFaseNotaAluno]
--ALTER TRIGGER [dbo].[TgFaseNotaAluno_Auditoria] ON [dbo].[TbFaseNotaAluno]
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
		

	IF ( SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS c WHERE DATA_TYPE NOT IN ( 'text', 'image' ) AND TABLE_NAME = 'TbFaseNotaAluno' AND LEFT(COLUMN_NAME,1) <> '_' ) <> 20 
	BEGIN
		ROLLBACK TRANSACTION 
		RAISERROR ('Dados não podem ser alterados (trigger de auditoria TgFaseNotaAluno_Auditoria inválida)', 16, 1) 
		RETURN 
	END
	
	
	DECLARE @IdUsuario INTEGER
	IF APP_NAME() = 'SIGAWEB'
		SELECT	@IdUsuario = IdUsuario
		FROM	dbo.FnCriarTabelaTemporaria(HOST_NAME())		
	ELSE IF OBJECT_ID( 'tempdb..#TempTable' ) IS NOT NULL
		SELECT @IdUsuario = IdUsuario FROM #TempTable

	DECLARE @IdProfessor INTEGER
	IF OBJECT_ID( 'tempdb..#TempTableWeb' ) IS NOT NULL	
		SELECT @IdProfessor = IdProfessor FROM #TempTableWeb
	ELSE
		SET @IdProfessor = NULL
	
	IF ( @IdUsuario IS NULL ) AND ( @IdProfessor IS NULL )
		SET 	@IdUsuario = -1	--Usuário ActiveMessenger

		
	IF ( @TipoOperacao = 'D' )
		INSERT	TbFaseNotaAluno_Auditoria ( DataHora, Operacao, 		IdUsuario, 	IdDisciplina, IdTurma, IdAluno, IdFaseNota, Nota01, Nota02, Nota03, Nota04, Nota05, Nota06, Nota07, Nota08, Nota09, Nota10, IdFormulaComposicao, StNotaConfirmada, NotaFase, Faltas, QuantAulasDadas, StNotaFaseExibirDisp, IdProfessor )
			SELECT							GETDATE(), @TipoOperacao, 	@IdUsuario, IdDisciplina, IdTurma, IdAluno, IdFaseNota, Nota01, Nota02, Nota03, Nota04, Nota05, Nota06, Nota07, Nota08, Nota09, Nota10, IdFormulaComposicao, StNotaConfirmada, NotaFase, Faltas, QuantAulasDadas, StNotaFaseExibirDisp, @IdProfessor
			FROM	deleted
	ELSE
		INSERT	TbFaseNotaAluno_Auditoria ( DataHora, Operacao, 		IdUsuario, 	IdDisciplina, IdTurma, IdAluno, IdFaseNota, Nota01, Nota02, Nota03, Nota04, Nota05, Nota06, Nota07, Nota08, Nota09, Nota10, IdFormulaComposicao, StNotaConfirmada, NotaFase, Faltas, QuantAulasDadas, StNotaFaseExibirDisp, IdProfessor )
			SELECT							GETDATE(), @TipoOperacao, 	@IdUsuario, IdDisciplina, IdTurma, IdAluno, IdFaseNota, Nota01, Nota02, Nota03, Nota04, Nota05, Nota06, Nota07, Nota08, Nota09, Nota10, IdFormulaComposicao, StNotaConfirmada, NotaFase, Faltas, QuantAulasDadas, StNotaFaseExibirDisp, @IdProfessor
			FROM	inserted
		EXCEPT
			SELECT							GETDATE(), @TipoOperacao, 	@IdUsuario, IdDisciplina, IdTurma, IdAluno, IdFaseNota, Nota01, Nota02, Nota03, Nota04, Nota05, Nota06, Nota07, Nota08, Nota09, Nota10, IdFormulaComposicao, StNotaConfirmada, NotaFase, Faltas, QuantAulasDadas, StNotaFaseExibirDisp, @IdProfessor
			FROM	deleted
END


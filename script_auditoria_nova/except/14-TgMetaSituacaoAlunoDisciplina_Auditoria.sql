CREATE TRIGGER TgMetaSituacaoAlunoDisciplina_Auditoria ON TbMetaSituacaoAlunoDisciplina
-- ALTER TRIGGER TgMetaSituacaoAlunoDisciplina_Auditoria ON TbMetaSituacaoAlunoDisciplina
FOR INSERT, UPDATE, DELETE AS
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
		

	DECLARE @IdUsuario INTEGER
	IF OBJECT_ID( 'tempdb..#TempTable' ) IS NOT NULL
		SELECT @IdUsuario = IdUsuario FROM #TempTable
	ELSE
		SET @IdUsuario = NULL


	IF ( @TipoOperacao = 'D' )
		INSERT	TbMetaSituacaoAlunoDisciplina_Auditoria ( 	DataHora, 	Operacao, 		IdUsuario, IdDisciplina, IdTurma, IdAluno, StDisciplinaDispensada )
			SELECT											GETDATE(), 	@TipoOperacao, @IdUsuario, IdDisciplina, IdTurma, IdAluno, StDisciplinaDispensada
			FROM	deleted
	ELSE
		INSERT	TbMetaSituacaoAlunoDisciplina_Auditoria ( 	DataHora, 	Operacao, 		IdUsuario, IdDisciplina, IdTurma, IdAluno, StDisciplinaDispensada )
			SELECT											GETDATE(), 	@TipoOperacao, @IdUsuario, IdDisciplina, IdTurma, IdAluno, StDisciplinaDispensada
			FROM	inserted
		EXCEPT
			SELECT											GETDATE(), 	@TipoOperacao, @IdUsuario, IdDisciplina, IdTurma, IdAluno, StDisciplinaDispensada
			FROM	deleted
END

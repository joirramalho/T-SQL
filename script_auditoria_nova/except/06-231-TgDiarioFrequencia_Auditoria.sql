
--
-- Activesoft Consultoria 
-- TRIGGER criada pelo Activesoft Service Pack em 20/05/2020 durante atualização para versão 1.065.035.
--

CREATE TRIGGER [dbo].[TgDiarioFrequencia_Auditoria] ON [dbo].[TbDiarioFrequencia]
--ALTER TRIGGER [dbo].[TgDiarioFrequencia_Auditoria] ON [dbo].[TbDiarioFrequencia]
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
		
	
	IF ( SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS c WHERE DATA_TYPE NOT IN ( 'text', 'image' ) AND TABLE_NAME = 'TbDiarioFrequencia' AND LEFT(COLUMN_NAME,1) <> '_' ) <> 4
	BEGIN
		ROLLBACK TRANSACTION 
		RAISERROR ('Dados não podem ser alterados (trigger de auditoria TgDiarioFrequencia_Auditoria inválida)', 16, 1) 
		RETURN 
	END 

	DECLARE @TipoUsuario VARCHAR

	DECLARE @IdUsuario INTEGER
	IF APP_NAME() = 'SIGAWEB'
		SELECT	@IdUsuario = IdUsuario, @TipoUsuario = TipoUsuario
		FROM	dbo.FnCriarTabelaTemporaria(HOST_NAME())		
	ELSE IF OBJECT_ID( 'tempdb..#TempTable' ) IS NOT NULL
		SELECT @IdUsuario = IdUsuario FROM #TempTable

	DECLARE @IdProfessor INTEGER
	IF OBJECT_ID( 'tempdb..#TempTableWeb' ) IS NOT NULL	
		SELECT @IdProfessor = IdProfessor FROM #TempTableWeb
	ELSE
		SET @IdProfessor = NULL


	IF @TipoUsuario = 'P'
	BEGIN
		SET @IdProfessor = @IdUsuario
		SET @IdUsuario = NULL
	END

	IF ( @IdUsuario IS NULL ) AND ( @IdProfessor IS NULL )
	BEGIN
		ROLLBACK TRANSACTION 
		RAISERROR ('A auditoria não está funcionando corretamente. Reinicie o sistema. (TgDiarioFrequencia_Auditoria)', 16, 1)
		RETURN 
	END


	IF ( @TipoOperacao = 'D' )
		INSERT	TbDiarioFrequencia_Auditoria (	DataHora,	Operacao,		IdUsuario,	IdProfessor,	IdDiarioFrequencia, IdDiarioAula, IdAluno, StPresencaFalta )
			SELECT 								GETDATE(),	@TipoOperacao,	@IdUsuario, @IdProfessor,	IdDiarioFrequencia, IdDiarioAula, IdAluno, StPresencaFalta
			FROM	deleted
	ELSE
		INSERT	TbDiarioFrequencia_Auditoria (	DataHora,	Operacao,		IdUsuario,	IdProfessor,	IdDiarioFrequencia, IdDiarioAula, IdAluno, StPresencaFalta )
			SELECT 								GETDATE(),	@TipoOperacao,	@IdUsuario, @IdProfessor,	IdDiarioFrequencia, IdDiarioAula, IdAluno, StPresencaFalta
			FROM	inserted
		EXCEPT
			SELECT 								GETDATE(),	@TipoOperacao,	@IdUsuario, @IdProfessor,	IdDiarioFrequencia, IdDiarioAula, IdAluno, StPresencaFalta
			FROM	deleted
END


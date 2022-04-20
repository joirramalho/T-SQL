
--
-- Activesoft Consultoria 
-- TRIGGER criada pelo Activesoft Service Pack em 06/10/2021 durante atualização para versão 1.065.173.
--


CREATE TRIGGER [dbo].[TgDiario_Auditoria] ON [dbo].[TbDiario]
--ALTER TRIGGER [dbo].[TgDiario_Auditoria] ON [dbo].[TbDiario]
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
		

	IF ( SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS c WHERE DATA_TYPE NOT IN ( 'text', 'image' ) AND TABLE_NAME = 'TbDiario' AND LEFT(COLUMN_NAME,1) <> '_' ) <> 11
	BEGIN
		ROLLBACK TRANSACTION 
		RAISERROR ('Dados não podem ser alterados (trigger de auditoria TgDiario_Auditoria inválida)', 16, 1) 
		RETURN 
	END 

	  
	DECLARE @IdUsuario INTEGER
	IF APP_NAME() = 'SIGAWEB'
		SELECT	@IdUsuario = IdUsuario
		FROM	dbo.FnCriarTabelaTemporaria(HOST_NAME())		
	ELSE IF OBJECT_ID( 'tempdb..#TempTable') IS NULL 
	  BEGIN 
		--RAISERROR ('Dados não podem ser alterados (autenticação)', 16, 1) 
		--ROLLBACK TRANSACTION 
		--RETURN 
		SET @IdUsuario = NULL
	  END
	ELSE
	  SELECT @IdUsuario = IdUsuario FROM #TempTable

	
	IF ( @TipoOperacao = 'D' )
		INSERT	TbDiario_Auditoria (	DataHora,	Operacao,		IdUsuario,	IdDiario,	IdTurma,	IdDisciplina,	Descricao,	IdFaseNota,	TipoConfirmacao,	QtdeMaximaAulas, DataLimiteDigitacao, QtdeMinimaAulas, StRegistroAulaPeriodoFaseNota, DataBloqueioDigitacaoAula )
			SELECT						GETDATE(),	@TipoOperacao,	@IdUsuario,	IdDiario,	IdTurma,	IdDisciplina,	Descricao,	IdFaseNota,	TipoConfirmacao,	QtdeMaximaAulas, DataLimiteDigitacao, QtdeMinimaAulas, StRegistroAulaPeriodoFaseNota, DataBloqueioDigitacaoAula	
			FROM	deleted
	ELSE
		INSERT	TbDiario_Auditoria (	DataHora,	Operacao,		IdUsuario,	IdDiario,	IdTurma,	IdDisciplina,	Descricao,	IdFaseNota,	TipoConfirmacao,	QtdeMaximaAulas, DataLimiteDigitacao, QtdeMinimaAulas, StRegistroAulaPeriodoFaseNota, DataBloqueioDigitacaoAula )
			SELECT						GETDATE(),	@TipoOperacao,	@IdUsuario,	IdDiario,	IdTurma,	IdDisciplina,	Descricao,	IdFaseNota,	TipoConfirmacao,	QtdeMaximaAulas, DataLimiteDigitacao, QtdeMinimaAulas, StRegistroAulaPeriodoFaseNota, DataBloqueioDigitacaoAula	
			FROM	inserted
		EXCEPT
			SELECT						GETDATE(),	@TipoOperacao,	@IdUsuario,	IdDiario,	IdTurma,	IdDisciplina,	Descricao,	IdFaseNota,	TipoConfirmacao,	QtdeMaximaAulas, DataLimiteDigitacao, QtdeMinimaAulas, StRegistroAulaPeriodoFaseNota, DataBloqueioDigitacaoAula	
			FROM	deleted
END


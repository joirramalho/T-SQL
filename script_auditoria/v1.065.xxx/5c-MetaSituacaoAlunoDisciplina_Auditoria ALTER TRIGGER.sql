SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

--
-- Activesoft Consultoria 
-- TRIGGER criada pelo Activesoft Service Pack em 21/01/2020 durante atualização para versão 1.065.xxx.
--

ALTER TRIGGER [dbo].[TgDiarioAluno_Auditoria] ON [dbo].[TbDiarioAluno]
--ALTER TRIGGER [dbo].[TgDiarioAluno_Auditoria] ON [dbo].[TbDiarioAluno]
FOR INSERT, UPDATE, DELETE
AS
BEGIN
	SET NOCOUNT ON

	IF ( SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS c WHERE DATA_TYPE NOT IN ( 'text', 'image' ) AND TABLE_NAME = 'TbDiarioAluno' AND LEFT(COLUMN_NAME,1) <> '_' ) <> 5
	BEGIN
		ROLLBACK TRANSACTION 
		RAISERROR ('Dados não podem ser alterados (trigger de auditoria TgDiarioAluno_Auditoria inválida)', 16, 1) 
		RETURN 
	END 

	
	DECLARE @IdUsuario INTEGER
	IF APP_NAME() = 'SIGAWEB'
		SELECT	@IdUsuario = IdUsuario
		FROM	dbo.FnCriarTabelaTemporaria(HOST_NAME())		
	ELSE IF OBJECT_ID( 'tempdb..#TempTable' ) IS NOT NULL
		SELECT @IdUsuario = IdUsuario FROM #TempTable

	IF ( @IdUsuario IS NULL ) 
	BEGIN
		ROLLBACK TRANSACTION 
		RAISERROR ('A auditoria não está funcionando corretamente. Reinicie o sistema. (TgDiarioAluno_Auditoria)', 16, 1)
		RETURN 
	END

	
	DECLARE @TipoOperacao CHAR(1) = 'I' -- Insert by default.
	IF EXISTS(SELECT * FROM DELETED)
	BEGIN
	SET @TipoOperacao = 
	    CASE
		WHEN EXISTS(SELECT * FROM INSERTED) THEN 'U' ELSE 'D' 
	    END
	END
	ELSE 
	IF NOT EXISTS(SELECT * FROM INSERTED) RETURN; -- Nem updated nem inserted. Pode ter sido um "failed delete".


	IF ( @TipoOperacao = 'D' )
		INSERT	TbDiarioAluno_Auditoria (	DataHora,	Operacao,		IdUsuario,	IdDiarioAluno,	IdDiario,	IdAluno,	DataInicial,	DataFinal )
		SELECT								GETDATE(),	@TipoOperacao,	@IdUsuario, IdDiarioAluno,	IdDiario,	IdAluno,	DataInicial,	DataFinal
		FROM	deleted
	ELSE
		INSERT	TbDiarioAluno_Auditoria (	DataHora,	Operacao,		IdUsuario,	IdDiarioAluno,	IdDiario,	IdAluno,	DataInicial,	DataFinal )
		SELECT								GETDATE(),	@TipoOperacao,	@IdUsuario, IdDiarioAluno,	IdDiario,	IdAluno,	DataInicial,	DataFinal
		FROM	inserted
END


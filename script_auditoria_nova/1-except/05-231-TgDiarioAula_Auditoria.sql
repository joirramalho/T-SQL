
--
-- Activesoft Consultoria 
-- TRIGGER criada pelo Activesoft Service Pack em 30/09/2021 durante atualização para versão 1.065.170.
--

CREATE TRIGGER [dbo].[TgDiarioAula_Auditoria] ON [dbo].[TbDiarioAula]
-- ALTER TRIGGER [dbo].[TgDiarioAula_Auditoria] ON [dbo].[TbDiarioAula]
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
		
		
	IF ( SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS c WHERE DATA_TYPE NOT IN ( 'text', 'image' ) AND TABLE_NAME = 'TbDiarioAula' AND LEFT(COLUMN_NAME,1) <> '_' ) <> 10
	BEGIN
		ROLLBACK TRANSACTION 
		RAISERROR ('Dados não podem ser alterados (trigger de auditoria TgDiarioAula_Auditoria inválida)', 16, 1) 
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
	BEGIN
		ROLLBACK TRANSACTION 
		RAISERROR ('A auditoria não está funcionando corretamente. Reinicie o sistema. (TgDiarioAula_Auditoria)', 16, 1)
		RETURN 
	END

	
	IF ( @TipoOperacao = 'D' )
		INSERT	TbDiarioAula_Auditoria (	DataHora,	Operacao,		IdUsuario,	IdDiarioAula,	IdDiario,	NumeroAula,	DataAula,	ConteudoMinistrado,	Tarefa,	IdProfessor, StChamadaOnlineAtivada, DataHoraLimiteChamadaOnline, NumeroAulaMigracao )
			SELECT 							GETDATE(),	@TipoOperacao,	@IdUsuario, IdDiarioAula,	IdDiario,	NumeroAula,	DataAula,	ConteudoMinistrado,	Tarefa,	IdProfessor, StChamadaOnlineAtivada, DataHoraLimiteChamadaOnline, NumeroAulaMigracao
			FROM	deleted
	ELSE
		INSERT	TbDiarioAula_Auditoria (	DataHora,	Operacao,		IdUsuario,	IdDiarioAula,	IdDiario,	NumeroAula,	DataAula,	ConteudoMinistrado,	Tarefa,	IdProfessor, StChamadaOnlineAtivada, DataHoraLimiteChamadaOnline, NumeroAulaMigracao )
			SELECT							GETDATE(),	@TipoOperacao,	@IdUsuario, IdDiarioAula,	IdDiario,	NumeroAula,	DataAula,	ConteudoMinistrado,	Tarefa,	IdProfessor, StChamadaOnlineAtivada, DataHoraLimiteChamadaOnline, NumeroAulaMigracao
			FROM	inserted
		EXCEPT
			SELECT							GETDATE(),	@TipoOperacao,	@IdUsuario, IdDiarioAula,	IdDiario,	NumeroAula,	DataAula,	ConteudoMinistrado,	Tarefa,	IdProfessor, StChamadaOnlineAtivada, DataHoraLimiteChamadaOnline, NumeroAulaMigracao
			FROM	deleted
END


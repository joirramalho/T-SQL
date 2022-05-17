
--
-- Activesoft Consultoria 
-- TRIGGER criada pelo Activesoft Service Pack em 25/10/2021 durante atualização para versão 1.065.177.
--


CREATE TRIGGER [dbo].[TgHistorico_Auditoria] ON [dbo].[TbHistorico]
-- ALTER TRIGGER [dbo].[TgHistorico_Auditoria] ON [dbo].[TbHistorico]
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
		

	IF ( SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS c WHERE DATA_TYPE NOT IN ( 'text', 'image' ) AND TABLE_NAME = 'TbHistorico' AND LEFT(COLUMN_NAME,1) <> '_' ) <> 12
	BEGIN
		ROLLBACK TRANSACTION 
		RAISERROR ('Dados não podem ser alterados (trigger de auditoria TgHistorico_Auditoria inválida)', 16, 1) 
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
		INSERT	TbHistorico_Auditoria (	DataHora,	Operacao,		IdUsuario,	[IdAluno], [CodigoSerie], [AnoConclusao], [ResultadoFinal], [IdEstabelecimentoEnsino], [DiasLetivos], [CargaHorariaTotal], [Observacao], [IdSerie], [CargaHorariaTotalExibicao], [StCHIgnorarSoma], [FrequenciaTotal] )
			SELECT						GETDATE(),	@TipoOperacao,	@IdUsuario, [IdAluno], [CodigoSerie], [AnoConclusao], [ResultadoFinal], [IdEstabelecimentoEnsino], [DiasLetivos], [CargaHorariaTotal], [Observacao], [IdSerie], [CargaHorariaTotalExibicao], [StCHIgnorarSoma], [FrequenciaTotal]
			FROM	deleted
	ELSE
		INSERT	TbHistorico_Auditoria (	DataHora,	Operacao,		IdUsuario,	[IdAluno], [CodigoSerie], [AnoConclusao], [ResultadoFinal], [IdEstabelecimentoEnsino], [DiasLetivos], [CargaHorariaTotal], [Observacao], [IdSerie], [CargaHorariaTotalExibicao], [StCHIgnorarSoma], [FrequenciaTotal] )
			SELECT						GETDATE(),	@TipoOperacao,	@IdUsuario, [IdAluno], [CodigoSerie], [AnoConclusao], [ResultadoFinal], [IdEstabelecimentoEnsino], [DiasLetivos], [CargaHorariaTotal], [Observacao], [IdSerie], [CargaHorariaTotalExibicao], [StCHIgnorarSoma], [FrequenciaTotal]
			FROM	inserted
		EXCEPT
			SELECT						GETDATE(),	@TipoOperacao,	@IdUsuario, [IdAluno], [CodigoSerie], [AnoConclusao], [ResultadoFinal], [IdEstabelecimentoEnsino], [DiasLetivos], [CargaHorariaTotal], [Observacao], [IdSerie], [CargaHorariaTotalExibicao], [StCHIgnorarSoma], [FrequenciaTotal]
			FROM	deleted
END


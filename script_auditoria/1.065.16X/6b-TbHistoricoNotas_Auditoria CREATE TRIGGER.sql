SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

--
-- Activesoft Consultoria 
-- TRIGGER criada pelo Activesoft Service Pack em 21/01/2020 durante atualização para versão 1.065.xxx.
--

ALTER TRIGGER [dbo].[TgHistoricoNotas_Auditoria] ON [dbo].[TbHistoricoNotas]
--ALTER TRIGGER [dbo].[TgHistoricoNotas_Auditoria] ON [dbo].[TbHistoricoNotas]
FOR INSERT, UPDATE, DELETE
AS
BEGIN
	SET NOCOUNT ON

	IF ( SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS c WHERE DATA_TYPE NOT IN ( 'text', 'image' ) AND TABLE_NAME = 'TbHistoricoNotas' AND LEFT(COLUMN_NAME,1) <> '_' ) <> 12
	BEGIN
		ROLLBACK TRANSACTION 
		RAISERROR ('Dados não podem ser alterados (trigger de auditoria TgHistoricoNotas_Auditoria inválida)', 16, 1) 
		RETURN 
	END 


--	IF ISNULL( (	SELECT	SUM( CASE WHEN c.COLUMN_NAME IN ( '','IdDiarioAluno' ) THEN 1 ELSE 100 END )
--			FROM	INFORMATION_SCHEMA.TABLE_CONSTRAINTS pk, 
--				INFORMATION_SCHEMA.KEY_COLUMN_USAGE c 
--			WHERE	CONSTRAINT_TYPE = 'PRIMARY KEY'
--				AND c.TABLE_NAME = pk.TABLE_NAME
--				AND c.CONSTRAINT_NAME = pk.CONSTRAINT_NAME
--				AND pk.TABLE_NAME = 'TbDiarioAluno' ), 0 ) <> 1
--	  BEGIN
--		RAISERROR ('Dados não podem ser alterados (trigger de auditoria TgAudit_TbDiarioAluno inválida -- definição da chave primária)', 16, 1) 
--		ROLLBACK TRANSACTION 
--		RETURN 
--	  END
	  
	  
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
		INSERT	TbHistoricoNotas_Auditoria (DataHora,	Operacao,		IdUsuario,	[IdAluno], [CodigoSerie], [AnoConclusao], [IdDisciplina], [StDependencia], [Nota_], [NotaFinal], [CargaHorariaAnual], [QuantidadeFaltasAnual], [ResultadoFinal], [IdSerie], [CargaHorariaAnualExibicao], [StCHIgnorarSoma], [IdHistoricoNotas] )
		SELECT								GETDATE(),	@TipoOperacao,	@IdUsuario, [IdAluno], [CodigoSerie], [AnoConclusao], [IdDisciplina], [StDependencia], [Nota_], [NotaFinal], [CargaHorariaAnual], [QuantidadeFaltasAnual], [ResultadoFinal], [IdSerie], [CargaHorariaAnualExibicao], [StCHIgnorarSoma], [IdHistoricoNotas]
		FROM	deleted
	ELSE
		INSERT	TbHistoricoNotas_Auditoria (DataHora,	Operacao,		IdUsuario,	[IdAluno], [CodigoSerie], [AnoConclusao], [IdDisciplina], [StDependencia], [Nota_], [NotaFinal], [CargaHorariaAnual], [QuantidadeFaltasAnual], [ResultadoFinal], [IdSerie], [CargaHorariaAnualExibicao], [StCHIgnorarSoma], [IdHistoricoNotas] )
		SELECT								GETDATE(),	@TipoOperacao,	@IdUsuario, [IdAluno], [CodigoSerie], [AnoConclusao], [IdDisciplina], [StDependencia], [Nota_], [NotaFinal], [CargaHorariaAnual], [QuantidadeFaltasAnual], [ResultadoFinal], [IdSerie], [CargaHorariaAnualExibicao], [StCHIgnorarSoma], [IdHistoricoNotas]
		FROM	inserted
END

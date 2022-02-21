--21fev22
--NOVA auditoria


--1 CREATE TABLE  -------------------------------------------

	SET ANSI_NULLS ON
	GO 
	
	SET QUOTED_IDENTIFIER ON
	GO 

	CREATE TABLE dbo.TbLancamentoCobrancaDesconto_Auditoria (
		[IdLancamentoCobrancaDescontoAuditoria] [bigint] IDENTITY(1,1) NOT NULL,
		[Audit_DataHora] [datetime] NOT NULL,
		[Audit_Operacao] [char](1) NOT NULL,
		[Audit_IdUsuario] [int] NULL,

		IdLancamentoCobrancaDesconto int NULL,
		IdLancamentoCobranca int NULL,
		IdAbatimento int NULL,
		DataLimiteConcessaoDesconto smalldatetime NULL,
		ValorDesconto numeric(12,2) NULL,
		StConsideradoNaLiquidacao bit NULL,
		CONSTRAINT PK_TbLancamentoCobrancaDesconto_Auditoria PRIMARY KEY CLUSTERED  
	(
		[IdLancamentoCobrancaDescontoAuditoria] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
	GO

	
	

	
	
-- 2 POPULAR TABELA ESPELHO com dados da tabela base (Operação "+" APENAS SE *** NÃO *** EXISTIA TABELA ESPELHADA -------------------------------------------

	INSERT	TbLancamentoCobrancaDesconto_Auditoria (	Audit_DataHora,	Audit_Operacao,	Audit_IdUsuario,	[IdLancamentoCobrancaDesconto], [IdLancamentoCobranca], [IdAbatimento], [DataLimiteConcessaoDesconto], [ValorDesconto], [StConsideradoNaLiquidacao] )
		SELECT											GETDATE(),		'+',			11, 			 	[IdLancamentoCobrancaDesconto], [IdLancamentoCobranca], [IdAbatimento], [DataLimiteConcessaoDesconto], [ValorDesconto], [StConsideradoNaLiquidacao] FROM TbLancamentoCobrancaDesconto
	GO 

	
	

--3 CREATE TRIGGER ON PK Tabela base -------------------------------------------
	SET ANSI_NULLS ON
	GO 
	
	SET QUOTED_IDENTIFIER ON
	GO 

	--
	-- Activesoft Consultoria 
	-- TRIGGER criada pelo Activesoft Service Pack em 21/01/2020 durante atualização para versão 1.065.xxx.
	--
	
	
	CREATE TRIGGER [dbo].[TgLancamentoCobrancaDesconto_Auditoria] ON [dbo].[TbLancamentoCobrancaDesconto]
	--ALTER TRIGGER [dbo].[TgLancamentoCobrancaDesconto_Auditoria] ON [dbo].[TbLancamentoCobrancaDesconto]
	FOR INSERT, UPDATE, DELETE
	AS
	BEGIN
		SET NOCOUNT ON
	
		IF ( SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS c WHERE DATA_TYPE NOT IN ( 'text', 'image' ) AND TABLE_NAME = 'TbLancamentoCobrancaDesconto' AND LEFT(COLUMN_NAME,1) <> '_' ) <> 6
		  BEGIN
			RAISERROR ('Dados não podem ser alterados (trigger de auditoria TgLancamentoCobrancaDesconto_Auditoria inválida -- quantidade de campos)', 16, 1) 
			ROLLBACK TRANSACTION 
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
	
	
		IF ( @TipoOperacao = 'D' )
			INSERT	TbLancamentoCobrancaDesconto_Auditoria (	Audit_DataHora,	Audit_Operacao,	Audit_IdUsuario,	[IdLancamentoCobrancaDesconto], [IdLancamentoCobranca], [IdAbatimento], [DataLimiteConcessaoDesconto], [ValorDesconto], [StConsideradoNaLiquidacao] )
			SELECT												GETDATE(),		@TipoOperacao,	@IdUsuario, 		[IdLancamentoCobrancaDesconto], [IdLancamentoCobranca], [IdAbatimento], [DataLimiteConcessaoDesconto], [ValorDesconto], [StConsideradoNaLiquidacao]
			FROM	deleted
		ELSE
			INSERT	TbLancamentoCobrancaDesconto_Auditoria (	Audit_DataHora,	Audit_Operacao,	Audit_IdUsuario,	[IdLancamentoCobrancaDesconto], [IdLancamentoCobranca], [IdAbatimento], [DataLimiteConcessaoDesconto], [ValorDesconto], [StConsideradoNaLiquidacao] )
			SELECT												GETDATE(),		@TipoOperacao,	@IdUsuario, 		[IdLancamentoCobrancaDesconto], [IdLancamentoCobranca], [IdAbatimento], [DataLimiteConcessaoDesconto], [ValorDesconto], [StConsideradoNaLiquidacao]
			FROM	inserted
	END
	GO

	
	
	
--4 DROP TRIGGERs ANTIGA ON PK Tabela base -------------------------------------------
	DROP TRIGGER [dbo].[TgAudit_TbLancamentoCobrancaDescontoD]
	GO
	
	DROP TRIGGER [dbo].[TgAudit_TbLancamentoCobrancaDescontoI]
	GO
	
	DROP TRIGGER [dbo].[TgAudit_TbLancamentoCobrancaDescontoU]
	GO
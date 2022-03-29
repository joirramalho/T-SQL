--28mar22
--NOVA auditoria


--1 CREATE TABLE  -------------------------------------------

	SET ANSI_NULLS ON
	GO 
	
	SET QUOTED_IDENTIFIER ON
	GO 
	
--	DROP TABLE TbModeloContrato_Auditoria

CREATE TABLE dbo.TbModeloContrato_Auditoria (
	[IdModeloContratoAuditoria] [bigint] IDENTITY(1,1) NOT NULL,
	[Audit_DataHora] [datetime] NOT NULL,
	[Audit_Operacao] [char](1) NOT NULL,
	[Audit_IdUsuario] [int] NULL,

	IdModeloContrato int NULL,
	Titulo varchar(300) COLLATE SQL_Latin1_General_CP1_CI_AI NULL,
	ConteudoHTML varchar(MAX) COLLATE SQL_Latin1_General_CP1_CI_AI NULL,
	IdColaboradorContratado int NULL,
	IdColaboradorTestemunha1 int NULL,
	IdColaboradorTestemunha2 int NULL,
	IdPeriodo int NULL,
	CONSTRAINT PK_TbModeloContrato_Auditoria PRIMARY KEY CLUSTERED  
	(
		[IdModeloContratoAuditoria] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]




-- 2 POPULAR TABELA ESPELHO com dados da tabela base (Operação "+" APENAS SE *** NÃO *** EXISTIA TABELA ESPELHADA -------------------------------------------

	INSERT	TbModeloContrato_Auditoria (	Audit_DataHora,	Audit_Operacao,	Audit_IdUsuario, [IdModeloContrato], [Titulo], [ConteudoHTML], [IdColaboradorContratado], [IdColaboradorTestemunha1], [IdColaboradorTestemunha2], [IdPeriodo] )
		SELECT								GETDATE(),		'+',			11, 			 [IdModeloContrato], [Titulo], [ConteudoHTML], [IdColaboradorContratado], [IdColaboradorTestemunha1], [IdColaboradorTestemunha2], [IdPeriodo]	FROM TbModeloContrato
	

		
		
--3 CREATE TRIGGER ON PK Tabela base -------------------------------------------
	SET ANSI_NULLS ON
	GO 
	
	SET QUOTED_IDENTIFIER ON
	GO 

	--
	-- Activesoft Consultoria 
	-- TRIGGER criada pelo Activesoft Service Pack em 21/01/2020 durante atualização para versão 1.065.xxx.
	--
	
	
	CREATE TRIGGER [dbo].[TgModeloContrato_Auditoria] ON [dbo].[TbModeloContrato]
	--ALTER TRIGGER [dbo].[TgModeloContrato_Auditoria] ON [dbo].[TbModeloContrato]
	FOR INSERT, UPDATE, DELETE
	AS
	BEGIN
		SET NOCOUNT ON
	
		IF ( SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS c WHERE DATA_TYPE NOT IN ( 'text', 'image' ) AND TABLE_NAME = 'TbModeloContrato' AND LEFT(COLUMN_NAME,1) <> '_' ) <> 7 
		  BEGIN
			RAISERROR ('Dados não podem ser alterados (trigger de auditoria TgModeloContrato_Auditoria inválida -- quantidade de campos)', 16, 1) 
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
			INSERT	TbModeloContrato_Auditoria (	Audit_DataHora,	Audit_Operacao,	Audit_IdUsuario,	[IdModeloContrato], [Titulo], [ConteudoHTML], [IdColaboradorContratado], [IdColaboradorTestemunha1], [IdColaboradorTestemunha2], [IdPeriodo] )
			SELECT									GETDATE(),		@TipoOperacao,	@IdUsuario,			[IdModeloContrato], [Titulo], [ConteudoHTML], [IdColaboradorContratado], [IdColaboradorTestemunha1], [IdColaboradorTestemunha2], [IdPeriodo] 		
			FROM	deleted
		ELSE
			INSERT	TbModeloContrato_Auditoria (	Audit_DataHora,	Audit_Operacao,	Audit_IdUsuario,	[IdModeloContrato], [Titulo], [ConteudoHTML], [IdColaboradorContratado], [IdColaboradorTestemunha1], [IdColaboradorTestemunha2], [IdPeriodo] )
			SELECT									GETDATE(),		@TipoOperacao,	@IdUsuario,			[IdModeloContrato], [Titulo], [ConteudoHTML], [IdColaboradorContratado], [IdColaboradorTestemunha1], [IdColaboradorTestemunha2], [IdPeriodo] 		
			FROM	inserted
	END
	GO


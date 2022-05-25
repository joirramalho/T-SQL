--19mai22
--NOVA auditoria


--1 CREATE TABLE  -------------------------------------------

	SET ANSI_NULLS ON
	GO 
	
	SET QUOTED_IDENTIFIER ON
	GO 
	
	CREATE TABLE dbo.TbContaPagarRateio_Auditoria (
	[IdContaPagarRateioAuditoria] [bigint] IDENTITY(1,1) NOT NULL,
	[Audit_DataHora] [datetime] NOT NULL,
	[Audit_Operacao] [char](1) NOT NULL,
	[Audit_IdUsuario] [int] NULL,

	[IdContaPagarRateio] [int] NULL,
	[IdContaPagar] [int] NULL,
	[IdEmpresa] [int] NULL,
	[IdPlanoContas] [int] NULL,
	[AnoMesCompetencia] [char](6) NULL,
	[Valor] [numeric](12, 2) NULL,
	[IdCentroResultado] [int] NULL,
	CONSTRAINT PK_TbContaPagarRateio_Auditoria PRIMARY KEY CLUSTERED  
	(
		[IdContaPagarRateioAuditoria] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
	GO
	
	

-- 2 POPULAR TABELA ESPELHO com dados da tabela base (Operação "+" APENAS SE *** NÃO *** EXISTIA TABELA ESPELHADA -------------------------------------------

	INSERT	TbContaPagarRateio_Auditoria (	Audit_DataHora,			Audit_Operacao,	Audit_IdUsuario,	  IdContaPagarRateio,  IdContaPagar,  IdEmpresa,  IdPlanoContas,  AnoMesCompetencia,  Valor,  IdCentroResultado  )
		SELECT								'1900-01-01 00:00:00',	'+',			11, 			 	  IdContaPagarRateio,  IdContaPagar,  IdEmpresa,  IdPlanoContas,  AnoMesCompetencia,  Valor,  IdCentroResultado  FROM TbContaPagarRateio
	GO 

	

--3 CREATE TRIGGER ON PK Tabela base -------------------------------------------

	--
-- Activesoft Consultoria 
-- TRIGGER criada pelo Activesoft Service Pack em 06/10/2021 durante atualização para versão 1.065.173.
--


CREATE TRIGGER [dbo].[TgContaPagarRateio_Auditoria] ON [dbo].[TbContaPagarRateio]
--ALTER TRIGGER [dbo].[TgContaPagarRateio_Auditoria] ON [dbo].[TbContaPagarRateio]
FOR INSERT, UPDATE, DELETE
AS
BEGIN
	IF @@ROWCOUNT = 0
		RETURN

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
		
	
	IF ( SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS c WHERE DATA_TYPE NOT IN ( 'text', 'image' ) AND TABLE_NAME = 'TbContaPagarRateio' AND LEFT(COLUMN_NAME,1) <> '_' ) <> 7 
	  BEGIN
		RAISERROR ('Dados não podem ser alterados (trigger de auditoria TgContaPagarRateio_Auditoria inválida)', 16, 1) 
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

	
	IF ( @TipoOperacao = 'D' )
		INSERT	TbContaPagarRateio_Auditoria (	Audit_DataHora,	Audit_Operacao,		Audit_IdUsuario,	IdContaPagarRateio,  IdContaPagar,  IdEmpresa,  IdPlanoContas,  AnoMesCompetencia,  Valor,  IdCentroResultado )
			SELECT								GETDATE(),		@TipoOperacao,		@IdUsuario,			IdContaPagarRateio,  IdContaPagar,  IdEmpresa,  IdPlanoContas,  AnoMesCompetencia,  Valor,  IdCentroResultado
			FROM	deleted
	ELSE
		INSERT	TbContaPagarRateio_Auditoria (	Audit_DataHora,	Audit_Operacao,		Audit_IdUsuario,	IdContaPagarRateio,  IdContaPagar,  IdEmpresa,  IdPlanoContas,  AnoMesCompetencia,  Valor,  IdCentroResultado )
			SELECT								GETDATE(),		@TipoOperacao,		@IdUsuario,			IdContaPagarRateio,  IdContaPagar,  IdEmpresa,  IdPlanoContas,  AnoMesCompetencia,  Valor,  IdCentroResultado
			FROM	inserted
		EXCEPT
			SELECT								GETDATE(),		@TipoOperacao,		@IdUsuario,			IdContaPagarRateio,  IdContaPagar,  IdEmpresa,  IdPlanoContas,  AnoMesCompetencia,  Valor,  IdCentroResultado
			FROM	deleted
END



--4 DROP TRIGGERs ANTIGA ON PK Tabela base -------------------------------------------
	DROP TRIGGER [dbo].[TgAudit_TbContaPagarRateioD]
	GO
	
	DROP TRIGGER [dbo].[TgAudit_TbContaPagarRateioI]
	GO
	
	DROP TRIGGER [dbo].[TgAudit_TbContaPagarRateioU]
	GO
	

	
--5 Check Auditoria de NOMES -------------------------------------------
	SELECT * FROM TbEmpresa   			--WHERE IdFavorecido = 8
	SELECT * FROM TbEmpresa_Auditoria	--WHERE IdFavorecido = 8
	
	SELECT * FROM TbContaPagarRateio			WHERE IdContaPagarRateio = 24294
	SELECT * FROM TbContaPagarRateio_Auditoria	WHERE IdContaPagarRateio = 24294
	
	
	SELECT cp.Audit_DataHora, IdContaPagarRateio, cp.IdEmpresa, Audit_Operacao, 
		(SELECT TOP 1 RazaoSocial FROM TbEmpresa_Auditoria a WHERE a.IdEmpresa = cp.IdEmpresa AND a.[Audit_DataHora] <= cp.[Audit_DataHora] ORDER BY Audit_DataHora DESC ) AS RazaoSocial
	
	FROM TbContaPagarRateio_Auditoria cp
	WHERE  IdContaPagarRateio  = 24294
	ORDER BY Audit_DataHora
	
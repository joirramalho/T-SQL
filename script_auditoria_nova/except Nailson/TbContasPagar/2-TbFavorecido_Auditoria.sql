--09mai22
--NOVA auditoria


--1 CREATE TABLE  -------------------------------------------

SET ANSI_NULLS OFF
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TbFavorecido_Auditoria](
	[IdFavorecidoAuditoria] [bigint] IDENTITY(1,1) NOT NULL,
	[Audit_DataHora] [datetime] NOT NULL,
	[Audit_Operacao] [char](1) NOT NULL,
	[Audit_IdUsuario] [int] NULL,

	[IdFavorecido] [int] NULL,
	[IdUnidade] [int] NULL,
	[NomeFavorecido] [varchar](100) NULL,
	[Logradouro] [varchar](500) NULL,
	[Bairro] [varchar](60) NULL,
	[Cidade] [varchar](60) NULL,
	[CEP] [varchar](9) NULL,
	[UF] [varchar](2) NULL,
	[Fone] [varchar](20) NULL,
	[Fax] [varchar](20) NULL,
	[URL] [varchar](50) NULL,
	[Email] [varchar](100) NULL,
	[CPFCNPJ] [varchar](18) NULL,
	[InscricaoMunicipal] [varchar](20) NULL,
	[Banco_CodigoBanco] [varchar](3) NULL,
	[Banco_Agencia] [varchar](10) NULL,
	[Banco_ContaCorrente] [varchar](15) NULL,
	[Contato] [varchar](500) NULL,
	[Observacoes] [varchar](500) NULL,
	[IdPlanoContas] [int] NULL,
	[IdEmpresa] [int] NULL,
	[Tipo] [char](1) NULL,
	[IntegContabil_NumeroConta] [varchar](20) NULL,
	[IntegContabil_EfetuarProvisao] [bit] NULL,
	[IdCentroResultado] [int] NULL,
	[IdComentarioPadrao] [int] NULL,
	[NomeFantasia] [varchar](255) NULL,
 CONSTRAINT [PK_TbFavorecido_Auditoria] PRIMARY KEY CLUSTERED 
(
	[IdFavorecidoAuditoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO



-- 2 POPULAR TABELA ESPELHO com dados da tabela base (Operação "+" APENAS SE *** NÃO *** EXISTIA TABELA ESPELHADA -------------------------------------------

--	TRUNCATE TABLE TbFavorecido_Auditoria

	INSERT	TbFavorecido_Auditoria (	Audit_DataHora,			Audit_Operacao,	Audit_IdUsuario,	 [IdFavorecido], [IdUnidade], [NomeFavorecido], [Logradouro], [Bairro], [Cidade], [CEP], [UF], [Fone], [Fax], [URL], [Email], [CPFCNPJ], [InscricaoMunicipal], [Banco_CodigoBanco], [Banco_Agencia], [Banco_ContaCorrente], [Contato], [Observacoes], [IdPlanoContas], [IdEmpresa], [Tipo], [IntegContabil_NumeroConta], [IntegContabil_EfetuarProvisao], [IdCentroResultado], [IdComentarioPadrao], [NomeFantasia] )
		SELECT							'1900-01-01 00:00:00',	'+',			11, 			 	 [IdFavorecido], [IdUnidade], [NomeFavorecido], [Logradouro], [Bairro], [Cidade], [CEP], [UF], [Fone], [Fax], [URL], [Email], [CPFCNPJ], [InscricaoMunicipal], [Banco_CodigoBanco], [Banco_Agencia], [Banco_ContaCorrente], [Contato], [Observacoes], [IdPlanoContas], [IdEmpresa], [Tipo], [IntegContabil_NumeroConta], [IntegContabil_EfetuarProvisao], [IdCentroResultado], [IdComentarioPadrao], [NomeFantasia]  FROM TbFavorecido
	GO 
	
	
	

	
--3 CREATE TRIGGER ON PK Tabela base -------------------------------------------

	--
-- Activesoft Consultoria 
-- TRIGGER criada pelo Activesoft Service Pack em 06/10/2021 durante atualização para versão 1.065.173.
--


CREATE TRIGGER [dbo].[TgFavorecido_Auditoria] ON [dbo].[TbFavorecido]
--ALTER TRIGGER [dbo].[TgFavorecido_Auditoria] ON [dbo].[TbFavorecido]
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
		
	
	IF ( SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS c WHERE DATA_TYPE NOT IN ( 'text', 'image' ) AND TABLE_NAME = 'TbFavorecido' AND LEFT(COLUMN_NAME,1) <> '_' ) <> 27 
	  BEGIN
		RAISERROR ('Dados não podem ser alterados (trigger de auditoria TgFavorecido_Auditoria inválida -- quantidade de campos)', 16, 1) 
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
		INSERT	TbFavorecido_Auditoria (	Audit_DataHora,	Audit_Operacao,		Audit_IdUsuario,	[IdFavorecido], [IdUnidade], [NomeFavorecido], [Logradouro], [Bairro], [Cidade], [CEP], [UF], [Fone], [Fax], [URL], [Email], [CPFCNPJ], [InscricaoMunicipal], [Banco_CodigoBanco], [Banco_Agencia], [Banco_ContaCorrente], [Contato], [Observacoes], [IdPlanoContas], [IdEmpresa], [Tipo], [IntegContabil_NumeroConta], [IntegContabil_EfetuarProvisao], [IdCentroResultado], [IdComentarioPadrao], [NomeFantasia] )
			SELECT							GETDATE(),		@TipoOperacao,		@IdUsuario,			[IdFavorecido], [IdUnidade], [NomeFavorecido], [Logradouro], [Bairro], [Cidade], [CEP], [UF], [Fone], [Fax], [URL], [Email], [CPFCNPJ], [InscricaoMunicipal], [Banco_CodigoBanco], [Banco_Agencia], [Banco_ContaCorrente], [Contato], [Observacoes], [IdPlanoContas], [IdEmpresa], [Tipo], [IntegContabil_NumeroConta], [IntegContabil_EfetuarProvisao], [IdCentroResultado], [IdComentarioPadrao], [NomeFantasia]
			FROM	deleted
	ELSE
		INSERT	TbFavorecido_Auditoria (	Audit_DataHora,	Audit_Operacao,		Audit_IdUsuario,	[IdFavorecido], [IdUnidade], [NomeFavorecido], [Logradouro], [Bairro], [Cidade], [CEP], [UF], [Fone], [Fax], [URL], [Email], [CPFCNPJ], [InscricaoMunicipal], [Banco_CodigoBanco], [Banco_Agencia], [Banco_ContaCorrente], [Contato], [Observacoes], [IdPlanoContas], [IdEmpresa], [Tipo], [IntegContabil_NumeroConta], [IntegContabil_EfetuarProvisao], [IdCentroResultado], [IdComentarioPadrao], [NomeFantasia] )
			SELECT							GETDATE(),		@TipoOperacao,		@IdUsuario,			[IdFavorecido], [IdUnidade], [NomeFavorecido], [Logradouro], [Bairro], [Cidade], [CEP], [UF], [Fone], [Fax], [URL], [Email], [CPFCNPJ], [InscricaoMunicipal], [Banco_CodigoBanco], [Banco_Agencia], [Banco_ContaCorrente], [Contato], [Observacoes], [IdPlanoContas], [IdEmpresa], [Tipo], [IntegContabil_NumeroConta], [IntegContabil_EfetuarProvisao], [IdCentroResultado], [IdComentarioPadrao], [NomeFantasia]
			FROM	inserted
		EXCEPT
			SELECT							GETDATE(),		@TipoOperacao,		@IdUsuario,			[IdFavorecido], [IdUnidade], [NomeFavorecido], [Logradouro], [Bairro], [Cidade], [CEP], [UF], [Fone], [Fax], [URL], [Email], [CPFCNPJ], [InscricaoMunicipal], [Banco_CodigoBanco], [Banco_Agencia], [Banco_ContaCorrente], [Contato], [Observacoes], [IdPlanoContas], [IdEmpresa], [Tipo], [IntegContabil_NumeroConta], [IntegContabil_EfetuarProvisao], [IdCentroResultado], [IdComentarioPadrao], [NomeFantasia]
			FROM	deleted
END



--4 DROP TRIGGERs ANTIGA ON PK Tabela base -------------------------------------------
	DROP TRIGGER [dbo].[TgAudit_TbFavorecidoD]
	GO
	
	DROP TRIGGER [dbo].[TgAudit_TbFavorecidoI]
	GO
	
	DROP TRIGGER [dbo].[TgAudit_TbFavorecidoU]
	GO
	
	
	
	
	
--5 Check Auditoria de NOMES -------------------------------------------
	SELECT * FROM TbFavorecido 				WHERE IdFavorecido = 8
	SELECT * FROM TbFavorecido_Auditoria	WHERE IdFavorecido = 8
	
	SELECT * FROM TbContaPagar				WHERE IdFavorecido = 8
	SELECT * FROM TbContaPagar_Auditoria	WHERE IdFavorecido = 8
	
	
	SELECT cp.Audit_DataHora, IdContaPagar, cp.IdFavorecido, Audit_Operacao, cp.ComentarioApropriacao,
		(SELECT TOP 1 NomeFavorecido FROM TbFavorecido_Auditoria a WHERE a.IdFavorecido = cp.IdFavorecido AND a.[Audit_DataHora] < cp.[Audit_DataHora] ORDER BY Audit_DataHora DESC ) AS NomeFavorecido 
	
	FROM TbContaPagar_Auditoria cp
	WHERE  IdContaPagar = 20329 --15390 -- IdFavorecido = 8 --
	ORDER BY Audit_DataHora
	
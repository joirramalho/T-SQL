--19mai22
--NOVA auditoria


--1 CREATE TABLE  -------------------------------------------

SET ANSI_NULLS OFF
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TbEmpresa_Auditoria](
	[IdEmpresaAuditoria] [bigint] IDENTITY(1,1) NOT NULL,
	[Audit_DataHora] [datetime] NOT NULL,
	[Audit_Operacao] [char](1) NOT NULL,
	[Audit_IdUsuario] [int] NULL,


	[IdEmpresa] [int] NULL,
	[IdUnidade] [int] NULL,
	[RazaoSocial] [varchar](100) NULL,
	[Endereco] [varchar](500) NULL,
	[Bairro] [varchar](60) NULL,
	[Cidade] [varchar](60) NULL,
	[CEP] [varchar](50) NULL,
	[UF] [varchar](50) NULL,
	[Fone] [varchar](20) NULL,
	[Fax] [varchar](20) NULL,
	[URL] [varchar](40) NULL,
	[Email] [varchar](70) NULL,
	[CNPJ] [char](18) NULL,
	[InscricaoMunicipal] [varchar](20) NULL,
	[FormatoDiscriminacaoServicoNFe] [varchar](500) NULL,
	[IntegContabil_NumeroEstabelecimento] [varchar](20) NULL,
	[IntegContabil_NumeroEmpresa] [varchar](20) NULL,
	[_StOptanteSimplesNacional] [bit] NULL,
	[StIncentivadorCultural] [bit] NULL,
	[StConsiderarIssZeradoComoImune] [bit] NULL,
	[ComentarioRPS] [varchar](500) NULL,
	[_StRetemIssFonte] [bit] NULL,
	[OptanteSimples] [smallint] NULL,
	[NomeFantasia] [varchar](100) NULL,
	[InscricaoEstadual] [varchar](20) NULL,
	[CodigoIBGEMunicipio] [varchar](7) NULL,
	[RegimeEspecialTributacao] [smallint] NULL,
	
--	[CertificadoA1_ArquivoPFX] [image] NULL,
	
	[CertificadoA1_Senha] [varchar](100) NULL,
	[CertificadoA1_NumeroSerie] [varchar](100) NULL,
	
--	[CabecalhoPersonalizado] [text] NULL,
	
	[StCabecalhoPersonalizado] [bit] NULL,
	
--	[CabecalhoPersonalizadoCaixa] [text] NULL,
	
	[StCabecalhoPersonalizadoCaixa] [bit] NULL,
 CONSTRAINT [PK_TbEmpresa_Auditoria] PRIMARY KEY CLUSTERED 
(
	[IdEmpresaAuditoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO



-- 2 POPULAR TABELA ESPELHO com dados da tabela base (Operação "+" APENAS SE *** NÃO *** EXISTIA TABELA ESPELHADA -------------------------------------------

--	TRUNCATE TABLE TbEmpresa_Auditoria

	INSERT	TbEmpresa_Auditoria (	Audit_DataHora,			Audit_Operacao,	Audit_IdUsuario,	 IdEmpresa,  IdUnidade,  RazaoSocial,  Endereco,  Bairro,  Cidade,  CEP,  UF,  Fone,  Fax,  URL,  Email,  CNPJ,  InscricaoMunicipal,  FormatoDiscriminacaoServicoNFe,  IntegContabil_NumeroEstabelecimento,  IntegContabil_NumeroEmpresa,  StIncentivadorCultural,  StConsiderarIssZeradoComoImune,  ComentarioRPS,  OptanteSimples,  NomeFantasia,  InscricaoEstadual,  CodigoIBGEMunicipio,  RegimeEspecialTributacao,  CertificadoA1_Senha,  CertificadoA1_NumeroSerie,  StCabecalhoPersonalizado,  StCabecalhoPersonalizadoCaixa )
		SELECT						'1900-01-01 00:00:00',	'+',			11, 			 	 IdEmpresa,  IdUnidade,  RazaoSocial,  Endereco,  Bairro,  Cidade,  CEP,  UF,  Fone,  Fax,  URL,  Email,  CNPJ,  InscricaoMunicipal,  FormatoDiscriminacaoServicoNFe,  IntegContabil_NumeroEstabelecimento,  IntegContabil_NumeroEmpresa,  StIncentivadorCultural,  StConsiderarIssZeradoComoImune,  ComentarioRPS,  OptanteSimples,  NomeFantasia,  InscricaoEstadual,  CodigoIBGEMunicipio,  RegimeEspecialTributacao,  CertificadoA1_Senha,  CertificadoA1_NumeroSerie,  StCabecalhoPersonalizado,  StCabecalhoPersonalizadoCaixa  FROM TbEmpresa
	GO 
	
	


--3 CREATE TRIGGER ON PK Tabela base -------------------------------------------

	--
-- Activesoft Consultoria 
-- TRIGGER criada pelo Activesoft Service Pack em 06/10/2021 durante atualização para versão 1.065.173.
--


CREATE TRIGGER [dbo].[TgEmpresa_Auditoria] ON [dbo].[TbEmpresa]
--ALTER TRIGGER [dbo].[TgEmpresa_Auditoria] ON [dbo].[TbEmpresa]
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

		
--	IF	NOT EXISTS(	SELECT * FROM inserted
--					EXCEPT
--					SELECT * FROM deleted ) AND  @TipoOperacao <> 'D'
--		RETURN
		
	
	IF ( SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS c WHERE DATA_TYPE NOT IN ( 'text', 'image' ) AND TABLE_NAME = 'TbEmpresa' AND LEFT(COLUMN_NAME,1) <> '_' ) <> 29
	  BEGIN
		RAISERROR ('Dados não podem ser alterados (trigger de auditoria TgEmpresa_Auditoria inválida)', 16, 1) 
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
		INSERT	TbEmpresa_Auditoria (	Audit_DataHora,	Audit_Operacao,		Audit_IdUsuario,	IdEmpresa,  IdUnidade,  RazaoSocial,  Endereco,  Bairro,  Cidade,  CEP,  UF,  Fone,  Fax,  URL,  Email,  CNPJ,  InscricaoMunicipal,  FormatoDiscriminacaoServicoNFe,  IntegContabil_NumeroEstabelecimento,  IntegContabil_NumeroEmpresa,  StIncentivadorCultural,  StConsiderarIssZeradoComoImune,  ComentarioRPS,  OptanteSimples,  NomeFantasia,  InscricaoEstadual,  CodigoIBGEMunicipio,  RegimeEspecialTributacao,  CertificadoA1_Senha,  CertificadoA1_NumeroSerie,  StCabecalhoPersonalizado,  StCabecalhoPersonalizadoCaixa )
			SELECT						GETDATE(),		@TipoOperacao,		@IdUsuario,			IdEmpresa,  IdUnidade,  RazaoSocial,  Endereco,  Bairro,  Cidade,  CEP,  UF,  Fone,  Fax,  URL,  Email,  CNPJ,  InscricaoMunicipal,  FormatoDiscriminacaoServicoNFe,  IntegContabil_NumeroEstabelecimento,  IntegContabil_NumeroEmpresa,  StIncentivadorCultural,  StConsiderarIssZeradoComoImune,  ComentarioRPS,  OptanteSimples,  NomeFantasia,  InscricaoEstadual,  CodigoIBGEMunicipio,  RegimeEspecialTributacao,  CertificadoA1_Senha,  CertificadoA1_NumeroSerie,  StCabecalhoPersonalizado,  StCabecalhoPersonalizadoCaixa
			FROM	deleted
	ELSE
		INSERT	TbEmpresa_Auditoria (	Audit_DataHora,	Audit_Operacao,		Audit_IdUsuario,	IdEmpresa,  IdUnidade,  RazaoSocial,  Endereco,  Bairro,  Cidade,  CEP,  UF,  Fone,  Fax,  URL,  Email,  CNPJ,  InscricaoMunicipal,  FormatoDiscriminacaoServicoNFe,  IntegContabil_NumeroEstabelecimento,  IntegContabil_NumeroEmpresa,  StIncentivadorCultural,  StConsiderarIssZeradoComoImune,  ComentarioRPS,  OptanteSimples,  NomeFantasia,  InscricaoEstadual,  CodigoIBGEMunicipio,  RegimeEspecialTributacao,  CertificadoA1_Senha,  CertificadoA1_NumeroSerie,  StCabecalhoPersonalizado,  StCabecalhoPersonalizadoCaixa )
			SELECT						GETDATE(),		@TipoOperacao,		@IdUsuario,			IdEmpresa,  IdUnidade,  RazaoSocial,  Endereco,  Bairro,  Cidade,  CEP,  UF,  Fone,  Fax,  URL,  Email,  CNPJ,  InscricaoMunicipal,  FormatoDiscriminacaoServicoNFe,  IntegContabil_NumeroEstabelecimento,  IntegContabil_NumeroEmpresa,  StIncentivadorCultural,  StConsiderarIssZeradoComoImune,  ComentarioRPS,  OptanteSimples,  NomeFantasia,  InscricaoEstadual,  CodigoIBGEMunicipio,  RegimeEspecialTributacao,  CertificadoA1_Senha,  CertificadoA1_NumeroSerie,  StCabecalhoPersonalizado,  StCabecalhoPersonalizadoCaixa
			FROM	inserted
		EXCEPT
			SELECT						GETDATE(),		@TipoOperacao,		@IdUsuario,			IdEmpresa,  IdUnidade,  RazaoSocial,  Endereco,  Bairro,  Cidade,  CEP,  UF,  Fone,  Fax,  URL,  Email,  CNPJ,  InscricaoMunicipal,  FormatoDiscriminacaoServicoNFe,  IntegContabil_NumeroEstabelecimento,  IntegContabil_NumeroEmpresa,  StIncentivadorCultural,  StConsiderarIssZeradoComoImune,  ComentarioRPS,  OptanteSimples,  NomeFantasia,  InscricaoEstadual,  CodigoIBGEMunicipio,  RegimeEspecialTributacao,  CertificadoA1_Senha,  CertificadoA1_NumeroSerie,  StCabecalhoPersonalizado,  StCabecalhoPersonalizadoCaixa
			FROM	deleted
END



--4 DROP TRIGGERs ANTIGA ON PK Tabela base -------------------------------------------
	DROP TRIGGER [dbo].[TgAudit_TbEmpresaD]
	GO
	
	DROP TRIGGER [dbo].[TgAudit_TbEmpresaI]
	GO
	
	DROP TRIGGER [dbo].[TgAudit_TbEmpresaU]
	GO
	

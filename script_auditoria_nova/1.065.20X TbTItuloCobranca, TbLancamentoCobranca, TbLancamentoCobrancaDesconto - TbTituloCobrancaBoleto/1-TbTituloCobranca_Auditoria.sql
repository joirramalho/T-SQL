--20jan22
--NOVA auditoria


--1 CREATE TABLE  -------------------------------------------

SET ANSI_NULLS OFF

SET QUOTED_IDENTIFIER ON


CREATE TABLE dbo.TbTituloCobranca_Auditoria  (
	[IdTituloCobrancaAuditoria] [bigint] IDENTITY(1,1) NOT NULL,
	[DataHora] [datetime] NOT NULL,
	[Operacao] [char](1) NOT NULL,
	[IdUsuario] [int] NULL,

	IdTituloCobranca int NULL,
	IdResponsavel int NULL,
	IdAluno int NULL,
	DataEmissao smalldatetime NULL,
	DataVencimento smalldatetime NULL,
	StImpresso bit NULL,
--	[_StVencimentoContraApresentacao] bit NULL,
	IdFormaRecebimento int NULL,
	IdTipoCalculoMultaJuros int NULL,
	SituacaoTituloCobranca char(3) COLLATE SQL_Latin1_General_CP1_CI_AI NULL,
	DataBaixa smalldatetime NULL,
	TipoLiquidacao char(3) COLLATE SQL_Latin1_General_CP1_CI_AI NULL,
	LIQ_ValorRecebidoAMaior numeric(12,2) NULL,
	StPagoPelaSeguradora bit NULL,
	Comentario varchar(8000) COLLATE SQL_Latin1_General_CP1_CI_AI NULL,
	DataPagamento smalldatetime NULL,
	LIQ_DataDevolucaoRecebidoAMaior smalldatetime NULL,
--	[_DataFaturamento] smalldatetime NULL,
	DataValidade smalldatetime NULL,
	LIQ_IdConta int NULL,
	[_IdLoteCobrancaRegistrada] int NULL,
	Audit_IdUsuarioLiquidacao int NULL,
	Audit_DataHoraLiquidacao smalldatetime NULL,
	Audit_ComentarioLiquidacao varchar(1000) COLLATE SQL_Latin1_General_CP1_CI_AI NULL,
	LIQ_IdContaDevolucaoRecebidoAMaior int NULL,
	IdAgenteCobrancaRegistrada int NULL,
	SituacaoCobrancaRegistrada varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AI NULL,
	StEmailEnviado bit  NULL,
	NossoNumeroMigracao varchar(1000) COLLATE SQL_Latin1_General_CP1_CI_AI NULL,
	LIQ_IdChequeDevolucaoRecebidoAMaior int NULL,
	LinkDoBoleto varchar(254) COLLATE SQL_Latin1_General_CP1_CI_AI NULL,
	IdTituloNoAgente varchar(254) COLLATE SQL_Latin1_General_CP1_CS_AS NULL,
	CobRegistrada_StAvisoPendente bit  NULL,
	LIQ_IdContaRecebimentoCaixaOperadoraCartao int NULL,
	DataHoraUltimaAlteracao datetime NULL,
	StPermitePagarRecebOnlineExcecao bit  NULL,
	
	PRIOR_IdTituloCobrancaAuditoria bigint,
	
	CONSTRAINT PK_TbTituloCobranca_Auditoria PRIMARY KEY CLUSTERED  
(
	[IdTituloCobrancaAuditoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY];





--2 CREATE INDEX ON PK Tabela ESPELHO -------------------------------------------
CREATE INDEX [IX_TbTituloCobranca_Auditoria_IdTituloCobranca] ON [dbo].[TbTituloCobranca_Auditoria] ([IdTituloCobranca])






--3 CREATE TRIGGER ON PK Tabela base -------------------------------------------
SET ANSI_NULLS ON
GO 

SET QUOTED_IDENTIFIER OFF
GO 

--
-- Activesoft Consultoria 
-- TRIGGER criada pelo Activesoft Service Pack em 21/01/2020 durante atualização para versão 1.065.xxx.
--


CREATE TRIGGER [dbo].[TgTituloCobranca_Auditoria] ON [dbo].[TbTituloCobranca]
--ALTER TRIGGER [dbo].[TgTituloCobranca_Auditoria] ON [dbo].[TbTituloCobranca]
FOR INSERT, UPDATE, DELETE
AS
BEGIN
	SET NOCOUNT ON

	IF ( SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS c WHERE DATA_TYPE NOT IN ( 'text', 'image' ) AND TABLE_NAME = 'TbTituloCobranca' AND LEFT(COLUMN_NAME,1) <> '_' ) <> 33 
	  BEGIN
		RAISERROR ('Dados não podem ser alterados (trigger de auditoria TgTituloCobranca_Auditoria inválida -- quantidade de campos)', 16, 1) 
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
		INSERT	TbTituloCobranca_Auditoria (	DataHora,	Operacao,		IdUsuario,	[IdTituloCobranca], [IdResponsavel], [IdAluno], [DataEmissao], [DataVencimento], [StImpresso], [IdFormaRecebimento], [IdTipoCalculoMultaJuros], [SituacaoTituloCobranca], [DataBaixa], [TipoLiquidacao], [LIQ_ValorRecebidoAMaior], [StPagoPelaSeguradora], [Comentario], [DataPagamento], [LIQ_DataDevolucaoRecebidoAMaior], [DataValidade], [LIQ_IdConta], [Audit_IdUsuarioLiquidacao], [Audit_DataHoraLiquidacao], [Audit_ComentarioLiquidacao], [LIQ_IdContaDevolucaoRecebidoAMaior], [IdAgenteCobrancaRegistrada], [SituacaoCobrancaRegistrada], [StEmailEnviado], [NossoNumeroMigracao], [LIQ_IdChequeDevolucaoRecebidoAMaior], [LinkDoBoleto], [IdTituloNoAgente], [CobRegistrada_StAvisoPendente], [LIQ_IdContaRecebimentoCaixaOperadoraCartao], [DataHoraUltimaAlteracao], [StPermitePagarRecebOnlineExcecao] )
		SELECT									GETDATE(),	@TipoOperacao,	@IdUsuario, [IdTituloCobranca], [IdResponsavel], [IdAluno], [DataEmissao], [DataVencimento], [StImpresso], [IdFormaRecebimento], [IdTipoCalculoMultaJuros], [SituacaoTituloCobranca], [DataBaixa], [TipoLiquidacao], [LIQ_ValorRecebidoAMaior], [StPagoPelaSeguradora], [Comentario], [DataPagamento], [LIQ_DataDevolucaoRecebidoAMaior], [DataValidade], [LIQ_IdConta], [Audit_IdUsuarioLiquidacao], [Audit_DataHoraLiquidacao], [Audit_ComentarioLiquidacao], [LIQ_IdContaDevolucaoRecebidoAMaior], [IdAgenteCobrancaRegistrada], [SituacaoCobrancaRegistrada], [StEmailEnviado], [NossoNumeroMigracao], [LIQ_IdChequeDevolucaoRecebidoAMaior], [LinkDoBoleto], [IdTituloNoAgente], [CobRegistrada_StAvisoPendente], [LIQ_IdContaRecebimentoCaixaOperadoraCartao], [DataHoraUltimaAlteracao], [StPermitePagarRecebOnlineExcecao]
		FROM	deleted
	ELSE
		INSERT	TbTituloCobranca_Auditoria (	DataHora,	Operacao,		IdUsuario,	[IdTituloCobranca], [IdResponsavel], [IdAluno], [DataEmissao], [DataVencimento], [StImpresso], [IdFormaRecebimento], [IdTipoCalculoMultaJuros], [SituacaoTituloCobranca], [DataBaixa], [TipoLiquidacao], [LIQ_ValorRecebidoAMaior], [StPagoPelaSeguradora], [Comentario], [DataPagamento], [LIQ_DataDevolucaoRecebidoAMaior], [DataValidade], [LIQ_IdConta], [Audit_IdUsuarioLiquidacao], [Audit_DataHoraLiquidacao], [Audit_ComentarioLiquidacao], [LIQ_IdContaDevolucaoRecebidoAMaior], [IdAgenteCobrancaRegistrada], [SituacaoCobrancaRegistrada], [StEmailEnviado], [NossoNumeroMigracao], [LIQ_IdChequeDevolucaoRecebidoAMaior], [LinkDoBoleto], [IdTituloNoAgente], [CobRegistrada_StAvisoPendente], [LIQ_IdContaRecebimentoCaixaOperadoraCartao], [DataHoraUltimaAlteracao], [StPermitePagarRecebOnlineExcecao] )
		SELECT									GETDATE(),	@TipoOperacao,	@IdUsuario, [IdTituloCobranca], [IdResponsavel], [IdAluno], [DataEmissao], [DataVencimento], [StImpresso], [IdFormaRecebimento], [IdTipoCalculoMultaJuros], [SituacaoTituloCobranca], [DataBaixa], [TipoLiquidacao], [LIQ_ValorRecebidoAMaior], [StPagoPelaSeguradora], [Comentario], [DataPagamento], [LIQ_DataDevolucaoRecebidoAMaior], [DataValidade], [LIQ_IdConta], [Audit_IdUsuarioLiquidacao], [Audit_DataHoraLiquidacao], [Audit_ComentarioLiquidacao], [LIQ_IdContaDevolucaoRecebidoAMaior], [IdAgenteCobrancaRegistrada], [SituacaoCobrancaRegistrada], [StEmailEnviado], [NossoNumeroMigracao], [LIQ_IdChequeDevolucaoRecebidoAMaior], [LinkDoBoleto], [IdTituloNoAgente], [CobRegistrada_StAvisoPendente], [LIQ_IdContaRecebimentoCaixaOperadoraCartao], [DataHoraUltimaAlteracao], [StPermitePagarRecebOnlineExcecao]
		FROM	inserted
END
GO






--4 DROP TRIGGERs ANTIGA ON PK Tabela base -------------------------------------------
DROP TRIGGER [dbo].[TgAudit_TbTituloCobrancaD]
GO

DROP TRIGGER [dbo].[TgAudit_TbTituloCobrancaI]
GO

DROP TRIGGER [dbo].[TgAudit_TbTituloCobrancaU]
GO







--5 CREATE TRIGGER NOVA ON tabela espelho -------------------------------------------

--
-- Activesoft Consultoria 
-- TRIGGER criada pelo Activesoft Service Pack em 18/11/2021 durante atualização para versão 1.065.183.
--

CREATE TRIGGER [dbo].[TgTituloCobranca_Auditoria_Prior] ON [dbo].[TbTituloCobranca_Auditoria]
--ALTER TRIGGER [dbo].[TgTituloCobranca_Auditoria_Prior] ON [dbo].[TbTituloCobranca_Auditoria]
FOR INSERT
AS
BEGIN
	SET NOCOUNT ON
	
    UPDATE TbTituloCobranca_Auditoria
    SET PRIOR_IdTituloCobrancaAuditoria = 
		    (
		    SELECT TOP 1 IdTituloCobrancaAuditoria 
         	FROM 	TbTituloCobranca_Auditoria
     		WHERE 	IdTituloCobrancaAuditoria < i.IdTituloCobrancaAuditoria	
					AND IdTituloCobranca = i.IdTituloCobranca 
     		ORDER 	BY IdTituloCobrancaAuditoria DESC
			)
	    FROM inserted i 
	    INNER JOIN TbTituloCobranca_Auditoria ON i.IdTituloCobrancaAuditoria = TbTituloCobranca_Auditoria.IdTituloCobrancaAuditoria
	    WHERE TbTituloCobranca_Auditoria.IdTituloCobrancaAuditoria = i.IdTituloCobrancaAuditoria
END




--6 APENAS SE JÁ *** NÃO *** EXISTIA TABELA ESPELHADA -------------------------------------------
	-- POPULAR TABELA ESPELHO com dados da tabela base (Operação "+" ------------------------

INSERT	TbTituloCobranca_Auditoria (		DataHora,	Operacao,	IdUsuario,	[IdTituloCobranca], [IdResponsavel], [IdAluno], [DataEmissao], [DataVencimento], [StImpresso], [IdFormaRecebimento], [IdTipoCalculoMultaJuros], [SituacaoTituloCobranca], [DataBaixa], [TipoLiquidacao], [LIQ_ValorRecebidoAMaior], [StPagoPelaSeguradora], [Comentario], [DataPagamento], [LIQ_DataDevolucaoRecebidoAMaior], [DataValidade], [LIQ_IdConta], [Audit_IdUsuarioLiquidacao], [Audit_DataHoraLiquidacao], [Audit_ComentarioLiquidacao], [LIQ_IdContaDevolucaoRecebidoAMaior], [IdAgenteCobrancaRegistrada], [SituacaoCobrancaRegistrada], [StEmailEnviado], [NossoNumeroMigracao], [LIQ_IdChequeDevolucaoRecebidoAMaior], [LinkDoBoleto], [IdTituloNoAgente], [CobRegistrada_StAvisoPendente], [LIQ_IdContaRecebimentoCaixaOperadoraCartao], [DataHoraUltimaAlteracao], [StPermitePagarRecebOnlineExcecao] )
	SELECT									GETDATE(),	'+',		11, 		[IdTituloCobranca], [IdResponsavel], [IdAluno], [DataEmissao], [DataVencimento], [StImpresso], [IdFormaRecebimento], [IdTipoCalculoMultaJuros], [SituacaoTituloCobranca], [DataBaixa], [TipoLiquidacao], [LIQ_ValorRecebidoAMaior], [StPagoPelaSeguradora], [Comentario], [DataPagamento], [LIQ_DataDevolucaoRecebidoAMaior], [DataValidade], [LIQ_IdConta], [Audit_IdUsuarioLiquidacao], [Audit_DataHoraLiquidacao], [Audit_ComentarioLiquidacao], [LIQ_IdContaDevolucaoRecebidoAMaior], [IdAgenteCobrancaRegistrada], [SituacaoCobrancaRegistrada], [StEmailEnviado], [NossoNumeroMigracao], [LIQ_IdChequeDevolucaoRecebidoAMaior], [LinkDoBoleto], [IdTituloNoAgente], [CobRegistrada_StAvisoPendente], [LIQ_IdContaRecebimentoCaixaOperadoraCartao], [DataHoraUltimaAlteracao], [StPermitePagarRecebOnlineExcecao] FROM TbTituloCobranca 



	

--7 CHECK tabela espelho -------------------------------------------

--SELECT COUNT(*)  						FROM TbTituloCobranca --WHERE PRIOR_IdTituloCobrancaAuditoria IS NOT NULL
--SELECT COUNT(DISTINCT IdTituloCobranca)	FROM TbTituloCobranca_Auditoria --WHERE PRIOR_IdTituloCobrancaAuditoria IS NOT NULL




--8 APENAS SE JÁ EXISTIA TABELA ESPELHADA -------------------------------------------
	-- POPULAR PRIOR_IdTituloCobrancaAuditoria ON tabela espelho -------------------------------------------

--IF (OBJECT_ID('tempdb..#TEMP_AUDITORIA') IS NOT NULL) DROP TABLE tempdb..#TEMP_AUDITORIA
--	CREATE TABLE #tempdb..#TEMP_AUDITORIA ( IdTituloCobrancaAuditoria bigint, PRIOR_IdTituloCobrancaAuditoria bigint )
--
--INSERT INTO #tempdb..#TEMP_AUDITORIA
--	SELECT IdTituloCobrancaAuditoria,
--		        (		SELECT 	TOP 1 IdTituloCobrancaAuditoria 
--			         	FROM 	TbTituloCobranca_Auditoria
--		         		WHERE 	IdTituloCobrancaAuditoria < t.IdTituloCobrancaAuditoria	
--								AND IdTituloCobranca = t.IdTituloCobranca
--		         		ORDER 	BY IdTituloCobrancaAuditoria DESC
--		        ) AS PRIOR_IdTituloCobrancaAuditoria
--		from TbTituloCobranca_Auditoria t
--
--		
--UPDATE 	TbTituloCobranca_Auditoria 
--SET 	TbTituloCobranca_Auditoria.PRIOR_IdTituloCobrancaAuditoria = #tempdb..#TEMP_AUDITORIA.PRIOR_IdTituloCobrancaAuditoria 
--FROM 	TbTituloCobranca_Auditoria, #tempdb..#TEMP_AUDITORIA 
--WHERE 	TbTituloCobranca_Auditoria.IdTituloCobrancaAuditoria = #tempdb..#TEMP_AUDITORIA.IdTituloCobrancaAuditoria
--		AND #tempdb..#TEMP_AUDITORIA.PRIOR_IdTituloCobrancaAuditoria IS NOT NULL



			
--9 CHECK de carga ON tabela espelho -------------------------------------------
			
--	SELECT 
--		audit.*
--		,CASE 
--				WHEN Operacao ='I' THEN 'Inclusão'
--				WHEN Operacao ='U' THEN 'Alteração'
--				WHEN Operacao ='D' THEN 'Remoção'
--				WHEN Operacao ='+' THEN 'Carga de auditoria'
--				WHEN Operacao ='O' THEN 'Tipo criado para identificar movimentações antigas' -- CRM 24432
--				ELSE 'r/w'
--			END AS 'NomeOperacao'
--		,tu.NomeUsuario
----		,p.NomeProfessor 
--	FROM TbTituloCobranca_Auditoria audit
--	LEFT JOIN TbUsuario 	tu 	ON tu.IdUsuario 	= audit.IdUsuario
----	LEFT JOIN TbProfessor 	p 	ON p.IdProfessor  	= audit.IdProfessor
--
--	WHERE IdAluno IN (7014, 6429)
--
--	
--	
--	SELECT TOP 100 * FROM TbTituloCobranca WHERE YEAR  (DataVencimento) = 2022
--	
--	SELECT TOP 10 * FROM TbTituloCobranca_Auditoria WHERE IdTituloCobranca  = 524027 
--	
--	UPDATE TbTituloCobranca
--	SET Comentario = 'A negociação 485 tinha este título como destino e foi excluída..'
--	WHERE IdTituloCobranca  IN (544188, 545414)
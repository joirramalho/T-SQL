--21fev22
--NOVA auditoria


--1 CREATE TABLE  -------------------------------------------

	SET ANSI_NULLS ON
	GO 
	
	SET QUOTED_IDENTIFIER ON
	GO 

CREATE TABLE dbo.TbLancamentoCobranca_Auditoria (
	[IdLancamentoCobrancaAuditoria] [bigint] IDENTITY(1,1) NOT NULL,
	[Audit_DataHora] [datetime] NOT NULL,
	[Audit_Operacao] [char](1) NOT NULL,
	[Audit_IdUsuario] [int] NULL,

	IdLancamentoCobranca int NULL,
	IdTituloCobrancaGerado int NULL,
	IdUnidade int NULL,
	ParcelaCobranca char(7) COLLATE SQL_Latin1_General_CP1_CI_AI NULL,
	IdLoteCobranca int NULL,
	IdServico int NULL,
	ValorServico numeric(12,2) NULL,
	LIQ_ValorDescontoNaoCondicionado numeric(12,2) NULL,
	LIQ_ValorDescontoCondicionado numeric(12,2) NULL,
	LIQ_ValorDescontoConcedido numeric(12,2) NULL,
	LIQ_ValorMultaCalculado numeric(12,2) NULL,
	LIQ_ValorJurosCalculado numeric(12,2) NULL,
	LIQ_ValorRecebidoPrincipal numeric(12,2) NULL,
	LIQ_ValorRecebidoMulta numeric(12,2) NULL,
	LIQ_ValorRecebidoJuros numeric(12,2) NULL,
	LIQ_ValorPendenteAMenor numeric(12,2) NULL,
	IdTurma int NULL,
	IdAlunoTaxa int NULL,
	StCobrancaServicoFinanceiro bit NULL,
	StTurmaTaxaRemovido bit NULL,
--	[_IdAbatimentoBolsa] int NULL,
--	[_ValorBolsa] numeric(12,2) NULL,
--	[_IdAbatimentoDescontoComercial] int NULL,
--	[_ValorDescontoComercial] numeric(12,2) NULL,
--	[_ValorDescontoNegociacao] numeric(12,2) NULL,
--	[_LIQ_ValorDescontoFinanceiroCalculado] numeric(12,2) NULL,
	LIQ_DataDevolucao smalldatetime NULL,
	DataFaturamento smalldatetime NULL,
	NFe_NumeroRPS int NULL,
	NFe_IdEmpresaRPS int NULL,
	NFe_AnoMesCompetenciaRPS varchar(6) COLLATE SQL_Latin1_General_CP1_CI_AI NULL,
	IdAlunoTurmaReserva int NULL,
	LIQ_IdContaDevolucao int NULL,
	IdAlunoServico int NULL,
	LIQ_IdChequeDevolucao int NULL,
	IdDisciplina int NULL,
	IdNotaFiscal int NULL,
	CONSTRAINT PK_TbLancamentoCobranca_Auditoria PRIMARY KEY CLUSTERED  
(
	[IdLancamentoCobrancaAuditoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO




-- 2 POPULAR TABELA ESPELHO com dados da tabela base (Opera????o "+" APENAS SE *** N??O *** EXISTIA TABELA ESPELHADA -------------------------------------------

	INSERT	TbLancamentoCobranca_Auditoria (	Audit_DataHora,	Audit_Operacao,	Audit_IdUsuario,[IdLancamentoCobranca], [IdTituloCobrancaGerado], [IdUnidade], [ParcelaCobranca], [IdLoteCobranca], [IdServico], [ValorServico], [LIQ_ValorDescontoNaoCondicionado], [LIQ_ValorDescontoCondicionado], [LIQ_ValorDescontoConcedido], [LIQ_ValorMultaCalculado], [LIQ_ValorJurosCalculado], [LIQ_ValorRecebidoPrincipal], [LIQ_ValorRecebidoMulta], [LIQ_ValorRecebidoJuros], [LIQ_ValorPendenteAMenor], [IdTurma], [IdAlunoTaxa], [StCobrancaServicoFinanceiro], [StTurmaTaxaRemovido], [LIQ_DataDevolucao], [DataFaturamento], [NFe_NumeroRPS], [NFe_IdEmpresaRPS], [NFe_AnoMesCompetenciaRPS], [IdAlunoTurmaReserva], [LIQ_IdContaDevolucao], [IdAlunoServico], [LIQ_IdChequeDevolucao], [IdDisciplina], [IdNotaFiscal] )
		SELECT									GETDATE(),		'+',			11, 			[IdLancamentoCobranca], [IdTituloCobrancaGerado], [IdUnidade], [ParcelaCobranca], [IdLoteCobranca], [IdServico], [ValorServico], [LIQ_ValorDescontoNaoCondicionado], [LIQ_ValorDescontoCondicionado], [LIQ_ValorDescontoConcedido], [LIQ_ValorMultaCalculado], [LIQ_ValorJurosCalculado], [LIQ_ValorRecebidoPrincipal], [LIQ_ValorRecebidoMulta], [LIQ_ValorRecebidoJuros], [LIQ_ValorPendenteAMenor], [IdTurma], [IdAlunoTaxa], [StCobrancaServicoFinanceiro], [StTurmaTaxaRemovido], [LIQ_DataDevolucao], [DataFaturamento], [NFe_NumeroRPS], [NFe_IdEmpresaRPS], [NFe_AnoMesCompetenciaRPS], [IdAlunoTurmaReserva], [LIQ_IdContaDevolucao], [IdAlunoServico], [LIQ_IdChequeDevolucao], [IdDisciplina], [IdNotaFiscal] FROM TbLancamentoCobranca
	GO 





--3 CREATE TRIGGER ON PK Tabela base -------------------------------------------
	SET ANSI_NULLS ON
	GO 
	
	SET QUOTED_IDENTIFIER ON
	GO 

	--
	-- Activesoft Consultoria 
	-- TRIGGER criada pelo Activesoft Service Pack em 21/01/2020 durante atualiza????o para vers??o 1.065.xxx.
	--
	
	
	CREATE TRIGGER [dbo].[TgLancamentoCobranca_Auditoria] ON [dbo].[TbLancamentoCobranca]
	--ALTER TRIGGER [dbo].[TgLancamentoCobranca_Auditoria] ON [dbo].[TbLancamentoCobranca]
	FOR INSERT, UPDATE, DELETE
	AS
	BEGIN
		SET NOCOUNT ON
	
		IF ( SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS c WHERE DATA_TYPE NOT IN ( 'text', 'image' ) AND TABLE_NAME = 'TbLancamentoCobranca' AND LEFT(COLUMN_NAME,1) <> '_' ) <> 31 
		  BEGIN
			RAISERROR ('Dados n??o podem ser alterados (trigger de auditoria TgLancamentoCobranca_Auditoria inv??lida -- quantidade de campos)', 16, 1) 
			ROLLBACK TRANSACTION 
			RETURN 
		  END 
	
		
		  
		DECLARE @IdUsuario INTEGER
		IF APP_NAME() = 'SIGAWEB'
			SELECT	@IdUsuario = IdUsuario
			FROM	dbo.FnCriarTabelaTemporaria(HOST_NAME())		
		ELSE IF OBJECT_ID( 'tempdb..#TempTable') IS NULL 
		  BEGIN 
			--RAISERROR ('Dados n??o podem ser alterados (autentica????o)', 16, 1) 
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
			INSERT	TbLancamentoCobranca_Auditoria (	Audit_DataHora,	Audit_Operacao,	Audit_IdUsuario,	[IdLancamentoCobranca], [IdTituloCobrancaGerado], [IdUnidade], [ParcelaCobranca], [IdLoteCobranca], [IdServico], [ValorServico], [LIQ_ValorDescontoNaoCondicionado], [LIQ_ValorDescontoCondicionado], [LIQ_ValorDescontoConcedido], [LIQ_ValorMultaCalculado], [LIQ_ValorJurosCalculado], [LIQ_ValorRecebidoPrincipal], [LIQ_ValorRecebidoMulta], [LIQ_ValorRecebidoJuros], [LIQ_ValorPendenteAMenor], [IdTurma], [IdAlunoTaxa], [StCobrancaServicoFinanceiro], [StTurmaTaxaRemovido], [LIQ_DataDevolucao], [DataFaturamento], [NFe_NumeroRPS], [NFe_IdEmpresaRPS], [NFe_AnoMesCompetenciaRPS], [IdAlunoTurmaReserva], [LIQ_IdContaDevolucao], [IdAlunoServico], [LIQ_IdChequeDevolucao], [IdDisciplina], [IdNotaFiscal] )
			SELECT										GETDATE(),		@TipoOperacao,	@IdUsuario, 		[IdLancamentoCobranca], [IdTituloCobrancaGerado], [IdUnidade], [ParcelaCobranca], [IdLoteCobranca], [IdServico], [ValorServico], [LIQ_ValorDescontoNaoCondicionado], [LIQ_ValorDescontoCondicionado], [LIQ_ValorDescontoConcedido], [LIQ_ValorMultaCalculado], [LIQ_ValorJurosCalculado], [LIQ_ValorRecebidoPrincipal], [LIQ_ValorRecebidoMulta], [LIQ_ValorRecebidoJuros], [LIQ_ValorPendenteAMenor], [IdTurma], [IdAlunoTaxa], [StCobrancaServicoFinanceiro], [StTurmaTaxaRemovido], [LIQ_DataDevolucao], [DataFaturamento], [NFe_NumeroRPS], [NFe_IdEmpresaRPS], [NFe_AnoMesCompetenciaRPS], [IdAlunoTurmaReserva], [LIQ_IdContaDevolucao], [IdAlunoServico], [LIQ_IdChequeDevolucao], [IdDisciplina], [IdNotaFiscal]
			FROM	deleted
		ELSE
			INSERT	TbLancamentoCobranca_Auditoria (	Audit_DataHora,	Audit_Operacao,	Audit_IdUsuario,	[IdLancamentoCobranca], [IdTituloCobrancaGerado], [IdUnidade], [ParcelaCobranca], [IdLoteCobranca], [IdServico], [ValorServico], [LIQ_ValorDescontoNaoCondicionado], [LIQ_ValorDescontoCondicionado], [LIQ_ValorDescontoConcedido], [LIQ_ValorMultaCalculado], [LIQ_ValorJurosCalculado], [LIQ_ValorRecebidoPrincipal], [LIQ_ValorRecebidoMulta], [LIQ_ValorRecebidoJuros], [LIQ_ValorPendenteAMenor], [IdTurma], [IdAlunoTaxa], [StCobrancaServicoFinanceiro], [StTurmaTaxaRemovido], [LIQ_DataDevolucao], [DataFaturamento], [NFe_NumeroRPS], [NFe_IdEmpresaRPS], [NFe_AnoMesCompetenciaRPS], [IdAlunoTurmaReserva], [LIQ_IdContaDevolucao], [IdAlunoServico], [LIQ_IdChequeDevolucao], [IdDisciplina], [IdNotaFiscal] )
			SELECT										GETDATE(),		@TipoOperacao,	@IdUsuario, 		[IdLancamentoCobranca], [IdTituloCobrancaGerado], [IdUnidade], [ParcelaCobranca], [IdLoteCobranca], [IdServico], [ValorServico], [LIQ_ValorDescontoNaoCondicionado], [LIQ_ValorDescontoCondicionado], [LIQ_ValorDescontoConcedido], [LIQ_ValorMultaCalculado], [LIQ_ValorJurosCalculado], [LIQ_ValorRecebidoPrincipal], [LIQ_ValorRecebidoMulta], [LIQ_ValorRecebidoJuros], [LIQ_ValorPendenteAMenor], [IdTurma], [IdAlunoTaxa], [StCobrancaServicoFinanceiro], [StTurmaTaxaRemovido], [LIQ_DataDevolucao], [DataFaturamento], [NFe_NumeroRPS], [NFe_IdEmpresaRPS], [NFe_AnoMesCompetenciaRPS], [IdAlunoTurmaReserva], [LIQ_IdContaDevolucao], [IdAlunoServico], [LIQ_IdChequeDevolucao], [IdDisciplina], [IdNotaFiscal]
			FROM	inserted
	END
	GO




--4 DROP TRIGGERs ANTIGA ON PK Tabela base -------------------------------------------
DROP TRIGGER [dbo].[TgAudit_TbLancamentoCobrancaD]
GO

DROP TRIGGER [dbo].[TgAudit_TbLancamentoCobrancaI]
GO

DROP TRIGGER [dbo].[TgAudit_TbLancamentoCobrancaU]
GO
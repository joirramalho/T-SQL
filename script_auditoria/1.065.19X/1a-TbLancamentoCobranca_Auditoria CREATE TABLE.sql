SET ANSI_NULLS OFF

SET QUOTED_IDENTIFIER ON

CREATE TABLE dbo.TbLancamentoCobranca_Auditoria (
	[IdLancamentoCobrancaAuditoria] [bigint] IDENTITY(1,1) NOT NULL,
	[DataHora] [datetime] NOT NULL,
	[Operacao] [char](1) NOT NULL,
	[IdUsuario] [int] NULL,

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
) ON [PRIMARY];

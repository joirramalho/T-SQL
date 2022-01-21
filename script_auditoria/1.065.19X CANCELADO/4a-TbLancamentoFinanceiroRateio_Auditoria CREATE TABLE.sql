SET ANSI_NULLS OFF

SET QUOTED_IDENTIFIER ON


CREATE TABLE dbo.TbLancamentoFinanceiroRateio_Auditoria (
	[IdLancamentoFinanceiroRateioAuditoria] [bigint] IDENTITY(1,1) NOT NULL,
	[DataHora] [datetime] NOT NULL,
	[Operacao] [char](1) NOT NULL,
	[IdUsuario] [int] NULL,

	IdLancamentoFinanceiroRateio int NULL,
	IdLancamentoFinanceiro int NULL,
	IdEmpresa int NULL,
	IdPlanoContas int NULL,
	ValorEntradaSaida char(1) COLLATE SQL_Latin1_General_CP1_CI_AI NULL,
	ValorAbsoluto numeric(12,2) NULL,
	AnoMesCompetencia char(6) COLLATE SQL_Latin1_General_CP1_CI_AI NULL,
	Comentario varchar(1000) COLLATE SQL_Latin1_General_CP1_CI_AI NULL,
	OrigemIdentificador varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AI NULL,
	IdCentroResultado int NULL,
	CONSTRAINT PK_TbLancamentoFinanceiroRateio_Auditoria PRIMARY KEY CLUSTERED  
(
	[IdLancamentoFinanceiroRateioAuditoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY];

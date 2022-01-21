SET ANSI_NULLS OFF

SET QUOTED_IDENTIFIER ON


CREATE TABLE dbo.TbLancamentoCobrancaDesconto_Auditoria (
	[IdLancamentoCobrancaDescontoAuditoria] [bigint] IDENTITY(1,1) NOT NULL,
	[DataHora] [datetime] NOT NULL,
	[Operacao] [char](1) NOT NULL,
	[IdUsuario] [int] NULL,

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
) ON [PRIMARY];

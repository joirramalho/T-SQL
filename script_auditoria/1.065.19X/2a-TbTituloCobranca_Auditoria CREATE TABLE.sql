SET ANSI_NULLS OFF

SET QUOTED_IDENTIFIER ON


CREATE TABLE dbo.TbTituloCobranca_Auditoria (
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
	CONSTRAINT PK_TbTituloCobranca_Auditoria PRIMARY KEY CLUSTERED  
(
	[IdTituloCobrancaAuditoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY];

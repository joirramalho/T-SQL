SET ANSI_NULLS OFF

SET QUOTED_IDENTIFIER ON


CREATE TABLE dbo.TbLoteCobrancaRegistradaTitulo_Auditoria (
	[IdLoteCobrancaRegistradaTituloAuditoria] [bigint] IDENTITY(1,1) NOT NULL,
	[DataHora] [datetime] NOT NULL,
	[Operacao] [char](1) NOT NULL,
	[IdUsuario] [int] NULL,

	IdLoteCobrancaRegistradaTitulo int NULL,
	IdTituloCobranca int  NULL,
	IdLoteCobrancaRegistrada int  NULL,
	CONSTRAINT PK_TbLoteCobrancaRegistradaTitulo_Auditoria PRIMARY KEY CLUSTERED  
(
	[IdLoteCobrancaRegistradaTituloAuditoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY];

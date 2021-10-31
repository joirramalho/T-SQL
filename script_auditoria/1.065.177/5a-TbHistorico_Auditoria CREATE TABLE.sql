SET ANSI_NULLS OFF
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TbHistorico_Auditoria](
	[IdHistoricoAuditoria] [bigint] IDENTITY(1,1) NOT NULL,
	[DataHora] [datetime] NOT NULL,
	[Operacao] [char](1) NOT NULL,
	[IdUsuario] [int] NULL,

	IdAluno int NOT NULL,
	CodigoSerie varchar(3) NULL,
	AnoConclusao char(6) NULL,
	ResultadoFinal char(1) NULL,
	IdEstabelecimentoEnsino int NULL,
	DiasLetivos smallint NULL,
	CargaHorariaTotal numeric(8,2) NULL,
	Observacao varchar(MAX) NULL,
	IdSerie int NULL,
	CargaHorariaTotalExibicao varchar(10) NULL,
	StCHIgnorarSoma bit NULL,
	FrequenciaTotal varchar(10) NULL,
 CONSTRAINT [PK_TbHistorico_Auditoria] PRIMARY KEY CLUSTERED 
(
	[IdHistoricoAuditoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

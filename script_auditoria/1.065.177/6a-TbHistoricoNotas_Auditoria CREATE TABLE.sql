CREATE TABLE [dbo].[TbHistoricoNotas_Auditoria](
	[IdHistoricoNotasAuditoria] [bigint] IDENTITY(1,1) NOT NULL,
	[DataHora] [datetime] NOT NULL,
	[Operacao] [char](1) NOT NULL,
	[IdUsuario] [int] NULL,


	IdAluno int NULL,
	CodigoSerie varchar(3) NULL,
	AnoConclusao char(6) NULL,
	IdDisciplina int NULL,
	StDependencia tinyint NULL,
	Nota_ numeric(5,2) NULL,
	NotaFinal varchar(15) NULL,
	CargaHorariaAnual numeric(8,2) NULL,
	QuantidadeFaltasAnual smallint NULL,
	ResultadoFinal char(1) NULL,
	IdSerie int NULL,
	CargaHorariaAnualExibicao varchar(10) NULL,
	StCHIgnorarSoma bit NULL,
	IdHistoricoNotas int IDENTITY(1,1) NULL,
 CONSTRAINT [PK_TbHistoricoNotas_Auditoria] PRIMARY KEY CLUSTERED 
(
	[IdHistoricoNotasAuditoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

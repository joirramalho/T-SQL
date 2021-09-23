SET ANSI_NULLS OFF
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TbDiarioAluno_Auditoria](
	[IdDiarioAlunoAuditoria] [bigint] IDENTITY(1,1) NOT NULL,
	[DataHora] [datetime] NOT NULL,
	[Operacao] [char](1) NOT NULL,
	[IdUsuario] [int] NULL,

	[IdDiarioAluno] [int]  NULL,
	[IdDiario] [int]  NULL,
	[IdAluno] [int]  NULL,
	[DataInicial] [smalldatetime] NULL,
	[DataFinal] [smalldatetime] NULL,
 CONSTRAINT [PK_TbDiarioAluno_Auditoria] PRIMARY KEY CLUSTERED 
(
	[IdDiarioAlunoAuditoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO




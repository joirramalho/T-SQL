USE [CRM_183033d]
GO

/****** Object:  Table [dbo].[TbDiarioFrequencia]    Script Date: 08/01/2020 11:02:57 ******/
SET ANSI_NULLS OFF
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TbDiarioFrequencia_Auditoria](
	[IdDiarioFrequenciaAuditoria] [bigint] IDENTITY(1,1) NOT NULL,
	[DataHora] [datetime] NOT NULL,
	[Operacao] [char](1) NOT NULL,
	[IdUsuario] [int] NULL,
	[IdProfessor] [int] NULL,
	[IdDiarioFrequencia] [int]  NULL,
	[IdDiarioAula] [int]  NULL,
	[IdAluno] [int]  NULL,
	[StPresencaFalta] [char](1)  NULL,

 CONSTRAINT [PK_TbDiarioFrequenciaAuditoria] PRIMARY KEY CLUSTERED 
(
	[IdDiarioFrequenciaAuditoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

) ON [PRIMARY]
GO
USE [CRM_183033d]
GO

SET ANSI_NULLS OFF
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TbDiario_Auditoria](
	[IdDiarioAuditoria] [bigint] IDENTITY(1,1) NOT NULL,
	[DataHora] [datetime] NOT NULL,
	[Operacao] [char](1) NOT NULL,
	[IdUsuario] [int] NULL,

	[IdDiario] [int] NULL,
	[IdTurma] [int] NULL,
	[IdDisciplina] [int] NULL,
	[Descricao] [varchar](50) NULL,
	[IdFaseNota] [int] NULL,
	[TipoConfirmacao] [char](1) NULL,
	[QtdeMaximaAulas] [int] NULL,
	[DataLimiteDigitacao] [datetime] NULL,
	[QtdeMinimaAulas] [int] NULL,
	[StRegistroAulaPeriodoFaseNota] [bit] NULL,
	[DataBloqueioDigitacaoAula] [datetime] NULL,
 CONSTRAINT [PK_TbDiario_Auditoria] PRIMARY KEY CLUSTERED 
(
	[IdDiarioAuditoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

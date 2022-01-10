SET ANSI_NULLS OFF

SET QUOTED_IDENTIFIER ON


CREATE TABLE dbo.TbAlunoTurma_Auditoria (
	[IdAlunoTurmaAuditoria] [bigint] IDENTITY(1,1) NOT NULL,
	[DataHora] [datetime] NOT NULL,
	[Operacao] [char](1) NOT NULL,
	[IdUsuario] [int] NULL,

	IdTurma int NULL,
	IdAluno int NULL,
	IdSituacaoAlunoTurma int NULL,
	DataSituacaoAtivo smalldatetime NULL,
	DataSituacaoInativo smalldatetime NULL,
	IdFaseNotaInicial int NULL,
	OrdemChamada smallint  NULL,
	DataHoraEfetivacaoMatricula smalldatetime NULL,
	IdUsuarioEfetivacaoMatricula int NULL,
	IdAlunoCursoSuperior int NULL,
	ProblemaAutorizadoMatricula varchar(6000) COLLATE SQL_Latin1_General_CP1_CI_AI NULL,
	IdUsuarioAutorizacaoMatricula int NULL,
	JustificativaAutorizacaoMatricula varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AI NULL,
	StAlunoTurmaNaoPermitePParcial bit  NULL,
	ES_IdCurriculoOptativa int NULL,
	IdResponsavelFinanceiro int NULL,
	IdTipoResponsavelFinanceiro int NULL,
	IdResponsavelSecundario int NULL,
	IdTipoResponsavelSecundario int NULL,
	IdMotivoInativacao int NULL,
	IdEstabEnsinoInativacao int NULL,
	ComentarioInativacao varchar(600) COLLATE SQL_Latin1_General_CP1_CI_AI NULL,
	Comentario varchar(5000) COLLATE SQL_Latin1_General_CP1_CI_AI NULL,
	IdPlanoPagamento_PreMatricula int NULL,
	IdPlanoPagamento_Matricula int NULL,
	SituacaoExcecao_IdSituacaoAlunoTurma int NULL,
	SituacaoExcecao_IdUsuario int NULL,
	SituacaoExcecao_DataRegistro smalldatetime NULL,
	SituacaoExcecao_Comentario varchar(2000) COLLATE SQL_Latin1_General_CP1_CI_AI NULL,
	IdAlunoCurso int NULL,
	IdEventoTipoInscricao int NULL,
	RMOnline_TextoPersonalizado_Confirmacao varchar(MAX) COLLATE SQL_Latin1_General_CP1_CI_AI NULL,
	StProcessamento_FichaInscricao bit NULL,
	StProcessamento_ConfirmacaoReservaOnline bit NULL,
	StProcessamento_InscricaoEmTurma bit NULL,
	IdAlunoTurma int NULL,

	CONSTRAINT PK_TbAlunoTurma_Auditoria PRIMARY KEY CLUSTERED  
(
	[IdAlunoTurmaAuditoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY];





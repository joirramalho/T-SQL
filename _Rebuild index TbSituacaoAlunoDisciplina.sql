-- DROP FK de [TbFaseNotaAluno] -> TbTurmaDisciplinaAluno
ALTER TABLE [dbo].[TbFaseNotaAluno] DROP CONSTRAINT [FK_TbFaseNotaAluno_TbTurmaDisciplinaAluno]


-- APAGAR IX que 'e CLUSTER
DROP INDEX [IX_TbSituacaoAlunoDisciplina_IdFormulaComposicaoNota] ON [dbo].[TbSituacaoAlunoDisciplina] WITH ( ONLINE = OFF )

	--CREATE CLUSTERED INDEX [IX_TbSituacaoAlunoDisciplina_IdFormulaComposicaoNota] ON [dbo].[TbSituacaoAlunoDisciplina]
	--(
	--	[IdAluno] ASC,
	--	[IdTurma] ASC
	--)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]





---DROP antiga [PK_TbAlunoTurmaDisciplina] NON-Clustered
ALTER TABLE [dbo].[TbSituacaoAlunoDisciplina] DROP CONSTRAINT [PK_TbAlunoTurmaDisciplina]

	--ALTER TABLE [dbo].[TbSituacaoAlunoDisciplina] ADD  CONSTRAINT [PK_TbAlunoTurmaDisciplina] PRIMARY KEY NONCLUSTERED 
	--(
	--	[IdDisciplina] ASC,
	--	[IdTurma] ASC,
	--	[IdAluno] ASC
	--)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]



-- RECRIANDO...

-- pk cluster

BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.TbSituacaoAlunoDisciplina ADD CONSTRAINT
	PK_TbSituacaoAlunoDisciplina PRIMARY KEY CLUSTERED 
	(
	IdSituacaoAlunoDisciplina
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.TbSituacaoAlunoDisciplina SET (LOCK_ESCALATION = TABLE)
GO
COMMIT



--- CRIANDO UK Turma-Aluno-Disciplina
CREATE UNIQUE NONCLUSTERED INDEX [UK_TbSituacaoAlunoDisciplina_IdTurma_IdAluno_IdDisciplina] ON [dbo].[TbSituacaoAlunoDisciplina]
(
	[IdTurma] ASC,
	[IdAluno] ASC,
	[IdDisciplina] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)


---


ALTER TABLE [dbo].[TbFaseNotaAluno]  WITH NOCHECK ADD  CONSTRAINT [FK_TbFaseNotaAluno_TbTurmaDisciplinaAluno] FOREIGN KEY([IdDisciplina], [IdTurma], [IdAluno])
REFERENCES [dbo].[TbSituacaoAlunoDisciplina] ([IdTurma], [IdAluno], [IdDisciplina])
GO

ALTER TABLE [dbo].[TbFaseNotaAluno] CHECK CONSTRAINT [FK_TbFaseNotaAluno_TbTurmaDisciplinaAluno]
GO


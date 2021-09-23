-- Executado em CRM_183374 e CRM_183372



-- TbFaseNota

IF OBJECT_ID('dbo.FK_TbAlunoTurma_TbFaseNota') IS NOT NULL
BEGIN
   ALTER TABLE [dbo].[TbAlunoTurma] DROP CONSTRAINT [FK_TbAlunoTurma_TbFaseNota]
END

IF OBJECT_ID('dbo.FK_TbAlunoTurmaAvaliacaoRelatorio_TbFaseNota') IS NOT NULL
BEGIN
   ALTER TABLE [dbo].[TbAlunoTurmaAvaliacaoRelatorio] DROP CONSTRAINT [FK_TbAlunoTurmaAvaliacaoRelatorio_TbFaseNota]
END

IF OBJECT_ID('dbo.FK_TbDiario_TbFaseNota') IS NOT NULL
BEGIN
   ALTER TABLE [dbo].[TbDiario] DROP CONSTRAINT [FK_TbDiario_TbFaseNota]
END

IF OBJECT_ID('dbo.FK_TbFaseNota_TbFaseNota') IS NOT NULL
BEGIN
   ALTER TABLE [dbo].[TbFaseNota] DROP CONSTRAINT [FK_TbFaseNota_TbFaseNota]
END

IF OBJECT_ID('dbo.FK_TbFaseNota_TbFaseNota1') IS NOT NULL
BEGIN
   ALTER TABLE [dbo].[TbFaseNota] DROP CONSTRAINT [FK_TbFaseNota_TbFaseNota1]
END

IF OBJECT_ID('dbo.FK_TbFaseNotaAluno_TbFaseNota1') IS NOT NULL
BEGIN
   ALTER TABLE [dbo].[TbFaseNotaAluno] DROP CONSTRAINT [FK_TbFaseNotaAluno_TbFaseNota1]
END

IF OBJECT_ID('dbo.FK_TbFaseNotaDisciplina_TbFaseNota') IS NOT NULL
BEGIN
   ALTER TABLE [dbo].[TbFaseNotaDisciplina] DROP CONSTRAINT [FK_TbFaseNotaDisciplina_TbFaseNota]
END

IF OBJECT_ID('dbo.FK_TbFaseNotaDisciplinaTurma_TbFaseNota') IS NOT NULL
BEGIN
   ALTER TABLE [dbo].[TbFaseNotaDisciplinaTurma] DROP CONSTRAINT [FK_TbFaseNotaDisciplinaTurma_TbFaseNota]
END

IF OBJECT_ID('dbo.FK_TbOptProva_TbFaseNota') IS NOT NULL
BEGIN
   ALTER TABLE [dbo].[TbOptProva] DROP CONSTRAINT [FK_TbOptProva_TbFaseNota]
END

IF OBJECT_ID('dbo.FK_TbOptSimuladoEnem_TbFaseNota_IdFaseNota') IS NOT NULL
BEGIN
   ALTER TABLE [dbo].[TbOptSimuladoEnem] DROP CONSTRAINT [FK_TbOptSimuladoEnem_TbFaseNota_IdFaseNota]
END

IF OBJECT_ID('dbo.FK_TbTurmaDisciplinaAluno_TbFaseNota') IS NOT NULL
BEGIN
   ALTER TABLE [dbo].[TbSituacaoAlunoDisciplina] DROP CONSTRAINT [FK_TbTurmaDisciplinaAluno_TbFaseNota]
END

IF OBJECT_ID('dbo.FK_TbTurmaDisciplinaFaseNota_TbFaseNota') IS NOT NULL
BEGIN
   ALTER TABLE [dbo].[TbTurmaDisciplinaFaseNota] DROP CONSTRAINT [FK_TbTurmaDisciplinaFaseNota_TbFaseNota]
END




-- REMOVER PK INCORRETA
ALTER TABLE [dbo].[TbFaseNota] DROP CONSTRAINT [PK_TbFaseNota]
GO


-- REMOVER IX
ALTER TABLE [dbo].[TbFaseNota] DROP CONSTRAINT [IX_TbFaseNotaNumeroFase] WITH ( ONLINE = OFF )
GO



-- RECRIAR INDEX CLUSTERED
ALTER TABLE [dbo].[TbFaseNota] ADD  CONSTRAINT [PK_TbFaseNota] PRIMARY KEY CLUSTERED 
(
	[IdFaseNota] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO



-- RECRIAR INDEX NONCLUSTERED
ALTER TABLE [dbo].[TbFaseNota] ADD  CONSTRAINT [IX_TbFaseNotaNumeroFase] UNIQUE NONCLUSTERED 
(
	[IdSerie] ASC,
	[IdPeriodo] ASC,
	[NumeroFase] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO







--- RECRIAR FKs                                                                                                                                                                                                                                                                                                                                                                                                                                       
IF	EXISTS		( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbAlunoTurma'	AND COLUMN_NAME = 'IdFaseNotaInicial' )
	AND	EXISTS	( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbFaseNota'		AND COLUMN_NAME = 'IdFaseNota' )
	BEGIN
		ALTER TABLE [dbo].[TbAlunoTurma] WITH CHECK ADD  CONSTRAINT [FK_TbAlunoTurma_TbFaseNota] FOREIGN KEY([IdFaseNotaInicial]) REFERENCES [dbo].[TbFaseNota] ([IdFaseNota])                                                                                           
		ALTER TABLE [dbo].[TbAlunoTurma] CHECK CONSTRAINT [FK_TbAlunoTurma_TbFaseNota]
	END

IF	EXISTS		( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbAlunoTurmaAvaliacaoRelatorio'	AND COLUMN_NAME = 'IdFaseNota' )
	AND	EXISTS	( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbFaseNota'						AND COLUMN_NAME = 'IdFaseNota' )
	BEGIN
		ALTER TABLE [dbo].[TbAlunoTurmaAvaliacaoRelatorio] WITH CHECK ADD  CONSTRAINT [FK_TbAlunoTurmaAvaliacaoRelatorio_TbFaseNota] FOREIGN KEY([IdFaseNota]) REFERENCES [dbo].[TbFaseNota] ([IdFaseNota])                                                              
		ALTER TABLE [dbo].[TbAlunoTurmaAvaliacaoRelatorio] CHECK CONSTRAINT [FK_TbAlunoTurmaAvaliacaoRelatorio_TbFaseNota]
	END

IF	EXISTS		( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbDiario'	AND COLUMN_NAME = 'IdFaseNota' )
	AND	EXISTS	( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbFaseNota'	AND COLUMN_NAME = 'IdFaseNota' )
	BEGIN
		ALTER TABLE [dbo].[TbDiario] WITH CHECK ADD  CONSTRAINT [FK_TbDiario_TbFaseNota] FOREIGN KEY([IdFaseNota]) REFERENCES [dbo].[TbFaseNota] ([IdFaseNota])                                                                                                          
		ALTER TABLE [dbo].[TbDiario] CHECK CONSTRAINT [FK_TbDiario_TbFaseNota]
	END

IF	EXISTS		( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbFaseNota'	AND COLUMN_NAME = 'IdFaseNotaAprovacao' )
	AND	EXISTS	( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbFaseNota'	AND COLUMN_NAME = 'IdFaseNota' )
	BEGIN
		ALTER TABLE [dbo].[TbFaseNota] WITH CHECK ADD  CONSTRAINT [FK_TbFaseNota_TbFaseNota] FOREIGN KEY([IdFaseNotaAprovacao]) REFERENCES [dbo].[TbFaseNota] ([IdFaseNota])                                                                                             
		ALTER TABLE [dbo].[TbFaseNota] CHECK CONSTRAINT [FK_TbFaseNota_TbFaseNota]
	END

IF	EXISTS		( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbFaseNota'	AND COLUMN_NAME = 'IdFaseNotaReprovacao' )
	AND	EXISTS	( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbFaseNota'	AND COLUMN_NAME = 'IdFaseNota' )
	BEGIN
		ALTER TABLE [dbo].[TbFaseNota] WITH CHECK ADD  CONSTRAINT [FK_TbFaseNota_TbFaseNota1] FOREIGN KEY([IdFaseNotaReprovacao]) REFERENCES [dbo].[TbFaseNota] ([IdFaseNota])                                                                                           
		ALTER TABLE [dbo].[TbFaseNota] CHECK CONSTRAINT [FK_TbFaseNota_TbFaseNota1]
	END

IF	EXISTS		( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbFaseNotaAluno'	AND COLUMN_NAME = 'IdFaseNota' )
	AND	EXISTS	( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbFaseNota'			AND COLUMN_NAME = 'IdFaseNota' )
	BEGIN
		ALTER TABLE [dbo].[TbFaseNotaAluno] WITH CHECK ADD  CONSTRAINT [FK_TbFaseNotaAluno_TbFaseNota1] FOREIGN KEY([IdFaseNota]) REFERENCES [dbo].[TbFaseNota] ([IdFaseNota])                                                                                           
		ALTER TABLE [dbo].[TbFaseNotaAluno] CHECK CONSTRAINT [FK_TbFaseNotaAluno_TbFaseNota1]
	END

IF	EXISTS		( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbFaseNotaDisciplina'	AND COLUMN_NAME = 'IdFaseNota' )
	AND	EXISTS	( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbFaseNota'				AND COLUMN_NAME = 'IdFaseNota' )
	BEGIN
		ALTER TABLE [dbo].[TbFaseNotaDisciplina] WITH CHECK ADD  CONSTRAINT [FK_TbFaseNotaDisciplina_TbFaseNota] FOREIGN KEY([IdFaseNota]) REFERENCES [dbo].[TbFaseNota] ([IdFaseNota])                                                                                  
		ALTER TABLE [dbo].[TbFaseNotaDisciplina] CHECK CONSTRAINT [FK_TbFaseNotaDisciplina_TbFaseNota]
	END

IF	EXISTS		( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbFaseNotaDisciplinaTurma'	AND COLUMN_NAME = 'IdFaseNota' )
	AND	EXISTS	( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbFaseNota'					AND COLUMN_NAME = 'IdFaseNota' )
	BEGIN
		ALTER TABLE [dbo].[TbFaseNotaDisciplinaTurma] WITH CHECK ADD  CONSTRAINT [FK_TbFaseNotaDisciplinaTurma_TbFaseNota] FOREIGN KEY([IdFaseNota]) REFERENCES [dbo].[TbFaseNota] ([IdFaseNota])                                                                        
		ALTER TABLE [dbo].[TbFaseNotaDisciplinaTurma] CHECK CONSTRAINT [FK_TbFaseNotaDisciplinaTurma_TbFaseNota]
	END

IF	EXISTS		( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbOptProva'	AND COLUMN_NAME = 'IdFaseNota' )
	AND	EXISTS	( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbFaseNota'	AND COLUMN_NAME = 'IdFaseNota' )
	BEGIN
		ALTER TABLE [dbo].[TbOptProva] WITH CHECK ADD  CONSTRAINT [FK_TbOptProva_TbFaseNota] FOREIGN KEY([IdFaseNota]) REFERENCES [dbo].[TbFaseNota] ([IdFaseNota])                                                                                                      
		ALTER TABLE [dbo].[TbOptProva] CHECK CONSTRAINT [FK_TbOptProva_TbFaseNota]
	END

IF	EXISTS		( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbOptSimuladoEnem'	AND COLUMN_NAME = 'IdFaseNota' )
	AND	EXISTS	( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbFaseNota'			AND COLUMN_NAME = 'IdFaseNota' )
	BEGIN
		ALTER TABLE [dbo].[TbOptSimuladoEnem] WITH CHECK ADD  CONSTRAINT [FK_TbOptSimuladoEnem_TbFaseNota_IdFaseNota] FOREIGN KEY([IdFaseNota]) REFERENCES [dbo].[TbFaseNota] ([IdFaseNota])                                                                             
		ALTER TABLE [dbo].[TbOptSimuladoEnem] CHECK CONSTRAINT [FK_TbOptSimuladoEnem_TbFaseNota_IdFaseNota]
	END

IF	EXISTS		( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbSituacaoAlunoDisciplina'	AND COLUMN_NAME = 'IdFaseNotaAtual' )
	AND	EXISTS	( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbFaseNota'					AND COLUMN_NAME = 'IdFaseNota' )
	BEGIN
		ALTER TABLE [dbo].[TbSituacaoAlunoDisciplina] WITH CHECK ADD  CONSTRAINT [FK_TbTurmaDisciplinaAluno_TbFaseNota] FOREIGN KEY([IdFaseNotaAtual]) REFERENCES [dbo].[TbFaseNota] ([IdFaseNota])                                                                      
		ALTER TABLE [dbo].[TbSituacaoAlunoDisciplina] CHECK CONSTRAINT [FK_TbTurmaDisciplinaAluno_TbFaseNota]
	END

IF	EXISTS		( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbTurmaDisciplinaFaseNota'	AND COLUMN_NAME = 'IdFaseNota' )
	AND	EXISTS	( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbFaseNota'					AND COLUMN_NAME = 'IdFaseNota' )
	BEGIN
		ALTER TABLE [dbo].[TbTurmaDisciplinaFaseNota] WITH CHECK ADD  CONSTRAINT [FK_TbTurmaDisciplinaFaseNota_TbFaseNota] FOREIGN KEY([IdFaseNota]) REFERENCES [dbo].[TbFaseNota] ([IdFaseNota])                                                                        
		ALTER TABLE [dbo].[TbTurmaDisciplinaFaseNota] CHECK CONSTRAINT [FK_TbTurmaDisciplinaFaseNota_TbFaseNota]
	END
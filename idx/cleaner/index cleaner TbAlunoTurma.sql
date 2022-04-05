--28mar22 -- Executado em todos e passado PARA ANDERSON em 28mar22 por slack.

--sp_help TbAlunoTurma

--VPS08, 04, 11, 01; 	09 dbSigaA *, 12, 10, 07, 06, 05, 03, 02


EXEC dbo.sp_foreachdb N'
    USE ?

	IF EXISTS( SELECT * FROM sys.indexes WHERE name=''IX_TbAlunoTurma_AlunoTurmaOrdem'' AND object_id = OBJECT_ID(''dbo.TbAlunoTurma'') )
	BEGIN
		PRINT DB_NAME()  


		DROP INDEX [IX_TbAlunoTurma_AlunoTurmaOrdem] ON [dbo].[TbAlunoTurma] WITH ( ONLINE = OFF )



		ALTER TABLE [dbo].[TbAlunoTurmaObservacao] DROP CONSTRAINT [FK_TbAlunoTurmaObservacao_TbAlunoTurma]
		
		ALTER TABLE [dbo].[TbAlunoTurmaAvaliacaoRelatorio] DROP CONSTRAINT [FK_TbAlunoTurmaAvaliacaoRelatorio_TbAlunoTurma]
		
		ALTER TABLE [dbo].[TbAlunoTurmaAlternativa] DROP CONSTRAINT [FK_TbAlunoTurmaAlternativa_TbAlunoTurma_Alternativa]
		
		ALTER TABLE [dbo].[TbAlunoTurmaAlternativa] DROP CONSTRAINT [FK_TbAlunoTurmaAlternativa_TbAlunoTurma_Principal]
		
		ALTER TABLE [dbo].[TbAlunoTurmaProcedimentoMatricula] DROP CONSTRAINT [FK_TbAlunoTurmaProcedimentoMatricula_TbAlunoTurma]
		
		ALTER TABLE [dbo].[TbSituacaoAlunoDisciplina] DROP CONSTRAINT [FK_TbTurmaDisciplinaAluno_TbAlunoTurma]
		
		ALTER TABLE [dbo].[TbMetaFaseNotaAluno] DROP CONSTRAINT [FK_TbMetaFaseNotaAluno_TbAlunoTurma]
		
		ALTER TABLE [dbo].[TbAlunoTurmaProcedimentoMatriculaHistorico] DROP CONSTRAINT [FK_TbAlunoTurmaProcedimentoMatriculaHistorico_TbAlunoTurma]
		
		ALTER TABLE [dbo].[TbFaseNotaAluno] DROP CONSTRAINT [FK_TbFaseNotaAluno_TbAlunoTurma]
		
		ALTER TABLE [dbo].[TbAlunoTurmaDocumento] DROP CONSTRAINT [FK_TbAlunoTurma]
		


				IF EXISTS( SELECT * FROM sys.indexes WHERE name=''PK_TbAlunoTurma'' AND object_id = OBJECT_ID(''dbo.TbAlunoTurma'') )
				BEGIN
					ALTER TABLE [dbo].[TbAlunoTurma] DROP CONSTRAINT [PK_TbAlunoTurma]
				END
				ELSE
			      	PRINT  ''  NÃO tem PK_TbAlunoTurma''


				IF EXISTS( SELECT * FROM sys.indexes WHERE name=''UK_TbAlunoTurma_IdAlunoTurma'' AND object_id = OBJECT_ID(''dbo.TbAlunoTurma'') )
				BEGIN
					ALTER TABLE [dbo].[TbAlunoTurma] DROP CONSTRAINT [UK_TbAlunoTurma_IdAlunoTurma]
				END
				ELSE
			      	PRINT  ''  NÃO tem UK_TbAlunoTurma_IdAlunoTurma''


	---
	
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

		ALTER TABLE dbo.TbAlunoTurma
			DROP CONSTRAINT IX_TbAlunoTurmaOrdemChamada

		ALTER TABLE dbo.TbAlunoTurma SET (LOCK_ESCALATION = TABLE)

		COMMIT
	


		ALTER TABLE [dbo].[TbAlunoTurma] ADD  CONSTRAINT [PK_TbAlunoTurma] PRIMARY KEY CLUSTERED 
		(
			[IdAlunoTurma] ASC
		)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]



		ALTER TABLE [dbo].[TbAlunoTurma] ADD  CONSTRAINT [UK_TbAlunoTurma_IdTurma_IdAluno] UNIQUE NONCLUSTERED 
		(
			[IdTurma] ASC,
			[IdAluno] ASC
		)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]





		ALTER TABLE [dbo].[TbAlunoTurmaDocumento]  WITH CHECK ADD  CONSTRAINT [FK_TbAlunoTurma] FOREIGN KEY([IdAlunoTurma])	REFERENCES [dbo].[TbAlunoTurma] ([IdAlunoTurma])
		ALTER TABLE [dbo].[TbAlunoTurmaDocumento] CHECK CONSTRAINT [FK_TbAlunoTurma]
		
		
		ALTER TABLE [dbo].[TbAlunoTurmaObservacao]  WITH CHECK ADD  CONSTRAINT [FK_TbAlunoTurmaObservacao_TbAlunoTurma] FOREIGN KEY([IdTurma], [IdAluno])	REFERENCES [dbo].[TbAlunoTurma] ([IdTurma], [IdAluno])
		ALTER TABLE [dbo].[TbAlunoTurmaObservacao] CHECK CONSTRAINT [FK_TbAlunoTurmaObservacao_TbAlunoTurma]
		
		
		
		ALTER TABLE [dbo].[TbAlunoTurmaAvaliacaoRelatorio]  WITH CHECK ADD  CONSTRAINT [FK_TbAlunoTurmaAvaliacaoRelatorio_TbAlunoTurma] FOREIGN KEY([IdTurma], [IdAluno])	REFERENCES [dbo].[TbAlunoTurma] ([IdTurma], [IdAluno])
		ALTER TABLE [dbo].[TbAlunoTurmaAvaliacaoRelatorio] CHECK CONSTRAINT [FK_TbAlunoTurmaAvaliacaoRelatorio_TbAlunoTurma]
		
		
		
		ALTER TABLE [dbo].[TbAlunoTurmaAlternativa]  WITH CHECK ADD  CONSTRAINT [FK_TbAlunoTurmaAlternativa_TbAlunoTurma_Alternativa] FOREIGN KEY([IdTurmaAlternativa], [IdAluno])	REFERENCES [dbo].[TbAlunoTurma] ([IdTurma], [IdAluno])
		ALTER TABLE [dbo].[TbAlunoTurmaAlternativa] CHECK CONSTRAINT [FK_TbAlunoTurmaAlternativa_TbAlunoTurma_Alternativa]
		
		
		
		ALTER TABLE [dbo].[TbAlunoTurmaAlternativa]  WITH CHECK ADD  CONSTRAINT [FK_TbAlunoTurmaAlternativa_TbAlunoTurma_Principal] FOREIGN KEY([IdTurmaPrincipal], [IdAluno])	REFERENCES [dbo].[TbAlunoTurma] ([IdTurma], [IdAluno])
		ALTER TABLE [dbo].[TbAlunoTurmaAlternativa] CHECK CONSTRAINT [FK_TbAlunoTurmaAlternativa_TbAlunoTurma_Principal]
		
		
		ALTER TABLE [dbo].[TbAlunoTurmaProcedimentoMatricula]  WITH CHECK ADD  CONSTRAINT [FK_TbAlunoTurmaProcedimentoMatricula_TbAlunoTurma] FOREIGN KEY([IdTurma], [IdAluno])	REFERENCES [dbo].[TbAlunoTurma] ([IdTurma], [IdAluno])
		ALTER TABLE [dbo].[TbAlunoTurmaProcedimentoMatricula] CHECK CONSTRAINT [FK_TbAlunoTurmaProcedimentoMatricula_TbAlunoTurma]
		
		
		ALTER TABLE [dbo].[TbAlunoTurmaProcedimentoMatriculaHistorico]  WITH CHECK ADD  CONSTRAINT [FK_TbAlunoTurmaProcedimentoMatriculaHistorico_TbAlunoTurma] FOREIGN KEY([IdTurma], [IdAluno])	REFERENCES [dbo].[TbAlunoTurma] ([IdTurma], [IdAluno])
		ALTER TABLE [dbo].[TbAlunoTurmaProcedimentoMatriculaHistorico] CHECK CONSTRAINT [FK_TbAlunoTurmaProcedimentoMatriculaHistorico_TbAlunoTurma]
		
		
		
		ALTER TABLE [dbo].[TbSituacaoAlunoDisciplina]  WITH NOCHECK ADD  CONSTRAINT [FK_TbTurmaDisciplinaAluno_TbAlunoTurma] FOREIGN KEY([IdTurma], [IdAluno])	REFERENCES [dbo].[TbAlunoTurma] ([IdTurma], [IdAluno])
		ALTER TABLE [dbo].[TbSituacaoAlunoDisciplina] CHECK CONSTRAINT [FK_TbTurmaDisciplinaAluno_TbAlunoTurma]
		
		
		ALTER TABLE [dbo].[TbMetaFaseNotaAluno]  WITH CHECK ADD  CONSTRAINT [FK_TbMetaFaseNotaAluno_TbAlunoTurma] FOREIGN KEY([IdTurma], [IdAluno])	REFERENCES [dbo].[TbAlunoTurma] ([IdTurma], [IdAluno])
		ALTER TABLE [dbo].[TbMetaFaseNotaAluno] CHECK CONSTRAINT [FK_TbMetaFaseNotaAluno_TbAlunoTurma]
		
		
		ALTER TABLE [dbo].[TbFaseNotaAluno]  WITH NOCHECK ADD  CONSTRAINT [FK_TbFaseNotaAluno_TbAlunoTurma] FOREIGN KEY([IdTurma], [IdAluno])	REFERENCES [dbo].[TbAlunoTurma] ([IdTurma], [IdAluno])
		ALTER TABLE [dbo].[TbFaseNotaAluno] CHECK CONSTRAINT [FK_TbFaseNotaAluno_TbAlunoTurma]

--
--
--		-- wait for 1 second
		WAITFOR DELAY ''00:00:05''


	END


--	VPS08, 04, 11, 01
	IF NOT EXISTS( SELECT * FROM sys.indexes WHERE name=''IX_TbAlunoTurma_IdAluno'' AND object_id = OBJECT_ID(''dbo.TbAlunoTurma'') )
	BEGIN
		CREATE INDEX IX_TbAlunoTurma_IdAluno ON [dbo].[TbAlunoTurma]	([IdAluno])	WITH (FILLFACTOR=90)
	END
'
,@print_command_only = 0 -- Obrigatório Gerar script
,@print_dbname=0
,@state_desc = N'ONLINE'
,@user_only = 1
,@suppress_quotename=1
-- ,@database_list = 'dbSigaBemMeQuer, dbSigaCordIMH, dbSigaCristoRedentor, dbSigaEvolucao, dbSigaImaCorMaria, dbSigaMadreDeusUnd1, dbSigaMadreDeusUnd2';
,@name_pattern='dbSiga';  --   dbActive -- dbBib

-- 16mar22 -- Executado em todos e passado PARA ANDERSON em 28mar22 por Slack.

-- SQL08, 01, 02, 03, 04, 05, 06, 07, 09, 10, 11, 12...

EXEC dbo.sp_foreachdb N'
    USE ?

	PRINT DB_NAME()  

--
	IF EXISTS( SELECT * FROM sys.indexes WHERE name=''IX_TbSituacaoAlunoDisciplina_IdFormulaComposicaoNota'' AND object_id = OBJECT_ID(''dbo.TbSituacaoAlunoDisciplina'') )	
	BEGIN

		IF OBJECT_ID(''dbo.FK_TbFaseNotaAluno_TbTurmaDisciplinaAluno'') IS NOT NULL
	    BEGIN
			ALTER TABLE [dbo].[TbFaseNotaAluno] DROP CONSTRAINT [FK_TbFaseNotaAluno_TbTurmaDisciplinaAluno]
	    END
		ELSE
	      	PRINT  ''NÃO tem FK_TbFaseNotaAluno_TbTurmaDisciplinaAluno''


			IF EXISTS( SELECT * FROM sys.indexes WHERE name=''IX_TbSituacaoAlunoDisciplina_IdFormulaComposicaoNota'' AND object_id = OBJECT_ID(''dbo.TbSituacaoAlunoDisciplina'') )
			BEGIN
				DROP INDEX [IX_TbSituacaoAlunoDisciplina_IdFormulaComposicaoNota] ON [dbo].[TbSituacaoAlunoDisciplina] WITH ( ONLINE = OFF )
			END
			ELSE
		      	PRINT  '' NÃO tem IX_TbSituacaoAlunoDisciplina_IdFormulaComposicaoNota''


				IF EXISTS( SELECT * FROM sys.indexes WHERE name=''PK_TbAlunoTurmaDisciplina'' AND object_id = OBJECT_ID(''dbo.TbSituacaoAlunoDisciplina'') )
				BEGIN
					ALTER TABLE [dbo].[TbSituacaoAlunoDisciplina] DROP CONSTRAINT [PK_TbAlunoTurmaDisciplina]
				END
				ELSE
			      	PRINT  ''  NÃO tem PK_TbAlunoTurmaDisciplina''



		IF NOT EXISTS( SELECT * FROM sys.indexes WHERE name=''PK_TbSituacaoAlunoDisciplina'' AND object_id = OBJECT_ID(''dbo.TbSituacaoAlunoDisciplina'') )
		BEGIN
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

			ALTER TABLE dbo.TbSituacaoAlunoDisciplina ADD CONSTRAINT
				PK_TbSituacaoAlunoDisciplina PRIMARY KEY CLUSTERED 
				(
				IdSituacaoAlunoDisciplina
				) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
			

			ALTER TABLE dbo.TbSituacaoAlunoDisciplina SET (LOCK_ESCALATION = TABLE)

			COMMIT

	      	PRINT  ''       RECRIADA PK_TbSituacaoAlunoDisciplina''
		END



		IF NOT EXISTS( SELECT * FROM sys.indexes WHERE name=''UK_TbSituacaoAlunoDisciplina_IdTurma_IdAluno_IdDisciplina'' AND object_id = OBJECT_ID(''dbo.TbSituacaoAlunoDisciplina'') )
		BEGIN
			CREATE UNIQUE NONCLUSTERED INDEX [UK_TbSituacaoAlunoDisciplina_IdTurma_IdAluno_IdDisciplina] ON [dbo].[TbSituacaoAlunoDisciplina]
			(
				[IdTurma] ASC,
				[IdAluno] ASC,
				[IdDisciplina] ASC
			)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)

	      	PRINT  ''       RECRIADA UK_TbSituacaoAlunoDisciplina_IdTurma_IdAluno_IdDisciplina RECRIADA''
		END



		IF OBJECT_ID(''dbo.FK_TbFaseNotaAluno_TbTurmaDisciplinaAluno'') IS NULL
	    BEGIN
			ALTER TABLE [dbo].[TbFaseNotaAluno]  WITH NOCHECK ADD  CONSTRAINT [FK_TbFaseNotaAluno_TbTurmaDisciplinaAluno] FOREIGN KEY([IdTurma], [IdAluno], [IdDisciplina])
			REFERENCES [dbo].[TbSituacaoAlunoDisciplina] ([IdTurma], [IdAluno], [IdDisciplina])
			
			ALTER TABLE [dbo].[TbFaseNotaAluno] CHECK CONSTRAINT [FK_TbFaseNotaAluno_TbTurmaDisciplinaAluno]

	      	PRINT  ''       RECRIADA FK_TbFaseNotaAluno_TbTurmaDisciplinaAluno''
		END


		-- wait for 1 second
		WAITFOR DELAY ''00:00:05''


	END



--    IF EXISTS( SELECT * FROM sys.indexes WHERE name=''IX_TbSituacaoAlunoDisciplina_IdDisciplina'' AND object_id = OBJECT_ID(''dbo.TbSituacaoAlunoDisciplina'') )
--        BEGIN
--            DROP INDEX [IX_TbSituacaoAlunoDisciplina_IdDisciplina] ON [?].[dbo].[TbSituacaoAlunoDisciplina]
--        END
--	ELSE
--			PRINT  ''  não tem IX_TbSituacaoAlunoDisciplina_IdDisciplina''

   

--	IF NOT EXISTS( SELECT * FROM sys.indexes WHERE name=''UQ_TbBibLocalPublicacao_LocalPublicacao'' AND object_id = OBJECT_ID(''dbo.TbTituloCobranca'') )
--        BEGIN
--			SET ANSI_PADDING ON
--
--
--			CREATE UNIQUE NONCLUSTERED INDEX UQ_TbBibLocalPublicacao_LocalPublicacao ON dbo.TbTituloCobranca (  SituacaoTituloCobranca ASC  )  	 INCLUDE ( IdFormaRecebimento ) WITH (FILLFACTOR=90)
--        END
--	ELSE
--		begin
--			PRINT  ''já tem UQ_TbBibLocalPublicacao_LocalPublicacao''
--		end




'
,@print_command_only = 0 -- Obrigatório Gerar script
,@print_dbname=0
,@state_desc = N'ONLINE'
,@user_only = 1
,@suppress_quotename=1
-- ,@database_list = 'dbSigaBemMeQuer, dbSigaCordIMH, dbSigaCristoRedentor, dbSigaEvolucao, dbSigaImaCorMaria, dbSigaMadreDeusUnd1, dbSigaMadreDeusUnd2';
,@name_pattern='dbSiga';  --   dbActive -- dbBib

--dbSigaGGE	dbSigaCEJUVPIAMARTA	dbSigaIEPAM	dbSigaColegioEAG	dbSigaCOLTIRADENTES	dbSigaPotiguarEnferm	dbSigaENSVitoriasRN	dbSigaPedacinhoCeuDF	dbSigaAlternativoPE	dbSigaAraraAzul	dbSigaIETiangua	dbSigaISO	dbSigaRuyBarbosaPE	dbSigaPH3CV
--

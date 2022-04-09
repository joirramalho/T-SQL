-- 31mar22 -- Executado em todos e passado PARA ANDERSON em 31/março/2022; revisado com ANDERSON em 07abr22


-- NEVES; GGE; dbSigaSalesianoDomBosco

-- VPS08
-- VPS04 dbSigaSale*..., VPS04 todos; VPS06 ELO e demais;
-- VPS11; VPS05; VPS09; VPS01; VPS02; VPS03; VPS07; VPS10; 

-- VPS12

EXEC dbo.sp_foreachdb N'
    USE ?


--Se CRIAR NOVO IdFaseNotaAluno DEVE TbFaseNotaAluno_Auditoria, Add IdFaseNotaAluno, Ajust trigger



--					IF EXISTS( SELECT * FROM sys.indexes WHERE name=''IX_TbFaseNotaAluno_IdDisciplina'' AND object_id = OBJECT_ID(''dbo.TbFaseNotaAluno'') )
--					    BEGIN
--					      DROP INDEX [IX_TbFaseNotaAluno_IdDisciplina] ON [?].[dbo].[TbFaseNotaAluno]
--					
--					    END
--					
--					
--					  IF EXISTS( SELECT * FROM sys.indexes WHERE name=''IX_TbFaseNotaAluno_IdAluno'' AND object_id = OBJECT_ID(''dbo.TbFaseNotaAluno'') )
--					    BEGIN
--					      DROP INDEX [IX_TbFaseNotaAluno_IdAluno] ON [?].[dbo].[TbFaseNotaAluno]
--					    END
--					
--					
--						IF EXISTS( SELECT * FROM sys.indexes WHERE name=''IX_TbFaseNotaAluno_TbFormula'' AND object_id = OBJECT_ID(''dbo.TbFaseNotaAluno'') )
--						    BEGIN
--						      DROP INDEX [IX_TbFaseNotaAluno_TbFormula] ON [?].[dbo].[TbFaseNotaAluno]
--						    END
--					
--					
--						IF EXISTS( SELECT * FROM sys.indexes WHERE name=''IX_TbFaseNotaAlunoAlunoTurmaFase'' AND object_id = OBJECT_ID(''dbo.TbFaseNotaAluno'') )
--						BEGIN
--						  DROP INDEX [IX_TbFaseNotaAlunoAlunoTurmaFase] ON [?].[dbo].[TbFaseNotaAluno]
--						END
--					 
--						IF EXISTS( SELECT * FROM sys.indexes WHERE name=''IX_TbFaseNotaAluno_IdFaseNota'' AND object_id = OBJECT_ID(''dbo.TbFaseNotaAluno'') )
--						BEGIN
--						  DROP INDEX [IX_TbFaseNotaAluno_IdFaseNota] ON [?].[dbo].[TbFaseNotaAluno]
--					
--						      	PRINT  ''  tem IX_TbFaseNotaAluno_IdFaseNota''
--						END

	IF EXISTS( SELECT * FROM sys.indexes WHERE name=''IX_TbFaseNotaAluno_IdTurma'' AND object_id = OBJECT_ID(''dbo.TbFaseNotaAluno'') )
	BEGIN

		PRINT DB_NAME()  


		IF EXISTS( SELECT * FROM sys.indexes WHERE name=''IX_TbFaseNotaAluno_IdTurma'' AND object_id = OBJECT_ID(''dbo.TbFaseNotaAluno'') )
		BEGIN
			DROP INDEX [IX_TbFaseNotaAluno_IdTurma] ON [dbo].[TbFaseNotaAluno] WITH ( ONLINE = OFF )
		END
		ELSE
	      	PRINT  '' NÃO tem IX_TbFaseNotaAluno_IdTurma''




		IF EXISTS( SELECT * FROM sys.indexes WHERE name=''PK_TbFaseNotaAluno'' AND object_id = OBJECT_ID(''dbo.TbFaseNotaAluno'') )
		BEGIN
			ALTER TABLE [dbo].[TbFaseNotaAluno] DROP CONSTRAINT [PK_TbFaseNotaAluno] WITH ( ONLINE = OFF )
		END
		ELSE
	      	PRINT  '' NÃO tem PK_TbFaseNotaAluno''





		ALTER TABLE [dbo].[TbFaseNotaAluno] ADD  CONSTRAINT [PK_TbFaseNotaAluno] PRIMARY KEY CLUSTERED 
		(
			[IdTurma] ASC,
			[IdDisciplina] ASC,
			[IdFaseNota] ASC,
			[IdAluno] ASC
		)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

--
--
--		-- wait for 1 second
		WAITFOR DELAY ''00:00:05''


	END

'
,@print_command_only = 0 -- Obrigatório Gerar script
,@print_dbname=0
,@state_desc = N'ONLINE'
,@user_only = 1
,@suppress_quotename=1
-- ,@database_list = 'dbSigaBemMeQuer, dbSigaCordIMH, dbSigaCristoRedentor, dbSigaEvolucao, dbSigaImaCorMaria, dbSigaMadreDeusUnd1, dbSigaMadreDeusUnd2';
,@name_pattern='dbSiga';  --   dbActive -- dbBib

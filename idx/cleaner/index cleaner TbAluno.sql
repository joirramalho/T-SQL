-- 28abr22
-- 01abr22 -- Executado em todos e passado PARA ANDERSON ...

-- VPS08; VPS04; VPS11; VPS06; VPS09; VPS01; VPS02; VPS03; VPS05; VPS07; VPS10; VPS12.

EXEC dbo.sp_foreachdb N'
    USE ?

--					

		IF EXISTS( SELECT * FROM sys.indexes WHERE name=''IX_TbAlunoNumeroPasta'' AND object_id = OBJECT_ID(''dbo.TbAluno'') )
		BEGIN
			PRINT DB_NAME()  

			DROP INDEX [IX_TbAlunoNumeroPasta] ON [dbo].[TbAluno] WITH ( ONLINE = OFF )

	      	PRINT  '' removido tem IX_TbAlunoNumeroPasta''
		END



		IF NOT EXISTS( SELECT * FROM sys.indexes WHERE name=''IX_TbAluno_IdResponsavel'' AND object_id = OBJECT_ID(''dbo.TbAluno'') )
			BEGIN
				CREATE INDEX IX_TbAluno_IdResponsavel ON [dbo].[TbAluno]	([IdResponsavel])	WITH (FILLFACTOR=90)

		      	PRINT  '' criado IX_TbAluno_IdResponsavel''
			END

--



--
--		-- wait for 1 second
--		WAITFOR DELAY ''00:00:05''



'
,@print_command_only = 0 -- Obrigatório Gerar script
,@print_dbname=0
,@state_desc = N'ONLINE'
,@user_only = 1
,@suppress_quotename=1
-- ,@database_list = 'dbSigaGGE, dbSigaISO, dbSigaAraraAzul, dbSigaPH3CV, dbSigaENSVitoriasRN, dbSigaConectivoCE, dbSigaOpcaoPE, dbSigaCEEsCrianca';
,@name_pattern='dbSiga';  --   dbActive -- dbBib
--
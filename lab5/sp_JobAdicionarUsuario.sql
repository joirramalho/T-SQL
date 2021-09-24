SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[sp_JobAdicionarUsuario] 
AS

-- PRINT '*** sp_JobAdicionarUsuario V1.02 - 30Julho20' -- update_one

DECLARE @strSQL			VARCHAR(8000)

DECLARE	@CRM			VARCHAR (16)
DECLARE @NomeDatabase	VARCHAR (64)
DECLARE	@LoginUsuario	VARCHAR (20)

DECLARE	@state_desc		VARCHAR (32)


-- Tem usuário para adicionar de banco já restaurado?
SELECT	TOP 1	@CRM = RTRIM(LTRIM(U.CRM)), @NomeDatabase = NomeDatabase, @LoginUsuario = RTRIM(LTRIM(LoginUsuario)) 
FROM	dbLogRestore.dbo.TbLogUsuario U
INNER	JOIN dbLogRestore.dbo.TbLogRestore R ON R.CRM = U.CRM
WHERE	AutorizadoEm IS NULL 
		AND DataRestauracao IS NOT NULL
ORDER	BY	IdLogUsuario 



		SELECT	@state_desc = state_desc FROM sys.databases WHERE NAME = 'CRM_' + @CRM -- 'RESTORING' OR 'OFFLINE'
		
		IF @state_desc IN ( 'RESTORING', 'OFFLINE') 
			BEGIN
--				INSERT INTO [dbLogRestore].[dbo].[TbLogMensagem]
--						   ([CRM]
--						   ,[Erro]
--						   ,[Mensagem])
--					 VALUES
--						   (@CRM
--						   ,1 -- Erro
--						   ,OBJECT_NAME(@@PROCID) + ' -98-> ' + 'Banco CRM_' + @CRM + ' está ' + @state_desc )

                RETURN
			END



-- Algum usuário para adicionar?
IF ( @CRM IS NULL )
	BEGIN
		SELECT	TOP 5 AutorizadoEm AS 'Últimos usuários autorizados', U.CRM, NomeDatabase, LoginUsuario, AutorizadoPor
		FROM	dbLogRestore.dbo.TbLogUsuario	U
		INNER	JOIN TbLogRestore R ON R.CRM = U.CRM
		ORDER BY AutorizadoEm DESC

		RETURN
	END



-- Banco dbSigaModelo
IF	@CRM = 'dbSigaModelo'
	SET	@NomeDatabase = 'dbSigaModelo'
ELSE	
	SET	@NomeDatabase = 'CRM_' + @CRM



-- Existe banco em estado ONLINE?
IF EXISTS(SELECT * FROM sys.databases WHERE NAME = @NomeDatabase AND state = 0 )
	BEGIN

		-- CRIAR NOVO USUÁRIO INTERNO se necessário
		IF NOT EXISTS(SELECT LoginUsuario FROM dbLogRestore.dbo.TbUsuario WHERE LoginUsuario = @LoginUsuario )
			BEGIN
				-- Logar operação em TbLogMensagem
				INSERT INTO [dbLogRestore].[dbo].[TbLogMensagem]
							([CRM]
							,[Erro]
							,[Mensagem])
						VALUES
							(@CRM
							,0 -- Warning
							,'novo USUÁRIO criado em TbUsuario [' + @LoginUsuario + ']' )

				INSERT INTO dbLogRestore.dbo.TbUsuario ( LoginUsuario )	VALUES ( @LoginUsuario )
			END



			-- CRIAR NOVO LOGIN se necessário com SENHA padrão Active.p@ss e política de senha conforme Windows (Vide abaixo)
			IF NOT EXISTS (SELECT name	FROM master.sys.server_principals	WHERE name = @LoginUsuario )
				BEGIN
					SET	@strSQL = 'USE [' + @NomeDatabase + ']; '
	
					BEGIN TRY   
						SET		@strSQL = @strSQL +  'CREATE LOGIN [' + @LoginUsuario + '] WITH PASSWORD = N''Active.p@ss'' MUST_CHANGE, CHECK_EXPIRATION = ON, CHECK_POLICY = ON; '

						EXEC	(@strSQL)

						-- Logar operação em TbLogMensagem
						INSERT INTO [dbLogRestore].[dbo].[TbLogMensagem]
									([CRM]
									,[Erro]
									,[Mensagem])
								VALUES
									(@CRM
									,0 -- Warning
									,'  novo LOGIN criado com a senha padrão [Active.p@ss] definida para [' + @LoginUsuario + ']' )
					END TRY
					  BEGIN CATCH
						UPDATE	dbLogRestore.dbo.TbLogUsuario	SET		AutorizadoEm = '1900-01-01 00:01'	WHERE	CRM = @CRM AND AutorizadoEm IS NULL

						INSERT INTO [dbLogRestore].[dbo].[TbLogMensagem]
									([CRM]
									,[Erro]
									,[Mensagem])
								VALUES
									(@CRM
									,1 -- Erro
									,OBJECT_NAME(@@PROCID) + ' -01-> ' + ERROR_MESSAGE())

						RETURN
					  END CATCH
				END



			-- ADICIONAR PERMISSÕES LEITURA, GRAVAÇÃO E DDL_ADMIN para Desenvolvedores
			DECLARE @StGestor			BIT
			DECLARE @StDesenvolvedor	BIT

			SELECT	@StGestor = StGestor, @StDesenvolvedor = StDesenvolvedor 
			FROM	dbLogRestore.dbo.TbUsuario 
			WHERE	LoginUsuario = @LoginUsuario

	--		IF	@LoginUsuario <> 'sigainternet'
	--		IF NOT EXISTS (	SELECT name FROM [sys].[database_principals] WHERE type = N'S' AND name = @LoginUsuario )
	--			BEGIN
					SET		@strSQL = 'USE [' + @NomeDatabase + ']; '

					BEGIN TRY   
						SET		@strSQL = @strSQL + 'CREATE USER	[' + @LoginUsuario + '] FOR LOGIN [' + @LoginUsuario + ']; '
						SET		@strSQL = @strSQL + 'ALTER USER		[' + @LoginUsuario + '] WITH DEFAULT_SCHEMA=[dbo]; '

						EXEC	(@strSQL)

						-- Logar operação em TbLogMensagem
						INSERT INTO [dbLogRestore].[dbo].[TbLogMensagem]
									([CRM]
									,[Erro]
									,[Mensagem])
								VALUES
									(@CRM
									,0 -- Warning
									,'Criado Login para [' + @LoginUsuario + ']')
					END TRY
						BEGIN CATCH
							INSERT INTO [dbLogRestore].[dbo].[TbLogMensagem]
										([CRM]
										,[Erro]
										,[Mensagem])
									VALUES
										(@CRM
										,0 -- Erro
										,'Usuário [' + @LoginUsuario + '] já existe')


							-- Usuário órfão -- EXEC sp_change_users_login 'Update_one', @UserName, @UserName 
							SET		@strSQL = 'USE [' + @NomeDatabase + ']; '

							-- BEGIN TRY   
								SET		@strSQL = @strSQL + 'EXEC sp_change_users_login	''Update_one'', [' + @LoginUsuario + '], [' + @LoginUsuario + ']; '

								EXEC	(@strSQL)
								-- Logar operação em TbLogMensagem
								INSERT INTO [dbLogRestore].[dbo].[TbLogMensagem]
											([CRM]
											,[Erro]
											,[Mensagem])
										VALUES
											(@CRM
											,0 -- Warning
											,'Update_one Login para [' + @LoginUsuario + ']')
							-- END TRY

						END CATCH

					UPDATE	dbLogRestore.dbo.TbLogUsuario	SET		AutorizadoEm = GETDATE()	WHERE	CRM = @CRM AND AutorizadoEm IS NULL
--				END
	



			-- MASCARAR OU NÃO
			SET	@strSQL = 'USE [' + @NomeDatabase + ']; '

			IF	@StGestor = 0
				BEGIN
					SET	@strSQL = @strSQL + 'REVOKE UNMASK TO	[' + @LoginUsuario + ']; ' -- MASCARAR
				END
			ELSE
				BEGIN
					SET	@strSQL = @strSQL + 'GRANT UNMASK TO	[' + @LoginUsuario + ']; ' -- DESMASCARAR
				END

			BEGIN TRY   
				EXEC	(@strSQL)

				-- Logar operação em TbLogMensagem
				INSERT INTO [dbLogRestore].[dbo].[TbLogMensagem]
							([CRM]
							,[Erro]
							,[Mensagem])
						VALUES
							(@CRM
							,0 -- Warning
							,IIF(@StGestor=0,'Ativando','Desativando') + ' Mascaramento para [' + @LoginUsuario + ']')
			END TRY
				BEGIN CATCH

					UPDATE	dbLogRestore.dbo.TbLogUsuario	SET		AutorizadoEm = '1900-01-01 00:03'	WHERE	CRM = @CRM AND AutorizadoEm IS NULL

					INSERT INTO [dbLogRestore].[dbo].[TbLogMensagem]
								([CRM]
								,[Erro]
								,[Mensagem])
							VALUES
								(@CRM
								,1 -- Erro
								,OBJECT_NAME(@@PROCID) + ' -03-> ' + ERROR_MESSAGE())
					RETURN
				END CATCH



		-- PERMISSÃO DDL_Admin para DEV
		SET	@strSQL = 'USE [' + @NomeDatabase + ']; '

		IF	@StDesenvolvedor = 1
			BEGIN
				SET	@strSQL = @strSQL + 'ALTER ROLE [db_ddladmin] ADD MEMBER [' + @LoginUsuario + ']; '
			END


		IF	@LoginUsuario = 'active.filipe' -- 05Fev21
			BEGIN
				SET	@strSQL = @strSQL + 'ALTER ROLE [db_owner] ADD MEMBER [' + @LoginUsuario + ']; '
			END
		


		-- PERMISSÃO R/W
		SET	@strSQL = @strSQL + 'ALTER ROLE [db_datareader] ADD MEMBER [' + @LoginUsuario + ']; '
		SET	@strSQL = @strSQL + 'ALTER ROLE [db_datawriter] ADD MEMBER [' + @LoginUsuario + ']; '


		-- PERMISSÃO PARA EXECUTAR PROCEDURES
		SET	@strSQL = @strSQL + 'GRANT EXECUTE TO [' + @LoginUsuario + ']; '


		-- PERMISSÃO PARA EXECUTAR SERVICE PACK
		--IF	@StGestor = 0
		--	BEGIN
				SET	@strSQL = @strSQL + 'ALTER ROLE [db_accessadmin]	ADD MEMBER [' + @LoginUsuario + ']; '
				SET	@strSQL = @strSQL + 'ALTER ROLE [db_securityadmin]	ADD MEMBER [' + @LoginUsuario + ']; '
--			END

		BEGIN TRY   
			EXEC	(@strSQL)

			-- Logar operação em TbLogMensagem
			INSERT INTO [dbLogRestore].[dbo].[TbLogMensagem]
						([CRM]
						,[Erro]
						,[Mensagem])
					VALUES
						(@CRM
						,0 -- Warning
						,'Atribuindo permissões a [' + @LoginUsuario + ']')
		END TRY
			BEGIN CATCH
				UPDATE	dbLogRestore.dbo.TbLogUsuario	SET		AutorizadoEm = '1900-01-01 00:04'	WHERE	CRM = @CRM AND AutorizadoEm IS NULL

				INSERT INTO [dbLogRestore].[dbo].[TbLogMensagem]
							([CRM]
							,[Erro]
							,[Mensagem])
						VALUES
							(@CRM
							,1 -- Erro
							,OBJECT_NAME(@@PROCID) + ' -04-> ' + ERROR_MESSAGE())
				RETURN
			END CATCH



		-- SINCRONIZAR LOGIN & USUARIO sigainternet
		IF	@LoginUsuario = 'sigainternet'
			BEGIN
				SET	@strSQL = 'USE [' + @NomeDatabase + ']; '

				SET	@strSQL = @strSQL + 'EXEC sp_change_users_login ''Auto_Fix'', ''sigainternet'', NULL, ''w7218'''

				BEGIN TRY   
					EXEC	(@strSQL)

					-- Logar operação em TbLogMensagem
					INSERT INTO [dbLogRestore].[dbo].[TbLogMensagem]
								([CRM]
								,[Erro]
								,[Mensagem])
							VALUES
								(@CRM
								,0 -- Warning
								,'Consertando usuário [' + @LoginUsuario + ']')
				END TRY
					BEGIN CATCH
						UPDATE	dbLogRestore.dbo.TbLogUsuario	SET		AutorizadoEm = '1900-01-01 00:05'	WHERE	CRM = @CRM AND AutorizadoEm IS NULL

						INSERT INTO [dbLogRestore].[dbo].[TbLogMensagem]
									([CRM]
									,[Erro]
									,[Mensagem])
								VALUES
									(@CRM
									,1 -- Erro
									,OBJECT_NAME(@@PROCID) + ' -05-> ' + ERROR_MESSAGE())
						RETURN
					END CATCH
			END





		-- ALTERAR SENHA DO LOGIN SUPORTE
		SET		@strSQL = 'USE [' + @NomeDatabase + ']; '

		SET		@strSQL = @strSQL + 'UPDATE TbUsuario SET Senha = ' + QUOTENAME('08111111111111111111', '''') + ', StAtivo = 1 WHERE Login=' + QUOTENAME('suporte', '''') + ' AND IdUsuario = 11';

		BEGIN TRY   
			EXEC	(@strSQL)
		END TRY
			BEGIN CATCH
				UPDATE	dbLogRestore.dbo.TbLogUsuario	SET		AutorizadoEm = '1900-01-01 00:05'	WHERE	CRM = @CRM AND AutorizadoEm IS NULL

				INSERT INTO [dbLogRestore].[dbo].[TbLogMensagem]
							([CRM]
							,[Erro]
							,[Mensagem])
						VALUES
							(@CRM
							,1 -- Erro
							,OBJECT_NAME(@@PROCID) + ' -05-> ' + ERROR_MESSAGE())
				RETURN
			END CATCH

		-- UPDATE TbUsuario SET Senha = '08111111111111111111', StAtivo = 1 WHERE Login='suporte' AND IdUsuario = 11
		-- UPDATE TbUsuario SET Senha = '08111111111111111111', StAtivo = 1 WHERE Login='suporte' AND IdUsuario = 1
		-- UPDATE TbUsuario SET Senha = '08111411111411111411', StAtivo = 1 WHERE Login='suporte' AND IdUsuario = 114
		-- UPDATE TbUsuario SET Senha = '0A131313131313131313', StAtivo = 1 WHERE Login='suporte' AND IdUsuario = 3
		-- ALTERAR SENHA DO LOGIN SUPORTE


		-- SETAR  Data hora que foi dada autorizacao
		UPDATE	dbLogRestore.dbo.TbLogUsuario	
		SET		AutorizadoEm = GETDATE()	
		WHERE	CRM = @CRM AND LoginUsuario = @LoginUsuario AND AutorizadoEm IS NULL
	
		---- Logar operação em TbLogMensagem
		--INSERT INTO [dbLogRestore].[dbo].[TbLogMensagem]
		--			([CRM]
		--			,[Erro]
		--			,[Mensagem])
		--		VALUES
		--			(@CRM
		--			,0 -- Warning
		--			,'Permissões concedidas ao usuário [' + @LoginUsuario + ']')
	END
ELSE
	BEGIN
			BEGIN
				UPDATE	dbLogRestore.dbo.TbLogUsuario	SET		AutorizadoEm = '1900-01-01 00:09'	WHERE	CRM = @CRM AND AutorizadoEm IS NULL

				-- Logar operação em TbLogMensagem
				INSERT INTO [dbLogRestore].[dbo].[TbLogMensagem]
							([CRM]
							,[Erro]
							,[Mensagem])
						VALUES
							(@CRM
							,1 -- Erro
							--,'Não existe Banco CRM_' + @CRM )
							,OBJECT_NAME(@@PROCID) + ' -99-> ' + ERROR_MESSAGE())
			END

			RETURN
	END



/*
A senha contém caracteres de três das seguintes categorias:

Letras maiúsculas de idiomas europeus (A a Z, com marcas diacrítico, caracteres gregos e cirílico)
Letras minúsculas de idiomas europeus (a a z, sustenido-s, com marcas diacrítico, caracteres gregos e cirílico)
Dígitos de base 10 (de 0 a 9)
Caracteres não alfanuméricos (caracteres especiais): (~! @ # $% ^& * _-+ = ' | \ \ (){}\ []:; "' <>,.? /) Símbolos de moeda como o euro ou a libra esterlina não são contados como caracteres especiais para essa configuração de política.
*/

GO

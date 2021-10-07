-- 29set21 - dbSigaSalePetrolina_Arquivo0X

-- P@ssw0rd.


--LOGIN --
	--SENHA COM 10 caracteres
		--CREATE LOGIN [userRosaCamara] 	WITH PASSWORD=N'***', DEFAULT_DATABASE=[dbSigaRosaCamara], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF;
		--CREATE LOGIN [userEcoVillePE] 	WITH PASSWORD=N'***', DEFAULT_DATABASE=[dbSigaEcoVillePE], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF;

		--ALTER LOGIN [userRestauraBancoVPS] DISABLE;

			--DROP LOGIN [userINSTBRASILIA];


-- PASSWORD
	-- ALTER LOGIN [userMeuFuturo] 	WITH PASSWORD = 'AgR3HuK2.W'; -- sigainternet userISO_PowerBI service.account



--USE dbSigaAraraAzul;


	--CREATE USER 	[romario.barbalho] 	FOR LOGIN [romario.barbalho] WITH DEFAULT_SCHEMA=[dbo]; -- active.wantuilson
	
		--DROP USER [userINSTBRASILIA];
	
	
	--	DEFAULT_DATABASE
			--ALTER LOGIN 	[userCELogosEEM] 	WITH  DEFAULT_DATABASE=[dbSigaCELogos];
	
	
		--GRANT CONNECT  TO [userRestauraBancoVPS];
			--REVOKE CONNECT  FROM [siga_caruaru];




--DATABASE ROLE
--ADD 
	--USE dbSigaModelo127;

	--ALTER ROLE [db_datareader] ADD MEMBER [userRestauraBancoVPS];
	--ALTER ROLE [db_datawriter] ADD MEMBER [userRestauraBancoVPS];
	
	--GRANT EXECUTE TO [romario.barbalho]; -- wantuilson -- (LAB4 xp_readerrorlog)
    	--REVOKE EXECUTE TO [romario.barbalho];

	--ALTER ROLE [db_owner] ADD MEMBER [romario.barbalho];
	--ALTER ROLE [db_ddladmin] ADD MEMBER [active.mardelson];

--DROP
	--USE dbBibDiocCaruaru;

    -- exec sp_droprolemember 'db_datareader', 'active.pollyana';
    -- exec sp_droprolemember 'db_datawriter', 'active.pollyana';

	-- exec sp_droprolemember 'db_owner', 			'userEscolaIsrael';
    -- exec sp_droprolemember 'db_accessadmin', 	'siga_caruaru';
    -- exec sp_droprolemember 'db_backupoperator', 	'siga_caruaru';
    -- exec sp_droprolemember 'db_datareader', 		'siga_caruaru';
    -- exec sp_droprolemember 'db_datawriter', 		'siga_caruaru';
    -- exec sp_droprolemember 'db_ddladmin', 		'siga_caruaru';





--SERVER ROLE
	--ADD
		-- EXEC sp_addsrvrolemember 'userRestauraBancoVPS', 'dbcreator'
		-- EXEC sp_addsrvrolemember 'romario.barbalho', 'securityadmin'
		
	--DROP
	    -- EXEC sp_dropsrvrolemember 'userRestauraBancoVPS', 	'sysadmin'




-- DROP USER from ROLE
    -- ALTER ROLE roleGPA DROP MEMBER [sigauser]



--Censo
	--	dbSigaFACHO (SQL10); dbSigaAraraAzul (SQL08)

		--ALTER ROLE [db_datareader] ADD MEMBER [active.filipe];
		--GRANT EXECUTE ON OBJECT::FnExtrairNumeroToString TO [active.filipe];
		--EXEC sp_change_users_login 'Update_one', 'active.filipe', 'active.filipe';



--roleEEM
	--	CREATE ROLE [roleEEM];
	--	
	--	GRANT SELECT ON [dbo].[VwEEM_Unidade] TO [roleEEM];
	--	GRANT SELECT ON [dbo].[VwEEM_Turma] TO [roleEEM];
	--	GRANT SELECT ON [dbo].[VwEEM_Colaboradores] TO [roleEEM];
	--	GRANT SELECT ON [dbo].[VwEEM_Ciclos] TO [roleEEM];
	--	GRANT SELECT ON [dbo].[VwEEM_Serie] TO [roleEEM];
	--	GRANT SELECT ON [dbo].[VwEEM_UsuarioResponsavel] TO [roleEEM];
	--	GRANT SELECT ON [dbo].[VwEEM_UsuarioAluno] TO [roleEEM];
	--	GRANT SELECT ON [dbo].[VwEEM_ResponsavelUsuarioAluno] TO [roleEEM];
	--	GRANT SELECT ON [dbo].[VwEEM_ResponsavelAluno] TO [roleEEM];
	--	GRANT SELECT ON [dbo].[VwEEM_AlunoTurma] TO [roleEEM];
	--	GRANT SELECT ON [dbo].[VwEEM_Aluno] TO [roleEEM];
	--	GRANT SELECT ON [dbo].[VwEEM_TurmaProfessor] TO [roleEEM];
	--	GRANT SELECT ON [dbo].[VwEEM_UsuarioProfessor] TO [roleEEM];
	--	
	--	EXECUTE sp_AddRoleMember 'roleEEM', 'userSantAnaEEM';

-- SET OWNER ROLE
    -- ALTER AUTHORIZATION ON ROLE::[roleEEM] TO [dbo];



--ALTER AUTHORIZATION ON SCHEMA
	--USE dbSigaCONFHICSaoJose;
	--ALTER AUTHORIZATION ON SCHEMA::[db_owner] TO [db_owner];
	--ALTER AUTHORIZATION ON SCHEMA::[db_datareader] TO [db_datareader];
	--ALTER AUTHORIZATION ON SCHEMA::[db_accessadmin] TO [db_accessadmin]

	--ALTER AUTHORIZATION ON SCHEMA::[db_datawriter] TO [db_datawriter];
	--ALTER AUTHORIZATION ON SCHEMA::[db_ddladmin] TO [db_ddladmin];
	--ALTER AUTHORIZATION ON SCHEMA::[db_backupoperator] TO [db_backupoperator];



	--ALTER AUTHORIZATION ON SCHEMA::[sigainternet] TO [sigainternet];

	--DROP SCHEMA [siga_caruaru];




--GRANT EXECUTE from PROCEDURE to ROLE/User
						
	--USE [dbLogRestore]
	--GRANT EXECUTE ON [dbo].sp_foreachdb TO [PUBLIC]

	--GRANT EXECUTE ON OBJECT::sp_DesmascararBanco TO [romario.barbalho]	
	--GRANT EXECUTE ON OBJECT::sp_restore TO [roleDesmascararDados]
	--GRANT EXECUTE ON [dbo].sp_JobEspacoLivreInMB TO [roleOperacaoRestore]
	--GRANT EXECUTE ON OBJECT::FnAnoMes TO [active.filipe]

		--REVOKE EXECUTE ON OBJECT::sp_restore FROM [active.pinto]
		--REVOKE EXECUTE ON OBJECT::sp_DesmascararBanco FROM [active.pinto]
			--REVOKE ALL ON dbo.MyObject TO MyUser


	-- GRANT UPDATE ON [dbo].Documento_ContasDeGestao TO role_SiaiAnalise_Escrita;





--PROFILER
	--GRANT
		--USE master;
		--GRANT ALTER TRACE TO [luiz.matheus]
	
	--REVOKE
	--	USE Master;
	--	REVOKE ALTER TRACE FROM manvendra;



--GRANT VIEW
	--	use master
	--	
	--	GRANT VIEW SERVER STATE TO [active.marley]



--userRestauraBancoVPS
	--CREATE LOGIN [userRestauraBancoVPS] WITH PASSWORD=N'*****', DEFAULT_DATABASE=[master], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF;
	--
	--CREATE USER [userRestauraBancoVPS] FOR LOGIN [userRestauraBancoVPS] WITH DEFAULT_SCHEMA=[dbo];
	--
	--EXEC master..sp_addsrvrolemember @loginame = N'userRestauraBancoVPS', @rolename = N'sysadmin';



-- LAB4 
	-- USE dbLogRestore;
	-- CREATE USER...
	-- EXEC sp_addrolemember N'roleOperacaoRestore', N'romario.barbalho'
	-- EXEC sp_addrolemember N'roleDesmascararDados', N'romario.barbalho'

 
-- HASHED
	-- ALTER LOGIN [userCognitivoEEM] WITH   PASSWORD = ... HASHED;
	-- ALTER LOGIN [userCognitivoGPA] WITH   PASSWORD = ... HASHED;




-- sp_change_users_login
	-- EXEC sp_change_users_login 'Update_one', 'userEloEEM', 'userEloEEM';
	-- EXEC sp_change_users_login 'Auto_Fix', 'userEloEEM', NULL, '*****';



--    ALTER LOGIN [userCognitivoGPA]
--    WITH PASSWORD = 'zd',
--    CHECK_EXPIRATION = OFF,
--    CHECK_POLICY = OFF;


-- User_MUST_CHANGE_password
    -- ALTER LOGIN [active.mislainy]
    -- WITH PASSWORD = '45DX$02' MUST_CHANGE,
    -- CHECK_EXPIRATION = ON,
    -- CHECK_POLICY = ON;

    -- Regras do Windows 10
    -- https://docs.microsoft.com/pt-br/sql/relational-databases/security/strong-passwords?view=sql-server-2017
--18jun22

--CREATE DATABASE dbSigaPlenus_Arquivo
--ALTER DATABASE dbSigaPlenus_Arquivo COLLATE SQL_Latin1_General_CP1_CI_AI

--ALTER DATABASE [dbSigaPlenus_Arquivo] SET RECOVERY SIMPLE WITH NO_WAIT;


USE dbSigaPlenus_Arquivo;

SELECT DB_NAME();

-- Create a new user and map it with login
CREATE USER [sigainternet] FOR LOGIN [sigainternet];
CREATE USER [userPlenus] FOR LOGIN [userPlenus];

	-- Database Level Permission
	--GRANT CONNECT  TO [sigainternet];
	--GRANT CONNECT  TO [userSaleDomBosco];

-- Create User-Role Scrip
EXEC sp_AddRoleMember 'db_datareader', 'userPlenus'






-- Object Level Permission
GRANT SELECT ON [dbo].[TbAuditoria] TO [sigainternet];


GRANT SELECT ON [dbo].[TbAlunoTurmaProcedimentoMatriculaHistorico] TO [sigainternet];
GRANT SELECT ON [dbo].[TbSituacaoAlunoDisciplina_Auditoria] TO [sigainternet];
GRANT SELECT ON [dbo].[TbLogWeb] TO [sigainternet];
GRANT SELECT ON [dbo].[TbFreqMarcacao] TO [sigainternet];
GRANT SELECT ON [dbo].[TbMetaSituacaoAlunoDisciplina_Auditoria] TO [sigainternet];
GRANT SELECT ON [dbo].[TbFaseNotaAluno_Auditoria] TO [sigainternet];



-- VIEWS MAPPED IN ARQUIVO04
-- VwAuditoria

-- VwFaseNotaAluno_Auditoria
-- VwSituacaoAlunoDisciplina_Auditoria
-- VwFreqMarcacao
-- VwAlunoTurmaProcedimentoMatriculaHistorico

-- VwLogWeb
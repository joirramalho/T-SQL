--17jun22

--CREATE DATABASE dbSigaSaleParalela_Arquivo
--ALTER DATABASE dbSigaSaleParalela_Arquivo COLLATE SQL_Latin1_General_CP1_CI_AI

--ALTER DATABASE [dbSigaSaleParalela_Arquivo] SET RECOVERY SIMPLE WITH NO_WAIT;

-- EXEC ACHADO
--16 TbAuditoria em Banco_Arquivo.SQL


USE dbSigaSaleParalela_Arquivo;

SELECT DB_NAME();

-- Create a new user and map it with login
CREATE USER [sigainternet] FOR LOGIN [sigainternet];
CREATE USER [userSaleParalela] FOR LOGIN [userSaleParalela];

	-- Database Level Permission
	--GRANT CONNECT  TO [sigainternet];
	--GRANT CONNECT  TO [userSaleDomBosco];

-- Create User-Role Scrip
EXEC sp_AddRoleMember 'db_datareader', 'userSaleParalela'






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
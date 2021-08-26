-- CREATE DATABASE dbSigaNeves_Arquivo

USE master;

SELECT DB_NAME();

-- Create a new user and map it with login
CREATE USER [sigainternet] FOR LOGIN [sigainternet];
CREATE USER [userNeves] FOR LOGIN [userNeves];


-- Create User-Role Scrip
EXEC sp_AddRoleMember 'db_datareader', 'userNeves'



-- Database Level Permission
GRANT CONNECT  TO [sigainternet];
GRANT CONNECT  TO [userNeves];



-- Object Level Permission
GRANT SELECT ON [dbo].[TbLogWeb] TO [sigainternet];
GRANT SELECT ON [dbo].[TbAuditoria] TO [sigainternet];
GRANT SELECT ON [dbo].[TbFaseNotaAluno_Auditoria] TO [sigainternet];
GRANT SELECT ON [dbo].[TbSituacaoAlunoDisciplina_Auditoria] TO [sigainternet];
GRANT SELECT ON [dbo].[TbFreqMarcacao] TO [sigainternet];
GRANT SELECT ON [dbo].[TbAlunoTurmaProcedimentoMatriculaHistorico] TO [sigainternet];

-- ERRO -- Procurar em qual ArquivoXX está
GRANT SELECT ON [dbo].[TbMetaSituacaoAlunoDisciplina_Auditoria] TO [sigainternet];




-- VIEWS MAPPED IN ARQUIVO04
-- VwAuditoria

-- VwFaseNotaAluno_Auditoria
-- VwSituacaoAlunoDisciplina_Auditoria
-- VwFreqMarcacao
-- VwAlunoTurmaProcedimentoMatriculaHistorico

-- VwLogWeb

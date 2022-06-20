-- CREATE DATABASE dbSigaSalesianoSaoJose_Arquivo

-- EXEC ACHADO
--16 TbAuditoria em Banco_Arquivo.SQL


USE dbSigaSalesianoSaoJose_Arquivo;

SELECT DB_NAME();

-- Create a new user and map it with login
CREATE USER [sigainternet] FOR LOGIN [sigainternet];
CREATE USER [userSaleNatal] FOR LOGIN [userSaleNatal];


-- Create User-Role Scrip
EXEC sp_AddRoleMember 'db_datareader', 'userNeves'



-- Database Level Permission
GRANT CONNECT  TO [sigainternet];
GRANT CONNECT  TO [userSaleNatal];



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
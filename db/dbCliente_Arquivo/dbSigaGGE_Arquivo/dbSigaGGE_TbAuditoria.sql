-- EXEC dbLogMonitor.dbo.sp_Where

-- use dbSigaGGE

-- SELECT YEAR(DAtaHora), COUNT(*) FROM dbSigaGGE.dbo.TbAuditoria    GROUP by YEAR(DAtaHora)
-- SELECT YEAR(DAtaHora), COUNT(*) FROM dbSigaGGE_Arquivo.dbo.TbAuditoria    GROUP by YEAR(DAtaHora)

    -- CREATE DATABASE dbSigaGGE_Arquivo

--
-- CREATE DATABASE dbSigaNeves_Arquivo

USE dbSigaGGE_Arquivo

SELECT DB_NAME()

-- Create a new user and map it with login
CREATE USER [sigainternet] FOR LOGIN [sigainternet];
CREATE USER [userGGE] FOR LOGIN [userGGE];


-- Create User-Role Scrip
EXEC sp_AddRoleMember 'db_datareader', 'userGGE'



-- Database Level Permission
GRANT CONNECT  TO [sigainternet];
GRANT CONNECT  TO [userGGE];



-- Object Level Permission
GRANT SELECT ON [dbo].[TbAuditoria] TO [sigainternet];



-- GRANT SELECT ON [dbo].[TbLogWeb] TO [sigainternet];
-- GRANT SELECT ON [dbo].[TbFaseNotaAluno_Auditoria] TO [sigainternet];
-- GRANT SELECT ON [dbo].[TbSituacaoAlunoDisciplina_Auditoria] TO [sigainternet];
-- GRANT SELECT ON [dbo].[TbFreqMarcacao] TO [sigainternet];
-- GRANT SELECT ON [dbo].[TbAlunoTurmaProcedimentoMatriculaHistorico] TO [sigainternet];

-- -- ERRO -- Procurar em qual ArquivoXX está
-- GRANT SELECT ON [dbo].[TbMetaSituacaoAlunoDisciplina_Auditoria] TO [sigainternet];




--



USE dbSigaGGE_Arquivo

SELECT DB_NAME()

-- CRIA TABELA DESTINO
SELECT * INTO dbSigaGGE_Arquivo.dbo.TbAuditoria
    FROM dbSigaGGE.dbo.TbAuditoria WHERE YEAR(DAtaHora) = 2015


EXEC sp_help 'TbAuditoria'


SET IDENTITY_INSERT dbSigaGGE_Arquivo.dbo.TbAuditoria ON;

INSERT INTO dbSigaGGE_Arquivo.dbo.TbAuditoria ( Tabela, IdUsuario, Operacao, DataHora, ValorChave1, ValorChave2, ValorChave3, ValorChave4, ValorChave5, DescricaoOperacao, IdAuditoria )
        SELECT Tabela, IdUsuario, Operacao, DataHora, ValorChave1, ValorChave2, ValorChave3, ValorChave4, ValorChave5, DescricaoOperacao, IdAuditoria
            FROM dbSigaGGE.dbo.TbAuditoria WHERE YEAR(DAtaHora) = 2020 

-- (2095849 rows affected)
-- 4790499 rows affected
-- 2735231 rows
-- 1984795 rows
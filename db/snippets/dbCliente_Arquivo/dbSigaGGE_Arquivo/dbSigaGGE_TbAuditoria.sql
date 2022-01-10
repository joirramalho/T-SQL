--07jan22

-- use dbSigaGGE

-- SELECT YEAR(DAtaHora), COUNT(*) FROM dbSigaGGE.dbo.TbAuditoria    GROUP by YEAR(DAtaHora)
-- SELECT YEAR(DAtaHora), COUNT(*) FROM dbSigaGGE_Arquivo.dbo.TbAuditoria    GROUP by YEAR(DAtaHora)

    -- CREATE DATABASE dbSigaGGE_Arquivo

--
-- CREATE DATABASE dbSigaNeves_Arquivo

USE dbSigaGGE_Arquivo

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
GRANT SELECT ON [dbo].[TbFaseNotaAluno_Auditoria] TO [sigainternet];
GRANT SELECT ON [dbo].[TbSituacaoAlunoDisciplina_Auditoria] TO [sigainternet];



-- GRANT SELECT ON [dbo].[TbLogWeb] TO [sigainternet];
-- GRANT SELECT ON [dbo].[TbFreqMarcacao] TO [sigainternet];
-- GRANT SELECT ON [dbo].[TbAlunoTurmaProcedimentoMatriculaHistorico] TO [sigainternet];

-- -- ERRO -- Procurar em qual ArquivoXX está
-- GRANT SELECT ON [dbo].[TbMetaSituacaoAlunoDisciplina_Auditoria] TO [sigainternet];




--



USE dbSigaGGE_Arquivo

-- CRIA TABELA DESTINO
SELECT * INTO dbSigaGGE_Arquivo.dbo.TbAuditoria
    FROM dbSigaGGE.dbo.TbAuditoria WHERE YEAR(DAtaHora) = 2015


EXEC sp_help 'TbAuditoria'


SET IDENTITY_INSERT dbSigaGGE_Arquivo.dbo.TbAuditoria ON;

INSERT INTO dbSigaGGE_Arquivo.dbo.TbAuditoria ( Tabela, IdUsuario, Operacao, DataHora, ValorChave1, ValorChave2, ValorChave3, ValorChave4, ValorChave5, DescricaoOperacao, IdAuditoria )
        SELECT Tabela, IdUsuario, Operacao, DataHora, ValorChave1, ValorChave2, ValorChave3, ValorChave4, ValorChave5, DescricaoOperacao, IdAuditoria
            FROM dbSigaGGE.dbo.TbAuditoria WHERE YEAR(DAtaHora) = 2021 

            
            
-- DECLARE @BatchSize INT = 10000
--
-- WHILE 1 = 1
-- BEGIN
-- 	DELETE TOP (@BatchSize)
-- 	FROM [dbSigaGGE].[dbo].[TbAuditoria]
-- 	where YEAR(DAtaHora) = 2021 --AND month( CreatedAt ) = 2 --AND revokedAt IS NOT NULL
-- 
-- 	IF @@ROWCOUNT < @BatchSize BREAK
-- END            

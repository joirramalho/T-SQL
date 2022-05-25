--07jan22

-- use dbSigaGGE

 SELECT YEAR(DAtaHora), COUNT(*) FROM dbSigaGGE.dbo.TbFaseNotaAluno_Auditoria    GROUP by YEAR(DAtaHora)
 SELECT YEAR(DAtaHora), COUNT(*) FROM dbSigaGGE_Arquivo.dbo.TbFaseNotaAluno_Auditoria    GROUP by YEAR(DAtaHora)

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

--

USE dbSigaGGE_Arquivo

SELECT DB_NAME()


-- Object Level Permission
GRANT SELECT ON [dbo].[TbFaseNotaAluno_Auditoria] TO [sigainternet];



-- CRIA TABELA DESTINO
SELECT * INTO dbSigaGGE_Arquivo.dbo.TbFaseNotaAluno_Auditoria
    FROM dbSigaGGE.dbo.TbFaseNotaAluno_Auditoria WHERE YEAR(DAtaHora) = 2017


EXEC sp_help 'TbAuditoria'


-- SELECT COLUMN_NAME
-- FROM INFORMATION_SCHEMA.COLUMNS
-- WHERE TABLE_NAME = 'TbFaseNotaAluno_Auditoria' --AND TABLE_SCHEMA='YourSchemaName'


SET IDENTITY_INSERT dbSigaGGE_Arquivo.dbo.TbFaseNotaAluno_Auditoria ON;

INSERT INTO dbSigaGGE_Arquivo.dbo.TbFaseNotaAluno_Auditoria ( IdFaseNotaAlunoAuditoria,DataHora,Operacao,IdUsuario,IdProfessor,IdDisciplina,IdTurma,IdAluno,IdFaseNota,Nota01, Nota02, Nota03, Nota04, Nota05, Nota06, Nota07, Nota08, Nota09, Nota10, IdFormulaComposicao, StNotaConfirmada, NotaFase, Faltas, QuantAulasDadas, StNotaFaseExibirDisp )
        SELECT IdFaseNotaAlunoAuditoria,DataHora,Operacao,IdUsuario,IdProfessor,IdDisciplina,IdTurma,IdAluno,IdFaseNota,Nota01, Nota02, Nota03, Nota04, Nota05, Nota06, Nota07, Nota08, Nota09, Nota10, IdFormulaComposicao, StNotaConfirmada, NotaFase, Faltas, QuantAulasDadas, StNotaFaseExibirDisp    
        	FROM dbSigaGGE.dbo.TbFaseNotaAluno_Auditoria 
        	WHERE YEAR(DAtaHora) = 2021



SELECT YEAR(DATAHORA), COUNT(*)
  FROM [dbSigaGGE].[dbo].[TbFaseNotaAluno_Auditoria]
  GROUP BY YEAR(DATAHORA)


  SELECT YEAR(DATAHORA), COUNT(*)
  FROM [dbSigaGGE_Arquivo].[dbo].[TbFaseNotaAluno_Auditoria]
  GROUP BY YEAR(DATAHORA)



-- DECLARE @BatchSize INT = 10000
--
-- WHILE 1 = 1
-- BEGIN
-- 	DELETE TOP (@BatchSize)
-- 	FROM [dbSigaGGE].[dbo].[TbFaseNotaAluno_Auditoria]
-- 	where YEAR(DAtaHora) = 2021 --AND month( CreatedAt ) = 2 --AND revokedAt IS NOT NULL
-- 
-- 	IF @@ROWCOUNT < @BatchSize BREAK
-- END

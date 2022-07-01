--30jun22

USE dbSigaNoildeRamalho_Arquivo

SELECT DB_NAME()


-- Object Level Permission
--GRANT SELECT ON [dbo].[TbFaseNotaAluno_Auditoria] TO [sigainternet];



-- CRIA TABELA DESTINO
SELECT * INTO dbSigaNoildeRamalho_Arquivo.dbo.TbFaseNotaAluno_Auditoria
    FROM dbSigaNoildeRamalho.dbo.TbFaseNotaAluno_Auditoria WHERE YEAR(DAtaHora) = 2020


EXEC sp_help 'TbAuditoria'


-- SELECT COLUMN_NAME
-- FROM INFORMATION_SCHEMA.COLUMNS
-- WHERE TABLE_NAME = 'TbFaseNotaAluno_Auditoria' --AND TABLE_SCHEMA='YourSchemaName'


SET IDENTITY_INSERT dbSigaNoildeRamalho_Arquivo.dbo.TbFaseNotaAluno_Auditoria ON;

INSERT INTO dbSigaNoildeRamalho_Arquivo.dbo.TbFaseNotaAluno_Auditoria ( IdFaseNotaAlunoAuditoria,DataHora,Operacao,IdUsuario,IdProfessor,IdDisciplina,IdTurma,IdAluno,IdFaseNota,Nota01, Nota02, Nota03, Nota04, Nota05, Nota06, Nota07, Nota08, Nota09, Nota10, IdFormulaComposicao, StNotaConfirmada, NotaFase, Faltas, QuantAulasDadas, StNotaFaseExibirDisp )
        SELECT IdFaseNotaAlunoAuditoria,DataHora,Operacao,IdUsuario,IdProfessor,IdDisciplina,IdTurma,IdAluno,IdFaseNota,Nota01, Nota02, Nota03, Nota04, Nota05, Nota06, Nota07, Nota08, Nota09, Nota10, IdFormulaComposicao, StNotaConfirmada, NotaFase, Faltas, QuantAulasDadas, StNotaFaseExibirDisp    
        	FROM dbSigaNoildeRamalho.dbo.TbFaseNotaAluno_Auditoria WHERE YEAR(DAtaHora) = 2021



 SELECT YEAR(DAtaHora), COUNT(*) FROM dbSigaNoildeRamalho.dbo.TbFaseNotaAluno_Auditoria    GROUP by YEAR(DAtaHora)
 SELECT YEAR(DAtaHora), COUNT(*) FROM dbSigaNoildeRamalho_Arquivo.dbo.TbFaseNotaAluno_Auditoria    GROUP by YEAR(DAtaHora)



 DECLARE @BatchSize INT = 5000

 WHILE 1 = 1
 BEGIN
 	DELETE TOP (@BatchSize)
 	FROM [dbSigaNoildeRamalho].[dbo].[TbFaseNotaAluno_Auditoria]
 	where YEAR(DAtaHora) = 2021 --AND month( CreatedAt ) = 2 --AND revokedAt IS NOT NULL
 
 	IF @@ROWCOUNT < @BatchSize BREAK
 END

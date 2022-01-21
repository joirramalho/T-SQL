-- SCRIPT TRIGGER GET PRIOR_IdFaseNotaAlunoAuditoria

CREATE TABLE ##TEMP ( IdFaseNotaAlunoAuditoria bigint, PRIOR_IdFaseNotaAlunoAuditoria bigint )

TRUNCATE TABLE ##TEMP

INSERT INTO ##TEMP
	SELECT IdFaseNotaAlunoAuditoria,
		        (		SELECT 	TOP 1 IdFaseNotaAlunoAuditoria 
			         	FROM 	TbFaseNotaAluno_Auditoria
		         		WHERE 	IdFaseNotaAlunoAuditoria < t.IdFaseNotaAlunoAuditoria	
								AND IdAluno = t.IdAluno AND IdTurma = t.IdTurma AND IdDisciplina = t.IdDisciplina AND IdFaseNota = t.IdFaseNota
		         		ORDER 	BY IdFaseNotaAlunoAuditoria DESC
		        ) AS PRIOR_IdFaseNotaAlunoAuditoria_CALCULADO
		from TbFaseNotaAluno_Auditoria t
--		WHERE  IdAluno = 2527 AND IdTurma = 142 AND IdDisciplina = 24 AND IdFaseNota = 31 
--		WHERE  IdAluno = 2091 AND IdTurma = 84 AND IdDisciplina = 30 AND IdFaseNota = 189 
		WHERE  IdAluno = 1589 AND IdTurma = 76 AND IdDisciplina = 13 AND IdFaseNota = 31 

SELECT * FROM ##TEMP
	

	
--ADD FIELD PRIOR_IdFaseNotaAlunoAuditoria
--ALTER TABLE TbFaseNotaAluno_Auditoria	ADD PRIOR_IdFaseNotaAlunoAuditoria BIGINT


--SET NULL
--UPDATE TbFaseNotaAluno_Auditoria	SET PRIOR_IdFaseNotaAlunoAuditoria = NULL WHERE PRIOR_IdFaseNotaAlunoAuditoria IS NOT NULL

--BEGIN TRAN 

	UPDATE 	TbFaseNotaAluno_Auditoria 
	SET 	TbFaseNotaAluno_Auditoria.PRIOR_IdFaseNotaAlunoAuditoria = ##TEMP.PRIOR_IdFaseNotaAlunoAuditoria 
	FROM 	TbFaseNotaAluno_Auditoria, ##TEMP 
	WHERE 	TbFaseNotaAluno_Auditoria.IdFaseNotaAlunoAuditoria = ##TEMP.IdFaseNotaAlunoAuditoria
			AND ##TEMP.PRIOR_IdFaseNotaAlunoAuditoria IS NOT NULL

		
			--SELECT * TbFaseNotaAluno_Auditoria WITH Operação e JOINs de IdUsuario e IdProfessor, se existir ( Nome das FKs em segunda fase)
			--LAB4 CRM_333850
			SELECT 
				audit.*
				,CASE 
						WHEN Operacao ='I' THEN 'Inclusão'
						WHEN Operacao ='U' THEN 'Alteração'
						WHEN Operacao ='D' THEN 'Remoção'
						WHEN Operacao ='O' THEN 'Tipo criado para identificar movimentações antigas' -- CRM 24432
						ELSE 'r/w'
					END AS 'Operação'
				,tu.NomeUsuario
				,p.NomeProfessor 
			FROM TbFaseNotaAluno_Auditoria audit
			LEFT JOIN TbUsuario 	tu 	ON tu.IdUsuario 	= audit.IdUsuario
			LEFT JOIN TbProfessor 	p 	ON p.IdProfessor  	= audit.IdProfessor
			WHERE  IdTurma = 110 AND IdDisciplina = 4 AND IdFaseNota = 124 AND IdAluno IN ( 1695 ) --2505
--			WHERE  IdAluno = 1 AND IdTurma = 110 AND IdDisciplina = 4 AND IdFaseNota = 124 
--			WHERE  IdAluno = 2091 AND IdTurma = 84 AND IdDisciplina = 30 AND IdFaseNota = 189 
	--		WHERE  IdAluno = 2527 AND IdTurma = 142 AND IdDisciplina = 24 AND IdFaseNota = 31 
--			WHERE  IdAluno = 2091 AND IdTurma = 84 AND IdDisciplina = 30 AND IdFaseNota = 189 
	--		WHERE  IdAluno = 772 AND IdTurma = 83 AND IdDisciplina = 27 AND IdFaseNota = 189 

--ROLLBACK 
    --COMMIT
    
    
--ORDER BY IdFaseNotaAlunoAuditoria -- PK

SELECT *
FROM TbFaseNotaAluno
WHERE  IdTurma = 110 AND IdDisciplina = 4 AND IdFaseNota = 124 -- IdAluno = 1 AND 

UPDATE 		TbFaseNotaAluno
SET NOTA06 = 4.5
WHERE  IdTurma = 110 AND IdDisciplina = 4 AND IdFaseNota = 124 AND IdAluno IN ( 1695 )
--WHERE  IdAluno = 1 AND IdTurma = 110 AND IdDisciplina = 4 AND IdFaseNota = 124 

			


					SELECT IdFaseNotaAlunoAuditoria, PRIOR_IdFaseNotaAlunoAuditoria 
		         	FROM TbFaseNotaAluno_Auditoria t
					WHERE  IdTurma = 110 AND IdDisciplina = 4 AND IdFaseNota = 124 AND IdAluno IN ( 1695 ) --, 1171 , 761
	         		ORDER 	BY IdFaseNotaAlunoAuditoria 



---
SELECT TOP 5 * 
FROM TbFaseNotaAluno

SELECT TOP 5 * 
FROM TbFaseNotaAluno_Auditoria 
ORDER BY IdFaseNotaAlunoAuditoria DESC
			
SELECT TOP 100 * --IdSituacaoAlunoDisciplinaAuditoria, DataHora, Operacao, IdAluno , IdDisciplina, IdTurma, SituacaoAtual 
FROM TbFaseNotaAluno_Auditoria
--WHERE Operacao NOT IN ('I', 'U')
WHERE IdFaseNotaAlunoAuditoria  = 422
WHERE  IdAluno = 8123 AND IdDisciplina = 260 AND IdTurma = 3572 AND IdFaseNota = 1950 
--WHERE  IdTurma = 3533 AND IdAluno = 10208 AND IdDisciplina = 403


SELECT TOP 10 *
FROM TbAuditoria ta 
where Tabela = 'TbSituacaoAlunoDisciplina' --AND IdUsuario = 290


SELECT TOP 100 IdAluno, IdTurma, IdDisciplina, IdFaseNota , count(*) 
FROM TbFaseNotaAluno_Auditoria
--WHERE IdProfessor IS NOT NULL
GROUP BY IdAluno, IdTurma, IdDisciplina, IdFaseNota
HAVING COUNT(*) > 2

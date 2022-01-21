--17jan22
	--sql server trigger pulling data from joined TABLE
		--	https://stackoverflow.com/questions/22195079/sql-server-trigger-pulling-data-from-joined-table



--DROp TABLE ##TEMP
--	
--CREATE TABLE ##TEMP ( IdFaseNotaAlunoAuditoria bigint, PRIOR_IdFaseNotaAlunoAuditoria bigint )
--
----TRUNCATE TABLE ##TEMP
--
--INSERT INTO ##TEMP
--	SELECT IdFaseNotaAlunoAuditoria,
--		        (		SELECT TOP 1 IdFaseNotaAlunoAuditoria 
--			         	FROM TbFaseNotaAluno_Auditoria
--		         		WHERE 	IdFaseNotaAlunoAuditoria < inserted.IdFaseNotaAlunoAuditoria	
--						AND IdAluno = inserted.IdAluno AND IdTurma = inserted.IdTurma AND IdDisciplina = inserted.IdDisciplina AND IdFaseNota = inserted.IdFaseNota
--		         		ORDER 	BY IdFaseNotaAlunoAuditoria DESC
--		        ) AS PRIOR_IdFaseNotaAlunoAuditoria_CALCULADO
----		        ,PRIOR_IdFaseNotaAlunoAuditoria
--		from inserted
--	
--	
--	UPDATE TbFaseNotaAluno_Auditoria 
--	SET TbFaseNotaAluno_Auditoria.PRIOR_IdFaseNotaAlunoAuditoria = ##TEMP.PRIOR_IdFaseNotaAlunoAuditoria 
--	FROM TbFaseNotaAluno_Auditoria, ##TEMP 
--	WHERE TbFaseNotaAluno_Auditoria.IdFaseNotaAlunoAuditoria = ##TEMP.IdFaseNotaAlunoAuditoria
--		AND ##TEMP.PRIOR_IdFaseNotaAlunoAuditoria IS NOT NULL
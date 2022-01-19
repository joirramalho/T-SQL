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




--
-- Activesoft Consultoria 
-- TRIGGER criada pelo Activesoft Service Pack em 18/11/2021 durante atualização para versão 1.065.183.
--

--CREATE TRIGGER [dbo].[TgFaseNotaAluno_PosAuditoria] ON [dbo].[TbFaseNotaAluno_Auditoria]
ALTER TRIGGER [dbo].[TgFaseNotaAluno_PosAuditoria] ON [dbo].[TbFaseNotaAluno_Auditoria]
FOR INSERT
AS
BEGIN
	SET NOCOUNT ON
	
    UPDATE TbFaseNotaAluno_Auditoria
    SET PRIOR_IdFaseNotaAlunoAuditoria = 
		    (
		    SELECT TOP 1 IdFaseNotaAlunoAuditoria 
         	FROM TbFaseNotaAluno_Auditoria
     		WHERE 	IdFaseNotaAlunoAuditoria < i.IdFaseNotaAlunoAuditoria	
				AND IdAluno = i.IdAluno AND IdTurma = i.IdTurma AND IdDisciplina = i.IdDisciplina AND IdFaseNota = i.IdFaseNota
     		ORDER 	BY IdFaseNotaAlunoAuditoria DESC
			)
	    FROM inserted i 
	    INNER JOIN TbFaseNotaAluno_Auditoria ON i.IdFaseNotaAlunoAuditoria = TbFaseNotaAluno_Auditoria.IdFaseNotaAlunoAuditoria
	    WHERE i.IdFaseNotaAlunoAuditoria = TbFaseNotaAluno_Auditoria.IdFaseNotaAlunoAuditoria
END


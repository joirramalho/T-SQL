
--
-- Activesoft Consultoria 
-- TRIGGER criada pelo Activesoft Service Pack em 18/11/2021 durante atualização para versão 1.065.183.
--

CREATE TRIGGER [dbo].[TgFaseNotaAluno_Auditoria_Pos] ON [dbo].[TbFaseNotaAluno_Auditoria]
--ALTER TRIGGER [dbo].[TgFaseNotaAluno_Auditoria_Pos] ON [dbo].[TbFaseNotaAluno_Auditoria]
FOR INSERT
AS
BEGIN
	SET NOCOUNT ON
	
    UPDATE TbFaseNotaAluno_Auditoria
    SET PRIOR_IdFaseNotaAlunoAuditoria = 
		    (
		    SELECT TOP 1 IdFaseNotaAlunoAuditoria 
         	FROM 	TbFaseNotaAluno_Auditoria
     		WHERE 	IdFaseNotaAlunoAuditoria < i.IdFaseNotaAlunoAuditoria	
					AND IdAluno = i.IdAluno AND IdTurma = i.IdTurma AND IdDisciplina = i.IdDisciplina AND IdFaseNota = i.IdFaseNota
     		ORDER 	BY IdFaseNotaAlunoAuditoria DESC
			)
	    FROM inserted i 
	    INNER JOIN TbFaseNotaAluno_Auditoria ON i.IdFaseNotaAlunoAuditoria = TbFaseNotaAluno_Auditoria.IdFaseNotaAlunoAuditoria
	    WHERE TbFaseNotaAluno_Auditoria.IdFaseNotaAlunoAuditoria = i.IdFaseNotaAlunoAuditoria
END

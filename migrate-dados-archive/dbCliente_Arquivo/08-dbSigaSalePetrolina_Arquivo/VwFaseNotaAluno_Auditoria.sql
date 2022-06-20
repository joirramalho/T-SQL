-- dbo.VwFaseNotaAluno_Auditoria source

ALTER  VIEW dbo.VwFaseNotaAluno_Auditoria AS 
	SELECT	DataHora,Operacao,IdUsuario,IdDisciplina,IdTurma,IdAluno,IdFaseNota,Nota01,Nota02,Nota03,Nota04,Nota05,Nota06,Nota07,Nota08,Nota09,Nota10,IdFormulaComposicao,StNotaConfirmada,NotaFase,Faltas,QuantAulasDadas,StNotaFaseExibirDisp,IdFaseNotaAlunoAuditoria,IdProfessor
	FROM	TbFaseNotaAluno_Auditoria
--	UNION ALL
--	SELECT	*
--	FROM	dbSigaSalePetrolina_Arquivo01.dbo.TbFaseNotaAluno_Auditoria
--	UNION ALL
--	SELECT	*
--	FROM	dbSigaSalePetrolina_Arquivo02.dbo.TbFaseNotaAluno_Auditoria
--	UNION ALL
--	SELECT	*
--	FROM	dbSigaSalePetrolina_Arquivo03.dbo.TbFaseNotaAluno_Auditoria;
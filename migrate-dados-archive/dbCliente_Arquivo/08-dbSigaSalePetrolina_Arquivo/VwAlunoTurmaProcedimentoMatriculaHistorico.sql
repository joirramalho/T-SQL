-- dbo.VwAlunoTurmaProcedimentoMatriculaHistorico source

ALTER VIEW dbo.VwAlunoTurmaProcedimentoMatriculaHistorico AS 
	SELECT	IdAluno, IdTurma, DataAtualizacao, DescricaoAtualizacao, IdUsuario, IdAlunoTurmaProcedimentoMatricula
	FROM	TbAlunoTurmaProcedimentoMatriculaHistorico
--	UNION ALL
--	SELECT	IdAluno, IdTurma, DataAtualizacao, DescricaoAtualizacao, IdUsuario, IdAlunoTurmaProcedimentoMatricula
--	FROM	dbSigaSalePetrolina_Arquivo01.dbo.TbAlunoTurmaProcedimentoMatriculaHistorico
--	UNION ALL
--	SELECT	IdAluno, IdTurma, DataAtualizacao, DescricaoAtualizacao, IdUsuario, IdAlunoTurmaProcedimentoMatricula
--	FROM	dbSigaSalePetrolina_Arquivo02.dbo.TbAlunoTurmaProcedimentoMatriculaHistorico
--	UNION ALL
--	SELECT	IdAluno, IdTurma, DataAtualizacao, DescricaoAtualizacao, IdUsuario, IdAlunoTurmaProcedimentoMatricula
--	FROM	dbSigaSalePetrolina_Arquivo03.dbo.TbAlunoTurmaProcedimentoMatriculaHistorico;
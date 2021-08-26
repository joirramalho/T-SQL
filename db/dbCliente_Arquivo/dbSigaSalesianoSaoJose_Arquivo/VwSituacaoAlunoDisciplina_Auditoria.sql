-- dbo.VwSituacaoAlunoDisciplina_Auditoria source

--
-- Activesoft Consultoria 
-- VIEW criada pelo Activesoft Service Pack em 30/04/2018 durante atualização para versão 1.064.750.
--


ALTER VIEW dbo.VwSituacaoAlunoDisciplina_Auditoria AS
--ALTER VIEW dbo.VwSituacaoAlunoDisciplina_Auditoria AS
	SELECT	sada.IdSituacaoAlunoDisciplinaAuditoria, 
        	sada.DataHora, 
                sada.Operacao, 
                Operacao_Extenso = CASE sada.Operacao WHEN 'U' THEN 'Alteração' WHEN 'I' THEN 'Inclusão' WHEN 'D' THEN 'Exclusão' END,
                sada.IdUsuario, 
        	u.NomeUsuario,
                sada.IdDisciplina, 
		d.SiglaDisciplina,
        	d.NomeDisciplina,
                sada.IdTurma, 
        	t.SiglaTurma,
                sada.IdAluno, 
                sada.IdFaseNotaAtual, 
                sada.SituacaoAtual, 
                sada.StDisciplinaDispensada,
		sada.IdAlunoCurso, 
                sada.DataMatricula, 
                sada.IdUsuarioMatricula, 
                sada.DataTrancamento, 
                sada.NotaFinal, 
                sada.Faltas, 
                sada.ProblemaAutorizadoMatricula,
                sada.IdUsuarioAutorizacaoMatricula,
                UsuarioAutorizacaoMatricula = ua.NomeUsuario,
                sada.JustificativaAutorizacaoMatricula,
                sada.IdUsuarioTrancamento, 
                UsuarioTrancamento = ut.NomeUsuario,
                sada.IdMotivoTrancamento,
                MotivoTrancamento = mi.MotivoInativacao,
                sada.ComentarioTrancamento,
        	tsad.Descricao,
        	NomeFaseNotaAtual = ISNULL( fn.NomeFase, '(Não definida)' ),
  		sada.IdSituacaoAlunoDisciplina
    	FROM	TbSituacaoAlunoDisciplina_Auditoria sada
        LEFT	JOIN TbFaseNota fn ON fn.IdFaseNota = sada.IdFaseNotaAtual
	LEFT	JOIN TbDisciplina d ON d.IdDisciplina = sada.IdDisciplina
	LEFT	JOIN TbTurma t ON t.IdTurma = sada.IdTurma
	LEFT	JOIN TbTipoSituacaoAlunoDisciplina tsad ON tsad.TipoSituacaoAlunoDisciplina = sada.SituacaoAtual
	LEFT	JOIN TbUsuario u on u.IdUsuario = sada.IdUsuario
	LEFT	JOIN TbUsuario ua on ua.IdUsuario = sada.IdUsuarioAutorizacaoMatricula
	LEFT	JOIN TbUsuario ut on ut.IdUsuario = sada.IdUsuarioTrancamento
        LEFT	JOIN TbMotivoInativacao mi ON mi.IdMotivoInativacao = sada.IdMotivoTrancamento
        
UNION ALL

	SELECT	sada.IdSituacaoAlunoDisciplinaAuditoria, 
        	sada.DataHora, 
                sada.Operacao, 
                Operacao_Extenso = CASE sada.Operacao WHEN 'U' THEN 'Alteração' WHEN 'I' THEN 'Inclusão' WHEN 'D' THEN 'Exclusão' END,
                sada.IdUsuario, 
        	u.NomeUsuario,
                sada.IdDisciplina, 
		d.SiglaDisciplina,
        	d.NomeDisciplina,
                sada.IdTurma, 
        	t.SiglaTurma,
                sada.IdAluno, 
                sada.IdFaseNotaAtual, 
                sada.SituacaoAtual, 
                sada.StDisciplinaDispensada,
		sada.IdAlunoCurso, 
                sada.DataMatricula, 
                sada.IdUsuarioMatricula, 
                sada.DataTrancamento, 
                sada.NotaFinal, 
                sada.Faltas, 
                sada.ProblemaAutorizadoMatricula,
                sada.IdUsuarioAutorizacaoMatricula,
                UsuarioAutorizacaoMatricula = ua.NomeUsuario,
                sada.JustificativaAutorizacaoMatricula,
                sada.IdUsuarioTrancamento, 
                UsuarioTrancamento = ut.NomeUsuario,
                sada.IdMotivoTrancamento,
                MotivoTrancamento = mi.MotivoInativacao,
                sada.ComentarioTrancamento,
        	tsad.Descricao,
        	NomeFaseNotaAtual = ISNULL( fn.NomeFase, '(Não definida)' ),
  		sada.IdSituacaoAlunoDisciplina
    	FROM	dbSigaSalesianoSaoJose_Arquivo.dbo.TbSituacaoAlunoDisciplina_Auditoria sada
        LEFT	JOIN TbFaseNota fn ON fn.IdFaseNota = sada.IdFaseNotaAtual
	LEFT	JOIN TbDisciplina d ON d.IdDisciplina = sada.IdDisciplina
	LEFT	JOIN TbTurma t ON t.IdTurma = sada.IdTurma
	LEFT	JOIN TbTipoSituacaoAlunoDisciplina tsad ON tsad.TipoSituacaoAlunoDisciplina = sada.SituacaoAtual
	LEFT	JOIN TbUsuario u on u.IdUsuario = sada.IdUsuario
	LEFT	JOIN TbUsuario ua on ua.IdUsuario = sada.IdUsuarioAutorizacaoMatricula
	LEFT	JOIN TbUsuario ut on ut.IdUsuario = sada.IdUsuarioTrancamento
        LEFT	JOIN TbMotivoInativacao mi ON mi.IdMotivoInativacao = sada.IdMotivoTrancamento
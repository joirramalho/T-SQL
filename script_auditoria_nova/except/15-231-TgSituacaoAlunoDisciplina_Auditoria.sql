
--
-- Activesoft Consultoria 
-- TRIGGER criada pelo Activesoft Service Pack em 15/09/2021 durante atualização para versão 1.065.164.
--


CREATE TRIGGER [dbo].[TgSituacaoAlunoDisciplina_Auditoria] ON [dbo].[TbSituacaoAlunoDisciplina]
-- ALTER TRIGGER [dbo].[TgSituacaoAlunoDisciplina_Auditoria] ON [dbo].[TbSituacaoAlunoDisciplina]
FOR INSERT, UPDATE, DELETE
AS
BEGIN
	IF @@ROWCOUNT = 0
		RETURN

	SET NOCOUNT ON
	
	DECLARE @TipoOperacao CHAR(1) = 'I' -- Insert by default.
	IF EXISTS(SELECT * FROM DELETED)
	BEGIN
		SET @TipoOperacao = 
		    CASE
			WHEN EXISTS(SELECT * FROM INSERTED) THEN 'U' ELSE 'D' 
		    END
	END
	ELSE 
		IF NOT EXISTS(SELECT * FROM INSERTED) RETURN -- Nem updated nem inserted. Pode ter sido um "failed delete".

		
	IF	NOT EXISTS(	SELECT * FROM inserted
					EXCEPT
					SELECT * FROM deleted ) AND  @TipoOperacao <> 'D'
		RETURN
		
	
	IF ( SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS c WHERE DATA_TYPE NOT IN ( 'text', 'image' ) AND TABLE_NAME = 'TbSituacaoAlunoDisciplina' AND LEFT(COLUMN_NAME,1) <> '_' ) <> 21
	BEGIN
		RAISERROR ('Dados não podem ser alterados (trigger de auditoria TgSituacaoAlunoDisciplina_Auditoria inválida)', 16, 1) 
		ROLLBACK TRANSACTION 
		RETURN 
	END 

	DECLARE @IdUsuario INTEGER
	IF OBJECT_ID( 'tempdb..#TempTable' ) IS NOT NULL
		SELECT @IdUsuario = IdUsuario FROM #TempTable
	ELSE
		SET @IdUsuario = NULL


	IF ( @TipoOperacao = 'D' )
		INSERT	TbSituacaoAlunoDisciplina_Auditoria ( 	DataHora, Operacao, IdUsuario, IdDisciplina, IdTurma, IdAluno, IdFaseNotaAtual, SituacaoAtual, StDisciplinaDispensada, IdAlunoCurso, DataMatricula, IdUsuarioMatricula, DataTrancamento, IdUsuarioTrancamento, IdMotivoTrancamento, ComentarioTrancamento, IdSituacaoAlunoDisciplina, NotaFinal, Faltas, ProblemaAutorizadoMatricula, IdUsuarioAutorizacaoMatricula, JustificativaAutorizacaoMatricula, StGoogleEdu_Sincronizado, GoogleForEducation_LogProcessamento )
			SELECT										GETDATE(), @TipoOperacao, @IdUsuario, IdDisciplina, IdTurma, IdAluno, IdFaseNotaAtual, SituacaoAtual, StDisciplinaDispensada, IdAlunoCurso, DataMatricula, IdUsuarioMatricula, DataTrancamento, IdUsuarioTrancamento, IdMotivoTrancamento, ComentarioTrancamento, IdSituacaoAlunoDisciplina, NotaFinal, Faltas, ProblemaAutorizadoMatricula, IdUsuarioAutorizacaoMatricula, JustificativaAutorizacaoMatricula, StGoogleEdu_Sincronizado, GoogleForEducation_LogProcessamento
			FROM	deleted
	ELSE
		INSERT	TbSituacaoAlunoDisciplina_Auditoria ( 	DataHora, Operacao, IdUsuario, IdDisciplina, IdTurma, IdAluno, IdFaseNotaAtual, SituacaoAtual, StDisciplinaDispensada, IdAlunoCurso, DataMatricula, IdUsuarioMatricula, DataTrancamento, IdUsuarioTrancamento, IdMotivoTrancamento, ComentarioTrancamento, IdSituacaoAlunoDisciplina, NotaFinal, Faltas, ProblemaAutorizadoMatricula, IdUsuarioAutorizacaoMatricula, JustificativaAutorizacaoMatricula, StGoogleEdu_Sincronizado, GoogleForEducation_LogProcessamento )
			SELECT										GETDATE(), @TipoOperacao, @IdUsuario, IdDisciplina, IdTurma, IdAluno, IdFaseNotaAtual, SituacaoAtual, StDisciplinaDispensada, IdAlunoCurso, DataMatricula, IdUsuarioMatricula, DataTrancamento, IdUsuarioTrancamento, IdMotivoTrancamento, ComentarioTrancamento, IdSituacaoAlunoDisciplina, NotaFinal, Faltas, ProblemaAutorizadoMatricula, IdUsuarioAutorizacaoMatricula, JustificativaAutorizacaoMatricula, StGoogleEdu_Sincronizado, GoogleForEducation_LogProcessamento
			FROM	inserted
		EXCEPT
			SELECT										GETDATE(), @TipoOperacao, @IdUsuario, IdDisciplina, IdTurma, IdAluno, IdFaseNotaAtual, SituacaoAtual, StDisciplinaDispensada, IdAlunoCurso, DataMatricula, IdUsuarioMatricula, DataTrancamento, IdUsuarioTrancamento, IdMotivoTrancamento, ComentarioTrancamento, IdSituacaoAlunoDisciplina, NotaFinal, Faltas, ProblemaAutorizadoMatricula, IdUsuarioAutorizacaoMatricula, JustificativaAutorizacaoMatricula, StGoogleEdu_Sincronizado, GoogleForEducation_LogProcessamento
			FROM	deleted
END


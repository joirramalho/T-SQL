SET ANSI_NULLS ON
GO 

SET QUOTED_IDENTIFIER OFF
GO 

--
-- Activesoft Consultoria 
-- TRIGGER criada pelo Activesoft Service Pack em 21/01/2020 durante atualização para versão 1.065.xxx.
--


CREATE TRIGGER [dbo].[TgAlunoTurma_Auditoria] ON [dbo].[TbAlunoTurma]
--ALTER TRIGGER [dbo].[TgAlunoTurma_Auditoria] ON [dbo].[TbAlunoTurma]
FOR INSERT, UPDATE, DELETE
AS
BEGIN
	SET NOCOUNT ON

	IF ( SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS c WHERE DATA_TYPE NOT IN ( 'text', 'image' ) AND TABLE_NAME = 'TbAlunoTurma' AND LEFT(COLUMN_NAME,1) <> '_' ) <> 36
	  BEGIN
		RAISERROR ('Dados não podem ser alterados (trigger de auditoria TgAlunoTurma_Auditoria inválida -- quantidade de campos)', 16, 1) 
		ROLLBACK TRANSACTION 
		RETURN 
	  END 

	
	  
	DECLARE @IdUsuario INTEGER
	IF APP_NAME() = 'SIGAWEB'
		SELECT	@IdUsuario = IdUsuario
		FROM	dbo.FnCriarTabelaTemporaria(HOST_NAME())		
	ELSE IF OBJECT_ID( 'tempdb..#TempTable') IS NULL 
	  BEGIN 
		--RAISERROR ('Dados não podem ser alterados (autenticação)', 16, 1) 
		--ROLLBACK TRANSACTION 
		--RETURN 
		SET @IdUsuario = NULL
	  END
	ELSE
	  SELECT @IdUsuario = IdUsuario FROM #TempTable

	
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


	IF ( @TipoOperacao = 'D' )
		INSERT	TbAlunoTurma_Auditoria (	DataHora,	Operacao,		IdUsuario,	[IdTurma], [IdAluno], [IdSituacaoAlunoTurma], [DataSituacaoAtivo], [DataSituacaoInativo], [IdFaseNotaInicial], [OrdemChamada], [DataHoraEfetivacaoMatricula], [IdUsuarioEfetivacaoMatricula], [IdAlunoCursoSuperior], [ProblemaAutorizadoMatricula], [IdUsuarioAutorizacaoMatricula], [JustificativaAutorizacaoMatricula], [StAlunoTurmaNaoPermitePParcial], [ES_IdCurriculoOptativa], [IdResponsavelFinanceiro], [IdTipoResponsavelFinanceiro], [IdResponsavelSecundario], [IdTipoResponsavelSecundario], [IdMotivoInativacao], [IdEstabEnsinoInativacao], [ComentarioInativacao], [Comentario], [IdPlanoPagamento_PreMatricula], [IdPlanoPagamento_Matricula], [SituacaoExcecao_IdSituacaoAlunoTurma], [SituacaoExcecao_IdUsuario], [SituacaoExcecao_DataRegistro], [SituacaoExcecao_Comentario], [IdAlunoCurso], [IdEventoTipoInscricao], [RMOnline_TextoPersonalizado_Confirmacao], [StProcessamento_FichaInscricao], [StProcessamento_ConfirmacaoReservaOnline], [StProcessamento_InscricaoEmTurma], [IdAlunoTurma] )
		SELECT								GETDATE(),	@TipoOperacao,	@IdUsuario, [IdTurma], [IdAluno], [IdSituacaoAlunoTurma], [DataSituacaoAtivo], [DataSituacaoInativo], [IdFaseNotaInicial], [OrdemChamada], [DataHoraEfetivacaoMatricula], [IdUsuarioEfetivacaoMatricula], [IdAlunoCursoSuperior], [ProblemaAutorizadoMatricula], [IdUsuarioAutorizacaoMatricula], [JustificativaAutorizacaoMatricula], [StAlunoTurmaNaoPermitePParcial], [ES_IdCurriculoOptativa], [IdResponsavelFinanceiro], [IdTipoResponsavelFinanceiro], [IdResponsavelSecundario], [IdTipoResponsavelSecundario], [IdMotivoInativacao], [IdEstabEnsinoInativacao], [ComentarioInativacao], [Comentario], [IdPlanoPagamento_PreMatricula], [IdPlanoPagamento_Matricula], [SituacaoExcecao_IdSituacaoAlunoTurma], [SituacaoExcecao_IdUsuario], [SituacaoExcecao_DataRegistro], [SituacaoExcecao_Comentario], [IdAlunoCurso], [IdEventoTipoInscricao], [RMOnline_TextoPersonalizado_Confirmacao], [StProcessamento_FichaInscricao], [StProcessamento_ConfirmacaoReservaOnline], [StProcessamento_InscricaoEmTurma], [IdAlunoTurma] 
		FROM	deleted
	ELSE
		INSERT	TbAlunoTurma_Auditoria (	DataHora,	Operacao,		IdUsuario,	[IdTurma], [IdAluno], [IdSituacaoAlunoTurma], [DataSituacaoAtivo], [DataSituacaoInativo], [IdFaseNotaInicial], [OrdemChamada], [DataHoraEfetivacaoMatricula], [IdUsuarioEfetivacaoMatricula], [IdAlunoCursoSuperior], [ProblemaAutorizadoMatricula], [IdUsuarioAutorizacaoMatricula], [JustificativaAutorizacaoMatricula], [StAlunoTurmaNaoPermitePParcial], [ES_IdCurriculoOptativa], [IdResponsavelFinanceiro], [IdTipoResponsavelFinanceiro], [IdResponsavelSecundario], [IdTipoResponsavelSecundario], [IdMotivoInativacao], [IdEstabEnsinoInativacao], [ComentarioInativacao], [Comentario], [IdPlanoPagamento_PreMatricula], [IdPlanoPagamento_Matricula], [SituacaoExcecao_IdSituacaoAlunoTurma], [SituacaoExcecao_IdUsuario], [SituacaoExcecao_DataRegistro], [SituacaoExcecao_Comentario], [IdAlunoCurso], [IdEventoTipoInscricao], [RMOnline_TextoPersonalizado_Confirmacao], [StProcessamento_FichaInscricao], [StProcessamento_ConfirmacaoReservaOnline], [StProcessamento_InscricaoEmTurma], [IdAlunoTurma] )
		SELECT								GETDATE(),	@TipoOperacao,	@IdUsuario, [IdTurma], [IdAluno], [IdSituacaoAlunoTurma], [DataSituacaoAtivo], [DataSituacaoInativo], [IdFaseNotaInicial], [OrdemChamada], [DataHoraEfetivacaoMatricula], [IdUsuarioEfetivacaoMatricula], [IdAlunoCursoSuperior], [ProblemaAutorizadoMatricula], [IdUsuarioAutorizacaoMatricula], [JustificativaAutorizacaoMatricula], [StAlunoTurmaNaoPermitePParcial], [ES_IdCurriculoOptativa], [IdResponsavelFinanceiro], [IdTipoResponsavelFinanceiro], [IdResponsavelSecundario], [IdTipoResponsavelSecundario], [IdMotivoInativacao], [IdEstabEnsinoInativacao], [ComentarioInativacao], [Comentario], [IdPlanoPagamento_PreMatricula], [IdPlanoPagamento_Matricula], [SituacaoExcecao_IdSituacaoAlunoTurma], [SituacaoExcecao_IdUsuario], [SituacaoExcecao_DataRegistro], [SituacaoExcecao_Comentario], [IdAlunoCurso], [IdEventoTipoInscricao], [RMOnline_TextoPersonalizado_Confirmacao], [StProcessamento_FichaInscricao], [StProcessamento_ConfirmacaoReservaOnline], [StProcessamento_InscricaoEmTurma], [IdAlunoTurma] 
				FROM	inserted
END
GO

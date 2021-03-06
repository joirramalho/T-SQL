SET ANSI_NULLS ON
GO 

SET QUOTED_IDENTIFIER OFF
GO 

--
-- Activesoft Consultoria 
-- TRIGGER criada pelo Activesoft Service Pack em 21/01/2020 durante atualização para versão 1.065.xxx.
--


CREATE TRIGGER [dbo].[TgAluno_Auditoria] ON [dbo].[TbAluno]
--ALTER TRIGGER [dbo].[TgAluno_Auditoria] ON [dbo].[TbAluno]
FOR INSERT, UPDATE, DELETE
AS
BEGIN
	SET NOCOUNT ON

	IF ( SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS c WHERE DATA_TYPE NOT IN ( 'text', 'image' ) AND TABLE_NAME = 'TbAluno' AND LEFT(COLUMN_NAME,1) <> '_' ) <> 99
	  BEGIN
		RAISERROR ('Dados não podem ser alterados (trigger de auditoria TgAluno_Auditoria inválida -- quantidade de campos)', 16, 1) 
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
		INSERT	TbAluno_Auditoria (	DataHora,	Operacao,		IdUsuario,	[IdAluno], [NomeAluno], [NomeAbreviado], [IdUnidade], [Matricula], [Senha], [CodigoLeitora], [Sexo], [EstadoCivil], [DataNascimento], [IdPai], [IdMae], [IdResponsavel], [IdTipoResponsavel], [Celular], [SMS], [Email], [IdEndereco], [CPF], [RG], [Naturalidade], [Nacionalidade], [TipoSangue], [PlanoSaude], [Alergia], [Medicamento], [IdEstabelecimentoEnsinoAnterior], [TIAcodigo], [IdReligiao], [AnoConclusao], [CorRaca], [NaturalidadeCidade], [NaturalidadeUF], [NumeroPasta], [IES_FormaIngresso], [IES_MediaVestibular], [IES_Curso], [IES_AnoIngresso], [IES_SituacaoAluno], [IES_DataSituacaoAluno], [RegistroNascimentoNumero], [RegistroNascimentoLivro], [RegistroNascimentoFolha], [RegistroNascimentoCartorio], [IdentidadeEstudantil], [IdFormaEntregaDocumento], [IdResponsavelSecundario], [IdTipoResponsavelSecundario], [RegistroNascimentoData], [IdentificadorCatraca], [IdentidadeEstudantil_RU], [Passaporte], [StDeficienciaCegueira], [StDeficienciaBaixaVisao], [StDeficienciaSurdez], [StDeficienciaAuditiva], [StDeficienciaFisica], [StDeficienciaSurdoCegueira], [StDeficienciaMultipla], [StDeficienciaMental], [NumeroNIS], [CodigoINEP], [TipoNacionalidade], [IdPaisOrigem], [RG_OrgaoEmissor], [RG_DataEmissao], [StMatriculaTemp], [GpaIdentificadorCatraca], [GpaDataHoraAlteracao], [IdAluno_CadastroVinculadoOrigem], [GpaIdentificadorCatraca2], [GpaIdentificadorCatraca3], [GpaIdentificadorCatraca4], [GpaIdentificadorCatraca5], [StFalecido], [TituloEleitor_Numero], [TituloEleitor_DataExpedicao], [TituloEleitor_Cidade], [TituloEleitor_UF], [TituloEleitor_Secao], [TituloEleitor_Zona], [TituloEleitor_StQuitacaoEleitoral], [EnsinoMedio_IdEstabelecimentoEnsino], [EnsinoMedio_AnoConclusao], [CertidaoReservista], [RG_OrgaoEmissorUF], [StDeficienciaAutismoInfantil], [StDeficienciaSindromeAsperger], [StDeficienciaSindromeRett], [StDeficienciaTrastornoDesintegrativo], [StDeficienciaAltasHabilidades], [GoogleForEducation_Id], [GoogleForEducation_Email], [GoogleForEducation_Nome], [GoogleForEducation_SobreNome], [NomeCivil], [GoogleForEducation_LogProcessamento], [StAppComunicacao_Sincronizado], [AppComunicacao_LogProcessamento] )
		SELECT						GETDATE(),	@TipoOperacao,	@IdUsuario, [IdAluno], [NomeAluno], [NomeAbreviado], [IdUnidade], [Matricula], [Senha], [CodigoLeitora], [Sexo], [EstadoCivil], [DataNascimento], [IdPai], [IdMae], [IdResponsavel], [IdTipoResponsavel], [Celular], [SMS], [Email], [IdEndereco], [CPF], [RG], [Naturalidade], [Nacionalidade], [TipoSangue], [PlanoSaude], [Alergia], [Medicamento], [IdEstabelecimentoEnsinoAnterior], [TIAcodigo], [IdReligiao], [AnoConclusao], [CorRaca], [NaturalidadeCidade], [NaturalidadeUF], [NumeroPasta], [IES_FormaIngresso], [IES_MediaVestibular], [IES_Curso], [IES_AnoIngresso], [IES_SituacaoAluno], [IES_DataSituacaoAluno], [RegistroNascimentoNumero], [RegistroNascimentoLivro], [RegistroNascimentoFolha], [RegistroNascimentoCartorio], [IdentidadeEstudantil], [IdFormaEntregaDocumento], [IdResponsavelSecundario], [IdTipoResponsavelSecundario], [RegistroNascimentoData], [IdentificadorCatraca], [IdentidadeEstudantil_RU], [Passaporte], [StDeficienciaCegueira], [StDeficienciaBaixaVisao], [StDeficienciaSurdez], [StDeficienciaAuditiva], [StDeficienciaFisica], [StDeficienciaSurdoCegueira], [StDeficienciaMultipla], [StDeficienciaMental], [NumeroNIS], [CodigoINEP], [TipoNacionalidade], [IdPaisOrigem], [RG_OrgaoEmissor], [RG_DataEmissao], [StMatriculaTemp], [GpaIdentificadorCatraca], [GpaDataHoraAlteracao], [IdAluno_CadastroVinculadoOrigem], [GpaIdentificadorCatraca2], [GpaIdentificadorCatraca3], [GpaIdentificadorCatraca4], [GpaIdentificadorCatraca5], [StFalecido], [TituloEleitor_Numero], [TituloEleitor_DataExpedicao], [TituloEleitor_Cidade], [TituloEleitor_UF], [TituloEleitor_Secao], [TituloEleitor_Zona], [TituloEleitor_StQuitacaoEleitoral], [EnsinoMedio_IdEstabelecimentoEnsino], [EnsinoMedio_AnoConclusao], [CertidaoReservista], [RG_OrgaoEmissorUF], [StDeficienciaAutismoInfantil], [StDeficienciaSindromeAsperger], [StDeficienciaSindromeRett], [StDeficienciaTrastornoDesintegrativo], [StDeficienciaAltasHabilidades], [GoogleForEducation_Id], [GoogleForEducation_Email], [GoogleForEducation_Nome], [GoogleForEducation_SobreNome], [NomeCivil], [GoogleForEducation_LogProcessamento], [StAppComunicacao_Sincronizado], [AppComunicacao_LogProcessamento] 
		FROM	deleted
	ELSE
		INSERT	TbAluno_Auditoria (	DataHora,	Operacao,		IdUsuario,	[IdAluno], [NomeAluno], [NomeAbreviado], [IdUnidade], [Matricula], [Senha], [CodigoLeitora], [Sexo], [EstadoCivil], [DataNascimento], [IdPai], [IdMae], [IdResponsavel], [IdTipoResponsavel], [Celular], [SMS], [Email], [IdEndereco], [CPF], [RG], [Naturalidade], [Nacionalidade], [TipoSangue], [PlanoSaude], [Alergia], [Medicamento], [IdEstabelecimentoEnsinoAnterior], [TIAcodigo], [IdReligiao], [AnoConclusao], [CorRaca], [NaturalidadeCidade], [NaturalidadeUF], [NumeroPasta], [IES_FormaIngresso], [IES_MediaVestibular], [IES_Curso], [IES_AnoIngresso], [IES_SituacaoAluno], [IES_DataSituacaoAluno], [RegistroNascimentoNumero], [RegistroNascimentoLivro], [RegistroNascimentoFolha], [RegistroNascimentoCartorio], [IdentidadeEstudantil], [IdFormaEntregaDocumento], [IdResponsavelSecundario], [IdTipoResponsavelSecundario], [RegistroNascimentoData], [IdentificadorCatraca], [IdentidadeEstudantil_RU], [Passaporte], [StDeficienciaCegueira], [StDeficienciaBaixaVisao], [StDeficienciaSurdez], [StDeficienciaAuditiva], [StDeficienciaFisica], [StDeficienciaSurdoCegueira], [StDeficienciaMultipla], [StDeficienciaMental], [NumeroNIS], [CodigoINEP], [TipoNacionalidade], [IdPaisOrigem], [RG_OrgaoEmissor], [RG_DataEmissao], [StMatriculaTemp], [GpaIdentificadorCatraca], [GpaDataHoraAlteracao], [IdAluno_CadastroVinculadoOrigem], [GpaIdentificadorCatraca2], [GpaIdentificadorCatraca3], [GpaIdentificadorCatraca4], [GpaIdentificadorCatraca5], [StFalecido], [TituloEleitor_Numero], [TituloEleitor_DataExpedicao], [TituloEleitor_Cidade], [TituloEleitor_UF], [TituloEleitor_Secao], [TituloEleitor_Zona], [TituloEleitor_StQuitacaoEleitoral], [EnsinoMedio_IdEstabelecimentoEnsino], [EnsinoMedio_AnoConclusao], [CertidaoReservista], [RG_OrgaoEmissorUF], [StDeficienciaAutismoInfantil], [StDeficienciaSindromeAsperger], [StDeficienciaSindromeRett], [StDeficienciaTrastornoDesintegrativo], [StDeficienciaAltasHabilidades], [GoogleForEducation_Id], [GoogleForEducation_Email], [GoogleForEducation_Nome], [GoogleForEducation_SobreNome], [NomeCivil], [GoogleForEducation_LogProcessamento], [StAppComunicacao_Sincronizado], [AppComunicacao_LogProcessamento] )
		SELECT						GETDATE(),	@TipoOperacao,	@IdUsuario, [IdAluno], [NomeAluno], [NomeAbreviado], [IdUnidade], [Matricula], [Senha], [CodigoLeitora], [Sexo], [EstadoCivil], [DataNascimento], [IdPai], [IdMae], [IdResponsavel], [IdTipoResponsavel], [Celular], [SMS], [Email], [IdEndereco], [CPF], [RG], [Naturalidade], [Nacionalidade], [TipoSangue], [PlanoSaude], [Alergia], [Medicamento], [IdEstabelecimentoEnsinoAnterior], [TIAcodigo], [IdReligiao], [AnoConclusao], [CorRaca], [NaturalidadeCidade], [NaturalidadeUF], [NumeroPasta], [IES_FormaIngresso], [IES_MediaVestibular], [IES_Curso], [IES_AnoIngresso], [IES_SituacaoAluno], [IES_DataSituacaoAluno], [RegistroNascimentoNumero], [RegistroNascimentoLivro], [RegistroNascimentoFolha], [RegistroNascimentoCartorio], [IdentidadeEstudantil], [IdFormaEntregaDocumento], [IdResponsavelSecundario], [IdTipoResponsavelSecundario], [RegistroNascimentoData], [IdentificadorCatraca], [IdentidadeEstudantil_RU], [Passaporte], [StDeficienciaCegueira], [StDeficienciaBaixaVisao], [StDeficienciaSurdez], [StDeficienciaAuditiva], [StDeficienciaFisica], [StDeficienciaSurdoCegueira], [StDeficienciaMultipla], [StDeficienciaMental], [NumeroNIS], [CodigoINEP], [TipoNacionalidade], [IdPaisOrigem], [RG_OrgaoEmissor], [RG_DataEmissao], [StMatriculaTemp], [GpaIdentificadorCatraca], [GpaDataHoraAlteracao], [IdAluno_CadastroVinculadoOrigem], [GpaIdentificadorCatraca2], [GpaIdentificadorCatraca3], [GpaIdentificadorCatraca4], [GpaIdentificadorCatraca5], [StFalecido], [TituloEleitor_Numero], [TituloEleitor_DataExpedicao], [TituloEleitor_Cidade], [TituloEleitor_UF], [TituloEleitor_Secao], [TituloEleitor_Zona], [TituloEleitor_StQuitacaoEleitoral], [EnsinoMedio_IdEstabelecimentoEnsino], [EnsinoMedio_AnoConclusao], [CertidaoReservista], [RG_OrgaoEmissorUF], [StDeficienciaAutismoInfantil], [StDeficienciaSindromeAsperger], [StDeficienciaSindromeRett], [StDeficienciaTrastornoDesintegrativo], [StDeficienciaAltasHabilidades], [GoogleForEducation_Id], [GoogleForEducation_Email], [GoogleForEducation_Nome], [GoogleForEducation_SobreNome], [NomeCivil], [GoogleForEducation_LogProcessamento], [StAppComunicacao_Sincronizado], [AppComunicacao_LogProcessamento] 
				FROM	inserted
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

USE dbLogRestore

IF (OBJECT_ID('dbo.sp_JobMascararDados') IS NOT NULL) DROP PROCEDURE sp_JobMascararDados
GO

-- dbLogRestore.dbo.sp_JobMascararDados '200018a' -- CRM

CREATE PROCEDURE [dbo].[sp_JobMascararDados] 
	@CRM	VARCHAR (16)
AS
-- VERSION 1.02 - 25Set20 TbResponsavelFoto; TbArquivoAnexo; TbSolicitacaoDescontoTipo; TbProfessorEscolaridade; TbAlunoTurma
-- VERSION 1.01 - 3Set20

DECLARE @NomeDatabase		VARCHAR(32)

DECLARE @strSQL				VARCHAR(MAX)


SET		@CRM	= RTRIM(LTRIM(@CRM))


SELECT		@NomeDatabase = NomeDatabase
FROM		dbLogRestore.dbo.TbLogRestore 
WHERE		CRM = @CRM


-- Logar operação em TbLogMensagem
INSERT INTO [dbLogRestore].[dbo].[TbLogMensagem]
			([CRM]
			,[Erro]
			,[Mensagem])
		VALUES
			(@CRM
			,0 -- Warning
			,'Mascarando Campos de [' + @NomeDatabase + ']' )


IF SUBSTRING( @NomeDatabase, 1, 6 ) = 'dbSiga'
	BEGIN
		SET		@strSQL = 'USE [' + 'CRM_' + @CRM + ']; '

		-- TbAluno
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAluno ALTER COLUMN NomeAluno                                ADD MASKED WITH (FUNCTION = ''partial(3, "XXXXXXXXX", 3)''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAluno ALTER COLUMN NomeAbreviado                            ADD MASKED WITH (FUNCTION = ''partial(3, "XXXXXXXXX", 3)''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAluno ALTER COLUMN Matricula                                ADD MASKED WITH (FUNCTION = ''partial(1, "XXX", 1)''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAluno ALTER COLUMN Senha                                    ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAluno ALTER COLUMN CodigoLeitora                            ADD MASKED WITH (FUNCTION = ''partial(1, "XXX", 1)''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAluno ALTER COLUMN Sexo                                     ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAluno ALTER COLUMN EstadoCivil                              ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAluno ALTER COLUMN DataNascimento                           ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAluno ALTER COLUMN Celular                                  ADD MASKED WITH (FUNCTION = ''partial(1, "(XX) XX", 1)''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAluno ALTER COLUMN SMS                                      ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAluno ALTER COLUMN Email                                    ADD MASKED WITH (FUNCTION = ''email()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAluno ALTER COLUMN CPF                                      ADD MASKED WITH (FUNCTION = ''partial(1, "XXXXXXXXX", 2)''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAluno ALTER COLUMN RG                                       ADD MASKED WITH (FUNCTION = ''partial(1, "XXX", 1)''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAluno ALTER COLUMN Naturalidade                             ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAluno ALTER COLUMN Nacionalidade                            ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAluno ALTER COLUMN TipoSangue                               ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAluno ALTER COLUMN PlanoSaude                               ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAluno ALTER COLUMN Alergia                                  ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAluno ALTER COLUMN Medicamento                              ADD MASKED WITH (FUNCTION = ''default()''); ' 
		-- IdEstabelecimentoEnsinoAnterior
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAluno ALTER COLUMN _RegistroNascimento                      ADD MASKED WITH (FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAluno ALTER COLUMN TIAcodigo                                ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAluno ALTER COLUMN IdReligiao                               ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAluno ALTER COLUMN AnoConclusao                             ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAluno ALTER COLUMN CorRaca                                  ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAluno ALTER COLUMN NaturalidadeCidade                       ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAluno ALTER COLUMN NaturalidadeUF                           ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAluno ALTER COLUMN NumeroPasta                              ADD MASKED WITH (FUNCTION = ''default()''); ' 

		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAluno ALTER COLUMN IES_FormaIngresso                        ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAluno ALTER COLUMN IES_MediaVestibular                      ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAluno ALTER COLUMN IES_Curso                                ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAluno ALTER COLUMN IES_AnoIngresso                          ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAluno ALTER COLUMN IES_SituacaoAluno                        ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAluno ALTER COLUMN IES_DataSituacaoAluno                    ADD MASKED WITH (FUNCTION = ''default()''); ' 

		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAluno ALTER COLUMN RegistroNascimentoNumero                 ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAluno ALTER COLUMN RegistroNascimentoLivro                  ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAluno ALTER COLUMN RegistroNascimentoFolha                  ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAluno ALTER COLUMN RegistroNascimentoCartorio               ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAluno ALTER COLUMN RegistroNascimentoData                   ADD MASKED WITH (FUNCTION = ''default()''); ' 

		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAluno ALTER COLUMN IdentidadeEstudantil                     ADD MASKED WITH (FUNCTION = ''partial(1, "XXX", 1)''); ' 
		-- IdFormaEntregaDocumento
		-- IdTipoResponsavelSecundario
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAluno ALTER COLUMN IdentificadorCatraca                     ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAluno ALTER COLUMN IdentidadeEstudantil_RU                  ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAluno ALTER COLUMN _IdentificadorMEC_Aluno                  ADD MASKED WITH (FUNCTION = ''default()''); ' 

		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAluno ALTER COLUMN StDeficienciaCegueira                    ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAluno ALTER COLUMN StDeficienciaBaixaVisao                  ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAluno ALTER COLUMN StDeficienciaSurdez                      ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAluno ALTER COLUMN StDeficienciaAuditiva                    ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAluno ALTER COLUMN StDeficienciaFisica                      ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAluno ALTER COLUMN StDeficienciaSurdoCegueira               ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAluno ALTER COLUMN StDeficienciaAltasHabilidades            ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAluno ALTER COLUMN StDeficienciaAutismoInfantil             ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAluno ALTER COLUMN StDeficienciaMental                      ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAluno ALTER COLUMN StDeficienciaMultipla                    ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAluno ALTER COLUMN StDeficienciaSindromeAsperger            ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAluno ALTER COLUMN StDeficienciaSindromeRett                ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAluno ALTER COLUMN StDeficienciaTrastornoDesintegrativo     ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAluno ALTER COLUMN StFalecido                               ADD MASKED WITH (FUNCTION = ''default()''); ' 
		-- _IdResponsavel_CadastroVinculado
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAluno ALTER COLUMN NumeroNIS                                ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAluno ALTER COLUMN CodigoINEP                               ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAluno ALTER COLUMN TipoNacionalidade                        ADD MASKED WITH (FUNCTION = ''default()''); ' 

		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAluno ALTER COLUMN RG_DataEmissao                           ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAluno ALTER COLUMN RG_OrgaoEmissor                          ADD MASKED WITH (FUNCTION = ''partial(1, "XXX", 1)''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAluno ALTER COLUMN RG_OrgaoEmissorUF                        ADD MASKED WITH (FUNCTION = ''default()''); ' 

		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAluno ALTER COLUMN TituloEleitor_Cidade                     ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAluno ALTER COLUMN TituloEleitor_DataExpedicao              ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAluno ALTER COLUMN TituloEleitor_Numero                     ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAluno ALTER COLUMN TituloEleitor_Secao                      ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAluno ALTER COLUMN TituloEleitor_StQuitacaoEleitoral        ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAluno ALTER COLUMN TituloEleitor_UF                         ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAluno ALTER COLUMN TituloEleitor_Zona                       ADD MASKED WITH (FUNCTION = ''default()''); ' 

		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAluno ALTER COLUMN CertidaoReservista                       ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAluno ALTER COLUMN EnsinoMedio_AnoConclusao                 ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAluno ALTER COLUMN GpaDataHoraAlteracao                     ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAluno ALTER COLUMN GpaIdentificadorCatraca2                 ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAluno ALTER COLUMN GpaIdentificadorCatraca3                 ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAluno ALTER COLUMN GpaIdentificadorCatraca4                 ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAluno ALTER COLUMN GpaIdentificadorCatraca5                 ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAluno ALTER COLUMN IdPaisOrigem                             ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAluno ALTER COLUMN GpaIdentificadorCatraca                  ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAluno ALTER COLUMN Passaporte                               ADD MASKED WITH (FUNCTION = ''default()''); ' 

		BEGIN TRY   
			EXEC	(@strSQL)
		END TRY
			BEGIN CATCH
				INSERT INTO [dbLogRestore].[dbo].[TbLogMensagem]
							([CRM]
							,[Erro]
							,[Mensagem])
						VALUES
							(@CRM
							,1 -- Erro
							,OBJECT_NAME(@@PROCID) + ' -TbAluno-> ' + ERROR_MESSAGE())
			END CATCH
		---

		SET		@strSQL = 'USE [' + 'CRM_' + @CRM + ']; '

		-- TbAlunoCurso
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoCurso ALTER COLUMN MatriculaAlunoCurso                 ADD MASKED WITH (FUNCTION = ''partial(2, "XXX", 2)''); ' 


		-- TbAlunoFilantropia
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFilantropia ALTER COLUMN RendaFamiliarBruta			ADD MASKED WITH (FUNCTION = ''default()''); ' 


		-- TbAlunoFoto
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFoto ALTER COLUMN Foto				                 	ADD MASKED WITH (FUNCTION = ''default()''); ' 


		-- TbAlunoObs
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoObs ALTER COLUMN ObservacaoRegistro					ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoObs ALTER COLUMN ObservacaoLiberacao					ADD MASKED WITH (FUNCTION = ''default()''); ' 

		BEGIN TRY   
			EXEC	(@strSQL)
		END TRY
			BEGIN CATCH
				INSERT INTO [dbLogRestore].[dbo].[TbLogMensagem]
							([CRM]
							,[Erro]
							,[Mensagem])
						VALUES
							(@CRM
							,1 -- Erro
							,OBJECT_NAME(@@PROCID) + ' -TbAlunoCurso-> ' + ERROR_MESSAGE())
			END CATCH
		---


		SET		@strSQL = 'USE [' + 'CRM_' + @CRM + ']; '

		-- TbAlunoFichaMedica
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN Alim_AmamentacMamadTempo                 ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN Alim_AmamentacSeioTempo                  ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN Alim_ComporDuranteRef                    ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN Alim_HabAlimentares                      ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN Alim_PastosaItens                        ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN Alim_PeriodoDesmame                      ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN Alim_ProbAliment                         ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN Alim_SolidaItens                         ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN Alim_StAmamentacMamad                    ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN Alim_StAmamentacSeio                     ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN Alim_StPastosa                           ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN Alim_StProbAliment                       ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN Alim_StSolida                            ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN Alim_StSozinho                           ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN AntecH_NomeApCirculatorio                ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN AntecH_NomeApDigestivo                   ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN AntecH_NomeApRespiratorio                ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN AntecH_NomePsicossomatica                ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN AntecH_StApCirculatorio                  ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN AntecH_StApDigestivo                     ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN AntecH_StApRespiratorio                  ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN AntecH_StPsicossomatica                  ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN AntecH_StTranstornoMental                ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN Contato1_Celular                         ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN Contato1_Fone                            ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN Contato1_Nome                            ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN Contato2_Celular                         ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN Contato2_Fone                            ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN Contato2_Nome                            ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN Contato3_Celular                         ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN Contato3_Fone                            ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN Contato3_Nome                            ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN DeficienciaDescricao                     ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN DesEmoc_ObsDesEmoc                       ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN DesEmoc_ObsSono                          ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN DesEmoc_ObsTemperamento                  ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN DesEmoc_StProblNoite_Baba                ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN DesEmoc_StProblNoite_Bruxismo            ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN DesEmoc_StProblNoite_Chora               ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN DesEmoc_StProblNoite_Fala                ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN DesEmoc_StProblNoite_Grita               ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN DesEmoc_StProblNoite_Insonia             ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN DesEmoc_StProblNoite_MovAgitada          ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN DesEmoc_StProblNoite_Pesadelo            ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN DesEmoc_StProblNoite_Sudorese            ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN DesEmoc_StReacao                         ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN DesEmoc_StSono                           ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN DesEmoc_StTemperamento                   ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN DesPsicomotor_Epoca_AndarSoz             ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN DesPsicomotor_Epoca_Engatinhar           ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN DesPsicomotor_Epoca_FicarPe              ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN DesPsicomotor_Epoca_SentarSoz            ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN DesPsicomotor_Lateralidade               ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN DesPsicomotor_ObsCorreEquilibrio         ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN DesPsicomotor_ObsMovDesembaraco          ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN DesPsicomotor_ObsPulaAltura              ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN DesPsicomotor_StAmarraLacos              ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN DesPsicomotor_StAndajar                  ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN DesPsicomotor_StCorreEquilibrio          ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN DesPsicomotor_StFazNos                   ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN DesPsicomotor_StMovDesembaraco           ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN DesPsicomotor_StPulaAltura               ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN DesPsicomotor_StSobeDesceEscada          ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN DesPsicomotor_StUsarTesoura              ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN DesVerbal_IdadeFalou                     ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN DesVerbal_ObsDifFalar                    ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN DesVerbal_ObsPron                        ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN DesVerbal_ObsVoc                         ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN DesVerbal_StDifFalar                     ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN DesVerbal_StPronuncia                    ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN DesVerbal_StVocRico                      ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN Escolaridade_DiaDoFilho                  ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN Escolaridade_EscolaAnterior              ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN Escolaridade_MotivoRefezAlgumaSerie      ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN Escolaridade_QualApresAlgumProbEscola    ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN Escolaridade_QualEscolaFreq              ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN Escolaridade_StApresAlgumProbEscola      ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN Escolaridade_StExecTarefasCaseiras       ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN Escolaridade_StLocalAdequadoEstudar      ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN Escolaridade_StRefezAlgumaSerie          ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN Gest_Duracao                             ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN Gest_NomeDoenca                          ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN Gest_ReacaoNoticia                       ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN Gest_SensacaoPsicologica                 ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN Gest_StAmeacaTentativaAborto             ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN Gest_StDoenca                            ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN Gest_StEstadoEmocionalMae_Aceitou        ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN Gest_StEstadoEmocionalMae_AmeacaAborto   ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN Gest_StEstadoEmocionalMae_Desejo         ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN Gest_StEstadoEmocionalMae_Enjoo          ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN Gest_StEstadoEmocionalMae_Rejeitou       ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN Gest_StEstadoEmocionalMae_Vomito         ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN Gest_StPlanFamiliar                      ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN Gest_StTratEngravidar                    ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN NomeAlergia                              ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN NomeDoencaCongenita                      ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN NomeHospitalParaRemocao                  ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN NomeMedicacaoEspecifica                  ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN NomeMedico                               ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN NomeParenteAAvisar                       ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN NomePlanoSaude                           ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN NomeRemedioFebre                         ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN NomeTratamentoMedico                     ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN NumeroSUS                                ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN Observacoes                              ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN Opiniao_ObjetivosFamilia                 ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN OutrasDoencaContagiosa                   ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN EnderecoHospitalRemocao                  ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN Nasc_QtdeMeses                           ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN Nasc_StComplicacao                       ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN Nasc_StCriancaChorou                     ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN Nasc_StFototerapia                       ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN Nasc_StIctericia                         ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN Nasc_StOxPosParto                        ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN Nasc_StParto                             ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN Nasc_StPresencaPai                       ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN Nasc_TipoComplicacao                     ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN RelFamiliar_AtividadesExtraCurriculares  ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN RelFamiliar_IrmaosNoColegio              ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN RelFamiliar_LimitesEducacao              ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN RelFamiliar_OrdemNascimento              ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN RelFamiliar_PessoasConvivem              ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN RelFamiliar_PreenchidosMomentosLazer     ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN RelFamiliar_QtdeIrmaos                   ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN RelFamiliar_QuaisParticipaMomentosFam    ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN RelFamiliar_RelacionamentoIrmaos         ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN RelFamiliar_Religiao                     ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN RelFamiliar_ResideComQuem                ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN RelFamiliar_RessaltadosVlrEticosMorais   ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN RelFamiliar_StFalecido_Mae               ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN RelFamiliar_StFalecido_Pai               ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN RelFamiliar_StIrmaos                     ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN RelFamiliar_StPaisVivemJuntos            ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN RelFamiliar_StParticipaMomentosFam       ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN RotCrianca_Caracteristica_Autoritaria    ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN RotCrianca_Caracteristica_Calada         ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN RotCrianca_Caracteristica_Carinhosa      ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN RotCrianca_Caracteristica_Dispersa       ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN RotCrianca_Caracteristica_Falante        ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN RotCrianca_Caracteristica_Teimosa        ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN RotCrianca_ObsFatoEmoc                   ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN RotCrianca_ObsRotina                     ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN RotCrianca_ObsTique                      ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN RotCrianca_QualComportamento             ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN RotCrianca_StAlheioAtiv                  ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN RotCrianca_StAlimSoz                     ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN RotCrianca_StAuxAosCDificuldade          ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN RotCrianca_StBanhoSoz                    ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN RotCrianca_StBirras                      ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN RotCrianca_StChupeta                     ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN RotCrianca_StComportamento               ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN RotCrianca_StConstipacaoInt              ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN RotCrianca_StDominador                   ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN RotCrianca_StDormirPais                  ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN RotCrianca_StEncoprese                   ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN RotCrianca_StEnureseNot                  ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN RotCrianca_StFantasiar                   ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN RotCrianca_StFatoEmoc                    ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN RotCrianca_StHabitos                     ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN RotCrianca_StIndependente                ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN RotCrianca_StIrBanheiro                  ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN RotCrianca_StMamadeira                   ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN RotCrianca_StMentir                      ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN RotCrianca_StRelacionamento              ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN RotCrianca_StRoerUnha                    ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN RotCrianca_StTique                       ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN RotCrianca_StVestDespSemDif              ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN Saude_ComplicacoesSNC                    ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN Saude_DoencasHospitalizacoes             ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN Saude_DuracaoTraumaCraniano              ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN Saude_MedicacaoFebreDosagem              ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN Saude_NomeHospPref                       ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN Saude_NomeIntervencaoCirurgica           ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN Saude_NomePediatra                       ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN Saude_ObsCartVac                         ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN Saude_RespAcompanhamento                 ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN Saude_StAcompanhamento                   ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN Saude_StAcompanhamentoNeurologico        ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN Saude_StAparelhoGlicosimetro             ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN Saude_StCartVacAtualizada                ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN Saude_StConvulsao                        ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN Saude_StIntervencaoCirurgica             ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN Saude_StTraumaCranianoCPerdaConsciencia  ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN Saude_TelPediatra                        ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN Saude_TelPessoaAux                       ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN Saude_TelRespAcompanhamento              ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN Sexualidade_AtituteCorpo                 ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN Sexualidade_CuriosidadesSex              ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN Sexualidade_StPercebeDifEntreSexos       ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN SocBrinq_ComQuemBrinca                   ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN SocBrinq_NaoGostaBrinq                   ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN SocBrinq_OndeBrinca                      ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN SocBrinq_PrefBrinq                       ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN SocBrinq_PrefCriancaIdadeSexo            ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN SocBrinq_StAmizadeFacilmente             ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN SocBrinq_StBrinca_So                     ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN StAlergico                               ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN StAsmatico                               ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN StDeficienteAuditivo                     ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN StDeficienteFisico                       ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN StDeficienteMental                       ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN StDeficienteVisual                       ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN StDependenteInsulina                     ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN StDiabetico                              ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN StDoencaCongenita                        ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN StEmTratamentoEpiletico                  ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN StEmTratamentoMedico                     ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN StEpiletico                              ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN StEscarlatina                            ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN StHemofilico                             ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN StHipertenso                             ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN StMedicacaoEspecifica                    ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN StPlanoSaude                             ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN StPossuiLaudoMedico                      ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN StRubeola                                ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN StSarampo                                ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN TelefoneHospitalRemocao                  ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN TelefoneMedico                           ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN TipoMedico                               ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN StCatapora                               ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN StCaxumba                                ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN StCoqueluche                             ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoFichaMedica  ALTER COLUMN TipoSangue                               ADD MASKED WITH (FUNCTION = ''default()''); ' 

		BEGIN TRY   
			EXEC	(@strSQL)
		END TRY
			BEGIN CATCH
				INSERT INTO [dbLogRestore].[dbo].[TbLogMensagem]
							([CRM]
							,[Erro]
							,[Mensagem])
						VALUES
							(@CRM
							,1 -- Erro
							,OBJECT_NAME(@@PROCID) + ' -TbAlunoFichaMedica-> ' + ERROR_MESSAGE())
			END CATCH
		---


		SET		@strSQL = 'USE [' + 'CRM_' + @CRM + ']; '

		-- TbAlunoTurma
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAlunoTurma  ALTER COLUMN OrdemChamada	ADD MASKED WITH (FUNCTION = ''default()''); ' 

		BEGIN TRY   
			EXEC	(@strSQL)
		END TRY
			BEGIN CATCH
				INSERT INTO [dbLogRestore].[dbo].[TbLogMensagem]
							([CRM]
							,[Erro]
							,[Mensagem])
						VALUES
							(@CRM
							,1 -- Erro
							,OBJECT_NAME(@@PROCID) + ' -TbAlunoTurma-> ' + ERROR_MESSAGE())
			END CATCH
		---



		SET		@strSQL = 'USE [' + 'CRM_' + @CRM + ']; '

		-- TbArquivoAnexo
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbArquivoAnexo ALTER  COLUMN Descricao	ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbArquivoAnexo ALTER  COLUMN Observacoes  ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbArquivoAnexo ALTER  COLUMN Url          ADD MASKED WITH (FUNCTION = ''default()''); ' 

		BEGIN TRY   
			EXEC	(@strSQL)
		END TRY
			BEGIN CATCH
				INSERT INTO [dbLogRestore].[dbo].[TbLogMensagem]
							([CRM]
							,[Erro]
							,[Mensagem])
						VALUES
							(@CRM
							,1 -- Erro
							,OBJECT_NAME(@@PROCID) + ' -TbArquivoAnexo-> ' + ERROR_MESSAGE())
			END CATCH
		---


		SET		@strSQL = 'USE [' + 'CRM_' + @CRM + ']; '

		-- TbCaixaAberturaSaldo
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbCaixaAberturaSaldo 	ALTER  COLUMN SaldoInicial	ADD MASKED WITH (FUNCTION = ''default()''); ' 


		-- TbCaixaLancamento
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbCaixaLancamento 	ALTER  COLUMN Valor					ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbCaixaLancamento 	ALTER  COLUMN CHQ_NomeTitular		ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbCaixaLancamento 	ALTER  COLUMN CHQ_TelefoneTitular	ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbCaixaLancamento 	ALTER  COLUMN CHQ_CPFCNPJTitular	ADD MASKED WITH (FUNCTION = ''default()''); ' 

		BEGIN TRY   
			EXEC	(@strSQL)
		END TRY
			BEGIN CATCH
				INSERT INTO [dbLogRestore].[dbo].[TbLogMensagem]
							([CRM]
							,[Erro]
							,[Mensagem])
						VALUES
							(@CRM
							,1 -- Erro
							,OBJECT_NAME(@@PROCID) + ' -TbArquivoAnexo-> ' + ERROR_MESSAGE())
			END CATCH
		---



		SET		@strSQL = 'USE [' + 'CRM_' + @CRM + ']; '

		-- TbProfessor
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbProfessor ALTER  COLUMN Login                                    ADD MASKED WITH (FUNCTION = ''partial(1, "XXX", 1)''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbProfessor ALTER  COLUMN Apelido                                  ADD MASKED WITH (FUNCTION = ''partial(2, "XXXXXXXXX", 2)''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbProfessor ALTER  COLUMN Celular                                  ADD MASKED WITH (FUNCTION = ''partial(1, "(XX) XX", 1)''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbProfessor ALTER  COLUMN CodigoLeitora                            ADD MASKED WITH (FUNCTION = ''partial(1, "XXX", 1)''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbProfessor ALTER  COLUMN CorRaca                                  ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbProfessor ALTER  COLUMN CPF                                      ADD MASKED WITH (FUNCTION = ''partial(1, "XXXXXXXXX", 2)''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbProfessor ALTER  COLUMN DataAdmissao                             ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbProfessor ALTER  COLUMN DataNascimento                           ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbProfessor ALTER  COLUMN Email                                    ADD MASKED WITH (FUNCTION = ''email()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbProfessor ALTER  COLUMN Escolaridade                             ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbProfessor ALTER  COLUMN EstadoCivil                              ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbProfessor ALTER COLUMN Fone                                     ADD MASKED WITH (FUNCTION = ''partial(2, "XXX", 2)''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbProfessor ALTER COLUMN GpaDataHoraAlteracao                     ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbProfessor ALTER COLUMN GpaIdentificadorCatraca                  ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbProfessor ALTER COLUMN IdentificadorMEC_Docente                 ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbProfessor ALTER COLUMN IdPaisOrigem                             ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbProfessor ALTER COLUMN IdReligiao                               ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbProfessor ALTER COLUMN Matricula                                ADD MASKED WITH (FUNCTION = ''partial(1, "XXX", 1)''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbProfessor ALTER COLUMN Nacionalidade                            ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbProfessor ALTER COLUMN NaturalidadeCidade                       ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbProfessor ALTER COLUMN NaturalidadeUF                           ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbProfessor ALTER COLUMN NomeProfessor                            ADD MASKED WITH (FUNCTION = ''partial(3, "XXXXXXXXX", 3)''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbProfessor ALTER COLUMN NumeroPasta                              ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbProfessor ALTER COLUMN Passaporte                               ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbProfessor ALTER COLUMN PosGraduacao                             ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbProfessor ALTER COLUMN RegistroNascimentoCartorio               ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbProfessor ALTER COLUMN RegistroNascimentoData                   ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbProfessor ALTER COLUMN RegistroNascimentoFolha                  ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbProfessor ALTER COLUMN RegistroNascimentoLivro                  ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbProfessor ALTER COLUMN RegistroNascimentoNumero                 ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbProfessor ALTER COLUMN RG                                       ADD MASKED WITH (FUNCTION = ''partial(1, "XXX", 1)''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbProfessor ALTER COLUMN RG_DataEmissao                           ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbProfessor ALTER COLUMN RG_OrgaoEmissor                          ADD MASKED WITH (FUNCTION = ''partial(1, "XXX", 1)''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbProfessor ALTER COLUMN Senha                                    ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbProfessor ALTER COLUMN Sexo                                     ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbProfessor ALTER COLUMN SMS                                      ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbProfessor ALTER COLUMN StAtuacao_EnsinoCursoGradDistancia       ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbProfessor ALTER COLUMN StAtuacao_EnsinoCursoGradPresencial      ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbProfessor ALTER COLUMN StAtuacao_EnsinoCursoSeq                 ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbProfessor ALTER COLUMN StAtuacao_EnsinoPosGradDistancia         ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbProfessor ALTER COLUMN StAtuacao_EnsinoPosGradPresencial        ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbProfessor ALTER COLUMN StAtuacao_Extensao                       ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbProfessor ALTER COLUMN StAtuacao_GestaoPlanejAvaliacao          ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbProfessor ALTER COLUMN StAtuacao_Pesquisa                       ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbProfessor ALTER COLUMN StBolsaPesquisa                          ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbProfessor ALTER COLUMN StDeficienciaAuditiva                    ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbProfessor ALTER COLUMN StDeficienciaBaixaVisao                  ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbProfessor ALTER COLUMN StDeficienciaCegueira                    ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbProfessor ALTER COLUMN StDeficienciaFisica                      ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbProfessor ALTER COLUMN StDeficienciaMental                      ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbProfessor ALTER COLUMN StDeficienciaMultipla                    ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbProfessor ALTER COLUMN StDeficienciaSurdez                      ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbProfessor ALTER COLUMN StDeficienciaSurdoCegueira               ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbProfessor ALTER COLUMN StDocenteSubstituto                      ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbProfessor ALTER COLUMN StDocenteVisitante                       ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbProfessor ALTER COLUMN StProfessorPolivalente                   ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbProfessor ALTER COLUMN TIAcodigo                                ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbProfessor ALTER COLUMN TipoNacionalidade                        ADD MASKED WITH (FUNCTION = ''default()''); ' 

		BEGIN TRY   
			EXEC	(@strSQL)
		END TRY
			BEGIN CATCH
				INSERT INTO [dbLogRestore].[dbo].[TbLogMensagem]
							([CRM]
							,[Erro]
							,[Mensagem])
						VALUES
							(@CRM
							,1 -- Erro
							,OBJECT_NAME(@@PROCID) + ' -TbProfessor-> ' + ERROR_MESSAGE())
			END CATCH
		---


		SET		@strSQL = 'USE [' + 'CRM_' + @CRM + ']; '

		-- TbProfessorEscolaridade
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbProfessorEscolaridade ALTER COLUMN Nivel		ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbProfessorEscolaridade ALTER COLUMN NomeCurso	ADD MASKED WITH (FUNCTION = ''default()''); ' 

		BEGIN TRY   
			EXEC	(@strSQL)
		END TRY
			BEGIN CATCH
				INSERT INTO [dbLogRestore].[dbo].[TbLogMensagem]
							([CRM]
							,[Erro]
							,[Mensagem])
						VALUES
							(@CRM
							,1 -- Erro
							,OBJECT_NAME(@@PROCID) + ' -TbProfessorEscolaridade-> ' + ERROR_MESSAGE())
			END CATCH
		---


		SET		@strSQL = 'USE [' + 'CRM_' + @CRM + ']; '

		-- TbProfessorFoto
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbProfessorFoto ALTER COLUMN Foto	ADD MASKED WITH (FUNCTION = ''default()''); ' 

		BEGIN TRY   
			EXEC	(@strSQL)
		END TRY
			BEGIN CATCH
				INSERT INTO [dbLogRestore].[dbo].[TbLogMensagem]
							([CRM]
							,[Erro]
							,[Mensagem])
						VALUES
							(@CRM
							,1 -- Erro
							,OBJECT_NAME(@@PROCID) + ' -TbProfessorFoto-> ' + ERROR_MESSAGE())
			END CATCH
		---

		SET		@strSQL = 'USE [' + 'CRM_' + @CRM + ']; '

		-- TbEndereco
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbEndereco ALTER COLUMN Bairro                                   ADD MASKED WITH (FUNCTION = ''partial(2, "XXX", 2)''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbEndereco ALTER COLUMN CEP                                      ADD MASKED WITH (FUNCTION = ''partial(2, "XXXXX", 2)''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbEndereco ALTER COLUMN Cidade                                   ADD MASKED WITH (FUNCTION = ''partial(1, "XXX", 1)''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbEndereco ALTER COLUMN Complemento                              ADD MASKED WITH (FUNCTION = ''partial(2, "XXX", 2)''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbEndereco ALTER COLUMN Fone                                     ADD MASKED WITH (FUNCTION = ''partial(2, "XXX", 2)''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbEndereco ALTER COLUMN Logradouro                               ADD MASKED WITH (FUNCTION = ''partial(2, "XXX", 2)''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbEndereco ALTER COLUMN UF                                       ADD MASKED WITH (FUNCTION = ''default()''); ' 

		BEGIN TRY   
			EXEC	(@strSQL)
		END TRY
			BEGIN CATCH
				INSERT INTO [dbLogRestore].[dbo].[TbLogMensagem]
							([CRM]
							,[Erro]
							,[Mensagem])
						VALUES
							(@CRM
							,1 -- Erro
							,OBJECT_NAME(@@PROCID) + ' -TbEndereco-> ' + ERROR_MESSAGE())
			END CATCH
		---

		SET		@strSQL = 'USE [' + 'CRM_' + @CRM + ']; '

		-- TbResponsavel
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbResponsavel	ALTER COLUMN Celular                                  ADD MASKED WITH (FUNCTION = ''partial(1, "(XX) XX", 1)''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbResponsavel	ALTER COLUMN CodigoLeitora                            ADD MASKED WITH (FUNCTION = ''partial(1, "XXX", 1)''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbResponsavel	ALTER COLUMN CPFCNPJ                                  ADD MASKED WITH (FUNCTION = ''partial(1, "XXXXXXXXX", 2)''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbResponsavel ALTER COLUMN DataNascimento                           ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbResponsavel	ALTER COLUMN DEB_ChaveAutorizacao                     ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbResponsavel	ALTER COLUMN DEB_CodigoBanco                          ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbResponsavel	ALTER COLUMN DEB_NumeroAgencia                        ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbResponsavel	ALTER COLUMN DEB_NumeroConta                          ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbResponsavel	ALTER COLUMN DiaPreferencialPagamento                 ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbResponsavel	ALTER COLUMN Email                                    ADD MASKED WITH (FUNCTION = ''email()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbResponsavel	ALTER COLUMN EstadoCivil                              ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbResponsavel	ALTER COLUMN FoneTrabalho                             ADD MASKED WITH (FUNCTION = ''partial(2, "XXX", 2)''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbResponsavel	ALTER COLUMN GpaDataHoraAlteracao                     ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbResponsavel	ALTER COLUMN GpaIdentificadorCatraca                  ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbResponsavel	ALTER COLUMN IdReligiao                               ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbResponsavel	ALTER COLUMN LocalTrabalho                            ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbResponsavel	ALTER COLUMN Login                                    ADD MASKED WITH (FUNCTION = ''partial(1, "XXX", 1)''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbResponsavel	ALTER COLUMN Nacionalidade                            ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbResponsavel	ALTER COLUMN NaturalidadeCidade                       ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbResponsavel	ALTER COLUMN NaturalidadeUF                           ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbResponsavel ALTER COLUMN NomeResponsavel						  ADD MASKED WITH (FUNCTION = ''partial(3, "XXXXXXXXX", 3)''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbResponsavel ALTER COLUMN Observacao                               ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbResponsavel ALTER COLUMN Passaporte                               ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbResponsavel ALTER COLUMN RG                                       ADD MASKED WITH (FUNCTION = ''partial(1, "XXX", 1)''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbResponsavel ALTER COLUMN RG_DataEmissao                           ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbResponsavel ALTER COLUMN RG_OrgaoEmissor                          ADD MASKED WITH (FUNCTION = ''partial(1, "XXX", 1)''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbResponsavel ALTER COLUMN Senha                                    ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbResponsavel ALTER COLUMN Sexo                                     ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbResponsavel ALTER COLUMN SMS                                      ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbResponsavel ALTER COLUMN StFalecido                               ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbResponsavel ALTER COLUMN StFuncionario                            ADD MASKED WITH (FUNCTION = ''default()''); ' 

		BEGIN TRY   
			EXEC	(@strSQL)
		END TRY
			BEGIN CATCH
				INSERT INTO [dbLogRestore].[dbo].[TbLogMensagem]
							([CRM]
							,[Erro]
							,[Mensagem])
						VALUES
							(@CRM
							,1 -- Erro
							,OBJECT_NAME(@@PROCID) + ' -TbResponsavel-> ' + ERROR_MESSAGE())
			END CATCH
		---


		-- TbTbResponsavelFoto
		SET		@strSQL = 'USE [' + 'CRM_' + @CRM + ']; '

		SET  	@strSQL = @strSQL + 'ALTER TABLE dbo.TbResponsavelFoto ALTER COLUMN Foto				                 ADD MASKED WITH (FUNCTION = ''default()''); ' 

		BEGIN TRY   
			EXEC	(@strSQL)
		END TRY
			BEGIN CATCH
				INSERT INTO [dbLogRestore].[dbo].[TbLogMensagem]
							([CRM]
							,[Erro]
							,[Mensagem])
						VALUES
							(@CRM
							,1 -- Erro
							,OBJECT_NAME(@@PROCID) + ' -TbResponsavelFoto-> ' + ERROR_MESSAGE())
			END CATCH
		---



		SET		@strSQL = 'USE [' + 'CRM_' + @CRM + ']; '

		-- TbCheque
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbCheque	ALTER COLUMN EmissorCPFCNPJ                           ADD MASKED WITH (FUNCTION = ''partial(1, "XXXXXXXXXXX", 2)''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbCheque	ALTER COLUMN EmissorNome                              ADD MASKED WITH (FUNCTION = ''partial(3, "XXXXXXXXX", 3)''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbCheque	ALTER COLUMN EmissorTelefone                          ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbCheque	ALTER COLUMN Observacao                               ADD MASKED WITH (FUNCTION = ''default()''); ' 


		--	SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAgenteCobranca                 ALTER COLUMN NomeAgenteCobranca                       ADD MASKED WITH (FUNCTION = ''partial(3, "XXXXXXXXX", 3)''); ' 


		-- TbNotaFiscal
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbNotaFiscal	ALTER COLUMN Responsavel_Bairro                       ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbNotaFiscal	ALTER COLUMN Responsavel_CEP                          ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbNotaFiscal	ALTER COLUMN Responsavel_Cidade                       ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbNotaFiscal	ALTER COLUMN Responsavel_Email                        ADD MASKED WITH (FUNCTION = ''email()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbNotaFiscal	ALTER COLUMN Responsavel_Endereco                     ADD MASKED WITH (FUNCTION = ''partial(3, "XXXXXXXXX", 3)''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbNotaFiscal	ALTER COLUMN Responsavel_Endereco_Complemento         ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbNotaFiscal	ALTER COLUMN Responsavel_Fone                         ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbNotaFiscal	ALTER COLUMN Responsavel_UF                           ADD MASKED WITH (FUNCTION = ''default()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbNotaFiscal	ALTER COLUMN ValorServicos                            ADD MASKED WITH (FUNCTION = ''random(1, 100)''); ' 


		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbAuditoria	ALTER COLUMN DescricaoOperacao	ADD MASKED WITH (FUNCTION = ''default()''); ' 

		BEGIN TRY   
			EXEC	(@strSQL)
		END TRY
			BEGIN CATCH
				INSERT INTO [dbLogRestore].[dbo].[TbLogMensagem]
							([CRM]
							,[Erro]
							,[Mensagem])
						VALUES
							(@CRM
							,1 -- Erro
							,OBJECT_NAME(@@PROCID) + ' -TbAuditoria-> ' + ERROR_MESSAGE())
			END CATCH
		---

		SET		@strSQL = 'USE [' + 'CRM_' + @CRM + ']; '

		-- TbSolicitacao
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacao ALTER COLUMN DescricaoSolicitacao                               ADD MASKED WITH (FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacao ALTER COLUMN ParecerAnalise                                     ADD MASKED WITH (FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacao ALTER COLUMN Nome                                               ADD MASKED WITH (FUNCTION = ''partial(3, "XXXXXXXXX", 3)''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacao ALTER COLUMN Sexo                                               ADD MASKED WITH (FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacao ALTER COLUMN EstadoCivil                                        ADD MASKED WITH (FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacao ALTER COLUMN DataNascimento                                     ADD MASKED WITH (FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacao ALTER COLUMN CorRaca                                            ADD MASKED WITH (FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacao ALTER COLUMN Email                                              ADD MASKED WITH (FUNCTION = ''email()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacao ALTER COLUMN CPF                                                ADD MASKED WITH(FUNCTION = ''partial(1, "XXXXXXXXX", 2)''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacao ALTER COLUMN RG                                                 ADD MASKED WITH(FUNCTION = ''partial(1, "XXX", 1)''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacao ALTER COLUMN Celular                                            ADD MASKED WITH(FUNCTION = ''partial(1, "(XX) XX", 1)''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacao ALTER COLUMN IdReligiao                                         ADD MASKED WITH (FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacao ALTER COLUMN Passaporte                                         ADD MASKED WITH (FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacao ALTER COLUMN NumeroNIS                                          ADD MASKED WITH (FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacao ALTER COLUMN NaturalidadeCidade                                 ADD MASKED WITH (FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacao ALTER COLUMN NaturalidadeUF                                     ADD MASKED WITH (FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacao ALTER COLUMN NaturalidadeUF                                     ADD MASKED WITH (FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacao ALTER COLUMN Nacionalidade                                      ADD MASKED WITH (FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacao ALTER COLUMN RegistroNascimentoNumero                           ADD MASKED WITH (FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacao ALTER COLUMN RegistroNascimentoLivro                            ADD MASKED WITH (FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacao ALTER COLUMN RegistroNascimentoFolha                            ADD MASKED WITH (FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacao ALTER COLUMN RegistroNascimentoCartorio                         ADD MASKED WITH (FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacao ALTER COLUMN RegistroNascimentoData                             ADD MASKED WITH (FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacao ALTER COLUMN Logradouro                                         ADD MASKED WITH(FUNCTION = ''partial(2, "XXX", 2)''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacao ALTER COLUMN Complemento                                        ADD MASKED WITH(FUNCTION = ''partial(2, "XXX", 2)''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacao ALTER COLUMN Bairro                                             ADD MASKED WITH(FUNCTION = ''partial(2, "XXX", 2)''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacao ALTER COLUMN Cidade                                             ADD MASKED WITH(FUNCTION = ''partial(1, "XXX", 1)''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacao ALTER COLUMN UF                                                 ADD MASKED WITH (FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacao ALTER COLUMN CEP                                                ADD MASKED WITH(FUNCTION = ''partial(2, "XXX", 2)''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacao ALTER COLUMN Fone                                               ADD MASKED WITH(FUNCTION = ''partial(2, "XXX", 2)''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacao ALTER COLUMN LocalTrabalho                                      ADD MASKED WITH (FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacao ALTER COLUMN FoneTrabalho                                       ADD MASKED WITH(FUNCTION = ''partial(2, "XXX", 2)''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacao ALTER COLUMN Apelido                                            ADD MASKED WITH(FUNCTION = ''partial(2, "XXX", 2)''); '

		BEGIN TRY   
			EXEC	(@strSQL)
		END TRY
			BEGIN CATCH
				INSERT INTO [dbLogRestore].[dbo].[TbLogMensagem]
							([CRM]
							,[Erro]
							,[Mensagem])
						VALUES
							(@CRM
							,1 -- Erro
							,OBJECT_NAME(@@PROCID) + ' -TbSolicitacao-> ' + ERROR_MESSAGE())
			END CATCH
		---

		SET		@strSQL = 'USE [' + 'CRM_' + @CRM + ']; '

		-- TbSolicitacaoComplemento
		--	Nada para mascarar

		-- TbSolicitacaoDesconto
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN IdSolicitacaoDesconto                              ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN IdSolicitacaoDescontoTipo                          ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN IdSolicitacaoDescontoTipo                          ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN IdResponsavel                                      ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN IdAluno                                            ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN DataHoraSolicitacao                                ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN JustificativaSolicitacao                           ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN RendaFamiliar                                      ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN QtdePessoasFamilia                                 ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Analise_Situacao                                   ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Analise_Parecer                                    ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Analise_Data                                       ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Analise_IdUsuario                                  ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN _PercentualDesconto                                ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN _ValorDesconto                                     ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN _AnoReferencia                                     ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN IdPeriodo                                          ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN IdSerie                                            ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN _Analise_IdPlanoDesconto                           ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN IdDesconto                                         ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN DataCompetenciaInicial                             ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN DataCompetenciaFinal                               ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN PercentualDesconto                                 ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN ValorDesconto                                      ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN ValorSalarioMinimo                                 ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN PercentualDesconto_Solicitado                      ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN PercentualDesconto_Solicitado                      ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN SituacaoConjugalPais                               ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN AlunoResideCom                                     ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN NumeroMembroFamilia                                ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN NumeroMembroFamiliaRenda                           ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN NumeroMembroFamiliaRenda                           ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN TotalRendaBrutaFamiliar                            ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN TipoResidencia                                     ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN ValorResidencia                                    ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN StPossuiVeiculo                                    ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN QtdVeiculos                                        ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN StVeiculoFinanciado                                ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN VeiculoPrestacaoValor                              ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN VeiculoModelo                                      ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN VeiculoAno                                         ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN StOutroMembroEstudaInstParticular                  ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN OutroMembroInstParticularValorMensalidade          ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN OutroMembroInstParticularNomeInsituicao            ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN StMembroPROUNI_FIES                                ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN StFamiliaRecebeBeneficioSocial                     ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN BeneficioSocialNome                                ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN ValorBeneficioSocial                               ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN StResideAlgumIdoso                                 ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN StIdosoAposentado                                  ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN ValorAposentadoriaIdoso                            ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN StResidePortadorNecesEspeciais                     ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN TipoNecesEspecial                                  ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN StDoencaGrave                                      ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN DoencaGraveNome                                    ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente01_Nome                                   ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente01_Parentesco                             ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente01_DtNascimento                           ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente01_Atividade                              ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN StResidente01_ImpostoDeRenda                       ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente01_RendaMensal                            ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente02_Nome                                   ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente02_Parentesco                             ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente02_DtNascimento                           ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente02_Atividade                              ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN StResidente02_ImpostoDeRenda                       ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente02_RendaMensal                            ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente03_Nome                                   ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente03_Parentesco                             ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente03_DtNascimento                           ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente03_Atividade                              ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN StResidente03_ImpostoDeRenda                       ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente03_RendaMensal                            ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente04_Nome                                   ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente04_Parentesco                             ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente04_DtNascimento                           ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente04_Atividade                              ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN StResidente04_ImpostoDeRenda                       ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente04_RendaMensal                            ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente05_Nome                                   ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente05_Parentesco                             ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente05_DtNascimento                           ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente05_Atividade                              ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN StResidente05_ImpostoDeRenda                       ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente05_RendaMensal                            ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente06_Nome                                   ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente06_Parentesco                             ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente06_DtNascimento                           ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente06_Atividade                              ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN StResidente06_ImpostoDeRenda                       ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente06_RendaMensal                            ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente07_Nome                                   ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente07_Parentesco                             ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente07_DtNascimento                           ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente07_Atividade                              ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN StResidente07_ImpostoDeRenda                       ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente07_RendaMensal                            ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente08_Nome                                   ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente08_Parentesco                             ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente08_DtNascimento                           ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente08_Atividade                              ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN StResidente08_ImpostoDeRenda                       ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente08_RendaMensal                            ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente09_Nome                                   ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente09_Parentesco                             ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente09_DtNascimento                           ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente09_Atividade                              ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN StResidente09_ImpostoDeRenda                       ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente09_RendaMensal                            ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente10_Nome                                   ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente10_Parentesco                             ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente10_DtNascimento                           ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente10_Atividade                              ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN StResidente10_ImpostoDeRenda                       ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente10_RendaMensal                            ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN DespesaAlimentacao                                 ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN DespesaAgua                                        ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN DespesaLuz                                         ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN DespesaTransporte                                  ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN DespesaMedicamento                                 ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN DespesaPlanoSaude                                  ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN DespesaOutras                                      ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN RendaFamiliarComprovada                            ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN RendaFamiliarComprovada                            ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN QtdePessoasFamiliaComprovada                       ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN QtdePessoasFamiliaComprovada                       ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN _IdResponsavelEntrevista                           ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN DataHoraEntrevista                                 ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN NomeResponsavelEntrevista                          ADD MASKED WITH(FUNCTION = ''partial(3, "XXXXXXXXX", 3)''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN NomeResponsavelEntrevista                          ADD MASKED WITH(FUNCTION = ''partial(3, "XXXXXXXXX", 3)''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN NomeResponsavelEntrevista                          ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN TurnoPreferencial                                  ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN TipoAlunoNovatoVeterano                            ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN EstabelecimentoEnsinoAnterior                      ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN TipoEstabelecimentoEnsinoAnterior                  ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN ValorMensalidadeEstabelecimentoEnsinoAnterior      ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN ObservacaoRequerimentoDesconto                     ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN ObservacaoRequerimentoDesconto                     ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente01_EstadoCivil                            ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente02_EstadoCivil                            ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente03_EstadoCivil                            ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente04_EstadoCivil                            ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente05_EstadoCivil                            ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente06_EstadoCivil                            ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente07_EstadoCivil                            ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente08_EstadoCivil                            ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente09_EstadoCivil                            ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente10_EstadoCivil                            ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente01_Escolaridade                           ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente02_Escolaridade                           ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente03_Escolaridade                           ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente04_Escolaridade                           ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente05_Escolaridade                           ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente06_Escolaridade                           ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente07_Escolaridade                           ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente08_Escolaridade                           ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente09_Escolaridade                           ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente10_Escolaridade                           ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN StAlunoResidePai                                   ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN StAlunoResideMae                                   ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN StAlunoResideResponsavel                           ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN QtdeOutroMembroEstudaInstParticular                ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN StRecebeBolsaFamilia                               ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN RecebeBolsaFamiliaNumeroNIS                        ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN StFamiliaRecebeBPC                                 ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN ValorFamiliaRecebeBPC                              ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN StNecesEspeciaisRecebeBPC                          ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN NumeroProcesso                                     ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN VeiculoUtilizado                                   ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN StFilhoExAluno                                     ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN StPossuiIrmaoInstituicaoEnsino                     ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN QtdeIrmaoInstituicaoEnsino                         ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN TransporteEscolar                                  ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente01_Ocupacao                               ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente02_Ocupacao                               ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente03_Ocupacao                               ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente04_Ocupacao                               ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente05_Ocupacao                               ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente06_Ocupacao                               ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente07_Ocupacao                               ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente08_Ocupacao                               ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente09_Ocupacao                               ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente10_Ocupacao                               ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente01_Idade                                  ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente02_Idade                                  ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente03_Idade                                  ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente04_Idade                                  ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente05_Idade                                  ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente06_Idade                                  ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente07_Idade                                  ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente08_Idade                                  ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente09_Idade                                  ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente10_Idade                                  ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN PercentualMembroPROUNI_FIES                        ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN ValorBolsaFamilia                                  ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN StRecebePensaoAlimenticia                          ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN ValorPensaoAlimenticia                             ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Tratamento01_Nome                                  ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Tratamento01_Parentesco                            ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Tratamento01_Especificar                           ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Tratamento01_GastoMensal                           ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Tratamento02_Nome                                  ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Tratamento02_Parentesco                            ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Tratamento02_Especificar                           ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Tratamento02_GastoMensal                           ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Tratamento03_Nome                                  ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Tratamento03_Parentesco                            ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Tratamento03_Especificar                           ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Tratamento03_GastoMensal                           ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN DespesaEducacao                                    ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN DespesaPrestacaoCarro                              ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN DespesaAluguelFinanciamento                        ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN AlunoDeficiencia                                   ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN ParenteBolsaEstudo                                 ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN TempoGastoDeslocamento                             ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN ProgramaGovernamental                              ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN ProgramaBenificiario                               ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN FontePensaoAlimenticia                             ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Rendimento01_Natureza                              ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Rendimento01_Tipo                                  ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Rendimento01_Especificar                           ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Rendimento01_Valor                                 ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Rendimento02_Natureza                              ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Rendimento02_Tipo                                  ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Rendimento02_Especificar                           ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Rendimento02_Valor                                 ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Rendimento03_Natureza                              ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Rendimento03_Tipo                                  ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Rendimento03_Especificar                           ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Rendimento03_Valor                                 ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN DescricaoResidencia                                ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN EstruturaResidencia                                ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN QtdeComodosResidencia                              ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN QtdeBanheirosResidencia                            ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN FornecimentoEnergiaResidencia                      ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN FornecimentoAguaResidencia                         ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN EsgotoResidencia                                   ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN LixoResidencia                                     ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN IluminacaoResidencia                               ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Veiculo01_Modelo                                   ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Veiculo01_Ano                                      ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Veiculo01_Situacao                                 ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Veiculo01_Utilizacao                               ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Veiculo02_Modelo                                   ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Veiculo02_Ano                                      ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Veiculo02_Situacao                                 ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Veiculo02_Utilizacao                               ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN PessoaEstuda01_Nome                                ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN PessoaEstuda01_Parentesco                          ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN PessoaEstuda01_UnidadeEducacao                     ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN PessoaEstuda01_ValorMensalidade                    ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN PessoaEstuda02_Nome                                ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN PessoaEstuda02_Parentesco                          ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN PessoaEstuda02_UnidadeEducacao                     ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN PessoaEstuda02_ValorMensalidade                    ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN PessoaEstuda03_Nome                                ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN PessoaEstuda03_Parentesco                          ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN PessoaEstuda03_UnidadeEducacao                     ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN PessoaEstuda03_ValorMensalidade                    ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN PessoaEstuda04_Nome                                ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN PessoaEstuda04_Parentesco                          ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN PessoaEstuda04_UnidadeEducacao                     ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN PessoaEstuda04_ValorMensalidade                    ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN PessoaEstuda05_Nome                                ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN PessoaEstuda05_Parentesco                          ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN PessoaEstuda05_UnidadeEducacao                     ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN PessoaEstuda05_ValorMensalidade                    ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Deficiencia01_Nome                                 ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Deficiencia01_Parentesco                           ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Deficiencia01_Especificar                          ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Deficiencia01_GastoMensal                          ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Deficiencia02_Nome                                 ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Deficiencia02_Parentesco                           ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Deficiencia02_Especificar                          ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Deficiencia02_GastoMensal                          ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Deficiencia03_Nome                                 ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Deficiencia03_Parentesco                           ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Deficiencia03_Especificar                          ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Deficiencia03_GastoMensal                          ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN DespesaTelefone                                    ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN DespesaCondominio                                  ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN DespesaIPTU                                        ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN DespesaITR                                         ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN DespesaTransporteParticular                        ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN DespesaTransporteParticular                        ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN DespesaTransporteColetivo                          ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN DespesaTransporteColetivo                          ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN DespesaTransporteEscolar                           ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN DespesaTransporteEscolar                           ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN DespesaInternet                                    ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN DespesaTV                                          ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN DespesaFinanciamentoResidencia                     ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN DespesaFinanciamentoVeiculo                        ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN StResponsavelDesempregado                          ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN StDescontoAnoAnterior                              ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN PercentualDesconto_AnoAnterior                     ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN PercentualDesconto_AnoAnterior                     ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente01_MemoriaCalculoMes01                    ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente01_MemoriaCalculoMes02                    ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente01_MemoriaCalculoMes03                    ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente01_MemoriaCalculoMes04                    ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente01_MemoriaCalculoMes05                    ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente01_MemoriaCalculoMes06                    ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente02_MemoriaCalculoMes01                    ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente02_MemoriaCalculoMes02                    ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente02_MemoriaCalculoMes03                    ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente02_MemoriaCalculoMes04                    ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente02_MemoriaCalculoMes05                    ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente02_MemoriaCalculoMes06                    ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente03_MemoriaCalculoMes01                    ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente03_MemoriaCalculoMes02                    ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente03_MemoriaCalculoMes03                    ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente03_MemoriaCalculoMes04                    ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente03_MemoriaCalculoMes05                    ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente03_MemoriaCalculoMes06                    ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente04_MemoriaCalculoMes01                    ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente04_MemoriaCalculoMes02                    ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente04_MemoriaCalculoMes03                    ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente04_MemoriaCalculoMes04                    ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente04_MemoriaCalculoMes05                    ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente04_MemoriaCalculoMes06                    ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente05_MemoriaCalculoMes01                    ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente05_MemoriaCalculoMes02                    ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente05_MemoriaCalculoMes03                    ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente05_MemoriaCalculoMes04                    ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente05_MemoriaCalculoMes05                    ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente05_MemoriaCalculoMes06                    ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente06_MemoriaCalculoMes01                    ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente06_MemoriaCalculoMes02                    ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente06_MemoriaCalculoMes03                    ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente06_MemoriaCalculoMes04                    ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente06_MemoriaCalculoMes05                    ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente06_MemoriaCalculoMes06                    ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente07_MemoriaCalculoMes01                    ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente07_MemoriaCalculoMes02                    ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente07_MemoriaCalculoMes03                    ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente07_MemoriaCalculoMes04                    ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente07_MemoriaCalculoMes05                    ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente07_MemoriaCalculoMes06                    ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente08_MemoriaCalculoMes01                    ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente08_MemoriaCalculoMes02                    ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente08_MemoriaCalculoMes03                    ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente08_MemoriaCalculoMes04                    ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente08_MemoriaCalculoMes05                    ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente08_MemoriaCalculoMes06                    ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente09_MemoriaCalculoMes01                    ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente09_MemoriaCalculoMes02                    ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente09_MemoriaCalculoMes03                    ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente09_MemoriaCalculoMes04                    ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente09_MemoriaCalculoMes05                    ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente09_MemoriaCalculoMes06                    ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente10_MemoriaCalculoMes01                    ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente10_MemoriaCalculoMes02                    ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente10_MemoriaCalculoMes03                    ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente10_MemoriaCalculoMes04                    ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente10_MemoriaCalculoMes05                    ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDesconto ALTER COLUMN Residente10_MemoriaCalculoMes06                    ADD MASKED WITH(FUNCTION = ''default()''); '

		BEGIN TRY   
			EXEC	(@strSQL)
		END TRY
			BEGIN CATCH
				INSERT INTO [dbLogRestore].[dbo].[TbLogMensagem]
							([CRM]
							,[Erro]
							,[Mensagem])
						VALUES
							(@CRM
							,1 -- Erro
							,OBJECT_NAME(@@PROCID) + ' -TbSolicitacaoDesconto-> ' + ERROR_MESSAGE())
			END CATCH
		---


		-- TbSolicitacaoDescontoTipo
		SET		@strSQL = 'USE [' + 'CRM_' + @CRM + ']; '

		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDescontoTipo ALTER COLUMN NomeSolicitacaoDescontoTipo	ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDescontoTipo ALTER COLUMN RendaMinima					ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoDescontoTipo ALTER COLUMN MensagemRendaMinima			ADD MASKED WITH(FUNCTION = ''default()''); '

		BEGIN TRY   
			EXEC	(@strSQL)
		END TRY
			BEGIN CATCH
				INSERT INTO [dbLogRestore].[dbo].[TbLogMensagem]
							([CRM]
							,[Erro]
							,[Mensagem])
						VALUES
							(@CRM
							,1 -- Erro
							,OBJECT_NAME(@@PROCID) + ' -TbSolicitacaoDescontoTipo-> ' + ERROR_MESSAGE())
			END CATCH
		---

		-- TbSolicitacaoDescontoTipo
		--	Nada para mascarar

		-- TbSolicitacaoDespesa
		-- O que é isso?

		-- TbSolicitacaoFichaMedica
		SET		@strSQL = 'USE [' + 'CRM_' + @CRM + ']; '

		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN StAlergico                                         ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN NomeAlergia                                        ADD MASKED WITH(FUNCTION = ''partial(3, "XXXXXXXXX", 3)''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN NomeAlergia                                        ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN TipoMedico                                         ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN NomeMedico                                         ADD MASKED WITH(FUNCTION = ''partial(3, "XXXXXXXXX", 3)''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN NomeMedico                                         ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN TelefoneMedico                                     ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN NomeRemedioFebre                                   ADD MASKED WITH(FUNCTION = ''partial(3, "XXXXXXXXX", 3)''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN NomeRemedioFebre                                   ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN StDoencaCongenita                                  ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN NomeDoencaCongenita                                ADD MASKED WITH(FUNCTION = ''partial(3, "XXXXXXXXX", 3)''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN NomeDoencaCongenita                                ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN StHipertenso                                       ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN StCaxumba                                          ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN StSarampo                                          ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN StRubeola                                          ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN StCatapora                                         ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN StEscarlatina                                      ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN StCoqueluche                                       ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN OutrasDoencaContagiosa                             ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN StEpiletico                                        ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN StEmTratamentoEpiletico                            ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN StHemofilico                                       ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN StDeficienteAuditivo                               ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN StDeficienteVisual                                 ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN StDeficienteFisico                                 ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN StDiabetico                                        ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN StDependenteInsulina                               ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN StAsmatico                                         ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN StEmTratamentoMedico                               ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN NomeTratamentoMedico                               ADD MASKED WITH(FUNCTION = ''partial(3, "XXXXXXXXX", 3)''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN NomeTratamentoMedico                               ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN StMedicacaoEspecifica                              ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN NomeMedicacaoEspecifica                            ADD MASKED WITH(FUNCTION = ''partial(3, "XXXXXXXXX", 3)''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN NomeMedicacaoEspecifica                            ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN NomeParenteAAvisar                                 ADD MASKED WITH(FUNCTION = ''partial(3, "XXXXXXXXX", 3)''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN NomeParenteAAvisar                                 ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN StPlanoSaude                                       ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN NomePlanoSaude                                     ADD MASKED WITH(FUNCTION = ''partial(3, "XXXXXXXXX", 3)''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN NomePlanoSaude                                     ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN NomeHospitalParaRemocao                            ADD MASKED WITH(FUNCTION = ''partial(3, "XXXXXXXXX", 3)''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN NomeHospitalParaRemocao                            ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN EnderecoHospitalRemocao                            ADD MASKED WITH(FUNCTION = ''partial(2, "XXX", 2)''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN EnderecoHospitalRemocao                            ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN TelefoneHospitalRemocao                            ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN Observacoes                                        ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN Gest_StTratEngravidar                              ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN Gest_StPlanFamiliar                                ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN Gest_StAmeacaTentativaAborto                       ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN Gest_ReacaoNoticia                                 ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN Gest_Duracao                                       ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN Gest_SensacaoPsicologica                           ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN Gest_StDoenca                                      ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN Gest_NomeDoenca                                    ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN Gest_StEstadoEmocionalMae_Aceitou                  ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN Gest_StEstadoEmocionalMae_Rejeitou                 ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN Gest_StEstadoEmocionalMae_Enjoo                    ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN Gest_StEstadoEmocionalMae_Vomito                   ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN Gest_StEstadoEmocionalMae_Desejo                   ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN Gest_StEstadoEmocionalMae_AmeacaAborto             ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN Nasc_StParto                                       ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN Nasc_QtdeMeses                                     ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN Nasc_StPresencaPai                                 ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN Nasc_StCriancaChorou                               ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN Nasc_StComplicacao                                 ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN Nasc_TipoComplicacao                               ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN Nasc_StOxPosParto                                  ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN Nasc_StIctericia                                   ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN Nasc_StFototerapia                                 ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN Alim_StAmamentacSeio                               ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN Alim_AmamentacSeioTempo                            ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN Alim_StAmamentacMamad                              ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN Alim_AmamentacMamadTempo                           ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN Alim_PeriodoDesmame                                ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN Alim_StPastosa                                     ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN Alim_PastosaItens                                  ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN Alim_StSolida                                      ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN Alim_SolidaItens                                   ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN Alim_StSozinho                                     ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN Alim_HabAlimentares                                ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN Alim_ComporDuranteRef                              ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN Alim_StProbAliment                                 ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN Alim_ProbAliment                                   ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN Saude_StCartVacAtualizada                          ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN Saude_ObsCartVac                                   ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN Saude_NomePediatra                                 ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN Saude_TelPediatra                                  ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN Saude_NomeHospPref                                 ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN Saude_TelPessoaAux                                 ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN Saude_DoencasHospitalizacoes                       ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN Saude_ComplicacoesSNC                              ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN Saude_StTraumaCranianoCPerdaConsciencia            ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN Saude_DuracaoTraumaCraniano                        ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN Saude_MedicacaoFebreDosagem                        ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN Saude_StConvulsao                                  ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN Saude_StAparelhoGlicosimetro                       ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN Saude_StIntervencaoCirurgica                       ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN Saude_NomeIntervencaoCirurgica                     ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN Saude_StAcompanhamento                             ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN Saude_RespAcompanhamento                           ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN Saude_TelRespAcompanhamento                        ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN Saude_StAcompanhamentoNeurologico                  ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN Saude_StAcompanhamentoNeurologico                  ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN AntecH_StTranstornoMental                          ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN AntecH_StPsicossomatica                            ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN AntecH_NomePsicossomatica                          ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN AntecH_StApCirculatorio                            ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN AntecH_NomeApCirculatorio                          ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN AntecH_StApDigestivo                               ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN AntecH_NomeApDigestivo                             ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN AntecH_StApRespiratorio                            ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN AntecH_NomeApRespiratorio                          ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN DesVerbal_IdadeFalou                               ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN DesVerbal_StVocRico                                ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN DesVerbal_ObsVoc                                   ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN DesVerbal_StPronuncia                              ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN DesVerbal_ObsPron                                  ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN DesVerbal_StDifFalar                               ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN DesVerbal_ObsDifFalar                              ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN DesEmoc_StTemperamento                             ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN DesEmoc_ObsTemperamento                            ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN DesEmoc_StSono                                     ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN DesEmoc_ObsSono                                    ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN DesEmoc_StProblNoite_Chora                         ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN DesEmoc_StProblNoite_Fala                          ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN DesEmoc_StProblNoite_Grita                         ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN DesEmoc_StProblNoite_Bruxismo                      ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN DesEmoc_StProblNoite_Pesadelo                      ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN DesEmoc_StProblNoite_MovAgitada                    ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN DesEmoc_StProblNoite_Baba                          ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN DesEmoc_StProblNoite_Sudorese                      ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN DesEmoc_StProblNoite_Insonia                       ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN DesEmoc_StReacao                                   ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN DesEmoc_ObsDesEmoc                                 ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN RotCrianca_StHabitos                               ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN RotCrianca_StMamadeira                             ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN RotCrianca_StChupeta                               ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN RotCrianca_StEnureseNot                            ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN RotCrianca_StEncoprese                             ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN RotCrianca_StConstipacaoInt                        ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN RotCrianca_StDormirPais                            ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN RotCrianca_StAlimSoz                               ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN RotCrianca_StBanhoSoz                              ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN RotCrianca_StIndependente                          ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN RotCrianca_StRelacionamento                        ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN RotCrianca_StAlheioAtiv                            ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN RotCrianca_StDominador                             ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN RotCrianca_StAuxAosCDificuldade                    ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN RotCrianca_StIrBanheiro                            ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN RotCrianca_StVestDespSemDif                        ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN RotCrianca_StRoerUnha                              ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN RotCrianca_StBirras                                ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN RotCrianca_StMentir                                ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN RotCrianca_StFantasiar                             ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN TipoSangue                                         ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN RotCrianca_ObsRotina                               ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN RotCrianca_StComportamento                         ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN RotCrianca_QualComportamento                       ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN RotCrianca_StTique                                 ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN RotCrianca_ObsTique                                ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN RotCrianca_Caracteristica_Teimosa                  ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN RotCrianca_Caracteristica_Carinhosa                ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN RotCrianca_Caracteristica_Autoritaria              ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN RotCrianca_Caracteristica_Calada                   ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN RotCrianca_Caracteristica_Falante                  ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN RotCrianca_Caracteristica_Dispersa                 ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN RotCrianca_StFatoEmoc                              ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN RotCrianca_ObsFatoEmoc                             ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN DesPsicomotor_Epoca_SentarSoz                      ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN DesPsicomotor_Epoca_Engatinhar                     ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN DesPsicomotor_Epoca_FicarPe                        ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN DesPsicomotor_Epoca_AndarSoz                       ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN DesPsicomotor_StSobeDesceEscada                    ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN DesPsicomotor_StAmarraLacos                        ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN DesPsicomotor_StFazNos                             ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN DesPsicomotor_StUsarTesoura                        ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN DesPsicomotor_StAndajar                            ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN DesPsicomotor_StPulaAltura                         ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN DesPsicomotor_ObsPulaAltura                        ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN DesPsicomotor_StCorreEquilibrio                    ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN DesPsicomotor_ObsCorreEquilibrio                   ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN DesPsicomotor_StMovDesembaraco                     ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN DesPsicomotor_ObsMovDesembaraco                    ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN DesPsicomotor_Lateralidade                         ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN RelFamiliar_StPaisVivemJuntos                      ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN RelFamiliar_ResideComQuem                          ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN RelFamiliar_StIrmaos                               ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN RelFamiliar_QtdeIrmaos                             ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN RelFamiliar_IrmaosNoColegio                        ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN RelFamiliar_OrdemNascimento                        ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN RelFamiliar_RelacionamentoIrmaos                   ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN RelFamiliar_StFalecido_Pai                         ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN RelFamiliar_StFalecido_Mae                         ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN RelFamiliar_PessoasConvivem                        ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN RelFamiliar_LimitesEducacao                        ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN RelFamiliar_RessaltadosVlrEticosMorais             ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN RelFamiliar_StParticipaMomentosFam                 ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN RelFamiliar_QuaisParticipaMomentosFam              ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN RelFamiliar_PreenchidosMomentosLazer               ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN RelFamiliar_AtividadesExtraCurriculares            ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN RelFamiliar_Religiao                               ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN Sexualidade_CuriosidadesSex                        ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN Sexualidade_StPercebeDifEntreSexos                 ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN Sexualidade_AtituteCorpo                           ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN SocBrinq_PrefCriancaIdadeSexo                      ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN SocBrinq_StAmizadeFacilmente                       ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN SocBrinq_StBrinca_So                               ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN SocBrinq_OndeBrinca                                ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN SocBrinq_ComQuemBrinca                             ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN SocBrinq_PrefBrinq                                 ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN SocBrinq_NaoGostaBrinq                             ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN Escolaridade_QualEscolaFreq                        ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN Escolaridade_QualEscolaFreq                        ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN Escolaridade_EscolaAnterior                        ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN Escolaridade_EscolaAnterior                        ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN Escolaridade_StRefezAlgumaSerie                    ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN Escolaridade_StRefezAlgumaSerie                    ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN Escolaridade_MotivoRefezAlgumaSerie                ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN Escolaridade_MotivoRefezAlgumaSerie                ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN Escolaridade_StApresAlgumProbEscola                ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN Escolaridade_StApresAlgumProbEscola                ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN Escolaridade_QualApresAlgumProbEscola              ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN Escolaridade_QualApresAlgumProbEscola              ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN Escolaridade_StLocalAdequadoEstudar                ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN Escolaridade_StLocalAdequadoEstudar                ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN Escolaridade_StExecTarefasCaseiras                 ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN Escolaridade_StExecTarefasCaseiras                 ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN Escolaridade_DiaDoFilho                            ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN Escolaridade_DiaDoFilho                            ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN Opiniao_ObjetivosFamilia                           ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN Contato1_Nome                                      ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN Contato1_Fone                                      ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN Contato1_Celular                                   ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN Contato2_Nome                                      ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN Contato2_Fone                                      ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN Contato2_Celular                                   ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN Contato3_Nome                                      ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN Contato3_Fone                                      ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoFichaMedica ALTER COLUMN Contato3_Celular                                   ADD MASKED WITH(FUNCTION = ''default()''); '

		BEGIN TRY   
			EXEC	(@strSQL)
		END TRY
			BEGIN CATCH
				INSERT INTO [dbLogRestore].[dbo].[TbLogMensagem]
							([CRM]
							,[Erro]
							,[Mensagem])
						VALUES
							(@CRM
							,1 -- Erro
							,OBJECT_NAME(@@PROCID) + ' -TbSolicitacaoFichaMedica-> ' + ERROR_MESSAGE())
			END CATCH
		---

		-- TbSolicitacaoPessoa
		SET		@strSQL = 'USE [' + 'CRM_' + @CRM + ']; '

		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoPessoa ALTER COLUMN Nome                                               ADD MASKED WITH(FUNCTION = ''partial(3, "XXXXXXXXX", 3)''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoPessoa ALTER COLUMN Sexo                                               ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoPessoa ALTER COLUMN EstadoCivil                                        ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoPessoa ALTER COLUMN EstadoCivil                                        ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoPessoa ALTER COLUMN DataNascimento                                     ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoPessoa ALTER COLUMN CorRaca                                            ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoPessoa ALTER COLUMN Email                                              ADD MASKED WITH(FUNCTION = ''email()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoPessoa ALTER COLUMN CPF                                                ADD MASKED WITH(FUNCTION = ''partial(1, "XXXXXXXXX", 2)''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoPessoa ALTER COLUMN RG                                                 ADD MASKED WITH(FUNCTION = ''partial(1, "XXX", 1)''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoPessoa ALTER COLUMN Celular                                            ADD MASKED WITH(FUNCTION = ''partial(1, "(XX) XX", 1)''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoPessoa ALTER COLUMN IdReligiao                                         ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoPessoa ALTER COLUMN Passaporte                                         ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoPessoa ALTER COLUMN NumeroNIS                                          ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoPessoa ALTER COLUMN NaturalidadeCidade                                 ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoPessoa ALTER COLUMN NaturalidadeCidade                                 ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoPessoa ALTER COLUMN NaturalidadeUF                                     ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoPessoa ALTER COLUMN NaturalidadeUF                                     ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoPessoa ALTER COLUMN Nacionalidade                                      ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoPessoa ALTER COLUMN RegistroNascimentoNumero                           ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoPessoa ALTER COLUMN RegistroNascimentoLivro                            ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoPessoa ALTER COLUMN RegistroNascimentoFolha                            ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoPessoa ALTER COLUMN RegistroNascimentoCartorio                         ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoPessoa ALTER COLUMN RegistroNascimentoData                             ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoPessoa ALTER COLUMN Logradouro                                         ADD MASKED WITH(FUNCTION = ''partial(2, "XXX", 2)''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoPessoa ALTER COLUMN Complemento                                        ADD MASKED WITH(FUNCTION = ''partial(2, "XXX", 2)''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoPessoa ALTER COLUMN Bairro                                             ADD MASKED WITH(FUNCTION = ''partial(2, "XXX", 2)''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoPessoa ALTER COLUMN Cidade                                             ADD MASKED WITH(FUNCTION = ''partial(1, "XXX", 1)''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoPessoa ALTER COLUMN UF                                                 ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoPessoa ALTER COLUMN CEP                                                ADD MASKED WITH(FUNCTION = ''partial(2, "XXXXX", 2)''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoPessoa ALTER COLUMN Fone                                               ADD MASKED WITH(FUNCTION = ''partial(2, "XXX", 2)''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoPessoa ALTER COLUMN LocalTrabalho                                      ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoPessoa ALTER COLUMN FoneTrabalho                                       ADD MASKED WITH(FUNCTION = ''partial(2, "XXX", 2)''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoPessoa ALTER COLUMN FoneTrabalho                                       ADD MASKED WITH(FUNCTION = ''partial(2, "XXX", 2)''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoPessoa ALTER COLUMN Apelido                                            ADD MASKED WITH(FUNCTION = ''partial(2, "XXXXXXXXX", 2)''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbSolicitacaoPessoa ALTER COLUMN EstabelecimentoEnsinoAnterior                      ADD MASKED WITH(FUNCTION = ''default()''); '

		BEGIN TRY   
			EXEC	(@strSQL)
		END TRY
			BEGIN CATCH
				INSERT INTO [dbLogRestore].[dbo].[TbLogMensagem]
							([CRM]
							,[Erro]
							,[Mensagem])
						VALUES
							(@CRM
							,1 -- Erro
							,OBJECT_NAME(@@PROCID) + ' -TbSolicitacaoPessoa-> ' + ERROR_MESSAGE())
				RETURN
			END CATCH


		-- TbUsuario
		SET		@strSQL = 'USE [' + 'CRM_' + @CRM + ']; '

		-- SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbUsuario ALTER COLUMN Login			ADD MASKED WITH(FUNCTION = ''partial(2, "XXX", 2)''); '
		-- SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbUsuario ALTER COLUMN Senha			ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbUsuario ALTER COLUMN NomeUsuario	ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbUsuario ALTER COLUMN Email			ADD MASKED WITH (FUNCTION = ''email()''); ' 
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbUsuario ALTER COLUMN Cargo			ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbUsuario ALTER COLUMN Celular		ADD MASKED WITH(FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbUsuario ALTER COLUMN FoneTrabalho	ADD MASKED WITH(FUNCTION = ''default()''); '

		BEGIN TRY   
			EXEC	(@strSQL)
		END TRY
			BEGIN CATCH
				INSERT INTO [dbLogRestore].[dbo].[TbLogMensagem]
							([CRM]
							,[Erro]
							,[Mensagem])
						VALUES
							(@CRM
							,1 -- Erro
							,OBJECT_NAME(@@PROCID) + ' -TbUsuario-> ' + ERROR_MESSAGE())
				RETURN
			END CATCH

	END


ELSE IF @NomeDatabase = 'dbCrmActivesoft'
	BEGIN
		SET		@strSQL = 'USE [' + 'CRM_' + @CRM + ']; '

		-- TbOcorrenciaMovimentacao
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbOcorrenciaMovimentacao ALTER COLUMN Descricao	ADD MASKED WITH (FUNCTION = ''default()''); '


		-- TbPessoa
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbPessoa ALTER COLUMN NomePessoa	ADD MASKED WITH (FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbPessoa ALTER COLUMN Email		ADD MASKED WITH (FUNCTION = ''email()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbPessoa ALTER COLUMN LoginSkype	ADD MASKED WITH (FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbPessoa ALTER COLUMN Anotacoes	ADD MASKED WITH (FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbPessoa ALTER COLUMN Cargo		ADD MASKED WITH (FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbPessoa ALTER COLUMN Telefones	ADD MASKED WITH (FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbPessoa ALTER COLUMN Senha		ADD MASKED WITH (FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbPessoa ALTER COLUMN StAtivo		ADD MASKED WITH (FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbPessoa ALTER COLUMN DiaMes		ADD MASKED WITH (FUNCTION = ''default()''); '


		-- TbCliente
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbCliente ALTER COLUMN CodigoCliente	ADD MASKED WITH (FUNCTION = ''partial(3, "XXX", 3)''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbCliente ALTER COLUMN NomeCliente	ADD MASKED WITH (FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbCliente ALTER COLUMN Logradouro		ADD MASKED WITH (FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbCliente ALTER COLUMN Complemento	ADD MASKED WITH (FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbCliente ALTER COLUMN Bairro			ADD MASKED WITH (FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbCliente ALTER COLUMN Cidade			ADD MASKED WITH (FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbCliente ALTER COLUMN UF				ADD MASKED WITH (FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbCliente ALTER COLUMN CEP			ADD MASKED WITH (FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbCliente ALTER COLUMN Telefone1		ADD MASKED WITH (FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbCliente ALTER COLUMN Telefone2		ADD MASKED WITH (FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbCliente ALTER COLUMN Fax			ADD MASKED WITH (FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbCliente ALTER COLUMN EnderecoURL	ADD MASKED WITH (FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbCliente ALTER COLUMN CNPJ			ADD MASKED WITH (FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbCliente ALTER COLUMN Anotacoes		ADD MASKED WITH (FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbCliente ALTER COLUMN Licencas		ADD MASKED WITH (FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbCliente ALTER COLUMN Operadores		ADD MASKED WITH (FUNCTION = ''default()''); '

		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbCliente ALTER COLUMN DadosConexao							ADD MASKED WITH (FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbCliente ALTER COLUMN OperadoresComPermissaoSolicitacao		ADD MASKED WITH (FUNCTION = ''default()''); '
		--SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbCliente ALTER COLUMN StAtivo_		ADD MASKED WITH (FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbCliente ALTER COLUMN TipoCliente							ADD MASKED WITH (FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbCliente ALTER COLUMN ObservacaoSetorComercial				ADD MASKED WITH (FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbCliente ALTER COLUMN IdClienteCongregacao					ADD MASKED WITH (FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbCliente ALTER COLUMN StRequerOrcamento						ADD MASKED WITH (FUNCTION = ''default()''); '

		--SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbCliente ALTER COLUMN IdVPS				ADD MASKED WITH (FUNCTION = ''default()''); '
		--SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbCliente ALTER COLUMN SiglaUnidade			ADD MASKED WITH (FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbCliente ALTER COLUMN SituacaoLicencaUso		ADD MASKED WITH (FUNCTION = ''default()''); '

		--SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbCliente ALTER COLUMN ServidorAlias				ADD MASKED WITH (FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbCliente ALTER COLUMN ServidorIP						ADD MASKED WITH (FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbCliente ALTER COLUMN ServidorPorta					ADD MASKED WITH (FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbCliente ALTER COLUMN ServidorDatabase				ADD MASKED WITH (FUNCTION = ''default()''); '

		--SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbCliente ALTER COLUMN ServidorAdmin_Login			ADD MASKED WITH (FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbCliente ALTER COLUMN ServidorAdmin_Senha			ADD MASKED WITH (FUNCTION = ''default()''); '

		--SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbCliente ALTER COLUMN ServidorSigauser_Login		ADD MASKED WITH (FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbCliente ALTER COLUMN ServidorSigauser_Senha			ADD MASKED WITH (FUNCTION = ''default()''); '

		--SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbCliente ALTER COLUMN ServidorSigainternet_Login	ADD MASKED WITH (FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbCliente ALTER COLUMN ServidorSigainternet_Senha		ADD MASKED WITH (FUNCTION = ''default()''); '

		--SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbCliente ALTER COLUMN ServidorMessenger_Login		ADD MASKED WITH (FUNCTION = ''default()''); '
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbCliente ALTER COLUMN ServidorMessenger_Senha		ADD MASKED WITH (FUNCTION = ''default()''); '	
		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbCliente ALTER COLUMN VersaoDB_Atual					ADD MASKED WITH (FUNCTION = ''default()''); '


		BEGIN TRY   
			EXEC	(@strSQL)
		END TRY
			BEGIN CATCH
				INSERT INTO [dbLogRestore].[dbo].[TbLogMensagem]
							([CRM]
							,[Erro]
							,[Mensagem])
						VALUES
							(@CRM
							,1 -- Erro
							,OBJECT_NAME(@@PROCID) + ' -02-> ' + ERROR_MESSAGE())

				RETURN
			END CATCH


		-- TbSolicitacaoProvisoria
	END



ELSE IF SUBSTRING( @NomeDatabase, 1, 5 ) = 'dbBib'
	BEGIN
		SET		@strSQL = 'USE [' + 'CRM_' + @CRM + ']; '

		-- TbOcorrenciaMovimentacao
--		SET  @strSQL = @strSQL + 'ALTER TABLE dbo.TbOcorrenciaMovimentacao ALTER COLUMN Descricao	ADD MASKED WITH (FUNCTION = ''default()''); '
	END
GO
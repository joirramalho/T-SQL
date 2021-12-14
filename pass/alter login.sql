-- 29set21 - dbSigaSalePetrolina_Arquivo0X

-- P@ssw0rd.


--LOGIN --
	--SENHA COM 10 caracteres								'1234567890'		
		--CREATE LOGIN [active.filipe] 		WITH PASSWORD= N'*****', DEFAULT_DATABASE=[dbSigaModeloWEB], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF;
		--CREATE LOGIN [userModuloAracaju] 	WITH PASSWORD= N'*****', DEFAULT_DATABASE=[dbSigaModuloAracaju], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF;

		--ALTER LOGIN [userMUNDODACRIANCA] DISABLE;

			--DROP LOGIN [userINSTBRASILIA];

--			ALTER LOGIN [userICM_RS] ENABLE;


-- PASSWORD
	--												'1234567890'
	-- ALTER LOGIN [userICM_RS] 	WITH PASSWORD = '******'; -- sigainternet userISO_PowerBI service.account



--USE dbBibModuloAracaju;


	--CREATE USER 	[userModuloAracaju] 	FOR LOGIN [userModuloAracaju] WITH DEFAULT_SCHEMA=[dbo]; -- active.wantuilson
	
		--DROP USER [userINSTBRASILIA];
	
	
	--	DEFAULT_DATABASE
			--ALTER LOGIN 	[userModuloAracaju] 	WITH  DEFAULT_DATABASE=[dbSigaModuloAracaju];
	
	
		--GRANT CONNECT  TO [userModuloAracaju];
			--REVOKE CONNECT  FROM [siga_caruaru];


	--ALTER ROLE [db_owner] ADD MEMBER [userModuloAracaju];

		--EXEC master..sp_addsrvrolemember @loginame = N'romario.barbalho', @rolename = N'sysadmin';



--DATABASE ROLE
--ADD 
	--USE CRM_307506;

	--ALTER ROLE [db_datareader] ADD MEMBER [userRestauraBancoVPS];
	--ALTER ROLE [db_datawriter] ADD MEMBER [userRestauraBancoVPS];
	
	--GRANT EXECUTE TO [romario.barbalho]; -- wantuilson -- (LAB4 xp_readerrorlog)
    	--REVOKE EXECUTE TO [romario.barbalho];

	--ALTER ROLE [db_owner] ADD MEMBER [userSANTAREM];
	--ALTER ROLE [db_ddladmin] ADD MEMBER [active.mardelson];

--DROP
	--USE dbBibDiocCaruaru;

    -- exec sp_droprolemember 'db_datareader', 'active.pollyana';
    -- exec sp_droprolemember 'db_datawriter', 'active.pollyana';

	-- exec sp_droprolemember 'db_owner', 			'userEscolaIsrael';
    -- exec sp_droprolemember 'db_accessadmin', 	'siga_caruaru';
    -- exec sp_droprolemember 'db_backupoperator', 	'siga_caruaru';
    -- exec sp_droprolemember 'db_datareader', 		'siga_caruaru';
    -- exec sp_droprolemember 'db_datawriter', 		'siga_caruaru';
    -- exec sp_droprolemember 'db_ddladmin', 		'siga_caruaru';





--SERVER ROLE
	--ADD
		-- EXEC sp_addsrvrolemember 'userRestauraBancoVPS', 'dbcreator'
		-- EXEC sp_addsrvrolemember 'active.filipe', 'dbcreator'

-- EXEC sp_addsrvrolemember 'romario.barbalho', 'securityadmin'
		
		-- EXEC sp_addsrvrolemember 'active.pinto', 'sysadmin'
	--DROP
	    -- EXEC sp_dropsrvrolemember 'active.pinto', 	'sysadmin'




-- DROP USER from ROLE
    -- ALTER ROLE roleGPA DROP MEMBER [sigauser]



--Censo
	--	dbSigaFACHO (SQL10); USE dbSigaAraraAzul (SQL08)

		--ALTER ROLE [db_datareader] ADD MEMBER [active.filipe];
		--GRANT EXECUTE ON OBJECT::FnExtrairNumeroToString TO [active.filipe];
		--EXEC sp_change_users_login 'Update_one', 'active.filipe', 'active.filipe';



--roleEEM
	--	CREATE ROLE [roleEEM];
	--	
	--	GRANT SELECT ON [dbo].[VwEEM_Unidade] TO [roleEEM];
	--	GRANT SELECT ON [dbo].[VwEEM_Turma] TO [roleEEM];
	--	GRANT SELECT ON [dbo].[VwEEM_Colaboradores] TO [roleEEM];
	--	GRANT SELECT ON [dbo].[VwEEM_Ciclos] TO [roleEEM];
	--	GRANT SELECT ON [dbo].[VwEEM_Serie] TO [roleEEM];
	--	GRANT SELECT ON [dbo].[VwEEM_UsuarioResponsavel] TO [roleEEM];
	--	GRANT SELECT ON [dbo].[VwEEM_UsuarioAluno] TO [roleEEM];
	--	GRANT SELECT ON [dbo].[VwEEM_ResponsavelUsuarioAluno] TO [roleEEM];
	--	GRANT SELECT ON [dbo].[VwEEM_ResponsavelAluno] TO [roleEEM];
	--	GRANT SELECT ON [dbo].[VwEEM_AlunoTurma] TO [roleEEM];
	--	GRANT SELECT ON [dbo].[VwEEM_Aluno] TO [roleEEM];
	--	GRANT SELECT ON [dbo].[VwEEM_TurmaProfessor] TO [roleEEM];
	--	GRANT SELECT ON [dbo].[VwEEM_UsuarioProfessor] TO [roleEEM];
	--	
	--	EXECUTE sp_AddRoleMember 'roleEEM', 'userSantAnaEEM';

-- SET OWNER ROLE
    -- ALTER AUTHORIZATION ON ROLE::[roleEEM] TO [dbo];



--ALTER AUTHORIZATION ON SCHEMA
	--USE dbSigaCONFHICSaoJose;
	--ALTER AUTHORIZATION ON SCHEMA::[db_owner] TO [db_owner];
	--ALTER AUTHORIZATION ON SCHEMA::[db_datareader] TO [db_datareader];
	--ALTER AUTHORIZATION ON SCHEMA::[db_accessadmin] TO [db_accessadmin]

	--ALTER AUTHORIZATION ON SCHEMA::[db_datawriter] TO [db_datawriter];
	--ALTER AUTHORIZATION ON SCHEMA::[db_ddladmin] TO [db_ddladmin];
	--ALTER AUTHORIZATION ON SCHEMA::[db_backupoperator] TO [db_backupoperator];



	--ALTER AUTHORIZATION ON SCHEMA::[sigainternet] TO [sigainternet];

	--DROP SCHEMA [siga_caruaru];




--GRANT EXECUTE from PROCEDURE to ROLE/User
						
	--USE [dbLogRestore]
	--GRANT EXECUTE ON [dbo].sp_foreachdb TO [PUBLIC]

	--GRANT EXECUTE ON OBJECT::sp_DesmascararBanco TO [romario.barbalho]	
	--GRANT EXECUTE ON OBJECT::sp_restore TO [roleDesmascararDados]
	--GRANT EXECUTE ON [dbo].sp_JobEspacoLivreInMB TO [roleOperacaoRestore]
	--GRANT EXECUTE ON OBJECT::FnAnoMes TO [active.filipe]

		--REVOKE EXECUTE ON OBJECT::sp_restore FROM [active.pinto]
		--REVOKE EXECUTE ON OBJECT::sp_DesmascararBanco FROM [active.pinto]
			--REVOKE ALL ON dbo.MyObject TO MyUser


	-- GRANT UPDATE ON [dbo].Documento_ContasDeGestao TO role_SiaiAnalise_Escrita;





--PROFILER
	--GRANT
		--USE master;
		--GRANT ALTER TRACE TO [luiz.matheus]
	
	--REVOKE
	--	USE Master;
	--	REVOKE ALTER TRACE FROM manvendra;



--GRANT VIEW
	--	use master
	--	
	--	GRANT VIEW SERVER STATE TO [active.marley]



--userRestauraBancoVPS
	--CREATE LOGIN [userRestauraBancoVPS] WITH PASSWORD=N'*****', DEFAULT_DATABASE=[master], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF;
	--
	--CREATE USER [userRestauraBancoVPS] FOR LOGIN [userRestauraBancoVPS] WITH DEFAULT_SCHEMA=[dbo];
	--
	--EXEC master..sp_addsrvrolemember @loginame = N'userRestauraBancoVPS', @rolename = N'sysadmin';



-- LAB4 
	-- USE dbLogRestore;
	-- CREATE USER...
	-- EXEC sp_addrolemember N'roleOperacaoRestore', N'romario.barbalho'
	-- EXEC sp_addrolemember N'roleDesmascararDados', N'romario.barbalho'

 
-- HASHED
	-- ALTER LOGIN [userCognitivoEEM] WITH   PASSWORD = ... HASHED;
	-- ALTER LOGIN [userCognitivoGPA] WITH   PASSWORD = ... HASHED;



-- sigainternet
--	USE dbSigaWillyJanz;
		--GRANT EXECUTE ON [dbo].[FnAlunoPeriodoNovatoVeterano] TO [rolePowerBI];
		--GRANT EXECUTE ON [dbo].[spInet_RemoverConfirmacaoNota] TO [sigainternet];


	--GRANT SELECT ON [dbo].[FnAlunoCursoHistorico] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[FnAlunoDiarioAula] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[FnAlunoDiarioAula_Impressao] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[FnAlunoPermiteAcessoPortalWeb] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[FnAnoMes] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[FnCalcularTarifaCartao] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[FnCampoDinamico_Varchar] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[FnConceitoMetaRetorna] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[FnConverterMinutosEmHora] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[FnDateTrunc] TO [sigainternet];
	--GRANT SELECT ON [dbo].[FnDescontoPlanoPagamento] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[FnDiarioAulasSemRegistro] TO [sigainternet];
	--GRANT SELECT ON [dbo].[FnDiarioValidarConcluirDigitacao] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[FnDominio] TO [sigainternet];
	--GRANT SELECT ON [dbo].[FnFaseNotaAluno_SALE_IPMA_2009] TO [sigainternet];
	--GRANT SELECT ON [dbo].[FnFaseNotaAluno_SALE_IPMA_2010] TO [sigainternet];
	--GRANT SELECT ON [dbo].[FnFaseNotaAluno_SALE_IPMA_EF_EM12Ano] TO [sigainternet];
	--GRANT SELECT ON [dbo].[FnFaseNotaAluno_SALE_IPMA_EF_EM12Ano2008] TO [sigainternet];
	--GRANT SELECT ON [dbo].[FnFaseNotaAluno_SALE_IPMA_EM3Ano] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[FnFaseNotaAlunoExibirNotaComposicao] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[FnFaseNotaAlunoExibirNotaComposicao2] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[FnFaseNotaAlunoExibirNotaFase] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[FnFormatarMinutosEmHoras] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[FnLCTO_ServicoMensagem] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[FnLCTO_ValorAReceber] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[FnLCTO_ValorJuros] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[FnLCTO_ValorJurosAoDia] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[FnLCTO_ValorMulta] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[FnLCTO_ValorMultaPorAtraso] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[FnMaximoParcelasRecebimentoOnline] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[FnMediaComponentes_2018] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[FnMediaComponentes_2020] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[FnMediaComponentes17deAgosto_2019] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[FnMediaComponentesCNSA2020] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[FnMediaComponentesContemporaneo2020] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[FnMediaComponentesMontessori_2017] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[FnMediaComponentesStaAmelia2020] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[FnMesAno] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[FnPermiteRecebimentoOnline] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[FnRecebimentoOnlineCdTipoRecebimento] TO [sigainternet];
	--GRANT SELECT ON [dbo].[FnRecebimentoOnlineCredencial] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[FnResolverNomeTurmaCompleto] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[FnResolverNomeTurmaResumido] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[FnRestricaoTurmaPrincipal] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[FnTestaPermissaoLicencaModulos] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[FnTurmaAlternativa] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[FnValidarDiarioPendente] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[FnValorTaxaConveniencia] TO [sigainternet];
	--GRANT DELETE ON [dbo].[ParserResult] TO [sigainternet];
	--GRANT INSERT ON [dbo].[ParserResult] TO [sigainternet];
	--GRANT SELECT ON [dbo].[ParserResult] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[SpAgendamento] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[SpAgendamentoAlunosVinculados] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[SpAgendarAtendimento] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[SpAlunoBoletim] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[SpAlunoBoletim_CEI] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[SpAlunoBoletim_CEI_2013] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[SpAlunoBoletim_CEI_2016] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[SpAlunoBoletim_CEI_2018] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[SpAlunoBoletim_CNSA] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[SpAlunoBoletim_PH3_2020] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[SpAlunoBoletimAgnesErskine] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[SpAlunoBoletimAngloLiderCordeiro] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[SpAlunoBoletimCarlRogers2020] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[SpAlunoBoletimClassificacaoNSGracas] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[SpAlunoBoletimCONFHICSJ] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[SpAlunoBoletimContemporaneo2020] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[SpAlunoBoletimCPPCrato] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[SpAlunoBoletimLourdinas2018] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[SpAlunoBoletimMontessori_2020] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[SpAlunoBoletimNSGracas] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[SpAlunoBoletimSantanna2019] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[SpAlunoBoletimStaAmelia2020] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[SpAlunoBoletimUNECIM] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[SpAlunoBoletimUNECIM_2019] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[SpAlunoClassificacao] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[SpAlunoCursoHistoricoCompleto] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[SpAlunoCursoMatricular] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[SpAlunoCursoOfertaDisciplina] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[SpAlunoCursoQuadroHorario] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[SpAlunoCursoQuadroHorarioProfessor] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[SpAvaliacaoUnificadaListaDisciplina_MAPLEBEAR] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[SpBoletim_CEIMAIS_EF9_2017] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[SpBoletim_CEIZONASUL_EF9_2018] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[SpBoletimCarochinha2019] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[SpBoletimCognitivo2016] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[SpBoletimCognitivo2018] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[SpBoletimCognitivo2019] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[SpBoletimContemp2015] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[SpBoletimGGE2017] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[SpBoletimNAP_3EM_2014] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[SpBoletimSemestralMarieJost] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[SpCadastrarConteudoProgramatico] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[SpCampoDinamicoValor_Gravar] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[SpCancelarAgendamento] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[SpChamadaOnlineEfetuarApuracao] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[SpChamadaOnlineMarcarPresenca] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[SpChamadaOnlineValidarDataHoraLimite] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[SpConfirmarConceitoMetaFaseNotaAluno] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[SpCopiarDiarioAula] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[spCopiarRotinaEducacaoInfantil] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[SpDeclaracaoVinculoES] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[SpDiarioAulaInserir] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[spDiarioConcluirConfirmarDigitacao] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[spDiarioConcluirDigitacao] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[SpDiarioEnviarDadosPlanilha] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[SpDiarioImportarApuracaoFrequencia] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[SpDiarioTurmaAlternativa] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[SpImportarCronogramaPrevistoDiarioAulaCompleto] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[spInet_AlterarNota] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[spInet_AlterarNota_MAPLEBEAR] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[spInet_ConfirmarNota] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[spInet_GravarFrequencia] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[spInetAlterarLogin] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[spInetAlterarSenha] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[SpInetRecuperarSenha] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[SpInetRecuperarSenha_AlunoCurso] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[SpInserirArquivoAnexo] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[SpInserirFichaInscricao] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[SpInserirMensagemCaixaSaida] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[SpInserirSolicitacaoComplemento] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[SpInserirSolicitacaoPessoa] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[SpListarFichaAcompanhamento_BMQ] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[SpMobileGravarMensagem] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[SpPagamentoOnline_Atualizar] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[SpPagamentoOnline_Inserir] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[SpPagamentoOnlineSituacao_Inserir] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[SpRemoverArquivoAnexo] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[SpRetornaParcelaVencimentoValor] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[SpRetornaParcelaVencimentoValorES] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[SpSolicitacaoProcedimentoMatriculaGravar] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[SpTitCob_Boleto] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[SpTitCob_BoletoDetalhamento] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[SpTitCob_HistoricoPagamento] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[SpWebCadastrarAvaliacaoRelatorio] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[SpWebCertificadoParticipacaoEvento] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[SpWebComprovanteSolicitacaoDesconto] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[SpWebDadosPessoaisSolicitacaoDesconto] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[SpWebDigiNotaValidar] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[SpWebExibeNota] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[SpWebExibirNotaTodosAlunos] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[SpWebExibirPlanilhaAluno] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[SpWebExibirPlanilhaTodosAlunos] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[SpWebGabarito] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[SpWebGabaritoResultado] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[SpWebGravarFrequencia] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[SpWebIncricaoEvento] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[SpWebIncricaoEvento_Validar] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[SpWebIncricaoTurma] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[SpWebIncricaoTurmaContrato] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[SpWebListarAlunosTurma] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[SpWebListarAlunoTurma] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[SpWebListarDiario] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[SpWebListarDisciplina] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[SpWebListarDisciplinaNeves] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[SpWebListarFaseNota] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[SpWebMatriculaOnLine] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[SpWebMatriculaOnLineContrato] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[SpWebMontarFotograma] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[SpWebMontarFrequenciaDiario] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[SpWebPeriodosAlunoSuperior] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[SpWebPeriodosProfessor] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[SpWebPlanilhaEnviarSolicitacao] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[SpWebPlanilhaNotas] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[SpWebPlanilhaValidar] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[SpWebPlanoAulaInserir] TO [sigainternet];
	--GRANT EXECUTE ON [dbo].[SpWebPlanoEnsinoImportar] TO [sigainternet];


-- sp_change_users_login
	-- EXEC sp_change_users_login 'Update_one', 'userEloEEM', 'userEloEEM';
	-- EXEC sp_change_users_login 'Auto_Fix', 'userEloEEM', NULL, '*****';



--    ALTER LOGIN [userCognitivoGPA]
--    WITH PASSWORD = 'zd',
--    CHECK_EXPIRATION = OFF,
--    CHECK_POLICY = OFF;


-- User_MUST_CHANGE_password
    -- ALTER LOGIN [active.mislainy]
    -- WITH PASSWORD = '45DX$02' MUST_CHANGE,
    -- CHECK_EXPIRATION = ON,
    -- CHECK_POLICY = ON;

    -- Regras do Windows 10
    -- https://docs.microsoft.com/pt-br/sql/relational-databases/security/strong-passwords?view=sql-server-2017
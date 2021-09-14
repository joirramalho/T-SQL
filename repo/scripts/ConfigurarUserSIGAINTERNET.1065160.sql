/*
	31/01/2008 Jader
		Script criado para ser adicionado ao service pack em todas as atualizações
		para clientes.

		Para consultar o que há de permissão, use 
			EXEC sp_helprotect @username = 'sigainternet'
			
	04/06/2008 Paulo
		Adicionada permissão a view vwSituacaoAlunoDisciplina

	25/05/2009 Jader
		Verificando se o login e o user sigainternet existem.
		Criando novas formas de revoke de permissões.

	27/05/2009 Jader
		Comentando o trecho que verifica se o login e user sigainternet existem.
		Os clientes que não têm o módulo Internet não precisam ter este login/user, logo o teste sempre daria erro com eles.
		E, na prática, se o cliente possui módulo Internet o mesmo não funcionará se não houver login/user, logo isto servirá como alerta.

	03/06/2009 Nelson
		Adicionada permissão para os objetos utilizados no diário de classe:
		- spDiarioConcluirDigitacao
		- spDiarioConcluirConfirmarDigitacao
		- spInet_GravarFrequencia
		- FnDiarioValidarConcluirDigitacao, FnDateTrunc
		- TbDiario, TbDiarioAula, TbDiarioFrequencia
	
	15/03/2010 Lismax
		Adicionando permissão para a VwFaseNotaAluno e TbNotaConceito
		
	30/03/2010 Deyvisson
		Adicionando permissão para procedure SpWebExibirNotaTodosAlunos
		
	26/04/2010 Deyvisson
		Adicionando permissão para FnFaseNotaAluno_SALE_IPMA_2010 e nas tabelas de metas.
	
	12/05/2010 Jorge Ney
		Adicionando permissão para FnAlunoDiarioAula.
	
	13/05/2010 Lismax
		Adicionando permissão para FnAlunoDiarioAula_Impressao.
	
	14/05/2010 Lismax
		Adicionando permissão para VwAluno.

	30/06/2010 Deyvisson 
		Adicionando permissão as View VwBoletim_MadreDeus_2010_EF9_EM123,
		VwBoletim_MadreDeus_2010_EF678 e VwBoletim_MadreDeus_2010_EM3.
	
	22/06/2010 Deyvisson
		Adicionando permissão para VwBoletimEscolarVisaoEF2

	05/08/2010 Jorge Ney
		Adicionando permissão para TbUsuario
		
	01/09/2010 Deyvisson
		Adicionada permissão para SpPlanilhaNotasWeb

	23/09/2010 Deyvisson 
		Adicionada permissão para SpAgendarAtendimento, SpAgendamento, VwAgendamento e SpCancelarAgendamento
		
	28/09/2010 Deyvisson
		Adicionada permissão para SpCadastrarConteudoProgramatico

	28/09/2010 Jorge Ney
		Adicionada permissão para SpAlunoClassificacao
	
	04/10/2010 Jorge Ney
		Adicionada permissão para TbFaseNotaDisciplina
	
	07/10/2010 Anderson
		Adicionada permissão para SpWebExibirPlanilhaTodosAlunos
		
	22/10/2010 Deyvisson 
		Adicionada permissão a TbDisponibilidade
	
	04/11/2010 Anderson
		Adicionada permissão a TbPlanoDesconto

	26/01/2011 Deyvisson
		Adicionada permissão para as tabelas TbAlunoTurmaProcedimentoMatricula e TbProcedimentoMatricula.
	
	01/02/2011 Deyvisson
		Adicionada permissão para TbFaseNotaDisciplinaTurma.
		
	05/04/2011 Deyvisson
		Adicionada permissão para TbMetaSituacaoAlunoDisciplina.

	05/04/2011 Deyvisson
		Adicionada permissão para VwWebBoletimEscolarVisaoEF2 e SpWebVerificaTipoBoletim
	
	28/04/2011 Jorge Ney
		Adicionada permissão para TbMetaFaseNotaAlunoRegistro
			
	--28/04/2011 Sérgio
	--	Adicionada permissão para VwBoletimPPasso2011
	
	05/04/2011 Anderson
		Adicionadda a permisão para VwBoletim_CNSA_2011	

	12/05/2011 Deyvisson
		Adicionada permissão para SpAlunoBoletim_CEI

	17/05/2011 Deyvisson
		Adicionada permissão para TbFreqMarcacao e VwBoletim_Juvenal_2010

	18/05/2011 Deyvisson 
		Adicionada permissão para VwBoletim_IPMA_2011 e VwBoletim_IPMA_2011_EF1Ano
	
	07/06/2011 Jorge Ney
		Adicionada permissão para TbTextoPersonalizado
		
	29/06/2011 Anderson
		Adicionada permissão para VwBoletimCEA_2011	

	05/09/2011 Anderson
		Adicionada a permissão para VwLancamentoCobrancaContabil e TbLancamentoCobrancaDesconto	

	08/09/2011 Italo
		Adicionada a permissão para VwLancamentoCobrancaContabil e TbLancamentoCobrancaDesconto

	29/09/2011 Deyvisson
		Adicionada a permissão para SpWebSolicitacaoDesconto e VwEndereco
		
	17/10/2011 Anderson
		Adicionada a permissão para SpWebListarAlunosTurma

	21/10/2011 Ítalo
		Adicionada a permissão para TbSala

	31/10/2011 Anderson
		Adicionada a permissão para as funcionalidades do diário de classe web.		

	11/11/2011 Ítalo
		Adicionada a permissão para VwBoletim_NEVES_2011.

	09/02/2012 Ítalo
		Adicionada a permissão para SpWebProfessorPrincipal.

	16/03/2012 Ítalo
		Adicionada a permissão para VwBoletim_Amadeus_2012.

	08/05/2012 Ítalo
		Adicionada a permissão para VwBoletim_NEVES_2012.

	09/05/2012 Ítalo
		Adicionada a permissão para VwBoletim_Exponente_2012.
		
	10/05/2012 Anderson
		Adicionada a permissão para VwBoletimNAP_3EM_2012.

	25/05/2012 Anderson
		Adicionada a permissão para SpDiarioEnviarDadosPlanilha
		
	27/07/2012 Ítalo Bruno
		Adicionada permissão para TbTextoPersonalizado.
		
	05/09/2012 Anderson Soares
		Adicionada permissão para SpTitCob_HistoricoPagamento
		
	10/10/2012 Anderson
		Adicionando permissão para as procedures utilizadas na 
		Ficha de inscrição e Reserva de matrícula online.
		
	01/11/2012 Anderson
		Adicionada a permissão para SpAgendamentoAlunosVinculados
		
	14/11/2012 Anderson
		Adicionada a permissão para TbTipoMeta

	23/04/2013 Anderson/Carol
		Adicionada a permissão
			VwBoletimNAPMurakami_3EM
			VwBoletimNAPMurakami_12EM
			VwBoletim_ViaMedicina_2013
	
	23/04/2013 Anderson
		Adicionada a permissão VwBoletim_MadreDeus_2013_EF9_EM12
		
	21/05/2013 Anderson
		Adicionada a permissão SpConfirmarConceitoMetaFaseNotaAluno
		
	23/05/2013 Anderson
		Adicionada a permissão VwBoletimMetasEF_Polichinelo_2013 e VwBoletimMetasEI_Polichinelo_2013		
		
	16/08/2013 Anderson
		Adicionando permissão para TbOptProva, TbOptProvaAlunoTurma, TbOptSimuladoEnem e TbOptSimuladoEnemResultado

	19/8/2013 Anderson
		Adicionando permissão para VwWebGabaritoResultado e SpWebGabaritoResultado

	20/8/2013 Anderson
		Adicionando permissão para VwWebENEMGeral, VwWebENEMAluno e SpWebResultadoENEM

	11/9/2013 Anderson
		Adicionando permissão para TbFormularioCadastroInternet
		
	10/10/2013 Anderson
		Adicionando permissão para VwAlunoBoletim
		
	09/11/2013 Anderson
		Adicionando permissão para SpDiarioAulaInserir
        
        12/11/2013 Jorge Ney
		Adicionando permissão para VwBoletimEscolarCNSA_2011_2AnoEF	

	16/12/2013 Anderson
		Adcionando permissão para VwAlunoTurmaComplementar

	19/12/2013 Anderson
		Adicionando permissão para VwResponsavelImpedimento	

	24/01/2013 Carol
		Adicionada a view VwBoletim_CulturaInglesaCasaForte
		
	
	21/03/2014 Anderson
		Adicionada permissão para FnLCTO_ValorAReceber		
					  FnLCTO_ValorJuros		
					  FnLCTO_ValorJurosAoDia	
					  FnLCTO_ValorMulta		
					  FnLCTO_ValorMultaPorAtraso
	
	30/06/2014 Jader
		CRM 58783: Identifiquei ao enviar versão pelo ServicePack através de conexões com logins do tipo "userCLIENTE",
		que só têm permissões dentro do database relativo a um cliente, as permissões não eram aplicadas corretamente.
		Isto ocorria porque as permissões só eram aplicadas dentro de um "IF" que verificava se existia o login "sigainternet"
		no database master, mas como o "userCLIENTE" não tem permissão sobre o master, ele não retornava nada e, consequentemente,
		não dava as permissões.
		Quando executávamos as permissões diretamente pelo Enterprise Manager sempre usávamos contas como sa ou sigaadmin,
		logo a operação dava certo.
		
	08/07/2014 Anderson
		Adicionada a permissão para TbProfessorObs
		
	14/07/2014 Anderson
		Adicionada a permissão VwBoletim_CEIMAIS_EF9_2014
		
	29/08/2014 Anderson
		Adicionando permissão para as alterações do INSCRIÇÃO EM TURMA - MATRÍCULA ONLINE.
	
	26/09/2014 Caroline
		Adicionando as permissões em tabelas e procedure do projeto Porta Arquivo.
		
	31/10/2014 Anderson
		Adicionando a  permissão a SpRetornaParcelaVencimentoValor
		
	12/12/2014 Caroline
		Adicionando a permissão à função FnLCTO_ServicoMensagem
		
	17/12/2014 Anderson
		Adicionada a permissão a função FnConverterMinutosEmHora

	03/02/2015 Jorge Ney
		Adicionando permissão para VwBoletim_ETER_2011	
		
	04/02/2015 Anderson
		Adicionado permissão para SpWebRegistrarPagamento	

	28/04/2015 Anderson
		Adicionado permissão para VwBoletim_CEIMAIS_2015
		
	28/04/2015 Anderson
		Adicionado permissão para VwBoletimMetasEI_Polichinelo_2015		
		
	12/05/2015 Anderson
		Adicionado permissão para VwWebGabarito e SpWebGabarito			
	
	28/04/2015 Anderson
		Adicionado permissão para VwBoletim_NEVES_2015	

	25/05/2015 Anderson
		Adicionada permissão para SpDiarioImportarApuracaoFrequencia		
		
	09/06/2015 Anderson
		Adicionada permissão para VwBoletim_Exponente_2015			
	
	17/08/2015 Jorge Ney 
		Adicionada permissão para VwBoletim_IPMA_2015					

	09/10/2015 Jorge Ney 
		Adicionada permissão para VwBoletim_Kerigma					
		
	19/11/2015 Anderson
		Adicionada permissão para TbTurmaTurmaPrincipal
		
	07/03/2016 Anderson
		Adicionada a permissão para VwBoletim_MadreDeus_2016_EF678
		
	28/04/2016 Anderson
		Adicionando a permissão:
			VwBoletim_CEIZONASUL_EF9_2016
			VwBoletim_CEIMAIS_EF9_2016
			SpAlunoBoletim_CEI_2016			
	12/05/2016 Joelson
		Adicionado permissão para a VwBoletim_IPMA_2016
		
	30/06/2016 Anderson
		Adicionado permissão para a VwBoletim_PLENUS_2016
		
	23/09/2016 Anderson
		Adicionado permissão para a FnRestricaoTurmaPrincipal
		
	26/09/2016 Carlos
		Adicionado permissão para a VwBoletim_MadreDeus_2016_EF9_EM12	
		
	17/10/2016 Anderson
		Adicionando a permissão para a SpAvaliacaoUnificadaListaDisciplina_MAPLEBEAR e spInet_AlterarNota_MAPLEBEAR
		
	21/12/2016 Anderson		
		Adicionando a permissão para a tabela TbPagamentoOnline
		
	04/04/2017 Anderson
		Adicionando a permissão para a tabela TbPagamentoOnlineSituacao
		
	10/04/2017 Anderson
		Adicionando a permissão para a procedure SpWebListarDisciplinaNeves
		
	12/04/2017 Sérgio Barbosa
		Adicionanco permissão para as views VwBoletim_MadreDeus_2017_EF6ao9 e VwBoletim_MadreDeus_2017_EM.

	16/05/2017 Carlos
		Adicionanco permissão para a view VwAlunoBoletimMontessori_2017			
		Adicionanco permissão para a função FnMediaComponentesMontessori_2017
	
	17/05/2017 Anderson
		Adicionando permissão para a view VwBoletim_IMA_2017			
		Adicionando permissão para a view VwBoletim_SALESIANONATAL_MAIOR_2017			
		Adicionando permissão para a view VwBoletim_SALESIANONATAL_MENOR_2017	
		Adicionando permissao para procedure SpBoletim_CEIMAIS_2017
		
	29/05/2017
		Adicionando permissão para procedure SpBoletim_CEIZONASUL_EF9_2017
		
	21/06/2017 Anderson
		Adicionando permissão para TbSolicitacaoFichaMedica, TbAlunoFichaMedica
		Adicionando permissão para SpWebSolicitacaoFichaMedicaInserir
		
	28/06/2017 Anderson
		Adicionando a permissão para 	TbAlunoRotinaEducacaoInfantil, TbCampoDinamico, TbCampoDinamicoValor, TbCampoDinamicoConjunto, 
						TbCampoDinamicoConjuntoElemento e SpCampoDinamicoValor_Gravar
						
	10/11/2017 Anderson
		Adicionando a permissão para 	FnAlunoCursoHistorico, SpAlunoCursoQuadroHorario e TbTurmaDisciplinaPlanoAula
	
	18/12/2017 Anderson
		Adicionando a permissão SpBoletimGGE2017
		
	29/12/2017 Anderson
		Adicionando permissão SpWebVerificaLogin_AlunoCurso e SpInetRecuperarSenha_AlunoCurso
		
	10/01/2017 Anderson
		Adicionando permissão VwComprovanteMatricula_FACHO e SpWebPlanoAulaInserir
		
	25/01/2018 Anderson
		Adicionando permissão SpWebPlanoEnsinoImportar
	
	16/02/2018 Anderson
		Adicionando permissão VwAtaAvaliacaoFaculdade
		
	20/02/2018 Anderson
		Adicionando permissão TbComunicado
		
	22/02/2018 Anderson
		Adicionando permissão spCopiarRotinaEducacaoInfantil
		
	13/03/2018 Anderson	
		Adicionando permissão SpBoletim_CEIMAIS_2018, SpBoletim_CEIMAIS_EF9_2018, SpBoletim_CEIZONASUL_EF9_2018

	28/03/2018 Anderson
		Adicionando permissão TbTurmaProfessorSecundario
		
	09/04/2018 Anderson
		Adicionando permissão SpWebExibirPlanilhaAluno
		
	25/04/2018 Anderson
		Adicionando permissão para SpAlunoBoletimUNECIM
		
	26/04/2018 Anderson
		Adicionando permissao para vwBibUsuariosSiga

	13/05/2018 Anderson
		Adicionando permissao para Eventos.
		
	16/05/2018 Anderson
		Adicionando permissão para VwAlunoBoletimNSGracas e SpAlunoBoletimNSGracas
		
	08/06/2018 Anderson
		Adicionando permissão para FnMediaComponentes_2018 e VwBoletim_NEVES_2018 
		
	18/06/2018 Sérgio Barbosa
		Adicionando permição para TbEventoTipo. {CRM 128132}
	
	06/08/2018 Anderson
		Adicionando permissão SpBoletimCognitivo2018
	
	10/09/2018 Anderson
		Adicionando permissao vwBoletim_SabeViver_2018
		
	26/09/2018 Anderson
		Adicionando permissão FnAnoMes

	14/11/2018 Antonio Paulo
		Adicionado permissões (TbTipoAvaliacao, TbAlunoTipoAvaliacao) para Avaliação Comportamental. {CRM 138179}

	04/12/2018 Jorge Ney
		Adicionado permissão VwBoletim_FaculdadeDioc  {CRM 142927}
		
	11/02/2019 Anderson
		Adicionado permissão SpWebTituloCobrancaVisualizacaoInserir {CRM 149804}
		
	06/05/2019 Anderson
		Adicionando permissão VwBoletim_MadreDeus_2019_EF4E5 {CRM 158443}
		
	14/05/2019 Anderson
		Adicionando permissão SpBoletimCarochinha2019 {CRM 158683}

	28/05/2019 Anderson
		Adicionando permissão SpAlunoBoletimLourdinas2018 {SEM CRM}
		
	02/07/2019 Anderson
		Adicionando permissão SpPagamentoOnline_Atualizar, SpPagamentoOnline_Inserir, SpPagamentoOnlineSituacao_Inserir. {CRM 161711}		
		
	09/08/2019 Anderson
		Adicionando permissão SpPagamentoOnline_Atualizar, SpPagamentoOnline_Inserir, SpPagamentoOnlineSituacao_Inserir. {CRM 161711}	
		
	12/08/2019 Anderson
		Adicionando permissão VwDiario. {CRM 154164}
		
	03/09/2019 Anderson
		Adicionando permissão VwAlunoBoletimSantanna2019 e SpAlunoBoletimSantanna2019. {CRM 167236}	

	01/11/2019 Anderson
		Adicionando permissão 
		
	27/01/2019 Anderson
		Adicionando permissão TbAlunoPeriodo

	29/01/2020 Anderson
		Adicionando permissão SpImportarCronogramaPrevistoDiarioAulaCompleto

	08/04/2020 Anderson
		Adicionando permissão VwBoletim_NEVES_2020 e FnMediaComponentes_2020

	08/04/2020 Anderson
		Adicionando permissão TbTituloCobrancaBoleto

	11/05/2020 Jorge Ney
		Adicionando permissão VwBoletim_MadreDeus_2020_EM. {193426}

	27/05/2020 Anderson
		Adicionando a permissão TbParametroGoogleForEducation
		
	01/06/2020 Anderson
		Adicionando a permissão FnMaximoParcelasRecebimentoOnline

	10/06/2020 Anderson
		Adicionando a permissão SpAlunoBoletimCPPCrato, VwAlunoBoletimCPPCrato

	10/06/2020 Anderson
		Adicionando a permissão SpWebPeriodosAlunoSuperior

	02/07/2020 Anderson
		Adicionando a permissão para Chamada online. {CRM 209441}

	04/08/2020 Anderson
		Adicionando a permissão para VwBoletim_CNSA_2020 e FnMediaComponentesCNSA2020. {210705}	

	12/08/2020 Anderson
		Adicionando a permissão TbSolicitacaoDescontoTipoDocumento e TbSolicitacaoDescontoDocumento. {CRM 212622}
		
	17/08/2020 Anderson
		Adcionando a permissão TbTurmaDisciplina_GoogleForEducation. {CRM 211328}
		
	31/08/2020 Anderson
		Adicionando a permissão SpDeclaracaoVinculoES

	21/09/2020 Anderson
		Adicionando a permissão FnTestaPermissaoLicencaModulos
		
	06/10/2020 Anderson
		Adicionando a permissão SpWebSolicitacaoDescontoCadastrarFiliacao		
		
	23/09/2020 Anderson
		Adicionando a permissão FnMediaComponentesStaAmelia2020, SpAlunoBoletimStaAmelia2020 e VwAlunoBoletimStaAmelia2020

	12/11/2020 Anderson
		Retirando permissão do SpBoletim_CEIMAIS_2017, SpBoletim_CEIMAIS_2018, SpBoletim_CEIZONASUL_EF9_2017, SpBoletim_CEIMAIS_EF9_2018

	22/12/2020 Anderson
		Adicionando a permissão VwTituloCobrancaBoleto			
		
	30/11/2020 Anderson
		Adicionando a permissão SpAlunoBoletimCONFHICSJ	

	30/12/2020 Anderson
		Adicionando a permissão VwAlunoBoletimCarlRogers2020 e SpAlunoBoletimCarlRogers2020
		
	18/03/2021 Anderson
		Adiconando a permissão TbNotaFiscalLote e TbNotaFiscal
		
	03/05/2021 Anderson
		Adicionando permissão SpAlunoBoletimAngloLiderCordeiro

	06/07/2021 Anderson
		Adicionando permissão SpChamadaOnlineValidarDataHoraLimite
		
	06/07/2021 Anderson
		Adicionando permissão para as alterações de Planos de mensalidades e Serviço adicional		
		
	06/07/2021 Anderson
		Adicionando permissão para TbSolicitacaoProcedimentoMatricula	

	24/08/2021 Anderson
		Adicionando permissão para SpBoletimSemestralMarieJost
*/
GO


-- Jader  28/05/2009 18:40:26
-- Comentando o trecho que verifica se o login e user sigainternet existem.
-- Os clientes que não têm o módulo Internet não precisam ter este login/user, logo o teste sempre daria erro com eles.
-- E, na prática, se o cliente possui módulo Internet o mesmo não funcionará se não houver login/user, logo isto servirá como alerta.

--IF NOT EXISTS( SELECT * FROM master..syslogins WHERE loginname = 'sigainternet' )
--	RAISERROR ( 'Login do servidor ''sigainternet'' não existe. Verifique.', 16, 1)

--IF NOT EXISTS( SELECT * FROM sysusers WHERE name = 'sigainternet' )
--	-- No SQL 2005 deve ser usada a view sys.database_principals
--	-- Mas a sysusers ainda funciona.
--	RAISERROR ( 'User do database ''sigainternet'' não existe. Verifique.', 16, 1)


IF EXISTS( SELECT * FROM SYSMEMBERS m INNER JOIN SYSUSERS u ON m.memberuid = u.uid AND u.name = 'sigainternet' )
	RAISERROR ( 'User ''sigainternet'' pertence a algum database role. Verifique.', 16, 1)

	/*
	-- Retirando o 'sigainternet' dos roles do banco de dados
	-- Não é possível executar esta procedure dentro de uma transação
	exec sp_droprolemember 'db_owner', 		'sigainternet'
	exec sp_droprolemember 'db_accessadmin',	'sigainternet'
	exec sp_droprolemember 'db_backupoperator', 	'sigainternet'
	exec sp_droprolemember 'db_datareader', 	'sigainternet'
	exec sp_droprolemember 'db_datawriter', 	'sigainternet'
	exec sp_droprolemember 'db_ddladmin', 		'sigainternet'
	exec sp_droprolemember 'db_denydatawriter', 	'sigainternet'
	exec sp_droprolemember 'db_denydatareader', 	'sigainternet'
	exec sp_droprolemember 'db_securityadmin', 	'sigainternet'
	*/
GO

-- O usuário comum não poderá remover o login sigainternet de algum server role. Então, basta verificar se existe algum.
-- Esta verificação só funciona se executada por um login sysadmin como "sa" pois usa informações do database master
IF EXISTS( SELECT * FROM master..syslogins WHERE loginname = 'sigainternet' AND sysadmin + securityadmin + serveradmin + setupadmin + processadmin + diskadmin + dbcreator <> 0 )
	RAISERROR ( 'User ''sigainternet'' pertence a algum server role. Verifique.', 16, 1)


-- excluir usuário sigainternet do banco
IF EXISTS( SELECT * FROM master..syslogins WHERE loginname = 'sigainternet' )
BEGIN
	IF NOT EXISTS( SELECT * FROM INFORMATION_SCHEMA.SCHEMATA WHERE SCHEMA_NAME = 'sigainternet' )
	BEGIN
		RAISERROR ( 'Execute "EXEC sp_dropuser sigainternet" e "EXEC sp_adduser sigainternet", uma vez que não é possível via transação.', 16, 1)
	END
END


IF NOT EXISTS( SELECT * FROM sysusers WHERE name='sigainternet' )
	RAISERROR ( 'Não existe o user ''sigainternet'' dentro do database. Execute o script para configurar as permissões corretamente.', 16, 1)


IF EXISTS( SELECT * FROM sysusers WHERE name='sigainternet' )
  BEGIN
	REVOKE SELECT, INSERT, UPDATE, DELETE, REFERENCES, ALTER FROM sigainternet

	-------------------------------------------------------- ATENÇÃO ---------------------------------------------------------------
	/*
		1.
		Ao criar permissão para um novo objeto execute o comando de GRANT também no script que o cria.
		
		2.
		Todos os novos acessos do módulo Internet devem ser por procedure ou view, nunca direto em tabela.
		Motivo: tabela não tem "script de definição".
		Não devem ser criadas permissões do tipo:

		    GRANT SELECT                ON TbAluno                                                              TO sigainternet
		    GRANT SELECT                ON TbResponsavel                                                        TO sigainternet

		Ou seja, a partir de agora, apenas procedure ou view devem ser usadas, não criar GRANT para TbAlgumaCoisa.
		Quando necessário, criar SpWebAlgumaCoisa.
	*/

	-------------------------------------------------------- Tabela ---------------------------------------------------------------
	GRANT SELECT, UPDATE			ON TbAluno 								TO sigainternet
	GRANT SELECT, UPDATE 			ON TbResponsavel							TO sigainternet
	GRANT SELECT 				ON TbAlunoFoto								TO sigainternet
	GRANT SELECT 				ON TbEndereco								TO sigainternet
	GRANT SELECT 				ON TbUnidade								TO sigainternet
	GRANT SELECT 				ON TbEscola								TO sigainternet
	GRANT SELECT, UPDATE			ON TbProfessor								TO sigainternet
	GRANT SELECT, INSERT, DELETE 		ON ParserResult								TO sigainternet
	GRANT SELECT, UPDATE			ON TbTurmaProfessor							TO sigainternet
	GRANT SELECT 				ON TbDisciplina								TO sigainternet
	GRANT SELECT 				ON TbPeriodo								TO sigainternet
	GRANT SELECT 				ON TbCurso								TO sigainternet
	GRANT SELECT 				ON TbAlunoTurma								TO sigainternet
	GRANT SELECT 				ON TbSerie								TO sigainternet
	GRANT SELECT 				ON TbTurma								TO sigainternet
	GRANT SELECT 				ON TbFormula								TO sigainternet
	GRANT SELECT 				ON TbFaseNota								TO sigainternet
	GRANT SELECT 				ON TbSituacaoAlunoTurma							TO sigainternet
	GRANT SELECT 				ON TbSituacaoAlunoDisciplina						TO sigainternet
	GRANT SELECT				ON TbFaseNotaAluno							TO sigainternet
	GRANT SELECT				ON TbLancamentoCobranca							TO sigainternet
	GRANT SELECT				ON TbTurmaDisciplinaFaseNota						TO sigainternet
	GRANT SELECT				ON TbTipoOcorrencia							TO sigainternet
	GRANT SELECT				ON TbAlunoObs								TO sigainternet	
	GRANT SELECT				ON TbTituloCobranca							TO sigainternet
	GRANT SELECT				ON TbParametroGlobal							TO sigainternet
	GRANT SELECT				ON TbParametroInternet							TO sigainternet
	GRANT SELECT				ON TbEmpresa								TO sigainternet
	GRANT SELECT				ON TbServico								TO sigainternet
	GRANT INSERT				ON TbLogWeb								TO sigainternet
	GRANT SELECT				ON TbDiario								TO sigainternet
	GRANT SELECT, INSERT, DELETE, UPDATE	ON TbDiarioAula								TO sigainternet
	GRANT SELECT, INSERT, DELETE, UPDATE	ON TbDiarioFrequencia							TO sigainternet
	GRANT SELECT				ON TbAlunoCursoSuperior							TO sigainternet
	GRANT SELECT				ON TbAlunoTurmaObservacao						TO sigainternet
	GRANT SELECT				ON TbAlunoTurmaAvaliacaoRelatorio					TO sigainternet
	GRANT SELECT				ON TbSolicitacaoTipo							TO sigainternet
	GRANT SELECT, DELETE			ON TbSolicitacao							TO sigainternet
	GRANT SELECT, UPDATE			ON TbSolicitacaoDesconto						TO sigainternet
	GRANT SELECT				ON TbSolicitacaoDescontoTipo						TO sigainternet
	GRANT SELECT, DELETE 			ON TbSolicitacaoProcedimentoMatricula					TO sigainternet
	GRANT SELECT				ON TbAlunoTurmaBolsa							TO sigainternet
	GRANT SELECT, INSERT, DELETE, UPDATE	ON TbMetaFaseNotaAluno							TO sigainternet
	GRANT SELECT				ON TbGradeCurricular							TO sigainternet
	GRANT SELECT				ON TbNotaConceito							TO sigainternet
	GRANT SELECT				ON TbMetaConceito							TO sigainternet	
	GRANT SELECT				ON TbMetaFaseNota							TO sigainternet
	GRANT SELECT				ON TbMeta								TO sigainternet
	GRANT SELECT				ON TbUsuario								TO sigainternet
	GRANT SELECT				ON TbFaseNotaDisciplina							TO sigainternet
	GRANT SELECT				ON TbDisponibilidade							TO sigainternet
	GRANT SELECT				ON TbAgendamento							TO sigainternet
	GRANT SELECT				ON TbProcedimentoMatricula						TO sigainternet
	GRANT SELECT				ON TbAlunoTurmaProcedimentoMatricula					TO sigainternet	
	GRANT SELECT				ON TbFaseNotaDisciplinaTurma						TO sigainternet
	GRANT SELECT				ON TbMetaSituacaoAlunoDisciplina					TO sigainternet
	GRANT SELECT				ON TbFreqMarcacao							TO sigainternet
	GRANT SELECT				ON TbLancamentoCobrancaDesconto						TO sigainternet
	GRANT SELECT, INSERT, DELETE, UPDATE	ON TbMetaFaseNotaAlunoRegistro						TO sigainternet
	GRANT SELECT				ON TbSala								TO sigainternet
	GRANT SELECT				ON TbTipoResponsavel							TO sigainternet
	GRANT SELECT				ON TbReligiao								TO sigainternet
	GRANT SELECT				ON TbProfissao								TO sigainternet
	GRANT SELECT				ON TbTipoImpedimento							TO sigainternet
	GRANT SELECT				ON TbTextoPersonalizado 						TO sigainternet
	GRANT SELECT 				ON TbMensagemConfiguracaoContaSMTP					TO sigainternet	
	GRANT SELECT 				ON TbTipoMeta								TO sigainternet	
	GRANT SELECT 				ON TbDiarioAluno							TO sigainternet	
	GRANT SELECT 				ON TbOptProva								TO sigainternet
	GRANT SELECT 				ON TbOptProvaAlunoTurma							TO sigainternet
	GRANT SELECT 				ON TbOptSimuladoEnem							TO sigainternet
	GRANT SELECT 				ON TbOptSimuladoEnemResultado						TO sigainternet
	GRANT SELECT 				ON TbFormularioCadastroInternet						TO sigainternet
	GRANT SELECT 				ON TbSolicitacaoPessoa							TO sigainternet
	GRANT SELECT 				ON TbSolicitacaoComplemento						TO sigainternet
	GRANT SELECT 				ON TbProfessorObs							TO sigainternet	
	GRANT SELECT, INSERT, DELETE, UPDATE	ON TbSolicitacaoProvisoria						TO sigainternet	
	GRANT SELECT				ON TbTextoPersonalizadoSerie						TO sigainternet
	GRANT SELECT, INSERT, UPDATE, DELETE	ON TbArqArquivo								TO sigainternet
	GRANT SELECT, INSERT, UPDATE, DELETE	ON TbArqArquivoTurmaPublicacao						TO sigainternet
	GRANT SELECT, INSERT, UPDATE, DELETE	ON TbArqArquivoAlunoVisualizacao					TO sigainternet
	GRANT SELECT				ON TbAbatimento								TO sigainternet
	GRANT SELECT 				ON TbResponsavelMobile 							TO sigainternet
	GRANT SELECT				ON TbEstabelecimentoEnsino						TO sigainternet
	GRANT SELECT				ON TbParametroMobile							TO sigainternet
	GRANT SELECT				ON TbFreqApuracao							TO sigainternet
	GRANT SELECT				ON TbEscola								TO sigainternet
	GRANT SELECT				ON TbUnidade								TO sigainternet
	GRANT SELECT				ON TbCurriculo								TO sigainternet
	GRANT SELECT				ON TbAlunoCurso								TO sigainternet
	GRANT SELECT				ON TbAtividadeComplementar						TO sigainternet
	GRANT SELECT				ON TbTurmaTurmaPrincipal						TO sigainternet
	GRANT SELECT, INSERT, UPDATE, DELETE	ON TbLogMobile 								TO sigainternet
	GRANT SELECT  				ON TbMobileTipoMensagem 						TO sigainternet
	GRANT SELECT, UPDATE			ON TbMobileMensagem 							TO sigainternet
	GRANT SELECT				ON TbPagamentoOnline							TO sigainternet
	GRANT SELECT				ON TbPagamentoOnlineSituacao						TO sigainternet	
	GRANT SELECT				ON TbAlunoFichaMedica							TO sigainternet
	GRANT SELECT				ON TbSolicitacaoFichaMedica						TO sigainternet
	GRANT SELECT, INSERT, DELETE, UPDATE	ON TbAlunoRotinaEducacaoInfantil					TO sigainternet
	GRANT SELECT 				ON TbCampoDinamico							TO sigainternet	
	GRANT SELECT, DELETE 			ON TbCampoDinamicoValor							TO sigainternet	
	GRANT SELECT 				ON TbCampoDinamicoConjunto						TO sigainternet	
	GRANT SELECT 				ON TbCampoDinamicoConjuntoElemento					TO sigainternet			
	GRANT SELECT, INSERT, UPDATE, DELETE	ON TbTurmaDisciplinaPlanoAula						TO sigainternet
	GRANT SELECT				ON TbProfessorFoto 							TO sigainternet
	GRANT SELECT				ON TbTipoSituacaoAlunoDisciplina					TO sigainternet
	GRANT SELECT				ON TbComunicado 							TO sigainternet
	GRANT SELECT				ON TbTurmaProfessorSecundario						TO sigainternet
	GRANT SELECT				ON TbEventoTipoInscricao						TO sigainternet
	GRANT SELECT				ON TbEventoTipo								TO sigainternet
	GRANT SELECT 				ON TbTipoAvaliacao							TO sigainternet
	GRANT SELECT 				ON TbAlunoTipoAvaliacao							TO sigainternet
	GRANT SELECT 				ON TbMensagemConfiguracao						TO sigainternet
	GRANT SELECT, UPDATE			ON TbArquivoAnexo							TO sigainternet		
	GRANT SELECT, INSERT			ON TbLancamentoFinanceiro						TO sigainternet
	GRANT SELECT, INSERT			ON TbLancamentoFinanceiroRateio						TO sigainternet	
	GRANT SELECT 				ON TbCartaoOperadora 							TO sigainternet
	GRANT SELECT 				ON TbCaixaTipoRecebimento 						TO sigainternet
	GRANT SELECT, INSERT, UPDATE, DELETE	ON TbCartaoMovimentacao 						TO sigainternet
	GRANT SELECT 				ON TbFormularioRotinaEducacaoInfantilCampoDinamico			TO sigainternet	
	GRANT SELECT 				ON TbAlunoPeriodo							TO sigainternet	
	GRANT SELECT				ON TbTituloCobrancaBoleto						TO sigainternet	
	GRANT SELECT				ON TbParametroGoogleForEducation					TO sigainternet		
	GRANT SELECT, UPDATE			ON TbAlunoPeriodo							TO sigainternet
	GRANT SELECT				ON TbParametroEnsinoSuperior						TO sigainternet	
	GRANT SELECT				ON TbDiarioAulaChamadaOnline						TO sigainternet	
	GRANT SELECT				ON TbSolicitacaoDescontoTipoDocumento					TO sigainternet	
	GRANT SELECT				ON TbSolicitacaoDescontoDocumento					TO sigainternet		
	GRANT SELECT				ON TbTurmaDisciplina_GoogleForEducation					TO sigainternet	
	GRANT SELECT				ON TbSituacaoSolicitacaoDesconto					TO sigainternet	
	GRANT SELECT				ON TbUnidadeTermoConsentimento						TO sigainternet	
	GRANT SELECT				ON TbNotaFiscalLote							TO sigainternet	
	GRANT SELECT				ON TbNotaFiscal								TO sigainternet		
	GRANT SELECT				ON TbPlanoPagamento							TO sigainternet			
	GRANT SELECT				ON TbPlanoPagamentoServico						TO sigainternet		
	GRANT SELECT				ON TbServicoAdicional							TO sigainternet		
	GRANT SELECT				ON TbServicoAdicionalTurma						TO sigainternet		
	GRANT SELECT				ON TbServicoAdicionalPlanoPagamento					TO sigainternet				
	
	-------------------------------------------------------- View ---------------------------------------------------------------
	GRANT SELECT 				ON vwTituloCobranca							TO sigainternet
	GRANT SELECT 				ON vwTurmaDisciplina							TO sigainternet
	GRANT SELECT 				ON vwAlunoImpedimento2							TO sigainternet
	GRANT SELECT 				ON vwSituacaoAlunoDisciplina						TO sigainternet
	GRANT SELECT				ON VwFaseNotaAluno							TO sigainternet
	GRANT SELECT				ON vwFormula								TO sigainternet
	GRANT SELECT				ON vwWebExibeNota							TO sigainternet
	GRANT SELECT				ON VwFreqMarcacao							TO sigainternet	
	GRANT SELECT				ON VwTituloCobrancaDescricaoValorAtualizado				TO sigainternet	
	GRANT SELECT				ON vwAlunoTurma								TO sigainternet
	GRANT SELECT				ON VwAnoMes								TO sigainternet
	GRANT SELECT				ON VwLancamentoCobranca							TO sigainternet
	GRANT SELECT				ON VwAlunoCursoSuperiorBoletim						TO sigainternet
	GRANT SELECT				ON VwAlunoCursoSuperior							TO sigainternet	
	GRANT SELECT				ON VwTurma								TO sigainternet
	GRANT SELECT				ON VwMeta								TO sigainternet
	GRANT SELECT				ON VwAluno								TO sigainternet
	GRANT SELECT				ON VwBoletim_MadreDeus_2010_EF678					TO sigainternet
	GRANT SELECT				ON VwBoletim_MadreDeus_2010_EF9_EM123					TO sigainternet
	GRANT SELECT				ON VwBoletim_MadreDeus_2010_EM3						TO sigainternet
	GRANT SELECT				ON VwBoletimEscolarVisaoEF2						TO sigainternet
	GRANT SELECT				ON VwBoletimPPasso2011 							TO sigainternet
	GRANT SELECT				ON VwBoletimCEA_2011 							TO sigainternet	
	GRANT SELECT				ON VwAgendamento							TO sigainternet
	GRANT SELECT				ON VwWebBoletimEscolarVisaoEF2						TO sigainternet
	GRANT SELECT				ON VwBoletim_CNSA_2011							TO sigainternet
	GRANT SELECT				ON VwBoletim_CNSA_2016							TO sigainternet
	GRANT SELECT				ON VwBoletim_IPMA_2011_EF1Ano						TO sigainternet
	GRANT SELECT				ON VwBoletim_Juvenal_2010						TO sigainternet
	GRANT SELECT				ON VwBoletim_IPMA_2011							TO sigainternet
	GRANT SELECT				ON VwLancamentoCobrancaContabil						TO sigainternet
	GRANT SELECT				ON VwEndereco								TO sigainternet
	GRANT SELECT				ON vwAlunoCurso								TO sigainternet
	GRANT SELECT				ON VwAlunoCursoBoletim							TO sigainternet
	GRANT SELECT				ON VwComprovanteSolicitacaoDesconto					TO sigainternet	
	GRANT SELECT				ON VwBoletim_NEVES_2011							TO sigainternet	
	GRANT SELECT				ON VwDominio								TO sigainternet	
	GRANT SELECT				ON VwWebAlunoImpedimento						TO sigainternet	
	GRANT SELECT				ON VwBoletim_Amadeus_2012						TO sigainternet	
	GRANT SELECT				ON VwBoletim_MadreDeus_2011_EF678					TO sigainternet
	GRANT SELECT				ON VwBoletim_NEVES_2012							TO sigainternet
	GRANT SELECT				ON VwBoletim_Exponente_2012						TO sigainternet
	GRANT SELECT				ON VwBoletim_Exponente_2013						TO sigainternet
	GRANT SELECT				ON VwBoletimNAP_3EM_2012						TO sigainternet
	GRANT SELECT				ON vwCantinaClienteSiga		        				TO sigainternet
	GRANT SELECT				ON VwBoletim_Nap_1e2EM  						TO sigainternet
	GRANT SELECT 				ON VwBoletim_CNSA_2013 							TO sigainternet
	GRANT SELECT 				ON VwBoletimNAPMurakami_3EM 						TO sigainternet 	
	GRANT SELECT 				ON VwBoletimNAPMurakami_12EM 						TO sigainternet 		
	GRANT SELECT 				ON VwBoletim_ViaMedicina_2013 						TO sigainternet	
	GRANT SELECT				ON VwBoletim_MadreDeus_2013_EF9_EM12					TO sigainternet
	GRANT SELECT				ON VwBoletimMetasEF_Polichinelo_2013					TO sigainternet
	GRANT SELECT				ON VwBoletimMetasEI_Polichinelo_2013					TO sigainternet
	GRANT SELECT				ON vwBoletim_SalesianoRecife						TO sigainternet
	GRANT SELECT				ON vwBoletim_SabeViver_2013						TO sigainternet
	GRANT SELECT				ON VwBoletim_CEA_2013							TO sigainternet
	GRANT SELECT				ON VwWebGabaritoResultado						TO sigainternet
	GRANT SELECT				ON VwWebENEMAluno							TO sigainternet
	GRANT SELECT				ON VwWebENEMGeral							TO sigainternet
	GRANT SELECT				ON VwBoletim_CulturaInglesaPetrolina			                TO sigainternet
	GRANT SELECT				ON VwAlunoBoletim							TO sigainternet	
	GRANT SELECT				ON VwBoletimNotasEF_Polichinelo_2013			                TO sigainternet	
	GRANT SELECT				ON VwBoletimMetas_Neves							TO sigainternet
	GRANT SELECT				ON VwBoletimMetasResumo_Neves					        TO sigainternet
	GRANT SELECT				ON VwBoletimEscolarCNSA_2011_2AnoEF                                     TO sigainternet
	GRANT SELECT				ON VwBoletim_SaleParalela						TO sigainternet
	GRANT SELECT				ON VwAlunoTurmaComplementar						TO sigainternet
	GRANT SELECT				ON VwResponsavelImpedimento						TO sigainternet
	GRANT SELECT				ON VwBoletim_CulturaInglesaCasaForte					TO sigainternet
	GRANT SELECT				ON VwBoletim_CEIMAIS_EF9_2014						TO sigainternet
	GRANT SELECT				ON VwBoletim_CEIZONASUL_EF9_2016					TO sigainternet
	GRANT SELECT				ON VwBoletim_CEIMAIS_EF9_2016						TO sigainternet	
	GRANT SELECT				ON VwBoletim_CEFRAN							TO sigainternet
	GRANT SELECT				ON VwBoletim_SaleParalela2014						TO sigainternet
	GRANT SELECT				ON VwBoletim_ETER_2011							TO sigainternet
	GRANT SELECT				ON VwBoletim_Nucleo							TO sigainternet
	GRANT SELECT				ON VwBoletim_CEIMAIS_2015						TO sigainternet	
	GRANT SELECT				ON VwBoletimMetasEI_Polichinelo_2015					TO sigainternet		
	GRANT SELECT				ON VwWebGabarito							TO sigainternet	
	GRANT SELECT				ON VwBoletim_NEVES_2015							TO sigainternet		
	GRANT SELECT				ON VwBoletim_NEVES_2016							TO sigainternet		
	GRANT SELECT				ON VwBoletim_Exponente_2015						TO sigainternet			
	GRANT SELECT				ON VwComunicado								TO sigainternet			
	GRANT SELECT				ON VwBoletim_Overdose_2015						TO sigainternet
	GRANT SELECT				ON VwBoletim_GURILANDIA_2015						TO sigainternet								
	GRANT SELECT				ON VwBoletim_IMA_2015							TO sigainternet		
	GRANT SELECT 				ON VwBoletim_IPMA_2015							TO sigainternet	
	GRANT SELECT				ON VwBoletim_CRISTREDENTOR_2015						TO sigainternet
	GRANT SELECT				ON VwBoletim_Kerigma							TO sigainternet
	GRANT SELECT				ON VwAlunoTurmaOficial							TO sigainternet
	GRANT SELECT				ON VwBoletim_MadreDeus_2016_EF678					TO sigainternet
	GRANT SELECT 				ON VwBoletim_IPMA_2016							TO sigainternet	
	GRANT SELECT 				ON VwBoletim_PLENUS_2016						TO sigainternet	
	GRANT SELECT				ON VwDiario 								TO sigainternet
	GRANT SELECT 				ON VwDiarioFrequencia 							TO sigainternet
	GRANT SELECT				ON VwBoletimPPasso1EF2EM						TO sigainternet
	GRANT SELECT				ON VwBoletim_MadreDeus_2016_EF9_EM12					TO sigainternet
	GRANT SELECT				ON VwAcessoPortalAluno							TO sigainternet
	GRANT SELECT				ON VwMobileMensagem							TO sigainternet
	GRANT SELECT				ON VwBoletim_MadreDeus_2017_EF6ao9					TO sigainternet
	GRANT SELECT				ON VwBoletim_MadreDeus_2017_EM						TO sigainternet
	GRANT SELECT				ON VwAlunoBoletimMontessori_2017					TO sigainternet
	GRANT SELECT				ON VwBoletim_IMA_2017							TO sigainternet
	GRANT SELECT				ON VwBoletim_SALESIANONATAL_MAIOR_2017					TO sigainternet
	GRANT SELECT				ON VwBoletim_SALESIANONATAL_MENOR_2017					TO sigainternet
	GRANT SELECT 				ON VwComprovanteMatricula_FACHO 					TO sigainternet
	GRANT SELECT 				ON VwAtaAvaliacaoFaculdade	 					TO sigainternet
	GRANT SELECT 				ON VwBoletim_NEVES_2018 	 					TO sigainternet
	GRANT SELECT 				ON vwBibUsuariosSiga	 	 					TO sigainternet
	GRANT SELECT 				ON VwAlunoBoletimNSGracas  	 					TO sigainternet
	GRANT SELECT 				ON VwBoletim_NEVES_2018 						TO sigainternet
	GRANT SELECT				ON vwBoletim_SabeViver_2018						TO sigainternet
	GRANT SELECT			    	ON VwBoletim_FaculdadeDioc						TO sigainternet
	GRANT SELECT			    	ON VwAlunoBoletimUNECIM							TO sigainternet
	GRANT SELECT			    	ON VwAlunoBoletimUNECIM_2019						TO sigainternet
	GRANT SELECT			    	ON VwBoletim_MadreDeus_2019_EF4E5					TO sigainternet	
	GRANT SELECT 				ON VwAlunoBoletimSantanna2019 						TO sigainternet
	GRANT SELECT 				ON VwBoletim_NEVES_2020 						TO sigainternet
	GRANT SELECT				ON VwBoletim_MadreDeus_2020_EM 						TO sigainternet
	GRANT SELECT 				ON VwAlunoBoletimCPPCrato 						TO sigainternet
	GRANT SELECT				ON VwBoletim_CNSA_2020							TO sigainternet
	GRANT SELECT				ON VwAlunoBoletimContemporaneo2020					TO sigainternet
	GRANT SELECT 				ON VwAlunoBoletimStaAmelia2020 						TO sigainternet
	GRANT SELECT 				ON VwAlunoBoletimMontessori_2020 					TO sigainternet
	GRANT SELECT				ON VwTituloCobrancaBoleto						TO sigainternet
	GRANT SELECT 				ON VwAlunoBoletimCarlRogers2020 					TO sigainternet
	GRANT SELECT 				ON VwAlunoBoletim_PH3_2020 						TO sigainternet
	GRANT SELECT 				ON VwPlanoPagamento 							TO sigainternet
	
	------------------------------------------------------- Function --------------------------------------------------------------
	GRANT SELECT 				ON FnFaseNotaAluno_SALE_IPMA_EM3Ano					TO sigainternet
	GRANT SELECT 				ON FnFaseNotaAluno_SALE_IPMA_EF_EM12Ano					TO sigainternet
	GRANT SELECT 				ON FnFaseNotaAluno_SALE_IPMA_EF_EM12Ano2008				TO sigainternet
	GRANT SELECT 				ON FnFaseNotaAluno_SALE_IPMA_2009					TO sigainternet
	GRANT SELECT				ON FnFaseNotaAluno_SALE_IPMA_2010					TO sigainternet
	GRANT SELECT 				ON FnDiarioValidarConcluirDigitacao					TO sigainternet
	GRANT SELECT				ON FnAlunoCursoHistorico						TO sigainternet	
	GRANT SELECT 				ON FnRecebimentoOnlineCredencial					TO sigainternet
	GRANT EXECUTE 				ON FnFaseNotaAlunoExibirNotaFase					TO sigainternet
	GRANT EXECUTE 				ON FnFaseNotaAlunoExibirNotaComposicao					TO sigainternet
	GRANT EXECUTE 				ON FnValidarDiarioPendente						TO sigainternet
	GRANT EXECUTE 				ON FnDateTrunc								TO sigainternet
	GRANT EXECUTE				ON FnDominio								TO sigainternet
	GRANT EXECUTE				ON FnAlunoDiarioAula							TO sigainternet
	GRANT EXECUTE				ON FnAlunoDiarioAula_Impressao						TO sigainternet
	GRANT EXECUTE				ON FnTurmaAlternativa							TO sigainternet
	GRANT EXECUTE				ON FnDiarioAulasSemRegistro 						TO sigainternet		
	GRANT EXECUTE 				ON FnLCTO_ValorAReceber							TO sigainternet		
	GRANT EXECUTE 				ON FnLCTO_ValorJuros							TO sigainternet
	GRANT EXECUTE 				ON FnLCTO_ValorJurosAoDia						TO sigainternet
	GRANT EXECUTE 				ON FnLCTO_ValorMulta							TO sigainternet
	GRANT EXECUTE 				ON FnLCTO_ValorMultaPorAtraso						TO sigainternet	
	GRANT EXECUTE				ON FnLCTO_ServicoMensagem						TO sigainternet
	GRANT EXECUTE				ON FnConceitoMetaRetorna						TO sigainternet
	GRANT EXECUTE				ON FnFormatarMinutosEmHoras						TO sigainternet	
	GRANT EXECUTE				ON FnFaseNotaAlunoExibirNotaComposicao2					TO sigainternet	
	GRANT EXECUTE				ON FnResolverNomeTurmaCompleto						TO sigainternet	
	GRANT EXECUTE				ON FnConverterMinutosEmHora						TO sigainternet		
	GRANT EXECUTE				ON FnMesAno								TO sigainternet
	GRANT EXECUTE				ON FnRestricaoTurmaPrincipal						TO sigainternet
	GRANT EXECUTE				ON FnAlunoPermiteAcessoPortalWeb					TO sigainternet
	GRANT EXECUTE				ON FnMediaComponentesMontessori_2017					TO sigainternet
	GRANT EXECUTE				ON FnCampoDinamico_Varchar						TO sigainternet
	GRANT EXECUTE 				ON FnMediaComponentes_2018 						TO sigainternet
	GRANT EXECUTE 				ON FnAnoMes		 						TO sigainternet	
	GRANT EXECUTE 				ON FnMediaComponentes17deAgosto_2019 					TO sigainternet
	GRANT EXECUTE 				ON FnPermiteRecebimentoOnline	 					TO sigainternet
	GRANT EXECUTE 				ON FnValorTaxaConveniencia	 					TO sigainternet
	GRANT EXECUTE 				ON FnRecebimentoOnlineCdTipoRecebimento					TO sigainternet	
	GRANT EXECUTE 				ON FnCalcularTarifaCartao						TO sigainternet
	GRANT EXECUTE				ON FnMediaComponentes_2020						TO sigainternet	
	GRANT EXECUTE				ON FnMaximoParcelasRecebimentoOnline					TO sigainternet	
	GRANT EXECUTE				ON FnMediaComponentesCNSA2020						TO sigainternet
	GRANT EXECUTE				ON FnMediaComponentesContemporaneo2020					TO sigainternet
	GRANT EXECUTE				ON FnTestaPermissaoLicencaModulos					TO sigainternet
	GRANT EXECUTE 				ON FnMediaComponentesStaAmelia2020 					TO sigainternet
	GRANT EXECUTE 				ON FnResolverNomeTurmaResumido 						TO sigainternet

	--------------------------------------------------- Stored Procedure ----------------------------------------------------------
--	GRANT EXECUTE 				ON spWebDetalheLog							TO sigainternet
	GRANT EXECUTE 				ON spWebExibeNota							TO sigainternet
	GRANT EXECUTE 				ON spWebListarAlunoTurma						TO sigainternet
	GRANT EXECUTE 				ON spWebPeriodosProfessor						TO sigainternet
	GRANT EXECUTE 				ON SpAlunoBoletim							TO sigainternet
	GRANT EXECUTE 				ON SpTitCob_Boleto							TO sigainternet
	GRANT EXECUTE 				ON SpTitCob_BoletoDetalhamento						TO sigainternet
	GRANT EXECUTE 				ON SpTitCob_HistoricoPagamento						TO sigainternet	
	GRANT EXECUTE 				ON spInetAlterarSenha							TO sigainternet
	GRANT EXECUTE 				ON spInet_AlterarNota							TO sigainternet
	GRANT EXECUTE 				ON spInetAlterarLogin							TO sigainternet
	GRANT EXECUTE 				ON spInet_GravarFrequencia						TO sigainternet
	GRANT EXECUTE 				ON spDiarioConcluirDigitacao						TO sigainternet
	GRANT EXECUTE 				ON spDiarioConcluirConfirmarDigitacao					TO sigainternet
	GRANT EXECUTE				ON SpWebCadastrarAvaliacaoRelatorio					TO sigainternet
	GRANT EXECUTE				ON SpWebSolicitacaoDescontoInserir					TO sigainternet
	GRANT EXECUTE				ON SpWebSolicitacaoInserir						TO sigainternet
	GRANT EXECUTE				ON SpWebExibirNotaTodosAlunos						TO sigainternet
	GRANT EXECUTE				ON SpWebPlanilhaNotas							TO sigainternet
	GRANT EXECUTE				ON SpAgendarAtendimento							TO sigainternet
	GRANT EXECUTE				ON SpCancelarAgendamento						TO sigainternet
	GRANT EXECUTE				ON SpAgendamento							TO sigainternet
	GRANT EXECUTE				ON SpCadastrarConteudoProgramatico					TO sigainternet
	GRANT EXECUTE				ON SpAlunoClassificacao							TO sigainternet	
	GRANT EXECUTE				ON SpWebExibirPlanilhaTodosAlunos					TO sigainternet
	GRANT EXECUTE				ON SpWebVerificaTipoBoletim						TO sigainternet
	GRANT EXECUTE				ON SpAlunoBoletim_CEI							TO sigainternet
	GRANT EXECUTE				ON SpAlunoBoletim_CEI_2016						TO sigainternet	
	GRANT EXECUTE				ON SpWebListarDiario							TO sigainternet
	GRANT EXECUTE				ON SpWebListarFaseNota							TO sigainternet
	GRANT EXECUTE				ON SpWebListarDisciplina						TO sigainternet
	GRANT EXECUTE				ON SpWebDigiNotaValidar							TO sigainternet
	GRANT EXECUTE				ON SpWebPlanilhaValidar							TO sigainternet
	GRANT EXECUTE				ON SpWebRetornaSituacaoAlunoTurma					TO sigainternet
	GRANT EXECUTE				ON SpWebPlanilhaEnviarSolicitacao					TO sigainternet
	GRANT EXECUTE				ON SpWebSolicitacaoDesconto						TO sigainternet
	GRANT EXECUTE				ON SpWebSolicitacaoDescontoInserir					TO sigainternet	
	GRANT EXECUTE				ON SpWebComprovanteSolicitacaoDesconto					TO sigainternet	
	GRANT EXECUTE				ON SpWebDadosPessoaisSolicitacaoDesconto				TO sigainternet	
	GRANT EXECUTE 				ON SpWebListarAlunosTurma 						TO sigainternet	
	GRANT EXECUTE 				ON SpWebVerificaLogin	 						TO sigainternet
	GRANT EXECUTE 				ON spInetRecuperarSenha 						TO sigainternet
	GRANT EXECUTE 				ON SpWebMontarFrequenciaDiario 						TO sigainternet
	GRANT EXECUTE 				ON SpDiarioTurmaAlternativa 						TO sigainternet	
	GRANT EXECUTE 				ON SpWebGravarFrequencia 						TO sigainternet
	GRANT EXECUTE 				ON SpWebSolicitacaoCadastroInserir					TO sigainternet
	GRANT EXECUTE 				ON SpWebMatriculaOnLine							TO sigainternet
	GRANT EXECUTE 				ON SpWebMatriculaOnLineContrato						TO sigainternet
	GRANT EXECUTE 				ON SpWebProfessorPrincipal						TO sigainternet
	GRANT EXECUTE 				ON SpWebMontarFotograma							TO sigainternet
	GRANT EXECUTE 				ON SpDiarioEnviarDadosPlanilha 						TO sigainternet
	GRANT EXECUTE 				ON SpInserirFichaInscricao 						TO sigainternet
	GRANT EXECUTE 				ON SpInserirSolicitacaoComplemento 					TO sigainternet
	GRANT EXECUTE 				ON SpInserirSolicitacaoPessoa 						TO sigainternet
	GRANT EXECUTE 				ON SpAgendamentoAlunosVinculados 					TO sigainternet	
	GRANT EXECUTE 				ON SpConfirmarConceitoMetaFaseNotaAluno					TO sigainternet
	GRANT EXECUTE				ON SpAlunoBoletim_CEI_2013						TO sigainternet 	
	GRANT EXECUTE				ON SpWebGabaritoResultado						TO sigainternet
	GRANT EXECUTE				ON SpWebResultadoENEM							TO sigainternet
	GRANT EXECUTE 				ON SpDiarioAulaInserir 							TO sigainternet
	GRANT EXECUTE 				ON SpBoletimNAP_3EM_2014						TO sigainternet
	GRANT EXECUTE 				ON SpWebIncricaoTurma							TO sigainternet
	GRANT EXECUTE 				ON SpWebIncricaoTurmaContrato 						TO sigainternet
	GRANT EXECUTE 				ON SpWebSolicitacaoProvisoria 						TO sigainternet		
	GRANT EXECUTE				ON SpListarFichaAcompanhamento_BMQ					TO sigainternet
	GRANT EXECUTE				ON SpWebProfessorArquivo						TO sigainternet
	GRANT EXECUTE				ON SpRetornaParcelaVencimentoValor					TO sigainternet		
	GRANT EXECUTE				ON SpWebRegistrarPagamento						TO sigainternet		
	GRANT EXECUTE				ON SpWebGabarito							TO sigainternet		
	GRANT EXECUTE				ON SpDiarioImportarApuracaoFrequencia					TO sigainternet
	GRANT EXECUTE				ON SpBoletimContemp2015							TO sigainternet
	GRANT EXECUTE				ON SpBoletimCognitivo2016						TO sigainternet	
	GRANT EXECUTE				ON SpAvaliacaoUnificadaListaDisciplina_MAPLEBEAR			TO sigainternet	
	GRANT EXECUTE				ON spInet_AlterarNota_MAPLEBEAR						TO sigainternet
	GRANT EXECUTE				ON SpMobileGravarMensagem						TO sigainternet
	GRANT EXECUTE				ON SpWebListarDisciplinaNeves						TO sigainternet
	GRANT EXECUTE				ON SpBoletim_CEIMAIS_EF9_2017						TO sigainternet		
	GRANT EXECUTE				ON SpWebSolicitacaoFichaMedicaInserir					TO sigainternet
	GRANT EXECUTE				ON SpCampoDinamicoValor_Gravar						TO sigainternet		
	GRANT EXECUTE				ON SpAlunoCursoQuadroHorario						TO sigainternet
	GRANT EXECUTE				ON SpAlunoCursoOfertaDisciplina						TO sigainternet
	GRANT EXECUTE				ON SpAlunoCursoMatricular						TO sigainternet	
	GRANT EXECUTE				ON SpAlunoCursoHistoricoCompleto					TO sigainternet
	GRANT EXECUTE 				ON SpBoletimGGE2017 							TO sigainternet	
	GRANT EXECUTE 				ON SpInetRecuperarSenha_AlunoCurso 					TO sigainternet	
	GRANT EXECUTE 				ON SpWebVerificaLogin_AlunoCurso 					TO sigainternet	
	GRANT EXECUTE 				ON SpWebPlanoAulaInserir 						TO sigainternet
	GRANT EXECUTE 				ON SpWebPlanoEnsinoImportar 						TO sigainternet
	GRANT EXECUTE 				ON SpAlunoCursoQuadroHorarioProfessor					TO sigainternet	
	GRANT EXECUTE 				ON spCopiarRotinaEducacaoInfantil					TO sigainternet	
	GRANT EXECUTE				ON SpBoletim_CEIZONASUL_EF9_2018					TO sigainternet
	GRANT EXECUTE				ON SpWebExibirPlanilhaAluno 						TO sigainternet
	GRANT EXECUTE				ON SpAlunoBoletimUNECIM 						TO sigainternet
	GRANT EXECUTE				ON SpWebIncricaoEvento 							TO sigainternet
	GRANT EXECUTE				ON SpWebIncricaoEvento_Validar 						TO sigainternet	
	GRANT EXECUTE				ON SpAlunoBoletimNSGracas  						TO sigainternet	
	GRANT EXECUTE 				ON SpBoletimCognitivo2018 						TO sigainternet
	GRANT EXECUTE 				ON SpAlunoBoletim_CEI_2018 						TO sigainternet
	GRANT EXECUTE				ON SpInserirMensagemCaixaSaida						TO sigainternet
	GRANT EXECUTE				ON SpAlunoBoletimClassificacaoNSGracas					TO sigainternet
	GRANT EXECUTE				ON SpWebTituloCobrancaVisualizacaoInserir				TO sigainternet	
	GRANT EXECUTE				ON SpAlunoBoletimUNECIM_2019						TO sigainternet	
	GRANT EXECUTE 				ON SpBoletimCarochinha2019 						TO sigainternet
	GRANT EXECUTE				ON SpAlunoBoletimLourdinas2018						TO sigainternet
	GRANT EXECUTE 				ON SpBoletimCognitivo2019 						TO sigainternet
	GRANT EXECUTE 				ON SpPagamentoOnline_Atualizar 						TO sigainternet
	GRANT EXECUTE 				ON SpPagamentoOnline_Inserir 						TO sigainternet
	GRANT EXECUTE 				ON SpPagamentoOnlineSituacao_Inserir 					TO sigainternet
	GRANT EXECUTE				ON SpInserirArquivoAnexo						TO sigainternet
	GRANT EXECUTE				ON SpRemoverArquivoAnexo 						TO sigainternet	
	GRANT EXECUTE				ON spInet_ConfirmarNota 						TO sigainternet
	GRANT EXECUTE				ON SpCopiarDiarioAula	 						TO sigainternet
	GRANT EXECUTE 				ON SpWebCertificadoParticipacaoEvento 					TO sigainternet
	GRANT EXECUTE 				ON SpAlunoBoletimSantanna2019 						TO sigainternet
	GRANT EXECUTE				ON SpImportarCronogramaPrevistoDiarioAulaCompleto			TO sigainternet
	GRANT EXECUTE				ON SpAlunoBoletimAgnesErskine 						TO sigainternet	
	GRANT EXECUTE				ON SpRetornaParcelaVencimentoValorES					TO sigainternet	
	GRANT EXECUTE				ON SpAlunoBoletimCPPCrato						TO sigainternet
	GRANT EXECUTE				ON SpWebPeriodosAlunoSuperior						TO sigainternet
	GRANT EXECUTE				ON SpChamadaOnlineEfetuarApuracao					TO sigainternet
	GRANT EXECUTE				ON SpChamadaOnlineMarcarPresenca					TO sigainternet
	GRANT EXECUTE				ON SpAlunoBoletimContemporaneo2020					TO sigainternet
	GRANT EXECUTE 				ON SpDeclaracaoVinculoES 						TO sigainternet
	GRANT EXECUTE 				ON SpWebSolicitacaoDescontoCadastrarFiliacao 				TO sigainternet	
	GRANT EXECUTE 				ON SpAlunoBoletimStaAmelia2020 						TO sigainternet	
	GRANT EXECUTE 				ON SpAlunoBoletimMontessori_2020 					TO sigainternet
	GRANT EXECUTE 				ON SpAlunoBoletimCONFHICSJ 						TO sigainternet
	GRANT EXECUTE 				ON SpAlunoBoletimCarlRogers2020 					TO sigainternet
	GRANT EXECUTE 				ON SpAlunoBoletim_PH3_2020 						TO sigainternet
	GRANT EXECUTE 				ON SpAlunoBoletim_PH3_2020 						TO sigainternet
	GRANT EXECUTE 				ON SpAlunoBoletimAngloLiderCordeiro 					TO sigainternet
	GRANT EXECUTE 				ON SpAlunoBoletim_CNSA		 					TO sigainternet
	GRANT EXECUTE 				ON SpChamadaOnlineValidarDataHoraLimite					TO sigainternet
	GRANT EXECUTE 				ON SpSolicitacaoProcedimentoMatriculaGravar 				TO sigainternet	
	GRANT EXECUTE 				ON SpBoletimSemestralMarieJost 						TO sigainternet
  END
GO


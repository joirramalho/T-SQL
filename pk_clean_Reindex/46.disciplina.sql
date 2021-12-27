USE dbSigaModuloAracaju;

-- TbDisciplina
IF OBJECT_ID('dbo.FK_TbAlunoAproveitamentoDisciplina_TbDisciplina') IS NOT NULL
BEGIN
	ALTER TABLE [dbo].[TbAlunoAproveitamentoDisciplina] DROP CONSTRAINT [FK_TbAlunoAproveitamentoDisciplina_TbDisciplina]
END;

IF OBJECT_ID('dbo.FK_TbAlunoTipoAvaliacao_TbDisciplina') IS NOT NULL
BEGIN
	ALTER TABLE [dbo].[TbAlunoTipoAvaliacao] DROP CONSTRAINT [FK_TbAlunoTipoAvaliacao_TbDisciplina]
END;


ALTER TABLE [dbo].[TbAlunoTurmaAvaliacaoRelatorio] DROP CONSTRAINT [FK_TbAlunoTurmaAvaliacaoRelatorio_TbDisciplina];

ALTER TABLE [dbo].[TbArqArquivo] DROP CONSTRAINT [FK_TbArqArquivo_TbDisciplina];

ALTER TABLE [dbo].[TbCurriculoDisciplina] DROP CONSTRAINT [FK_TbCurriculoDisciplina_TbDisciplina];

ALTER TABLE [dbo].[TbCurriculoDisciplinaEletiva] DROP CONSTRAINT [FK_TbCurriculoDisciplinaEletiva_TbDisciplina1];

ALTER TABLE [dbo].[TbCurriculoDisciplinaEletiva] DROP CONSTRAINT [FK_TbCurriculoDisciplinaEletiva_TbDisciplina2];

ALTER TABLE [dbo].[TbCurriculoDisciplinaEquivalente] DROP CONSTRAINT [FK_TbCurriculoDisciplinaEquivalente_TbDisciplina1];

ALTER TABLE [dbo].[TbCurriculoDisciplinaEquivalente] DROP CONSTRAINT [FK_TbCurriculoDisciplinaEquivalente_TbDisciplina2];

ALTER TABLE [dbo].[TbCurriculoOptativaDisciplina] DROP CONSTRAINT [FK_TbCurriculoOptativaDisciplina_TbDisciplina];

ALTER TABLE [dbo].[TbDiario] DROP CONSTRAINT [FK_TbDiaro_TbDisciplina];

ALTER TABLE [dbo].[TbDisciplinaPlano] DROP CONSTRAINT [FK_TbDisciplinaPlano_TbDisciplina];

ALTER TABLE [dbo].[TbDisciplinaRequisito] DROP CONSTRAINT [FK_TbDisciplinaRequisito_TbDisciplina1];

ALTER TABLE [dbo].[TbDisciplinaRequisito] DROP CONSTRAINT [FK_TbDisciplinaRequisito_TbDisciplina];

ALTER TABLE [dbo].[TbFaseNotaAluno] DROP CONSTRAINT [FK_TbFaseNotaAluno_TbDisciplina];


IF OBJECT_ID('dbo.FK_TbFaseNotaAluno_FilaProcessamento_TbDisciplina') IS NOT NULL
BEGIN
	ALTER TABLE [dbo].[TbFaseNotaAluno_FilaProcessamento] DROP CONSTRAINT [FK_TbFaseNotaAluno_FilaProcessamento_TbDisciplina]
END;

ALTER TABLE [dbo].[TbFaseNotaDisciplina] DROP CONSTRAINT [FK_TbFaseNotaDisciplina_TbDisciplina];

ALTER TABLE [dbo].[TbFaseNotaDisciplinaTurma] DROP CONSTRAINT [FK_TbFaseNotaDisciplinaTurma_TbDisciplina];

ALTER TABLE [dbo].[TbFreqApuracao] DROP CONSTRAINT [FK_TbFreqApuracao_TbDisciplina];

ALTER TABLE [dbo].[TbFreqQuadroHorario] DROP CONSTRAINT [FK_TbFreqQuadroHorario_TbDisciplina];

ALTER TABLE [dbo].[TbGradeCurricular] DROP CONSTRAINT [FK_TbGradeCurricular_TbDisciplina];

ALTER TABLE [dbo].[TbHistoricoAproveitamento] DROP CONSTRAINT [FK_TbHistoricoAproveitamento_TbDisciplina];

ALTER TABLE [dbo].[TbHistoricoEnsinoSuperior] DROP CONSTRAINT [FK_TbHistoricoEnsinoSuperior_TbDisciplina];

ALTER TABLE [dbo].[TbHistoricoNotas] DROP CONSTRAINT [FK_TbHistoricoNotas_TbDisciplina];

ALTER TABLE [dbo].[TbLancamentoCobranca] DROP CONSTRAINT [FK_TbLancamnetoCobranca_TbDisciplina];

ALTER TABLE [dbo].[TbMeta] DROP CONSTRAINT [FK_TbMeta_TbDisciplina];

ALTER TABLE [dbo].[TbMetaSituacaoAlunoDisciplina] DROP CONSTRAINT [FK_TbMetaSituacaoAlunoDisciplina_TbDisciplina];

ALTER TABLE [dbo].[TbOptProvaGabarito] DROP CONSTRAINT [FK_TbOptProvaGabarito_TbDisciplina14];

ALTER TABLE [dbo].[TbOptProvaGabarito] DROP CONSTRAINT [FK_TbOptProvaGabarito_TbDisciplina15];

ALTER TABLE [dbo].[TbOptProvaGabarito] DROP CONSTRAINT [FK_TbOptProvaGabarito_TbDisciplina09];

ALTER TABLE [dbo].[TbOptProvaGabarito] DROP CONSTRAINT [FK_TbOptProvaGabarito_TbDisciplina12];

ALTER TABLE [dbo].[TbOptProvaGabarito] DROP CONSTRAINT [FK_TbOptProvaGabarito_TbDisciplina13];

ALTER TABLE [dbo].[TbOptProvaGabarito] DROP CONSTRAINT [FK_TbOptProvaGabarito_TbDisciplina10];

IF OBJECT_ID('dbo.FK__TbOptProv__IdDis__03482384') IS NOT NULL
BEGIN
	ALTER TABLE [dbo].[TbOptProvaGabarito] DROP CONSTRAINT [FK__TbOptProv__IdDis__03482384]
END;

IF OBJECT_ID('dbo.FK__TbOptProv__IdDis__0718B468') IS NOT NULL
BEGIN
	ALTER TABLE [dbo].[TbOptProvaGabarito] DROP CONSTRAINT [FK__TbOptProv__IdDis__0718B468]
END;

ALTER TABLE [dbo].[TbOptProvaGabarito] DROP CONSTRAINT [FK_TbOptProvaGabarito_TbDisciplina11];

ALTER TABLE [dbo].[TbOptProvaGabarito] DROP CONSTRAINT [FK_TbOptProvaGabarito_TbDisciplina06];

ALTER TABLE [dbo].[TbOptProvaGabarito] DROP CONSTRAINT [FK_TbOptProvaGabarito_TbDisciplina08];

ALTER TABLE [dbo].[TbOptProvaGabarito] DROP CONSTRAINT [FK_TbOptProvaGabarito_TbDisciplina07];

ALTER TABLE [dbo].[TbOptProvaGabarito] DROP CONSTRAINT [FK_TbOptProvaGabarito_TbDisciplina02];

ALTER TABLE [dbo].[TbOptProvaGabarito] DROP CONSTRAINT [FK_TbOptProvaGabarito_TbDisciplina03];

ALTER TABLE [dbo].[TbOptProvaGabarito] DROP CONSTRAINT [FK_TbOptProvaGabarito_TbDisciplina04];

ALTER TABLE [dbo].[TbOptProvaGabarito] DROP CONSTRAINT [FK_TbOptProvaGabarito_TbDisciplina05];

ALTER TABLE [dbo].[TbOptSimuladoEnem] DROP CONSTRAINT [FK_TbOptSimuladoEnem_TbDisciplina_IdDisciplinaRedacao];

ALTER TABLE [dbo].[TbProfessorDisciplina] DROP CONSTRAINT [FK_TbProfessorDisciplina_TbDisciplina];

ALTER TABLE [dbo].[TbSituacaoAlunoDisciplina] DROP CONSTRAINT [FK_TbTurmaDisciplinaAluno_TbDisciplina];

ALTER TABLE [dbo].[TbTurma] DROP CONSTRAINT [FK_TbTurma_TbDisciplina];

ALTER TABLE [dbo].[TbTurmaDisciplinaFaseNota] DROP CONSTRAINT [FK_TbTurmaDisciplinaFaseNota_TbDisciplina];

ALTER TABLE [dbo].[TbTurmaDisciplinaPlanoAula] DROP CONSTRAINT [FK_TbTurmaDisciplinaPlanoAula_TbDisciplina];


IF OBJECT_ID('dbo.FK_TbTurmaProfessorCursoAdicional_TbDisciplina') IS NOT NULL
BEGIN
	ALTER TABLE [dbo].[TbTurmaProfessorCursoAdicional] DROP CONSTRAINT [FK_TbTurmaProfessorCursoAdicional_TbDisciplina]
END;


ALTER TABLE [dbo].[TbTurmaDisciplina_GoogleForEducation] DROP CONSTRAINT [FK_TbTurmaDisciplina_GoogleForEducation_TbDisciplina];

ALTER TABLE [dbo].[TbDisciplina] DROP CONSTRAINT [PK_TbDisciplina];
	



-- TbDisciplina - reCREATE
    ALTER TABLE [dbo].[TbDisciplina] ADD  CONSTRAINT [PK_TbDisciplina] PRIMARY KEY CLUSTERED 
	(
			[IdDisciplina] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY];
	

-- 15Fev21
ALTER TABLE [dbo].[TbTurmaDisciplina_GoogleForEducation] WITH CHECK ADD CONSTRAINT [FK_TbTurmaDisciplina_GoogleForEducation_TbDisciplina] FOREIGN KEY([IdDisciplina]) 
REFERENCES [dbo].[TbDisciplina] ([IdDisciplina]);

ALTER TABLE [dbo].[TbTurmaDisciplina_GoogleForEducation] CHECK CONSTRAINT [FK_TbTurmaDisciplina_GoogleForEducation_TbDisciplina];




                                                                                                                                                                                                                                                                 
IF	EXISTS		( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbAlunoAproveitamentoDisciplina'	AND COLUMN_NAME = 'IdDisciplina' )
	AND	EXISTS	( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbDisciplina'						AND COLUMN_NAME = 'IdDisciplina' )
	BEGIN
		ALTER TABLE [dbo].[TbAlunoAproveitamentoDisciplina] WITH CHECK ADD  CONSTRAINT [FK_TbAlunoAproveitamentoDisciplina_TbDisciplina] FOREIGN KEY([IdDisciplina]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina])                                                    

		ALTER TABLE [dbo].[TbAlunoAproveitamentoDisciplina] CHECK CONSTRAINT [FK_TbAlunoAproveitamentoDisciplina_TbDisciplina]
	END;

IF	EXISTS		( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbAlunoTipoAvaliacao'	AND COLUMN_NAME = 'IdDisciplina' )
	AND	EXISTS	( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbDisciplina'			AND COLUMN_NAME = 'IdDisciplina' )
	BEGIN
		ALTER TABLE [dbo].[TbAlunoTipoAvaliacao] WITH CHECK ADD  CONSTRAINT [FK_TbAlunoTipoAvaliacao_TbDisciplina] FOREIGN KEY([IdDisciplina]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina])                                                                          

		ALTER TABLE [dbo].[TbAlunoTipoAvaliacao] CHECK CONSTRAINT [FK_TbAlunoTipoAvaliacao_TbDisciplina]
	END;


ALTER TABLE [dbo].[TbAlunoTurmaAvaliacaoRelatorio] WITH CHECK ADD  CONSTRAINT [FK_TbAlunoTurmaAvaliacaoRelatorio_TbDisciplina] FOREIGN KEY([IdDisciplina]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina]);                                               

ALTER TABLE [dbo].[TbAlunoTurmaAvaliacaoRelatorio] CHECK CONSTRAINT [FK_TbAlunoTurmaAvaliacaoRelatorio_TbDisciplina];


ALTER TABLE [dbo].[TbArqArquivo] WITH CHECK ADD  CONSTRAINT [FK_TbArqArquivo_TbDisciplina] FOREIGN KEY([IdDisciplina]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina]);                                                                                      

ALTER TABLE [dbo].[TbArqArquivo] CHECK CONSTRAINT [FK_TbArqArquivo_TbDisciplina];


ALTER TABLE [dbo].[TbCurriculoDisciplina] WITH CHECK ADD  CONSTRAINT [FK_TbCurriculoDisciplina_TbDisciplina] FOREIGN KEY([IdDisciplina]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina]);                                                                     

ALTER TABLE [dbo].[TbCurriculoDisciplina] CHECK CONSTRAINT [FK_TbCurriculoDisciplina_TbDisciplina];


ALTER TABLE [dbo].[TbCurriculoDisciplinaEletiva] WITH CHECK ADD  CONSTRAINT [FK_TbCurriculoDisciplinaEletiva_TbDisciplina1] FOREIGN KEY([IdDisciplinaCursada]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina]);                                              

ALTER TABLE [dbo].[TbCurriculoDisciplinaEletiva] CHECK CONSTRAINT [FK_TbCurriculoDisciplinaEletiva_TbDisciplina1];


ALTER TABLE [dbo].[TbCurriculoDisciplinaEletiva] WITH CHECK ADD  CONSTRAINT [FK_TbCurriculoDisciplinaEletiva_TbDisciplina2] FOREIGN KEY([IdDisciplinaEletiva]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina]);                                                

ALTER TABLE [dbo].[TbCurriculoDisciplinaEletiva] CHECK CONSTRAINT [FK_TbCurriculoDisciplinaEletiva_TbDisciplina2];


ALTER TABLE [dbo].[TbCurriculoDisciplinaEquivalente] WITH CHECK ADD  CONSTRAINT [FK_TbCurriculoDisciplinaEquivalente_TbDisciplina1] FOREIGN KEY([IdDisciplinaCursada]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina]);                                          

ALTER TABLE [dbo].[TbCurriculoDisciplinaEquivalente] CHECK CONSTRAINT [FK_TbCurriculoDisciplinaEquivalente_TbDisciplina1];


ALTER TABLE [dbo].[TbCurriculoDisciplinaEquivalente] WITH CHECK ADD  CONSTRAINT [FK_TbCurriculoDisciplinaEquivalente_TbDisciplina2] FOREIGN KEY([IdDisciplinaEquivalente]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina]);                                      

ALTER TABLE [dbo].[TbCurriculoDisciplinaEquivalente] CHECK CONSTRAINT [FK_TbCurriculoDisciplinaEquivalente_TbDisciplina2];


ALTER TABLE [dbo].[TbCurriculoOptativaDisciplina] WITH CHECK ADD  CONSTRAINT [FK_TbCurriculoOptativaDisciplina_TbDisciplina] FOREIGN KEY([IdDisciplina]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina]);                                                        

ALTER TABLE [dbo].[TbCurriculoOptativaDisciplina] CHECK CONSTRAINT [FK_TbCurriculoOptativaDisciplina_TbDisciplina];


ALTER TABLE [dbo].[TbDiario] WITH CHECK ADD  CONSTRAINT [FK_TbDiaro_TbDisciplina] FOREIGN KEY([IdDisciplina]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina]);                                                                                                   

ALTER TABLE [dbo].[TbDiario] CHECK CONSTRAINT [FK_TbDiaro_TbDisciplina];


ALTER TABLE [dbo].[TbDisciplinaPlano] WITH CHECK ADD  CONSTRAINT [FK_TbDisciplinaPlano_TbDisciplina] FOREIGN KEY([IdDisciplina]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina]);                                                                                

ALTER TABLE [dbo].[TbDisciplinaPlano] CHECK CONSTRAINT [FK_TbDisciplinaPlano_TbDisciplina];


ALTER TABLE [dbo].[TbDisciplinaRequisito] WITH CHECK ADD  CONSTRAINT [FK_TbDisciplinaRequisito_TbDisciplina1] FOREIGN KEY([IdDisciplinaRequerida]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina]);                                                            

ALTER TABLE [dbo].[TbDisciplinaRequisito] CHECK CONSTRAINT [FK_TbDisciplinaRequisito_TbDisciplina1];


ALTER TABLE [dbo].[TbDisciplinaRequisito] WITH CHECK ADD  CONSTRAINT [FK_TbDisciplinaRequisito_TbDisciplina] FOREIGN KEY([IdDisciplina]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina]);                                                                        

ALTER TABLE [dbo].[TbDisciplinaRequisito] CHECK CONSTRAINT [FK_TbDisciplinaRequisito_TbDisciplina];


ALTER TABLE [dbo].[TbFaseNotaAluno] WITH CHECK ADD  CONSTRAINT [FK_TbFaseNotaAluno_TbDisciplina] FOREIGN KEY([IdDisciplina]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina]);                                                                                 

ALTER TABLE [dbo].[TbFaseNotaAluno] CHECK CONSTRAINT [FK_TbFaseNotaAluno_TbDisciplina];


IF	EXISTS		( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbFaseNotaAluno_FilaProcessamento'	AND COLUMN_NAME = 'IdDisciplina' )
	AND	EXISTS	( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbDisciplina'						AND COLUMN_NAME = 'IdDisciplina' )
	BEGIN
		ALTER TABLE [dbo].[TbFaseNotaAluno_FilaProcessamento] WITH CHECK ADD  CONSTRAINT [FK_TbFaseNotaAluno_FilaProcessamento_TbDisciplina] FOREIGN KEY([IdDisciplina]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina])                                                

		ALTER TABLE [dbo].[TbFaseNotaAluno_FilaProcessamento] CHECK CONSTRAINT [FK_TbFaseNotaAluno_FilaProcessamento_TbDisciplina]
	END;

ALTER TABLE [dbo].[TbFaseNotaDisciplina] WITH CHECK ADD  CONSTRAINT [FK_TbFaseNotaDisciplina_TbDisciplina] FOREIGN KEY([IdDisciplina]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina]);                                                                        

ALTER TABLE [dbo].[TbFaseNotaDisciplina] CHECK CONSTRAINT [FK_TbFaseNotaDisciplina_TbDisciplina];


ALTER TABLE [dbo].[TbFaseNotaDisciplinaTurma] WITH CHECK ADD  CONSTRAINT [FK_TbFaseNotaDisciplinaTurma_TbDisciplina] FOREIGN KEY([IdDisciplina]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina]);                                                                

ALTER TABLE [dbo].[TbFaseNotaDisciplinaTurma] CHECK CONSTRAINT [FK_TbFaseNotaDisciplinaTurma_TbDisciplina];


ALTER TABLE [dbo].[TbFreqApuracao] WITH CHECK ADD  CONSTRAINT [FK_TbFreqApuracao_TbDisciplina] FOREIGN KEY([IdDisciplina]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina]);                                                                                      

ALTER TABLE [dbo].[TbFreqApuracao] CHECK CONSTRAINT [FK_TbFreqApuracao_TbDisciplina];


ALTER TABLE [dbo].[TbFreqQuadroHorario] WITH CHECK ADD  CONSTRAINT [FK_TbFreqQuadroHorario_TbDisciplina] FOREIGN KEY([IdDisciplina]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina]);                                                                           

ALTER TABLE [dbo].[TbFreqQuadroHorario] CHECK CONSTRAINT [FK_TbFreqQuadroHorario_TbDisciplina];


ALTER TABLE [dbo].[TbGradeCurricular] WITH CHECK ADD  CONSTRAINT [FK_TbGradeCurricular_TbDisciplina] FOREIGN KEY([IdDisciplina]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina]);                                                                              

ALTER TABLE [dbo].[TbGradeCurricular] CHECK CONSTRAINT [FK_TbGradeCurricular_TbDisciplina];


ALTER TABLE [dbo].[TbHistoricoAproveitamento] WITH CHECK ADD  CONSTRAINT [FK_TbHistoricoAproveitamento_TbDisciplina] FOREIGN KEY([IdDisciplinaCursada]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina]);                                                        

ALTER TABLE [dbo].[TbHistoricoAproveitamento] CHECK CONSTRAINT [FK_TbHistoricoAproveitamento_TbDisciplina];


ALTER TABLE [dbo].[TbHistoricoEnsinoSuperior] WITH CHECK ADD  CONSTRAINT [FK_TbHistoricoEnsinoSuperior_TbDisciplina] FOREIGN KEY([IdDisciplina]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina]);                                                               

ALTER TABLE [dbo].[TbHistoricoEnsinoSuperior] CHECK CONSTRAINT [FK_TbHistoricoEnsinoSuperior_TbDisciplina];


ALTER TABLE [dbo].[TbHistoricoNotas] WITH CHECK ADD  CONSTRAINT [FK_TbHistoricoNotas_TbDisciplina] FOREIGN KEY([IdDisciplina]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina]);                                                                                  

ALTER TABLE [dbo].[TbHistoricoNotas] CHECK CONSTRAINT [FK_TbHistoricoNotas_TbDisciplina];


ALTER TABLE [dbo].[TbLancamentoCobranca] WITH CHECK ADD  CONSTRAINT [FK_TbLancamnetoCobranca_TbDisciplina] FOREIGN KEY([IdDisciplina]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina]);                                                                          

ALTER TABLE [dbo].[TbLancamentoCobranca] CHECK CONSTRAINT [FK_TbLancamnetoCobranca_TbDisciplina];


ALTER TABLE [dbo].[TbMeta] WITH CHECK ADD  CONSTRAINT [FK_TbMeta_TbDisciplina] FOREIGN KEY([IdDisciplina]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina]);                                                                                                      

ALTER TABLE [dbo].[TbMeta] CHECK CONSTRAINT [FK_TbMeta_TbDisciplina];


ALTER TABLE [dbo].[TbMetaSituacaoAlunoDisciplina] WITH CHECK ADD  CONSTRAINT [FK_TbMetaSituacaoAlunoDisciplina_TbDisciplina] FOREIGN KEY([IdDisciplina]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina]);                                                       

ALTER TABLE [dbo].[TbMetaSituacaoAlunoDisciplina] CHECK CONSTRAINT [FK_TbMetaSituacaoAlunoDisciplina_TbDisciplina];


ALTER TABLE [dbo].[TbOptProvaGabarito] WITH CHECK ADD  CONSTRAINT [FK_TbOptProvaGabarito_TbDisciplina14] FOREIGN KEY([IdDisciplina14]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina]);                                                                          

ALTER TABLE [dbo].[TbOptProvaGabarito] CHECK CONSTRAINT [FK_TbOptProvaGabarito_TbDisciplina14];


ALTER TABLE [dbo].[TbOptProvaGabarito] WITH CHECK ADD  CONSTRAINT [FK_TbOptProvaGabarito_TbDisciplina15] FOREIGN KEY([IdDisciplina15]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina]);                                                                          

ALTER TABLE [dbo].[TbOptProvaGabarito] CHECK CONSTRAINT [FK_TbOptProvaGabarito_TbDisciplina15];


ALTER TABLE [dbo].[TbOptProvaGabarito] WITH CHECK ADD  CONSTRAINT [FK_TbOptProvaGabarito_TbDisciplina09] FOREIGN KEY([IdDisciplina09]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina]);                                                                          

ALTER TABLE [dbo].[TbOptProvaGabarito] CHECK CONSTRAINT [FK_TbOptProvaGabarito_TbDisciplina09];


ALTER TABLE [dbo].[TbOptProvaGabarito] WITH CHECK ADD  CONSTRAINT [FK_TbOptProvaGabarito_TbDisciplina12] FOREIGN KEY([IdDisciplina12]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina]);                                                                          

ALTER TABLE [dbo].[TbOptProvaGabarito] CHECK CONSTRAINT [FK_TbOptProvaGabarito_TbDisciplina12];


ALTER TABLE [dbo].[TbOptProvaGabarito] WITH CHECK ADD  CONSTRAINT [FK_TbOptProvaGabarito_TbDisciplina13] FOREIGN KEY([IdDisciplina13]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina]);                                                                          

ALTER TABLE [dbo].[TbOptProvaGabarito] CHECK CONSTRAINT [FK_TbOptProvaGabarito_TbDisciplina13];


ALTER TABLE [dbo].[TbOptProvaGabarito] WITH CHECK ADD  CONSTRAINT [FK_TbOptProvaGabarito_TbDisciplina10] FOREIGN KEY([IdDisciplina10]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina]);                                                                         

ALTER TABLE [dbo].[TbOptProvaGabarito] CHECK CONSTRAINT [FK_TbOptProvaGabarito_TbDisciplina10];


ALTER TABLE [dbo].[TbOptProvaGabarito] WITH CHECK ADD  CONSTRAINT [FK__TbOptProv__IdDis__03482384] FOREIGN KEY([IdDisciplina]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina]);                                                                                

ALTER TABLE [dbo].[TbOptProvaGabarito] CHECK CONSTRAINT [FK__TbOptProv__IdDis__03482384];


ALTER TABLE [dbo].[TbOptProvaGabarito] WITH CHECK ADD  CONSTRAINT [FK_TbOptProvaGabarito_TbDisciplina11] FOREIGN KEY([IdDisciplina11]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina]);                                                                         

ALTER TABLE [dbo].[TbOptProvaGabarito] CHECK CONSTRAINT [FK_TbOptProvaGabarito_TbDisciplina11];


ALTER TABLE [dbo].[TbOptProvaGabarito] WITH CHECK ADD  CONSTRAINT [FK_TbOptProvaGabarito_TbDisciplina06] FOREIGN KEY([IdDisciplina06]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina]);                                                                          

ALTER TABLE [dbo].[TbOptProvaGabarito] CHECK CONSTRAINT [FK_TbOptProvaGabarito_TbDisciplina06];


ALTER TABLE [dbo].[TbOptProvaGabarito] WITH CHECK ADD  CONSTRAINT [FK_TbOptProvaGabarito_TbDisciplina08] FOREIGN KEY([IdDisciplina08]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina]);                                                                          

ALTER TABLE [dbo].[TbOptProvaGabarito] CHECK CONSTRAINT [FK_TbOptProvaGabarito_TbDisciplina08];


ALTER TABLE [dbo].[TbOptProvaGabarito] WITH CHECK ADD  CONSTRAINT [FK_TbOptProvaGabarito_TbDisciplina07] FOREIGN KEY([IdDisciplina07]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina]);                                                                          

ALTER TABLE [dbo].[TbOptProvaGabarito] CHECK CONSTRAINT [FK_TbOptProvaGabarito_TbDisciplina07];


ALTER TABLE [dbo].[TbOptProvaGabarito] WITH CHECK ADD  CONSTRAINT [FK_TbOptProvaGabarito_TbDisciplina02] FOREIGN KEY([IdDisciplina02]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina]);                                                                          

ALTER TABLE [dbo].[TbOptProvaGabarito] CHECK CONSTRAINT [FK_TbOptProvaGabarito_TbDisciplina02];


ALTER TABLE [dbo].[TbOptProvaGabarito] WITH CHECK ADD  CONSTRAINT [FK_TbOptProvaGabarito_TbDisciplina03] FOREIGN KEY([IdDisciplina03]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina]);                                                                         

ALTER TABLE [dbo].[TbOptProvaGabarito] CHECK CONSTRAINT [FK_TbOptProvaGabarito_TbDisciplina03];


ALTER TABLE [dbo].[TbOptProvaGabarito] WITH CHECK ADD  CONSTRAINT [FK_TbOptProvaGabarito_TbDisciplina04] FOREIGN KEY([IdDisciplina04]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina]);                                                                          

ALTER TABLE [dbo].[TbOptProvaGabarito] CHECK CONSTRAINT [FK_TbOptProvaGabarito_TbDisciplina04];


ALTER TABLE [dbo].[TbOptProvaGabarito] WITH CHECK ADD  CONSTRAINT [FK_TbOptProvaGabarito_TbDisciplina05] FOREIGN KEY([IdDisciplina05]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina]);                                                                         

ALTER TABLE [dbo].[TbOptProvaGabarito] CHECK CONSTRAINT [FK_TbOptProvaGabarito_TbDisciplina05];


ALTER TABLE [dbo].[TbOptSimuladoEnem] WITH CHECK ADD  CONSTRAINT [FK_TbOptSimuladoEnem_TbDisciplina_IdDisciplinaRedacao] FOREIGN KEY([IdDisciplinaRedacao]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina]);                                                     

ALTER TABLE [dbo].[TbOptSimuladoEnem] CHECK CONSTRAINT [FK_TbOptSimuladoEnem_TbDisciplina_IdDisciplinaRedacao];


ALTER TABLE [dbo].[TbProfessorDisciplina] WITH CHECK ADD  CONSTRAINT [FK_TbProfessorDisciplina_TbDisciplina] FOREIGN KEY([IdDisciplina]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina]);                                                                        

ALTER TABLE [dbo].[TbProfessorDisciplina] CHECK CONSTRAINT [FK_TbProfessorDisciplina_TbDisciplina];


ALTER TABLE [dbo].[TbSituacaoAlunoDisciplina] WITH CHECK ADD  CONSTRAINT [FK_TbTurmaDisciplinaAluno_TbDisciplina] FOREIGN KEY([IdDisciplina]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina]);                                                                   

ALTER TABLE [dbo].[TbSituacaoAlunoDisciplina] CHECK CONSTRAINT [FK_TbTurmaDisciplinaAluno_TbDisciplina];


ALTER TABLE [dbo].[TbTurma] WITH CHECK ADD  CONSTRAINT [FK_TbTurma_TbDisciplina] FOREIGN KEY([IdDisciplina]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina]);                                                                                                  

ALTER TABLE [dbo].[TbTurma] CHECK CONSTRAINT [FK_TbTurma_TbDisciplina];


ALTER TABLE [dbo].[TbTurmaDisciplinaFaseNota] WITH CHECK ADD  CONSTRAINT [FK_TbTurmaDisciplinaFaseNota_TbDisciplina] FOREIGN KEY([IdDisciplina]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina]);                                                                

ALTER TABLE [dbo].[TbTurmaDisciplinaFaseNota] CHECK CONSTRAINT [FK_TbTurmaDisciplinaFaseNota_TbDisciplina];


ALTER TABLE [dbo].[TbTurmaDisciplinaPlanoAula] WITH CHECK ADD  CONSTRAINT [FK_TbTurmaDisciplinaPlanoAula_TbDisciplina] FOREIGN KEY([IdDisciplina]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina]);                                                             

ALTER TABLE [dbo].[TbTurmaDisciplinaPlanoAula] CHECK CONSTRAINT [FK_TbTurmaDisciplinaPlanoAula_TbDisciplina];


IF	EXISTS		( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbTurmaProfessorCursoAdicional'	AND COLUMN_NAME = 'IdDisciplina' )
	AND	EXISTS	( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbDisciplina'					AND COLUMN_NAME = 'IdDisciplina' )
	BEGIN
		ALTER TABLE [dbo].[TbTurmaProfessorCursoAdicional] WITH CHECK ADD  CONSTRAINT [FK_TbTurmaProfessorCursoAdicional_TbDisciplina] FOREIGN KEY([IdDisciplina]) REFERENCES [dbo].[TbDisciplina] ([IdDisciplina])                                                      

		ALTER TABLE [dbo].[TbTurmaProfessorCursoAdicional] CHECK CONSTRAINT [FK_TbTurmaProfessorCursoAdicional_TbDisciplina]
	END;

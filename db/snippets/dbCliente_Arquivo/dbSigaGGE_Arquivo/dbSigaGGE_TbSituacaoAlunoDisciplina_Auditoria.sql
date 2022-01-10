--07jan22

USE dbSigaGGE

-- Object Level Permission
GRANT SELECT ON [dbo].[TbSituacaoAlunoDisciplina_Auditoria] TO [sigainternet];


SELECT YEAR(DATAHORA), COUNT(*)
  FROM [dbSigaGGE].[dbo].[TbSituacaoAlunoDisciplina_Auditoria]
  GROUP BY YEAR(DATAHORA)


  SELECT YEAR(DATAHORA), COUNT(*)
  FROM [dbSigaGGE_Arquivo].[dbo].[TbSituacaoAlunoDisciplina_Auditoria]
  GROUP BY YEAR(DATAHORA)

  

EXEC sp_help 'TbSituacaoAlunoDisciplina_auditoria'


	DECLARE @sql nvarchar(max) = N''
 
	SELECT @sql += QUOTENAME(COLUMN_NAME) + ', '
 	FROM INFORMATION_SCHEMA.COLUMNS
 	WHERE TABLE_NAME = 'TbSituacaoAlunoDisciplina_Auditoria' --AND TABLE_SCHEMA='YourSchemaName'
 	
 	SELECT @sql




-- CRIA TABELA DESTINO
--	SELECT * INTO dbSigaGGE_Arquivo.dbo.TbSituacaoAlunoDisciplina_Auditoria
--	    FROM dbSigaGGE.dbo.TbSituacaoAlunoDisciplina_Auditoria
--	    WHERE YEAR(DataHora) <= 2020


EXEC sp_help 'TbSituacaoAlunoDisciplina_Auditoria'


 	SET IDENTITY_INSERT dbSigaGGE_Arquivo.dbo.TbSituacaoAlunoDisciplina_Auditoria ON;
	
 	INSERT INTO dbSigaGGE_Arquivo.dbo.TbSituacaoAlunoDisciplina_Auditoria ( [DataHora], [Operacao], [IdUsuario], [IdDisciplina], [IdTurma], [IdAluno], [IdFaseNotaAtual], [SituacaoAtual], [StDisciplinaDispensada], [IdSituacaoAlunoDisciplinaAuditoria], [IdAlunoCurso], [DataMatricula], [IdUsuarioMatricula], [DataTrancamento], [IdUsuarioTrancamento], [IdMotivoTrancamento], [ComentarioTrancamento], [IdSituacaoAlunoDisciplina], [NotaFinal], [Faltas], [ProblemaAutorizadoMatricula], [IdUsuarioAutorizacaoMatricula], [JustificativaAutorizacaoMatricula], [StGoogleEdu_Sincronizado], [GoogleForEducation_LogProcessamento] )
         SELECT [DataHora], [Operacao], [IdUsuario], [IdDisciplina], [IdTurma], [IdAluno], [IdFaseNotaAtual], [SituacaoAtual], [StDisciplinaDispensada], [IdSituacaoAlunoDisciplinaAuditoria], [IdAlunoCurso], [DataMatricula], [IdUsuarioMatricula], [DataTrancamento], [IdUsuarioTrancamento], [IdMotivoTrancamento], [ComentarioTrancamento], [IdSituacaoAlunoDisciplina], [NotaFinal], [Faltas], [ProblemaAutorizadoMatricula], [IdUsuarioAutorizacaoMatricula], [JustificativaAutorizacaoMatricula], [StGoogleEdu_Sincronizado], [GoogleForEducation_LogProcessamento]  
            FROM dbSigaGGE.dbo.TbSituacaoAlunoDisciplina_Auditoria
			WHERE YEAR(DataHora) = 2021

--ROLLBACK 

			
DECLARE @BatchSize INT = 10000

WHILE 1 = 1
BEGIN
	DELETE TOP (@BatchSize)
	FROM dbSigaGGE.dbo.TbSituacaoAlunoDisciplina_Auditoria
	where YEAR(DataHora) = 2021
 
	IF @@ROWCOUNT < @BatchSize BREAK
END
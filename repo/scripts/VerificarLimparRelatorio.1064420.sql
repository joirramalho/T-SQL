/*	
	22/04/2016 Anderson/Jader
		Criando script para limpar relatórios especificos e auditoria.
*/
GO

--SET NOCOUNT ON

IF ( SELECT AtualizadorVersaoBD FROM TbParametroGlobal ) % 10 <> 0
  GOTO FIM

--exec sp_spaceused
  
IF object_id('tempdb..#tempApagarRelatorio') is not null
  DROP TABLE #tempApagarRelatorio
  
SELECT	r.IdRelatorio,
	r.CdRelatorio,
	r.NomeRelatorio,
	r.ListaUnidadeVisivel,
	r.ListaUnidadeNaoVisivel,
	Tamanho = DATALENGTH(r.Conteudo)
INTO	#tempApagarRelatorio
FROM	TbRelatorio r
WHERE	NOT (	(	ISNULL( r.ListaUnidadeVisivel, '' ) = '' OR 
			CHARINDEX( 'ACAD_ESCOLA', 		r.ListaUnidadeVisivel ) > 0 OR 
			CHARINDEX( 'ALUNO_CURSO', 		r.ListaUnidadeVisivel ) > 0 OR
			CHARINDEX( 'SUPORTE', 	  		r.ListaUnidadeVisivel ) > 0 OR
			CHARINDEX( 'ENSINO_SUPERIOR', 	r.ListaUnidadeVisivel ) > 0 OR
			EXISTS( SELECT * FROM TbUnidade WHERE CHARINDEX( SiglaUnidade, r.ListaUnidadeVisivel ) > 0 )
		)
		AND ISNULL( CHARINDEX( 'ACAD_ESCOLA', 		r.ListaUnidadeNaoVisivel ), 0 ) = 0
		AND ISNULL( CHARINDEX( 'ALUNO_CURSO', 		r.ListaUnidadeNaoVisivel ), 0 ) = 0 
		AND ISNULL( CHARINDEX( 'ALUNO_CURSO', 		r.ListaUnidadeNaoVisivel ), 0 ) = 0 
		AND ISNULL( CHARINDEX( 'ENSINO_SUPERIOR', 	r.ListaUnidadeNaoVisivel ), 0 ) = 0)		
 
/*
SELECT	*
FROM	#tempApagarRelatorio
ORDER	BY NomeRelatorio
 
SELECT	SUM(Tamanho)
FROM	#tempApagarRelatorio
*/ 
 
 
DELETE TbRelatorioFuncionalidade WHERE IdRelatorio IN ( SELECT IdRelatorio FROM #tempApagarRelatorio )
DELETE TbRelatorioGrupo WHERE IdRelatorio IN ( SELECT IdRelatorio FROM #tempApagarRelatorio )
DELETE TbRelatorioMatricula WHERE IdRelatorio IN ( SELECT IdRelatorio FROM #tempApagarRelatorio )
-- SERÁ APAGADO POR BLOCOS, ANTES ESTAVA DEMORANDO CERCA DE 1min E O SERVICE PACK DA TIMEOUT. 
--DELETE TbRelatorio WHERE IdRelatorio IN ( SELECT IdRelatorio FROM #tempApagarRelatorio )
WHILE 1 = 1 
BEGIN
    DELETE TOP (100)  FROM TbRelatorio WHERE IdRelatorio IN ( SELECT IdRelatorio FROM #tempApagarRelatorio )
    IF @@ROWCOUNT = 0
	BREAK
END


--exec sp_spaceused
--dbSigaSagradoCoracao	3695.56 MB	23.55 MB
--DBCC SHRINKDATABASE('dbSigaSagradoCoracao')


FIM:
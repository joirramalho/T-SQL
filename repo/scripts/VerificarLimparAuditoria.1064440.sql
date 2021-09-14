/*	
	22/04/2016 Anderson/Jader
		Criando script para limpar relatórios especificos e auditoria.
		
*/
GO

--SET NOCOUNT ON

-- SCRIPT DEMORANDO MUITO - SENDO RETIRADO IF ( SELECT AtualizadorVersaoBD FROM TbParametroGlobal ) % 10 <> 0
  GOTO FIM


-- Apagar auditoria "antiga" das tabelas não prioritárias!
DELETE TbAuditoria WHERE Tabela='TbDiarioFrequencia' AND	DataHora < dbo.FnFirstDay( GETDATE()-180 )
DELETE TbAuditoria WHERE Tabela='TbDiarioAula' AND		DataHora < dbo.FnFirstDay( GETDATE()-180 )
DELETE TbAuditoria WHERE Tabela='TbDiarioAluno' AND		DataHora < dbo.FnFirstDay( GETDATE()-180 )
DELETE TbAuditoria WHERE Tabela='TbSituacaoAlunoDisciplina' AND DataHora < dbo.FnFirstDay( GETDATE()-180 )
WHILE 1 = 1 
BEGIN
    DELETE TOP (100)  FROM TbAuditoria WHERE Tabela='TbPagamento' AND		YEAR(DataHora) < YEAR(GETDATE())-2
    IF @@ROWCOUNT = 0
	BREAK
END
WHILE 1 = 1 
BEGIN
    DELETE TOP (100)  FROM TbFaseNotaAluno_Auditoria WHERE			YEAR(DataHora) < YEAR(GETDATE())-2
    IF @@ROWCOUNT = 0
	BREAK
END
WHILE 1 = 1 
BEGIN
    DELETE TOP (100)  FROM TbMetaSituacaoAlunoDisciplina_Auditoria WHERE	YEAR(DataHora) < YEAR(GETDATE())-2
    IF @@ROWCOUNT = 0
	BREAK
END
WHILE 1 = 1 
BEGIN
    DELETE TOP (100)  FROM TbSituacaoAlunoDisciplina_Auditoria WHERE		YEAR(DataHora) < YEAR(GETDATE())-2
    IF @@ROWCOUNT = 0
	BREAK
END
WHILE 1 = 1 
BEGIN
    DELETE TOP (100)  FROM TbControleVersao2 WHERE				YEAR(DataLiberacao) < YEAR(GETDATE())-1
    IF @@ROWCOUNT = 0
	BREAK
END
 
DELETE TbMensagem WHERE						DataHoraInsercao < dbo.FnFirstDay( GETDATE()-60 )
DELETE TbLogWeb WHERE						DataHora < dbo.FnFirstDay( GETDATE()-60 )



FIM:
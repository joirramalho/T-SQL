	

--Consulta em tabela tempor�ria
SET DATEFORMAT DMY 
SELECT
DataEmissaoNova = '01' + '/' + REPLICATE('0', 2 - DATALENGTH(CAST( MONTH(dataVencimento) AS VARCHAR ))) +  CAST( MONTH(dataVencimento) AS VARCHAR ) + '/' + CONVERT(VARCHAR,YEAR(dataVencimento)),
* 
INTO TbTituloCobranca_CRM300860
FROM TbTituloCobranca WHERE  DataEmissao = '25/01/1900'

--DROP TABLE TbTituloCobranca_CRM300860


BEGIN TRAN 


--spctt
SET QUOTED_IDENTIFIER OFF 
SET DATEFORMAT dmy 
SET LANGUAGE Portuguese 
SET CONCAT_NULL_YIELDS_NULL ON 
 
CREATE TABLE #TempTable ( IdUsuario INT, IdUnidade INT, StSistemaEnsinoSuperior BIT, StExecutando_ExcluirDescontoDuplicado BIT NOT NULL DEFAULT (0), StExecutando_LancamentoCobranca_RenumerarRPS BIT NOT NULL DEFAULT (0), StExecutando_LancamentoCobranca_EfetuandoNegociacao BIT NOT NULL DEFAULT (0) )
 
INSERT #TempTable
	SELECT	IdUsuario = ( SELECT IdUsuario FROM TbUsuario WHERE Login='suporte' ),
		IdUnidade = ( SELECT TOP 1 IdUnidade FROM TbUnidade ),
		StSistemaEnsinoSuperior = 0,
		StExecutando_ExcluirDescontoDuplicado = 0,
		StExecutando_LancamentoCobranca_RenumerarRPS = 0,
		StExecutando_LancamentoCobranca_EfetuandoNegociacao = 0
 
-- SELECT IdUnidade, NomeUnidade, SiglaUnidade FROM TbUnidade
 
CREATE TABLE #Parametro ( Parametro VARCHAR(255), ValorVarchar VARCHAR(255), ValorInteger INT, ValorNumeric NUMERIC(12,2), ValorBit BIT )



--Alterando dados
ALTER TABLE TbTituloCobranca DISABLE TRIGGER TgTituloCobrancaValidarLancamentos
ALTER TABLE TbTituloCobranca DISABLE TRIGGER TgTituloCobrancaDataBloqueio
ALTER TABLE TbTituloCobranca DISABLE TRIGGER TgTituloCobrancaValidar


UPDATE TbTituloCobranca
SET dataEmissao = '01' + '/' + REPLICATE('0', 2 - DATALENGTH(CAST( MONTH(dataVencimento) AS VARCHAR ))) +  CAST( MONTH(dataVencimento) AS VARCHAR ) + '/' + CONVERT(VARCHAR,YEAR(dataVencimento))
WHERE DataEmissao = '25/01/1900'


ALTER TABLE TbTituloCobranca ENABLE TRIGGER TgTituloCobrancaValidarLancamentos
ALTER TABLE TbTituloCobranca ENABLE TRIGGER TgTituloCobrancaDataBloqueio
ALTER TABLE TbTituloCobranca ENABLE TRIGGER TgTituloCobrancaValidar



--ROLLBACK
COMMIT


--spctt

SET QUOTED_IDENTIFIER OFF 
SET DATEFORMAT dmy 
SET LANGUAGE Portuguese 
SET CONCAT_NULL_YIELDS_NULL ON 
 
DROP TABLE #TempTable

CREATE TABLE #TempTable ( IdUsuario INT, IdUnidade INT, StSistemaEnsinoSuperior BIT, StExecutando_ExcluirDescontoDuplicado BIT NOT NULL DEFAULT (0), StExecutando_LancamentoCobranca_RenumerarRPS BIT NOT NULL DEFAULT (0), StExecutando_LancamentoCobranca_EfetuandoNegociacao BIT NOT NULL DEFAULT (0) )
 
INSERT #TempTable
	SELECT	IdUsuario = ( SELECT IdUsuario FROM TbUsuario WHERE Login='suporte' ),
		IdUnidade = ( SELECT TOP 1 IdUnidade FROM TbUnidade ),
		StSistemaEnsinoSuperior = 0,
		StExecutando_ExcluirDescontoDuplicado = 0,
		StExecutando_LancamentoCobranca_RenumerarRPS = 0,
		StExecutando_LancamentoCobranca_EfetuandoNegociacao = 0
 
-- SELECT IdUnidade, NomeUnidade, SiglaUnidade FROM TbUnidade

DROP TABLE #Parametro 
CREATE TABLE #Parametro ( Parametro VARCHAR(255), ValorVarchar VARCHAR(255), ValorInteger INT, ValorNumeric NUMERIC(12,2), ValorBit BIT )

EXEC dbo.SpAvisoTelaInicial 1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,10997760
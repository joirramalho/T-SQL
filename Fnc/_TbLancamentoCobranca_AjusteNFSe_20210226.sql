-- RENOMEAR A TABELA 6 com *** Replace All ***

-- INSERIR OS T͍TULOS QUE DEVEM SER DESVINCULADOS NA CONSULTA A SEGUIR

USE dbSigaActivesoftGestao; 

BEGIN TRAN

SELECT	IdTituloCobranca, SituacaoTituloCobranca, ValorServico, NomeAluno,
	NFSe_NumeroMIN = ( SELECT NFSe_Numero FROM TbNotaFiscal nf WHERE nf.IdNotaFiscal = ( SELECT MIN(IdNotaFiscal) FROM TbLancamentoCobranca lc WHERE lc.IdTituloCobrancaGerado = tc.IdTituloCobranca ) ),
	NFSe_NumeroMAX = ( SELECT NFSe_Numero FROM TbNotaFiscal nf WHERE nf.IdNotaFiscal = ( SELECT MAX(IdNotaFiscal) FROM TbLancamentoCobranca lc WHERE lc.IdTituloCobrancaGerado = tc.IdTituloCobranca ) )
INTO	_TbLancamentoCobranca_AjusteNFSe_20220321
FROM	VwTituloCobrancaDescricao tc
WHERE	IdTituloCobranca IN ( 69707  )
ORDER	BY IdTituloCobranca 


SELECT	* 
FROM	_TbLancamentoCobranca_AjusteNFSe_20220321

-- TIRAR PRINT DO SELECT ACIMA; CONFERIR NOME DOS CLIENTES E DEPOIS ENVIAR PARA FABÍOLA.


--SELECT *
--FROM	TbLancamentoCobranca 
--WHERE	IdTituloCobrancaGerado IN ( SELECT IdTituloCobranca FROM _TbLancamentoCobranca_AjusteNFSe_20211006 )


UPDATE	TbLancamentoCobranca 
SET	IdNotaFiscal=NULL
WHERE	IdTituloCobrancaGerado IN ( SELECT IdTituloCobranca FROM _TbLancamentoCobranca_AjusteNFSe_20220321 )

--COMMIT
--ROLLBACK



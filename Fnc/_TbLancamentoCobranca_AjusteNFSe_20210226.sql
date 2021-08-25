-- RENOMEAR A TABELA _TbLancamentoCobranca_AjusteNFSe_20210825 com *** Replace All ***

-- INSERIR OS T͍TULOS QUE DEVEM SER DESVINCULADOS NA CONSULTA A SEGUIR

USE dbSigaActivesoftGestao; 

BEGIN TRAN

SELECT	IdTituloCobranca, SituacaoTituloCobranca, ValorServico, NomeAluno,
	NFSe_NumeroMIN = ( SELECT NFSe_Numero FROM TbNotaFiscal nf WHERE nf.IdNotaFiscal = ( SELECT MIN(IdNotaFiscal) FROM TbLancamentoCobranca lc WHERE lc.IdTituloCobrancaGerado = tc.IdTituloCobranca ) ),
	NFSe_NumeroMAX = ( SELECT NFSe_Numero FROM TbNotaFiscal nf WHERE nf.IdNotaFiscal = ( SELECT MAX(IdNotaFiscal) FROM TbLancamentoCobranca lc WHERE lc.IdTituloCobrancaGerado = tc.IdTituloCobranca ) )
INTO	_TbLancamentoCobranca_AjusteNFSe_20210825
FROM	VwTituloCobrancaDescricao tc
WHERE	IdTituloCobranca IN ( 65414 )
ORDER	BY IdTituloCobranca 


SELECT	* 
FROM	_TbLancamentoCobranca_AjusteNFSe_20210825

-- TIRAR PRINT DO SELECT ACIMA; CONFERIR NOME DOS CLIENTES E DEPOIS ENVIAR PARA FABÍOLA.


--SELECT *
--FROM	TbLancamentoCobranca 
--WHERE	IdTituloCobrancaGerado IN ( SELECT IdTituloCobranca FROM _TbLancamentoCobranca_AjusteNFSe_20210825 )


UPDATE	TbLancamentoCobranca 
SET	IdNotaFiscal=NULL
WHERE	IdTituloCobrancaGerado IN ( SELECT IdTituloCobranca FROM _TbLancamentoCobranca_AjusteNFSe_20210825 )

--COMMIT
--ROLLBACK

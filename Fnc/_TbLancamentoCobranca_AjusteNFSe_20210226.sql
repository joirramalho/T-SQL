-- RENOMEAR A TABELA _TbLancamentoCobranca_AjusteNFSe_20210831 com *** Replace All ***

-- INSERIR OS T͍TULOS QUE DEVEM SER DESVINCULADOS NA CONSULTA A SEGUIR

USE dbSigaActivesoftGestao; 

BEGIN TRAN

SELECT	IdTituloCobranca, SituacaoTituloCobranca, ValorServico, NomeAluno,
	NFSe_NumeroMIN = ( SELECT NFSe_Numero FROM TbNotaFiscal nf WHERE nf.IdNotaFiscal = ( SELECT MIN(IdNotaFiscal) FROM TbLancamentoCobranca lc WHERE lc.IdTituloCobrancaGerado = tc.IdTituloCobranca ) ),
	NFSe_NumeroMAX = ( SELECT NFSe_Numero FROM TbNotaFiscal nf WHERE nf.IdNotaFiscal = ( SELECT MAX(IdNotaFiscal) FROM TbLancamentoCobranca lc WHERE lc.IdTituloCobrancaGerado = tc.IdTituloCobranca ) )
INTO	_TbLancamentoCobranca_AjusteNFSe_20210831
FROM	VwTituloCobrancaDescricao tc
WHERE	IdTituloCobranca IN ( 65442
,54236
 ,65544
,59252
,55652
,58532
,65102
,59264
,55700
,58568
,54572
,55724
,58640
,62281
,55736
,58748
,54704
,55748
,54716
,65492
,55784
,59480
,55904
,65493
,54752
,59528
,65554
,58784
,54788
,59588
,56132
,54824
,58844
,56240
,54884
,58904
,56252
,58928
,56276
,54944
,58940
,65182
,55052
,59612
,58952
,55136
,58976
,59648
,55172
,59708
,58988
,55280
,59720
,59072
,55292
,59756
,59132
,55304
,59780
,59144
,55316
,56612
,59792
,59180
,55556
,59852
,59216
,62446
,53559
,61020
,57980
,58112
,58160
,58340
,58364)
ORDER	BY IdTituloCobranca 


SELECT	* 
FROM	_TbLancamentoCobranca_AjusteNFSe_20210831

-- TIRAR PRINT DO SELECT ACIMA; CONFERIR NOME DOS CLIENTES E DEPOIS ENVIAR PARA FABÍOLA.


--SELECT *
--FROM	TbLancamentoCobranca 
--WHERE	IdTituloCobrancaGerado IN ( SELECT IdTituloCobranca FROM _TbLancamentoCobranca_AjusteNFSe_20210831 )


UPDATE	TbLancamentoCobranca 
SET	IdNotaFiscal=NULL
WHERE	IdTituloCobrancaGerado IN ( SELECT IdTituloCobranca FROM _TbLancamentoCobranca_AjusteNFSe_20210831 )

--COMMIT
--ROLLBACK



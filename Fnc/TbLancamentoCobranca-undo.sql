USE dbSigaActivesoftGestao;


SELECT ValorServico, *
FROM TbLancamentoCobranca 
WHERE	IdTituloCobrancaGerado IN ( SELECT IdTituloCobranca FROM _TbLancamentoCobranca_AjusteNFSe_20210324 )


SELECT	IdTituloCobranca, SituacaoTituloCobranca, ValorServico, NomeAluno
	-- NFSe_NumeroMIN = ( SELECT NFSe_Numero FROM TbNotaFiscal nf WHERE nf.IdNotaFiscal = ( SELECT MIN(IdNotaFiscal) FROM TbLancamentoCobranca lc WHERE lc.IdTituloCobrancaGerado = tc.IdTituloCobranca ) ),
	-- NFSe_NumeroMAX = ( SELECT NFSe_Numero FROM TbNotaFiscal nf WHERE nf.IdNotaFiscal = ( SELECT MAX(IdNotaFiscal) FROM TbLancamentoCobranca lc WHERE lc.IdTituloCobrancaGerado = tc.IdTituloCobranca ) )
FROM	VwTituloCobrancaDescricao tc
WHERE	IdTituloCobranca IN ( SELECT IdTituloCobranca FROM _TbLancamentoCobranca_AjusteNFSe_20210324 )
ORDER	BY IdTituloCobranca 


-- Colégio Overdose - Cursinho -- título 54.962 / NF 622
-- Colégio Overdose - Lagoa Nova -- título 54.903 / NF 725
-- Colégio Overdose - Nova Parnamirim -- título 55.347 / NF 737
-- Colégio Overdose - Over Kids -- titulo 54.495 / NF 724
-- Over Colégio e Curso Eireli - Mossoró -- título 59571 / NF 26724
-- Over Colégio e Curso Eireli - João Pessoa -- título 59559 / NF 26720
-- Complexo Educacional Contemporâneo - titulo 54.075 / NF 26698

-- 54075
-- 54495
-- 54903
-- 54962
-- 55347
-- 59559
-- 59571

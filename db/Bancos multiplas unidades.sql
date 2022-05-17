IF (OBJECT_ID('tempdb..#MaisUmaUnidade') IS NOT NULL) DROP TABLE #MaisUmaUnidade

CREATE TABLE #MaisUmaUnidade ( ServidorDatabase VARCHAR(64) )

INSERT INTO #MaisUmaUnidade (ServidorDatabase )
SELECT
--    SiglaUnidade,
--    VersaoDB = REPLACE(FORMAT(VersaoDB_Atual, '#,0'), ',', '.'),
--    NomeCliente,
--    ServidorAlias,
--    NomeGrupo,
    ServidorDatabase
--    ServidorMessenger_Login,
--    COUNT(*),
    
    
--    DataHora_AtualizacaoSIGA

FROM TbCliente C
LEFT JOIN TbGrupoAtendimento GC ON C.IdGrupoAtendimento = GC.IdGrupoAtendimento

WHERE 1=1
    AND TipoCliente = 'A'
    -- AND NOT ( -- Para tirar clientes do G9 que não sejam o Filantropia independente
    --     GC.NomeGrupo LIKE '%9'
    --     AND C.IdCliente NOT IN (SELECT IdCliente FROM TbClienteSistema cs WHERE cs.IdSistema = 76)
    -- )
    -- AND GC.NomeGrupo LIKE '%5'
	AND VersaoDB_Atual >= 1065171 -- Limite mínimo
--    AND VersaoDB_Atual < 1065181
    -- AND C.IdCliente <> 5862
--	AND ServidorDatabase = 'dbSigaCognitivo'
	GROUP BY ServidorDatabase
	HAVING COUNT(*) > 1  
	ORDER BY ServidorDatabase

	
SELECT IdCliente, m1.ServidorDatabase ServidorDatabase, NomeCliente, SiglaUnidade, ServidorMessenger_Login
FROM #MaisUmaUnidade m1
LEFT JOIN TbCliente tc on tc.ServidorDatabase = m1.ServidorDatabase COLLATE  SQL_Latin1_General_CP1_CI_AI
ORDER BY ServidorDatabase, IdCliente

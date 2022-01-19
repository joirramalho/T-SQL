SELECT
    IdCliente,
    SiglaUnidade,
    VersaoDB = REPLACE(FORMAT(VersaoDB_Atual, '#,0'), ',', '.'),
    NomeCliente,
    ServidorAlias,
    NomeGrupo,
    ServidorDatabase,
    DataHora_AtualizacaoSIGA

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
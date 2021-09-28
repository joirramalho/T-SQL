USE dbSigaGGE;

-- join TbEmpresa, Unidadde e Escola ocorre com REGISTROS retornados pelo subselect

SELECT t.*,
    emp.CNPJ,
    esco.NomeEscola
FROM (
    SELECT
        c.IdCaixa,
        c.NomeCaixa,
        c.IdCaixaAbertura,
        c.DataHoraAbertura,
        c.DataHoraFechamento,
        c.NomeUsuario,
        c.StCaixaAberto,
        c.IdUsuarioAbertura,
        SUM(vcs.SaldoInicial) SaldoInicial,
        SUM(vcs.SaldoAtual) SaldoAtual,
        COUNT(vcs.CdTipoRecebimento) TotalCaixaAbertura,
        c.RazaoSocial,
        c.IdEmpresa, c.IdUnidade
        -- emp.CNPJ,
        -- esco.NomeEscola
    FROM VwCaixa c
    LEFT JOIN VwCaixaSaldo vcs ON vcs.IdCaixaAbertura = c.IdCaixaAbertura
    WHERE c.IdUnidade = 1 AND c.StAtivo = 1 /*WHERE*/
    GROUP BY c.IdCaixa, c.NomeCaixa, c.IdCaixaAbertura, c.DataHoraAbertura, c.DataHoraFechamento, c.NomeUsuario, c.StCaixaAberto, IdUsuarioAbertura, c.RazaoSocial, c.IdEmpresa, c.IdUnidade --, emp.CNPJ, esco.NomeEscola
) t
LEFT JOIN TbEmpresa emp ON emp.IdEmpresa = t.IdEmpresa
LEFT JOIN TbUnidade uni ON uni.IdUnidade = t.IdUnidade
LEFT JOIN TbEscola esco ON esco.IdEscola = uni.IdEscola
ORDER BY t.NomeCaixa, t.DataHoraAbertura
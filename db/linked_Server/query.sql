USE dbSigaActivesoftGestao;

SELECT  a.*,
        Motivo = CASE   WHEN a.Nome LIKE 'PARCEIRO%' AND a.NomeGrupo='Grupo 9' THEN 'LAB'
                        WHEN a.Nome LIKE 'Activesoft%' AND a.NomeGrupo='Grupo 9' THEN 'LAB'
                        WHEN a.Nome LIKE 'Migração%' AND a.NomeGrupo='Grupo 9' THEN 'LAB'
                        WHEN a.Nome IN ( 'CMDEUS - Treinamento', 'Contemporâneo TESTE NUVEM', 'Diocesano Caruaru - Teste banco da nuvem',
                                        'Escola Modelo Comercial', 'Escola Modelo Filantropia', 'MODELO - PROJETO SIGAWEB',
                                        'Modelo Activesoft - Ensino superior', 'PARCEIRO - TULLI',
                                        'TESTE Instituto Brasila' ) THEN 'LAB'
                        WHEN p.CodigoPatrocinador IS NOT NULL THEN 'Patrocinador ' + p.CodigoPatrocinador + CASE WHEN p.PatrocinadorInadimplente<>'OK' THEN ' (INADIMPLENTE)' ELSE '' END
                        END
FROM    VwPowerBI_ConferenciaClientesAtivos_SIGA_CRM a
LEFT    JOIN VwPowerBI_ConferenciaClientes_Ativos_SemCobranca_VinculoPatrocinador p ON p.CodigoCliente = a.Codigo
ORDER   BY Nome
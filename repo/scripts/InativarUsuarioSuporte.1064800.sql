/*	
	30/07/2018 Jader
		Retirando acesso dos usuários suporte.
	09/08/2019 Jorge
		Adicionando os novos gestores
	29/05/2020 Antonio Pinto
		Evita executar este script no banco modelo do SIGAWEB
	23/07/2021 Jorge
		Adicionando os novos gestores
	16/08/2021 Jorge
		Adicionando novos colaboradores
	08/09/2021 Jorge
		Adicionando novos colaboradores por solicitação de Fabrícia

*/
GO

  
IF NOT (EXISTS(SELECT 1 FROM TbUnidade WHERE SiglaUnidade = 'SIGAWEB'))
UPDATE	TbUsuario 
SET	StAtivo = 0 
WHERE	Login LIKE 'suporte.%' AND 
	Login NOT IN	( 
			'suporte.luciana',
			'suporte.jader',
			'suporte.jorge',
			'suporte.anderso',
			'suporte.caio',
			'suporte.marley',
			'suporte.wantu',
			'suporte.andre',
			'suporte.polly',
			'suporte.pollyana',
			'suporte.cinthia',
			'suporte.filipe',
			'suporte.fabrici',
			'suporte.edson',
			'suporte.camila',
			'suporte.pablo',
			'suporte.valdir',
			'suporte.ramon',
			'suporte.italorodrigues',
			'suporte.Valdir',
			'suporte.flavios',
			'suporte.raiane',
			'suporte.mardels',			
			'suporte.douglas.rocha',
			'suporte.raimundo.alves',
			'suporte.mignald',
			'suporte.victor',
			'suporte.bruno.cunha',
			'suporte.ewerton',
			'suporte.alexandre.ronys',
			'suporte.rafael.confesso',
			'suporte.lois.pontes',
			'suporte.placido.carlos',
			'suporte.gustavo.azevedo',
			'suporte.luacarrera',
			'suporte.eri',
			'suporte.carla.cordeiro',
			'suporte.hellen.carvalho',
			'suporte.andressa.german',
			'suporte.emanuel.borges',
			'suporte.elza',
			'suporte.michelle.torres',
			'suporte.ana.leticia'
			)



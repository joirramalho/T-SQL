-- dbo.VwFreqMarcacao source

--
-- Activesoft Consultoria 
-- VIEW criada pelo Activesoft Service Pack em 18/03/2014 durante atualização para versão 1.063.810.
--


CREATE VIEW dbo.VwFreqMarcacao AS 
--ALTER VIEW dbo.VwFreqMarcacao AS 
	SELECT	IdMarcacao, 
        	DataMarcacao, 
                IdPessoa, 
                IdColetorEntrada, 
                HoraEntrada, 
                ComentarioEntrada, 
                IdColetorSaida, 
                HoraSaida, 
                IdResponsavelSaida, 
                ComentarioSaida, 
                NomePessoa 		= COALESCE( a.NomeAluno, r.NomeResponsavel, p.NomeProfessor ),
                NomeResponsavelSaida 	= rs.NomeResponsavel,
                NomeColetorEntrada	= ce.NomeColetor,
                NomeColetorSaida	= cs.NomeColetor,
                TipoPessoa
	FROM	TbFreqMarcacao fm
        LEFT	JOIN TbAluno a 		ON a.IdAluno 	   	= fm.IdPessoa AND fm.TipoPessoa = 'A'
        LEFT	JOIN TbResponsavel r	ON r.IdResponsavel 	= fm.IdPessoa AND fm.TipoPessoa = 'R'
        LEFT	JOIN TbProfessor p	ON p.IdProfessor   	= fm.IdPessoa AND fm.TipoPessoa = 'P'        
        LEFT	JOIN TbResponsavel rs	ON rs.IdResponsavel 	= fm.IdResponsavelSaida
        LEFT	JOIN TbFreqColetor ce	ON ce.IdColetor		= fm.IdColetorEntrada
        LEFT	JOIN TbFreqColetor cs	ON cs.IdColetor		= fm.IdColetorSaida;
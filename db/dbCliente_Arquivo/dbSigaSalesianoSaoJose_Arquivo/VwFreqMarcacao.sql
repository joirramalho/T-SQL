-- dbo.VwFreqMarcacao source

--%SERVICEPACK_INFORMACAO_VERSAO%

ALTER VIEW dbo.VwFreqMarcacao AS 
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
        LEFT	JOIN TbFreqColetor cs	ON cs.IdColetor		= fm.IdColetorSaida

        
UNION ALL
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

	FROM	dbSigaSalesianoSaoJose_Arquivo.dbo.TbFreqMarcacao fm
        LEFT	JOIN TbAluno a 		ON a.IdAluno 	   	= fm.IdPessoa AND fm.TipoPessoa = 'A'
        LEFT	JOIN TbResponsavel r	ON r.IdResponsavel 	= fm.IdPessoa AND fm.TipoPessoa = 'R'
        LEFT	JOIN TbProfessor p	ON p.IdProfessor   	= fm.IdPessoa AND fm.TipoPessoa = 'P'  
		LEFT	JOIN TbResponsavel rs	ON rs.IdResponsavel 	= fm.IdResponsavelSaida
        LEFT	JOIN TbFreqColetor ce	ON ce.IdColetor		= fm.IdColetorEntrada
        LEFT	JOIN TbFreqColetor cs	ON cs.IdColetor		= fm.IdColetorSaida


--UNION ALL
--	SELECT	IdMarcacao, 
--        	DataMarcacao, 
--                IdPessoa, 
--                IdColetorEntrada, 
--                HoraEntrada, 
--                ComentarioEntrada, 
--                IdColetorSaida, 
--                HoraSaida, 
--                IdResponsavelSaida, 
--                ComentarioSaida, 
--                NomePessoa 		= COALESCE( a.NomeAluno, r.NomeResponsavel, p.NomeProfessor ),
--                NomeResponsavelSaida 	= rs.NomeResponsavel,
--                NomeColetorEntrada	= ce.NomeColetor,
--                NomeColetorSaida	= cs.NomeColetor,
--                TipoPessoa
--
--	FROM	dbSigaSalesianoSaoJose_Arquivo03.dbo.TbFreqMarcacao fm
--        LEFT	JOIN TbAluno a 		ON a.IdAluno 	   	= fm.IdPessoa AND fm.TipoPessoa = 'A'
--        LEFT	JOIN TbResponsavel r	ON r.IdResponsavel 	= fm.IdPessoa AND fm.TipoPessoa = 'R'
--        LEFT	JOIN TbProfessor p	ON p.IdProfessor   	= fm.IdPessoa AND fm.TipoPessoa = 'P'  
--		LEFT	JOIN TbResponsavel rs	ON rs.IdResponsavel 	= fm.IdResponsavelSaida
--        LEFT	JOIN TbFreqColetor ce	ON ce.IdColetor		= fm.IdColetorEntrada
--        LEFT	JOIN TbFreqColetor cs	ON cs.IdColetor		= fm.IdColetorSaida
--
--UNION ALL
--	SELECT	IdMarcacao, 
--        	DataMarcacao, 
--                IdPessoa, 
--                IdColetorEntrada, 
--                HoraEntrada, 
--                ComentarioEntrada, 
--                IdColetorSaida, 
--                HoraSaida, 
--                IdResponsavelSaida, 
--                ComentarioSaida, 
--                NomePessoa 		= COALESCE( a.NomeAluno, r.NomeResponsavel, p.NomeProfessor ),
--                NomeResponsavelSaida 	= rs.NomeResponsavel,
--                NomeColetorEntrada	= ce.NomeColetor,
--                NomeColetorSaida	= cs.NomeColetor,
--                TipoPessoa
--
--	FROM	dbSigaSalesianoSaoJose_Arquivo04.dbo.TbFreqMarcacao fm
--        LEFT	JOIN TbAluno a 		ON a.IdAluno 	   	= fm.IdPessoa AND fm.TipoPessoa = 'A'
--        LEFT	JOIN TbResponsavel r	ON r.IdResponsavel 	= fm.IdPessoa AND fm.TipoPessoa = 'R'
--        LEFT	JOIN TbProfessor p	ON p.IdProfessor   	= fm.IdPessoa AND fm.TipoPessoa = 'P'  
--		LEFT	JOIN TbResponsavel rs	ON rs.IdResponsavel 	= fm.IdResponsavelSaida
--        LEFT	JOIN TbFreqColetor ce	ON ce.IdColetor		= fm.IdColetorEntrada
--        LEFT	JOIN TbFreqColetor cs	ON cs.IdColetor		= fm.IdColetorSaida
--
--UNION ALL
--	SELECT	IdMarcacao, 
--        	DataMarcacao, 
--                IdPessoa, 
--                IdColetorEntrada, 
--                HoraEntrada, 
--                ComentarioEntrada, 
--                IdColetorSaida, 
--                HoraSaida, 
--                IdResponsavelSaida, 
--                ComentarioSaida, 
--                NomePessoa 		= COALESCE( a.NomeAluno, r.NomeResponsavel, p.NomeProfessor ),
--                NomeResponsavelSaida 	= rs.NomeResponsavel,
--                NomeColetorEntrada	= ce.NomeColetor,
--                NomeColetorSaida	= cs.NomeColetor,
--                TipoPessoa
--
--	FROM	dbSigaSalesianoSaoJose_Arquivo05.dbo.TbFreqMarcacao fm
--        LEFT	JOIN TbAluno a 		ON a.IdAluno 	   	= fm.IdPessoa AND fm.TipoPessoa = 'A'
--        LEFT	JOIN TbResponsavel r	ON r.IdResponsavel 	= fm.IdPessoa AND fm.TipoPessoa = 'R'
--        LEFT	JOIN TbProfessor p	ON p.IdProfessor   	= fm.IdPessoa AND fm.TipoPessoa = 'P'  
--		LEFT	JOIN TbResponsavel rs	ON rs.IdResponsavel 	= fm.IdResponsavelSaida
--        LEFT	JOIN TbFreqColetor ce	ON ce.IdColetor		= fm.IdColetorEntrada
--        LEFT	JOIN TbFreqColetor cs	ON cs.IdColetor		= fm.IdColetorSaida;
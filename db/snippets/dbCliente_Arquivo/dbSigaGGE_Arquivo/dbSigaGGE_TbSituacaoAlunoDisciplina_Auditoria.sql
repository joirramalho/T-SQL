USE dbSigaGGE_Arquivo

-- Object Level Permission
GRANT SELECT ON [dbo].[TbSituacaoAlunoDisciplina_Auditoria] TO [sigainternet];


SELECT YEAR(DATAHORA), COUNT(*)
  FROM [dbSigaGGE].[dbo].[TbSituacaoAlunoDisciplina_Auditoria]
  GROUP BY YEAR(DATAHORA)


  SELECT YEAR(DATAHORA), COUNT(*)
  FROM [dbSigaGGE_Arquivo].[dbo].[TbSituacaoAlunoDisciplina_Auditoria]
  GROUP BY YEAR(DATAHORA)

  

EXEC sp_help 'TbSituacaoAlunoDisciplina_auditoria'


--	DECLARE @sql nvarchar(max) = N''
-- 
--	SELECT @sql += QUOTENAME(COLUMN_NAME) + ', '
-- 	FROM INFORMATION_SCHEMA.COLUMNS
-- 	WHERE TABLE_NAME = 'TbSituacaoAlunoDisciplina' --AND TABLE_SCHEMA='YourSchemaName'
-- 	
-- 	SELECT @sql




-- CRIA TABELA DESTINO
SELECT * INTO dbSigaGGE_Arquivo.dbo.TbSituacaoAlunoDisciplina_Auditoria
    FROM dbSigaGGE.dbo.TbSituacaoAlunoDisciplina_Auditoria
    WHERE YEAR(DataHora) <= 2020


EXEC sp_help 'TbSituacaoAlunoDisciplina_Auditoria'


	-- SET IDENTITY_INSERT TbSituacaoAlunoDisciplina_Auditoria ON;
	
	-- INSERT INTO TbSituacaoAlunoDisciplina_Auditoria ( IdLogWeb, SessionId, DataHora, IPHost, SistemaOperacional, Arquivo, IdUsuario, TitpoUsuario, Acao, ParametroInt_1, ParametroInt_2, ParametroInt_3, ParametroStr )
	--         SELECT IdLogWeb, SessionId, DataHora, IPHost, SistemaOperacional, Arquivo, IdUsuario, TitpoUsuario, Acao, ParametroInt_1, ParametroInt_2, ParametroInt_3, ParametroStr  
	--             FROM dbSigaSalesianoSaoJose_Arquivo01.dbo.TbSituacaoAlunoDisciplina_Auditoria


--DECLARE @BatchSize INT = 5000
--
--WHILE 1 = 1
--BEGIN
--	DELETE TOP (@BatchSize)
--	FROM dbSigaGGE.dbo.TbSituacaoAlunoDisciplina_Auditoria
--	where YEAR(DataHora) <= 2020
-- 
--	IF @@ROWCOUNT < @BatchSize BREAK
--END
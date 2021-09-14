/*	
	18/06/2014 Jader
		Criando script para verificar tamanho do banco de dados (limite 4GB do SQL Server Express).

	10/09/2015 Jader
		Atualizando o script para o SQL 2008.
*/
GO

IF (
	SELECT	percentual
	FROM	(
		SELECT	size = ( SELECT SUM(size*8) FROM sysfiles ),
			percentual = CONVERT(FLOAT,( SELECT SUM(size*8) FROM sysfiles )) / (max_db_size*1000) * 100,
			*
		FROM	(
			SELECT	d.server_name, version=@@VERSION, d.sversion_name, d.edition, 
				max_db_size = 
				CASE WHEN engine_edition IN (2,4) -- Express version e Web Edition
				    THEN 
					1000*CASE 
					    WHEN d.sversion_name LIKE '%2012%' THEN 10
					    WHEN d.sversion_name LIKE '%2008 R2%' THEN 10
					    WHEN d.sversion_name LIKE '%2008%' THEN 4 
					    WHEN d.sversion_name LIKE '%2005%' THEN 4
					END
				    ELSE 1000
				END
			FROM (
				SELECT	sversion_name = SUBSTRING(v.ver, 0, CHARINDEX('-', v.ver) - 1), 
					engine_edition = SERVERPROPERTY('EngineEdition'), 
					edition = SERVERPROPERTY('Edition'), 
					server_name = SERVERPROPERTY('ServerName')
				FROM	(SELECT ver = @@VERSION) v
				WHERE v.ver LIKE '%Express%'
			) d  
		) t
	) t
	) > 80
RAISERROR( 'Banco de dados perto de atingir limite do SQL Server Express Edition. É necessário apagar dados desnecessários.', 16, 1)
GO

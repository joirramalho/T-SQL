/*	
	23/06/2011 Jader
		Criando script para verificar se existe alguma trigger desabilitada no banco de dados.
		Em circunst�ncias normais (banco de produ��o) n�o deve existir.

	12/03/2018 Jader
		Melhorando a mensagem de erro
*/
USE dbLogMonitor;

DECLARE	@Qtde INTEGER
DECLARE	@Nome1 VARCHAR(50)
DECLARE	@Nome2 VARCHAR(50)

SELECT	@Qtde	= COUNT(*),
	@Nome1	= MIN( name ),
	@Nome2	= MAX( name )
FROM	sys.triggers 
WHERE	is_disabled = 1

IF @Nome1 <> @Nome2
	IF @Qtde = 2
		SET @Nome1 = @Nome1 + ' e ' + @Nome2
	ELSE
		SET @Nome1 = @Nome1 + ', ' + @Nome2 + ', etc.'

IF @Qtde > 0
	RAISERROR ( 'Existem triggers desabilitadas no banco de dados (%s).', 16, 1, @Nome1 );
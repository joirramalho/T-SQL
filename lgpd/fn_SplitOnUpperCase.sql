--30nov21

--SELECT dbo.Split_On_Upper_Case('IdNumeroCNPJ')

IF (OBJECT_ID('dbo.fn_SplitOnUpperCase') IS NOT NULL) DROP FUNCTION fn_SplitOnUpperCase;


CREATE FUNCTION dbo.fn_SplitOnUpperCase
 (
     @String VARCHAR(4000)
 )
RETURNS VARCHAR(4000)
AS
BEGIN
	DECLARE @Char CHAR(1)
	DECLARE @i    INT = 0
	DECLARE @OutString VARCHAR(4000) = ''
	
	IF 	LEFT( @String, 2 ) = 'Id'
		SET @String = SUBSTRING( @String, 3, LEN( @String) - 2) 
	
	WHILE (@i <= LEN(@String))
	BEGIN
	    SELECT @Char = SUBSTRING(@String, @i,1)
	
	    IF (@Char = UPPER(@Char) COLLATE Latin1_General_CS_AI) 
	       SET @OutString = @OutString + ' ' + @Char
	    ELSE 
	       SET @OutString = @OutString +  @Char
	
	     SET @i += 1
	END
	
	SET @OutString =  LTRIM(@OutString)
	
	SET @OutString =   REPLACE( @OutString, 'C P F', 'CPF')
	SET @OutString =   REPLACE( @OutString, 'C N P J', 'CNPJ')
	SET @OutString =   REPLACE( @OutString, 'C N P J', 'CNPJ')
	SET @OutString =   REPLACE( @OutString, 'C E P', 'CEP')
	SET @OutString =   REPLACE( @OutString, 'L R F', 'LRF')
	SET @OutString =   REPLACE( @OutString, 'U R L', 'URL')
	SET @OutString =   REPLACE( @OutString, 'F E B R A B A N', 'FEBRABAN')
	 
	SET @OutString =   REPLACE( @OutString, 'I B G E', 'IBGE')
	SET @OutString =   REPLACE( @OutString, 'A N S', 'ANS')
	 
	RETURN @OutString
END 
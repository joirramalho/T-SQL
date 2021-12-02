--02nov21

--SELECT dbo.fn_PutSpaceBetweenLetters('CNPJ')

IF (OBJECT_ID('dbo.fn_PutSpaceBetweenLetters') IS NOT NULL) DROP FUNCTION fn_PutSpaceBetweenLetters;


CREATE FUNCTION dbo.fn_PutSpaceBetweenLetters
 (
     @String VARCHAR(4000)
 )
RETURNS VARCHAR(4000)
AS
BEGIN
	DECLARE @Char CHAR(1)
	DECLARE @i    INT = 0
	DECLARE @OutString VARCHAR(4000) = ''
		
	WHILE ( @i <= LEN(@String) )
	BEGIN
	    SELECT @Char = SUBSTRING(@String, @i, 1 )
	
		SET @OutString = @OutString + ' ' + 	@Char
		
	    SET @i += 1
	END
	
	RETURN  LTRIM( @OutString )
END
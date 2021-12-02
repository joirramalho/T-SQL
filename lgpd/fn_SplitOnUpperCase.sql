--02dez21

--SELECT dbo.fn_SplitOnUpperCase('AnexoSIAIDPAnexo14')

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
	
	WHILE ( @i <= LEN(@String) )
	BEGIN
	    SELECT @Char = SUBSTRING(@String, @i, 1 )
	
	    IF ( @Char = UPPER( @Char ) COLLATE Latin1_General_CS_AI ) 
	       SET @OutString = @OutString + ' ' + 	@Char
	    ELSE 
	       SET @OutString = @OutString +  		@Char
	
	    SET @i += 1
	END
	
	SET @OutString =  LTRIM( @OutString )
	
	DECLARE @palavra VARCHAR(50)

	DECLARE load_cursor CURSOR FOR 
	    SELECT  dbo.fn_PutSpaceBetweenLetters( palavra )	FROM BdDicionarioDados.dbo.DicionarioDados WHERE SIGLA = 1
	    
	OPEN load_cursor 
	FETCH NEXT FROM load_cursor INTO @palavra 
	
	WHILE @@FETCH_STATUS = 0 
	BEGIN 
		IF CHARINDEX(@palavra, @OutString) > 0
			begin
				SET @OutString = REPLACE( @OutString, @palavra, REPLACE( UPPER( @palavra ), ' ', '' ) )
			end
		
		FETCH NEXT FROM load_cursor INTO @palavra

	END 	
	
	CLOSE load_cursor 
	DEALLOCATE load_cursor
	
	RETURN @OutString
END
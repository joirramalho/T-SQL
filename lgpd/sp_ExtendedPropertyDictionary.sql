--30nov21

--Standardize SQL Server data with text lookup and replace function
	--https://www.mssqltips.com/sqlservertip/1052/standardize-sql-server-data-with-text-lookup-and-replace-function/

--SQL Case Sensitive String Compare
	--https://stackoverflow.com/questions/3969059/sql-case-sensitive-string-compare/66393472#66393472

--sp_ExtendedPropertyDictionary

IF (OBJECT_ID('dbo.sp_ExtendedPropertyDictionary') IS NOT NULL) DROP PROCEDURE sp_ExtendedPropertyDictionary;

CREATE PROCEDURE sp_ExtendedPropertyDictionary
AS
BEGIN
    SET NOCOUNT ON;

	DECLARE @word VARCHAR(50),  
	    @position INT,  
	    @newProductName VARCHAR(500),  
	    @oldProductName VARCHAR(500),  
	    @newWord VARCHAR(50)
	
		DECLARE @TableName 			sysname
		DECLARE @ColumnName 		sysname
		DECLARE @Description 		VARCHAR(512)
	
	    DECLARE @ProductName VARCHAR(500)
	--    @ProductID INT 
	
	DECLARE load_cursor CURSOR FOR 
	    SELECT  [TableName], ColumnName, Description 
	    FROM dbo._column_details_extended_property
	    
	    
	OPEN load_cursor 
	FETCH NEXT FROM load_cursor INTO @TableName, @ColumnName, @ProductName 
	
	WHILE @@FETCH_STATUS = 0 
	BEGIN 
		SET @oldProductName = @ProductName 
	    SET @ProductName = LTRIM( RTRIM( @ProductName ) ) 
	     
	    SET @newProductName = @ProductName 
	
	    SET @position = CHARINDEX(' ', @ProductName, 1) 
	
	    BEGIN 
	         WHILE @position > 0 
	         BEGIN 
	              SET @word = LTRIM(RTRIM(LEFT(@ProductName, @position - 1))) 
	              
	              IF @word <> '' 
	              BEGIN 
	                 
	                SELECT @newWord = NULL 
	                SELECT @newWord = Palavra FROM BdDicionarioDados.dbo.DicionarioDados WHERE Palavra = @word COLLATE Latin1_General_CI_AI 
	                IF @newWord IS NOT NULL 
						SET @newProductName = REPLACE( @newProductName, @word, @newWord ) 
	                ELSE
						INSERT INTO BdDicionarioDados.dbo.DicionarioDados( Palavra )	VALUES( LOWER( @word ) )
	
	              END 
	              SET @ProductName = RIGHT(@ProductName, LEN(@ProductName) - @position) 
	              SET @position = CHARINDEX(' ', @ProductName, 1) 
	         END 
	          
	         SET @word = @ProductName 
	         SELECT @newWord = NULL 
	         SELECT @newWord = Palavra FROM BdDicionarioDados.dbo.DicionarioDados WHERE Palavra = @word COLLATE Latin1_General_CI_AI
	             	
	
	         IF @newWord IS NOT NULL 
	              SET @newProductName = REPLACE( @newProductName, @ProductName, @newWord ) 
	    END 
	
	    IF  @oldProductName COLLATE Latin1_General_CI_AS  <> @newProductName COLLATE Latin1_General_CI_AS    
	    BEGIN 
	--         SELECT @oldProductName AS OldProductName, @newProductName AS NewProductName
	
	         UPDATE dbo._column_details_extended_property 
	         	SET Description =  UPPER(LEFT(@newProductName,1)) + LOWER( SUBSTRING(@newProductName,2,LEN(@newProductName)) )
	         	WHERE TableName = @TableName AND ColumnName = @ColumnName 
	    END 
	
	    FETCH NEXT FROM load_cursor INTO @TableName, @ColumnName, @ProductName 
	END 
	
	
	CLOSE load_cursor 
	DEALLOCATE load_cursor

END
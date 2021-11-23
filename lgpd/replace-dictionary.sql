--23nov21

--Standardize SQL Server data with text lookup and replace function
	--https://www.mssqltips.com/sqlservertip/1052/standardize-sql-server-data-with-text-lookup-and-replace-function/

--SQL Case Sensitive String Compare
	--https://stackoverflow.com/questions/3969059/sql-case-sensitive-string-compare/66393472#66393472


--CREATE TABLE [dbo].[_column_details_extended_property_dictionary] ( 
--    [synonym] 	[VARCHAR] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL , 
--    [word] 		[VARCHAR] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL  
--) ON [PRIMARY] 

SET NOCOUNT ON 

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
--    WHERE [TableName] = 'Gen_Orgao' --AND ColumnName = 'IdOrgao'
    
OPEN load_cursor 
FETCH NEXT FROM load_cursor INTO @TableName, @ColumnName, @ProductName 

WHILE @@FETCH_STATUS = 0 
BEGIN 
    SET @oldProductName = @ProductName 
    SET @ProductName = LTRIM(RTRIM(@ProductName)) 
     
    SET @newProductName = @ProductName 

    SET @position = CHARINDEX(' ', @ProductName, 1) 

    BEGIN 
         WHILE @position > 0 
         BEGIN 
              SET @word = LTRIM(RTRIM(LEFT(@ProductName, @position - 1))) 
              IF @word <> '' 
              BEGIN 
                 
                SELECT @newWord = NULL 
                SELECT @newWord = synonym FROM _column_details_extended_property_dictionary WHERE synonym = @word COLLATE Latin1_General_CI_AI 
                IF @newWord IS NOT NULL 
                BEGIN 
                     SET @newProductName = REPLACE(@newProductName, @word, @newWord) 
                END 
              END 
              SET @ProductName = RIGHT(@ProductName, LEN(@ProductName) - @position) 
              SET @position = CHARINDEX(' ', @ProductName, 1) 
         END 
          
         SET @word = @ProductName 
         SELECT @newWord = NULL 
         SELECT @newWord = synonym FROM _column_details_extended_property_dictionary WHERE synonym = @word COLLATE Latin1_General_CI_AI

         IF @newWord IS NOT NULL 
              SET @newProductName = REPLACE(@newProductName, @ProductName, @newWord) 
    END 

    IF  @oldProductName COLLATE Latin1_General_CI_AS  <> @newProductName COLLATE Latin1_General_CI_AS    
    BEGIN 
--         SELECT @oldProductName AS OldProductName, @newProductName AS NewProductName

         UPDATE dbo._column_details_extended_property 
         	SET Description =  UPPER(LEFT(@newProductName,1))+LOWER(SUBSTRING(@newProductName,2,LEN(@newProductName)))
         	WHERE TableName = @TableName AND ColumnName = @ColumnName 
    END 

    FETCH NEXT FROM load_cursor INTO @TableName, @ColumnName, @ProductName 
END 



CLOSE load_cursor 
DEALLOCATE load_cursor

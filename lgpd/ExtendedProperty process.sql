SELECT TableName, ColumnName, isPrimaryKey, SUBSTRING( TableName, 0, CHARINDEX('_', TableName, 0 ) ) AS PrefixColumnName, SUBSTRING( TableName, CHARINDEX('_', TableName, 0 ) + 1, LEN(TableName) ) as SufixColumnName, Description
FROM _column_details_extended_property
WHERE isPrimaryKey = 1
	AND ColumnName = 'Id' + SUBSTRING( TableName, CHARINDEX('_', TableName, 0 ) + 1, LEN(TableName) )
	
--	UPDATE	_column_details_extended_property	SET	Description = NULL 

SELECT 
		TableName, 
		ColumnName, 
		isPrimaryKey, 
--		SUBSTRING( TableName, 0, CHARINDEX('_', TableName, 0 ) ) AS PrefixColumnName, 
--		SUBSTRING( TableName, CHARINDEX('_', TableName, 0 ) + 1, LEN(TableName) ) as SufixColumnName, 
--		dbo.Split_On_Upper_Case(	SUBSTRING( ColumnName, CHARINDEX(' ', ColumnName, 0 ) + 1, LEN( ColumnName ) )	), 
		Description
FROM _column_details_extended_property
WHERE ColumnName LIKE '%situacao%' --OR ColumnName LIKE '%Telefone%' 



--Identificador de tabela (PK) com nome do campo compatível com nome da tabela 
	UPDATE	_column_details_extended_property
	SET
	    _column_details_extended_property.Description = 'Identificador de ' + dbo.Split_On_Upper_Case(	SUBSTRING( ColumnName, CHARINDEX(' ', ColumnName, 0 ) + 1, LEN( ColumnName ) )	)
	WHERE isPrimaryKey = 1
		AND ColumnName = 'Id' + SUBSTRING( TableName, CHARINDEX('_', TableName, 0 ) + 1, LEN(TableName) );


	--Identificador de tabela (PK) existente em outras tabelas como FK 
	UPDATE	_column_details_extended_property
	SET
	    Description = ( SELECT Description FROM _column_details_extended_property base WHERE base.ColumnName = _column_details_extended_property.ColumnName AND Description IS NOT NULL )
	WHERE Description IS NULL;

	

-- Descrever casos específicos
	DECLARE @ID INT
	DECLARE @ColumnName 		VARCHAR(32)
	DECLARE @PrefixColumnName 	VARCHAR(32)
	DECLARE @SufixColumnName 	VARCHAR(256)
	DECLARE @Description 		VARCHAR(512)
	
	DECLARE c CURSOR FOR SELECT * FROM _column_details_extended_property_keyword WHERE ( Description IS NOT NULL OR Prefix IS NOT NULL OR Sufix IS NOT NULL ) ORDER BY ID
	OPEN c
	FETCH NEXT FROM c INTO @ID, @ColumnName, @Description, @PrefixColumnName, @SufixColumnName
	WHILE @@FETCH_STATUS =0
	BEGIN
		UPDATE	_column_details_extended_property
			SET		Description = IIF( 	@Description IS NOT  NULL, @Description, 
										COALESCE( @PrefixColumnName, '' ) + dbo.Split_On_Upper_Case( 	SUBSTRING( ColumnName, CHARINDEX( ' ', ColumnName, 0 ) + 1, LEN( ColumnName ) )		) + COALESCE( @SufixColumnName, '' )
									)
			WHERE 	ColumnName LIKE @ColumnName  
					AND Description IS NULL
	
		FETCH NEXT FROM c INTO @ID, @ColumnName, @Description, @PrefixColumnName, @SufixColumnName
	END
	CLOSE c
	DEALLOCATE c;
 

-- Descrever demais casos
	UPDATE	_column_details_extended_property
			SET		Description = dbo.Split_On_Upper_Case( 	SUBSTRING( ColumnName, CHARINDEX( ' ', ColumnName, 0 ) + 1, LEN( ColumnName ) )		)
			WHERE 	Description IS NULL;

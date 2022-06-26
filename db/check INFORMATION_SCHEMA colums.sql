--22jun22
		
DECLARE @TableName 	VARCHAR(64)
DECLARE @Msg 		VARCHAR(64)

DECLARE load_cursor CURSOR FOR 
	SELECT tab.name 
	FROM 	sys.triggers 	AS trig 
	INNER 	JOIN sys.objects tab	on trig.parent_id = tab.object_id
	WHERE 	trig.name LIKE '%_Auditoria' -- = 'TbLancamentoCobranca'  

OPEN load_cursor 
FETCH NEXT FROM load_cursor INTO @TableName 

WHILE @@FETCH_STATUS = 0 
BEGIN 
	IF(
		(	
			SELECT 	COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS 
			WHERE 	TABLE_NAME = @TableName
						AND LEFT(COLUMN_NAME, 1)  <> '_' 			-- campo _descontinuado
						AND DATA_TYPE NOT IN ( 'text', 'image' )	-- campos não tratados por triggers
		)
		<>
		(	
			SELECT COUNT(*) 
			FROM (
					SELECT * FROM INFORMATION_SCHEMA.COLUMNS cols
					WHERE TABLE_NAME = @TableName
							AND LEFT(COLUMN_NAME, 1)  <> '_' 
							AND DATA_TYPE NOT IN ( 'text', 'image' )

				) X
			INNER JOIN (
				SELECT * FROM INFORMATION_SCHEMA.COLUMNS 
				WHERE TABLE_NAME = @TableName + '_Auditoria'
						AND LEFT(COLUMN_NAME, 1)  <> '_'	
						AND DATA_TYPE NOT IN ( 'text', 'image' )

			) Y ON 	Y.COLUMN_NAME = X.COLUMN_NAME 
--					AND Y.DATA_TYPE = X.DATA_TYPE
--					AND ISNULL( Y.CHARACTER_MAXIMUM_LENGTH, 0 ) = ISNULL( X.CHARACTER_MAXIMUM_LENGTH, 0 )
--					AND ISNULL( Y.NUMERIC_PRECISION_RADIX, 0 ) 	= ISNULL( X.NUMERIC_PRECISION_RADIX, 0 )
--					AND ISNULL( Y.NUMERIC_SCALE, 0 ) 			= ISNULL( X.NUMERIC_SCALE, 0 )
--					AND ISNULL( Y.COLLATION_NAME, 0 ) 			= ISNULL( X.COLLATION_NAME, 0 )
		)
	)
	BEGIN
		SET @Msg = 'Erro na tabela de auditoria ' + @TableName

		RAISERROR( @Msg, 16, 1)
	END
	
	FETCH NEXT FROM load_cursor INTO @TableName

END 	

CLOSE load_cursor 
DEALLOCATE load_cursor

		
--IF(
--	(	
--		SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbLancamentoCobranca'	
--	)
--	<>
--	(	
--		SELECT COUNT(*) 
--		FROM (
--			SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbLancamentoCobranca'
--		) X
--		INNER JOIN (
--			SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbLancamentoCobranca_Auditoria'
--		) Y ON 	Y.COLUMN_NAME = X.COLUMN_NAME 
--				AND Y.DATA_TYPE = X.DATA_TYPE
--	)
--)
--		RAISERROR('AUDITORIA ERRADA', 16, 1)
	
--EXEC sp_help 'TbFaseNota' ;
--EXEC sp_helptext 'TgDiarioAula_Auditoria' ;
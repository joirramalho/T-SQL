--23mar22
	--https://www.red-gate.com/simple-talk/blogs/sql-server-table-smells/

	--Rolling up multiple rows into a single row and column for SQL Server data
		--concatenar campo de vários registros em um só
		--https://www.mssqltips.com/sqlservertip/2914/rolling-up-multiple-rows-into-a-single-row-and-column-for-sql-server-data/

	--https://www.esrf.fr/computing/scientific/FIT2D/FIT2D_REF/node18.html
/*
	INFO and WARNING text in the terminal window is identified by one of four initial ``keywords'':
	
	INFO: The text is of a purely informative nature e.g. values calculated as the result of some operation, or information on an input data-set.
	
	NOTE: The text is also informative, but highlights a potential for misunderstanding by an inexperienced user. Thus, such messages should be carefully noted.
	
	WARNING: Something has not worked as it should. This may be of greater or lesser importance depending on the circumstances. e.g. An input file was not found, or was of the wrong format.
	
	ERROR: Something ``serious'' has gone wrong. This may require exiting FIT2D or may be ``recoverable'' depending on the circumstances. e.g. The system has failed to allocate dynamic memory as requested.

	It should be noted that these categories are not strict i.e. in some circumstances a WARNING message may be more serious than an ERROR message, nevertheless, this show a generally increasing importance and need for user comprehension and maybe action.
 */


/*
DECLARE @CountError INT, @CountWarning  INT

EXEC [dbo].[sp_ObjectSmells] @DisplayEvidence = 1, @Errors = @CountError OUTPUT, @Warnings = @CountWarning OUTPUT

PRINT @CountError
PRINT @CountWarning
*/


--IF OBJECT_ID('dbo.sp_ObjectSmells', 'P') IS NULL	EXECUTE('CREATE PROCEDURE dbo.sp_ObjectSmells AS SELECT 1')


ALTER PROCEDURE dbo.sp_ObjectSmells
( 
	@DisplayEvidence 	BIT = 0,
	@Errors 			INT OUTPUT,
   	@Warnings 			INT OUTPUT 
)
AS
BEGIN
/**
	Extras (adaptado or Add by Joir)
	28/ Dont use Views with `ORDER BY`
	29/ Triggers using `EXEC`, Don’t use EXEC to run dynamic SQL. It is there only for backward compatibility and is a commonly used vector for SQL injection
	**/
	
	SET NOCOUNT ON;

	IF OBJECT_ID('dbo._database_smells') IS NOT NULL
		TRUNCATE TABLE dbo._database_smells
	ELSE
		CREATE TABLE dbo._database_smells ( IdDatabaseSmells INT NOT NULL IDENTITY(1,1), EvidenceOf VARCHAR(8), [TableName] SYSNAME, Problem VARCHAR(1024)  ) -- , FalsoPositivo BIT NOT NULL  DEFAULT 0

		
	IF OBJECT_ID('TEMPDB..##TEMP') IS NOT NULL
		DROP TABLE ##TEMP
	
	CREATE TABLE TEMPDB..##TEMP ( [TableName] SYSNAME, Problem VARCHAR(1024), TypeEvidenceOf TINYINT  )
	
 	
	
	INSERT INTO TEMPDB..##TEMP ( [TableName], [Problem], TypeEvidenceOf ) 
	
		/*
		 * 
		 *	4-ERROR
		 */
        	--Problems_with_Table_Design
			SELECT DISTINCT Object_Name(sys.tables.object_id), 'heap (table should have a clustered index)', 4
	        FROM sys.indexes /* see whether the table is a heap */
	        INNER JOIN sys.tables ON sys.tables.object_id = sys.indexes.object_id
	        WHERE sys.indexes.type = 0

        UNION ALL

			--Problems_with_Table_Design
	        SELECT Object_Name(sys.tables.object_id), 'No primary key (Not explicitly declaring which index is the clustered one)', 4
	        FROM sys.tables /* see whether the table has a primary key */
	        WHERE ObjectProperty(object_id, 'TableHasPrimaryKey') = 0


	    /*
		 * 
		 *	3-WARNING
		 */
		UNION ALL

			--Problems_with_Table_Design
        	SELECT DISTINCT Object_Name(parent_object_id), 'disabled constraint(s)', 3
          	FROM sys.check_constraints /* hmm. i wonder why */
          	WHERE is_disabled = 1

		UNION ALL

			--Problems_with_Table_Design
        	SELECT DISTINCT Object_Name(parent_object_id), 'untrusted constraint(s)', 3
          	FROM sys.check_constraints /* ETL gone bad? */
          	WHERE is_not_trusted = 1

		UNION ALL

			--Problems_with_Table_Design
			SELECT DISTINCT Object_Name(parent_id), 'has a disabled trigger', 3
			FROM sys.triggers
			WHERE is_disabled = 1 AND parent_id > 0
			
		UNION ALL

			--Problems_with_Table_Design
			--column has a collation different from the database', 3
			SELECT Object_Name(c.object_id), 'has a column ''[' + c.name + ']'' that has a collation ''' + collation_name + ''' different from the database', 3
          	FROM sys.columns AS c
          	WHERE Coalesce(collation_name, '') <> DatabasePropertyEx(Db_Id(), 'Collation')

		UNION ALL 

			--Problems_with_Data_Types
			SELECT [TableName], 'Using varchar(1) or varchar(2) in [' + ColumnName + '] (Columns of short or fixed length should have a fixed size since variable-length types have a disproportionate storage overhead)', 3
	        FROM _column_details_extended_property
	        WHERE TableType = 'COLUMN'
				AND DataType IN ('varchar', 'nvarchar' )
				AND MaxLength < 3

		
			--Problems_with_Data_Types
			--SELECT [TableName], 'Using varchar(1) or varchar(2) in [' + ColumnName + '] (Columns of short or fixed length should have a fixed size since variable-length types have a disproportionate storage overhead)', 3
		
			--		SELECT 
			--    c.name 'ColumnName',
			--    t.Name 'Datatype',
			--    c.max_length 'MaxLength',
			--    c.precision ,
			--    c.scale ,
			--    c.is_nullable,
			--    ISNULL(i.is_primary_key, 0) 'Primary Key'
			--FROM    
			--    sys.columns c
			--INNER JOIN 		sys.types t ON c.user_type_id = t.user_type_id
			--LEFT OUTER JOIN sys.index_columns ic ON ic.object_id = c.object_id AND ic.column_id = c.column_id
			--LEFT OUTER JOIN sys.indexes i ON ic.object_id = i.object_id AND ic.index_id = i.index_id
		
		
		
		UNION ALL
	
			--Problems_with_Data_Types
			--DEP002 WRITETEXT,UPDATETEXT and READTEXT statements are deprecated.		
	        SELECT [TableName], 'Using text or ntext in [' + ColumnName + '] deprecated language elements data types. (been replaced by the varchar(n) and varchar(MAX) data types) (BLOB storage are there only for backward compatibility)', 3
	        FROM _column_details_extended_property
	        WHERE TableType = 'COLUMN'
				AND DataType IN ('text', 'ntext' )

		UNION ALL

			--Problems_with_Data_Types
        	SELECT Object_Name(object_id), 'deprecated LOB datatype', 3
          	FROM sys.tables /* found a simpler way! */
          	WHERE ObjectPropertyEx(object_id, 'TableHasTextImage') = 1 

         UNION ALL
	
			--Problems_with_Data_Types
	        SELECT [TableName], 'possibility to loss precision due to rounding errors Using money in [' + ColumnName + '] (Using the DECIMAL data type instead)', 3
	        FROM _column_details_extended_property
	        WHERE TableType = 'COLUMN'
					AND DataType IN ( 'money' )
				
		UNION ALL

			--Problems_With_Database_Design
			--https://documentation.red-gate.com/codeanalysis/code-analysis-for-sql-server/execution-rules/ei026
			--EI017 Hardcoded current database name in procedure call
			SELECT Object_Name(a.object_id), 'hardcoded database name reference: ' + type_desc COLLATE SQL_Latin1_General_CP1_CI_AI + ' [' + object_name(a.object_id) + '] in ' + DB_NAME() + ' pointing to ' + x.name, 3
			FROM sys.sql_modules a
			LEFT JOIN sys.objects o ON o.object_id = a.object_id 
			CROSS  apply (select name from master.sys.databases where name <> DB_NAME() and database_id > 4 and len(name) > 3) x
			WHERE patindex(concat('%from%',x.name,'.%.%') collate database_default, a.definition collate database_default ) > 0
			
		UNION ALL

			--Problems_with_Table_Design
        	SELECT DISTINCT Object_Name(object_id), 'disabled Index(es)', 3
          	FROM sys.indexes /* don't leave these lying around */
          	WHERE is_disabled = 1

		UNION ALL

			--Problems_with_Table_Design
        	SELECT DISTINCT Object_Name(object_id), 'low Fill-Factor less than 80%', 3
          	FROM sys.indexes /* a fill factor of less than 80 raises eyebrows */
          	WHERE fill_factor <> 0
	            AND fill_factor < 80
	            AND is_disabled = 0
	            AND is_hypothetical = 0

		UNION ALL

			--Problems_with_Table_Design
        	SELECT DISTINCT Object_Name(parent_object_id), 'disabled FK', 3
          	FROM sys.foreign_keys /* build script gone bad? */
          	WHERE is_disabled = 1

		UNION ALL

			--Problems_with_Table_Design
        	SELECT DISTINCT Object_Name(parent_object_id), 'untrusted FK', 3
          	FROM sys.foreign_keys /* Why do you have untrusted FKs?	Constraint was enabled without checking existing rows;	therefore, the constraint may not hold for all rows. */
          	WHERE is_not_trusted = 1

			
		--		UNION ALL
		--        
		--			Defining foreign keys without a supporting index
		--        	SELECT Object_Name(keys.parent_object_id), 'foreign key [' + keys.name + '] that has no supporting index', 3
		--          	FROM sys.foreign_keys AS keys
		--            INNER JOIN sys.foreign_key_columns 	AS TheColumns 	ON keys.object_id = constraint_object_id
		--            LEFT OUTER JOIN sys.index_columns 	AS ic			ON ic.object_id = TheColumns.parent_object_id AND ic.column_id = TheColumns.parent_column_id AND TheColumns.constraint_column_id = ic.key_ordinal
		--          	WHERE ic.object_id IS NULL


		/*
		 * 
		 *	2-NOTE
		 */
	        
		UNION ALL

			--Problems_with_Table_Design
			--Using too many or too few indexes
       		SELECT Object_Name(sys.tables.object_id), 'No index at all', 2
          	FROM sys.tables /* see whether the table has any index */
          	WHERE ObjectProperty(object_id, 'TableHasIndex') = 0

		UNION ALL

			--Problems_with_Table_Design
          	--Using too many indexes
       		SELECT t.name, 'Using too many  indexes', 2
			FROM 	sys.indexes ind 
			INNER JOIN sys.tables t ON ind.object_id = t.object_id 
			GROUP BY t.name
			HAVING count(*) > 3
	
		UNION ALL

			--Problems_with_Table_Design
			--APX1229 – Missing primary key
			SELECT Object_Name(sys.tables.object_id), 'No candidate key', 2
          	FROM sys.tables /* if no unique constraint then it isn't relational */
          	WHERE ObjectProperty(object_id, 'TableHasUniqueCnst') = 0
            	AND ObjectProperty(object_id, 'TableHasPrimaryKey') = 0

		UNION ALL
				
			--Problems_with_Table_Design
        	SELECT Object_Name(object_id), 'wide (more than 15 columns)', 2
			FROM sys.tables /* see whether the table has more than 15 columns */
			WHERE max_column_id_used > 15

		UNION ALL

			--Problems_with_Routines
			--DEP028 The SQL module was created with ANSI_NULLS and/or QUOTED_IDENTIFIER options set to OFF.
			SELECT Object_Name(sys.tables.object_id), 'has ANSI NULLs set to OFF', 2
          	FROM sys.tables /* see whether the table has ansii NULLs off*/
          	WHERE ObjectPropertyEx(object_id, 'IsAnsiNullsOn') = 0
	        
		UNION ALL

			--Problems_with_Routines
			--MI008 QUOTED_IDENTIFIERS option inside stored procedure, trigger or function
        	SELECT Object_Name(ta.object_id), 'This table''s trigger [' + Object_Name(tr.object_id) + '] has''nt got NOCOUNT ON', 2
			FROM sys.tables AS ta /* Triggers lacking `SET NOCOUNT ON`, which can cause unexpected results WHEN USING OUTPUT */
			INNER JOIN sys.triggers 	AS tr ON tr.parent_id = ta.object_id
			INNER JOIN sys.sql_modules 	AS mo ON tr.object_id = mo.object_id
        	WHERE definition NOT LIKE '%SET NOCOUNT ON%'
	        
		UNION ALL

			--Problems_with_Routines
			--MI008 QUOTED_IDENTIFIERS option inside stored procedure, trigger or function -- JOIR
        	SELECT Object_Name(ta.object_id), 'This table''s trigger [' + Object_Name(tr.object_id) + '] has got NOCOUNT ON', 2
			FROM sys.tables AS ta /* Triggers lacking `SET NOCOUNT ON`, which can cause unexpected results WHEN USING OUTPUT */
			INNER JOIN sys.triggers 	AS tr ON tr.parent_id = ta.object_id
			INNER JOIN sys.sql_modules 	AS mo ON tr.object_id = mo.object_id
        	WHERE definition LIKE '%SET NOCOUNT OFF%'
        	
		UNION ALL

			--Problems_with_Routines
			--PE009 No SET NOCOUNT ON before DML
			SELECT Object_Name(object_id), 'procedure [' + Object_Name(object_id) + '] has''nt got NOCOUNT ON', 2
			FROM sys.procedures AS p /* Triggers lacking `SET NOCOUNT ON`, which can cause unexpected results WHEN USING OUTPUT */
        	WHERE object_definition(object_id) NOT LIKE '%SET NOCOUNT ON%'

		UNION ALL

			--Problems_with_Table_Design
       		SELECT DISTINCT Object_Name(object_id), 'unintelligible column names', 2
          	FROM sys.columns /* column names with no letters in them */
          	WHERE name COLLATE Latin1_General_CI_AI NOT LIKE '%[A-Z]%' COLLATE Latin1_General_CI_AI

		UNION ALL

			--Problems_with_Table_Design
        	SELECT DISTINCT Object_Name(object_id), 'non-compliant column names', 3
          	FROM sys.columns /* column names that need delimiters*/
          	WHERE name COLLATE Latin1_General_CI_AI LIKE '%[^_@$#A-Z0-9]%' COLLATE Latin1_General_CI_AI

		UNION ALL

			--Problems_with_Table_Design
        	SELECT Object_Name(object_id), 'unrelated to any other table', 2
          	FROM sys.tables /* found a simpler way! */
          	WHERE ObjectPropertyEx(object_id, 'TableHasForeignKey') = 0
            AND ObjectPropertyEx(object_id, 'TableHasForeignRef') = 0

		UNION ALL

			--Problems_with_Table_Design
        	SELECT Object_Name(Ic.object_id), Col_Name(Ic.object_id, Ic.column_id) + ' is a GUID in a clustered index', 2 /* GUID in a clustered IX */
          	FROM sys.index_columns AS Ic
			INNER JOIN sys.tables AS tables ON tables.object_id = Ic.object_id
            INNER JOIN sys.columns AS c ON c.object_id = Ic.object_id AND c.column_id = Ic.column_id
            INNER JOIN sys.types AS t ON t.system_type_id = c.system_type_id
            INNER JOIN sys.indexes AS i ON i.object_id = Ic.object_id AND i.index_id = Ic.index_id
          	WHERE t.name = 'uniqueidentifier'
            	AND i.type_desc = 'CLUSTERED'

		UNION ALL

			--Problems_with_Table_Design
			SELECT Object_Name(sys.tables.object_id), 'not referenced by procedure, view or function', 2
			FROM sys.tables /* table not referenced by any routine */
			LEFT OUTER JOIN sys.sql_expression_dependencies	ON referenced_id = sys.tables.object_id
			WHERE referenced_id IS NULL

		UNION ALL

			--Problems_with_Table_Design
			SELECT Object_Name(sys.tables.object_id), 'can''t be indexed', 2
			FROM sys.tables /* see whether the table has a primary key */
			WHERE ObjectProperty(object_id, 'IsIndexable') = 0
	        
		UNION ALL

			--Problems_with_Table_Design
        	SELECT DISTINCT Object_Name(object_id), 'leftover fake index(es) (restos de índice(s) falso(s))', 2
          	FROM sys.indexes /* don't leave these lying around */
          	WHERE is_hypothetical = 1

        	

		/*
		 * 
		 *	1-INFO
		 */
	        
		UNION ALL

	        SELECT Object_Name(s.object_id), 'Undocumented table: it has no extended properties', 1
	        FROM sys.objects AS s /* it has no extended properties */
	        LEFT OUTER JOIN sys.extended_properties AS ep ON s.object_id = ep.major_id AND minor_id = 0
	        WHERE type_desc = 'USER_TABLE' AND ep.value IS NULL


			
--	28/ Dont use Views with `ORDER BY`
--	29/ Triggers using `EXEC`, Don’t use EXEC to run dynamic SQL. It is there only for backward compatibility and is a commonly used vector for SQL injection
			
			
		IF @DisplayEvidence = 1
		BEGIN 
--			CREATE TABLE TEMPDB..##TEMP ( [TableName] SYSNAME, Problem VARCHAR(1024), TypeEvidenceOf TINYINT  )

			SELECT
				CASE
				WHEN TypeEvidenceOf = 1 THEN 'info'
				WHEN TypeEvidenceOf = 2 THEN 'note'
				WHEN TypeEvidenceOf = 3 THEN 'warning'
				ELSE 'ERROR'
				END [EvidenceOf],
				[TableName],
				[Problem]

				--	STUFF( ( SELECT '; ' + US.[Problem] 
				--		      FROM  ##TEMP US
				--		      WHERE US.[Object_ID] = t1.[Object_ID] AND US.TypeEvidenceOf = t1.TypeEvidenceOf
				--		      FOR XML PATH('') ), 1, 1, '') AS [Problem],
			FROM  ##TEMP t1
			WHERE [TableName] NOT IN ('_flyway_schema_history', '_column_details_extended_property', '_database_smells' )
			ORDER BY TypeEvidenceOf DESC, [TableName]-- 1, 2 DESC
		END 
		
	--	
		
		INSERT INTO dbo._database_smells ( EvidenceOf, TableName, Problem )
			SELECT TOP 1000
				CASE
				WHEN TypeEvidenceOf = 1 THEN 'info'
				WHEN TypeEvidenceOf = 2 THEN 'note'
				WHEN TypeEvidenceOf = 3 THEN 'warning'
				ELSE 'ERROR'
				END [EvidenceOf],
				[TableName],
				[Problem]
			FROM  ##TEMP t1
			WHERE [TableName] NOT IN ('_flyway_schema_history', '_column_details_extended_property', '_database_smells' )
			ORDER BY TypeEvidenceOf DESC, [TableName]
			
			
		SELECT 	@Errors 	= (SELECT COUNT(*) FROM ##TEMP WHERE TypeEvidenceOf = 4 AND [TableName] NOT IN ('_flyway_schema_history', '_column_details_extended_property', '_database_smells' )),
				@Warnings 	= (SELECT COUNT(*) FROM ##TEMP WHERE TypeEvidenceOf = 3 AND [TableName] NOT IN ('_flyway_schema_history', '_column_details_extended_property', '_database_smells' ))
END
			
	--SELECT * FROM ##TEMP
          

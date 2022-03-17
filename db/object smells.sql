--05dez21
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
	 * Problems with Data Types
	 * 
	 * 
	 * 
	 * 
	 * 
	 This query finds the following table smells
	 1/ is a Wide table (set this to what you consider to be wide)
	 2/ is a Heap
	 3/ is an undocumented table
	 4/ Has no Primary Key
	 5/ Has ANSI NULLs set to OFF
	 6/ Has no index at all
	 7/ No candidate key (unique constraint on column(s))
	 8/ Has disabled Index(es)
	 9/ has leftover fake index(es)
	10/ has a column collation different from the database
	11/ Has a surprisingly low Fill-Factor
	12/ Has disabled constraint(s)'
	13/ Has untrusted constraint(s)'
	14/ Has a disabled Foreign Key'
	15/ Has untrusted FK'
	16/ Has unrelated to any other table'
	17/ Has a deprecated LOB datatype
	18/ Has unintelligible column names'
	19/ Has a foreign key that has no index'
	20/ Has a GUID in a clustered Index
	21/ Has non-compliant column names'
	22/ Has a trigger that has'nt got NOCOUNT ON'
	23/ Is not referenced by any procedure, view or function'
	24/ Has  a disabled trigger' 
	25/ Can't be indexed'
	
	Extras (adaptado or Add by Joir)
	26/ hardcoded database name reference
	27/ Has a Procedure that has'nt got NOCOUNT ON'
	28/ Dont use Views with `ORDER BY`
	29/ Triggers using `EXEC`, Don’t use EXEC to run dynamic SQL. It is there only for backward compatibility and is a commonly used vector for SQL injection
	
	15mar22
	14mar22
	**/
	
	SET NOCOUNT ON;

	IF OBJECT_ID('TEMPDB..##TEMP') IS NOT NULL
		DROP TABLE ##TEMP
	
	CREATE TABLE ##TEMP ( [TableName] SYSNAME, Problem VARCHAR(1024), TypeEvidenceOf TINYINT  )
	
	 
	INSERT INTO ##TEMP ( [TableName], [Problem], TypeEvidenceOf ) 

	        SELECT [TableName], 'Using varchar(1) or varchar(2) in [' + ColumnName + '] (Columns of short or fixed length should have a fixed size since variable-length types have a disproportionate storage overhead)', 3
	        FROM _column_details_extended_property  /* #19 */
	        WHERE TableType = 'COLUMN'
				AND DataType IN ('varchar', 'nvarchar' )
				AND MaxLength < 3
	
		UNION ALL
	
	        SELECT [TableName], 'Using text or ntext in [' + ColumnName + '] deprecated language elements data types. (been replaced by the varchar(n) and varchar(MAX) data types) (BLOB storage are there only for backward compatibility)', 3
	        FROM _column_details_extended_property
	        WHERE TableType = 'COLUMN'
				AND DataType IN ('text', 'ntext' )

		UNION ALL
	
	        SELECT [TableName], 'possibility to loss precision due to rounding errors Using money in [' + ColumnName + '] (Using the DECIMAL data type instead)', 3
	        FROM _column_details_extended_property
	        WHERE TableType = 'COLUMN'
					AND DataType IN ( 'money' )
				
		UNION ALL
				
        	SELECT Object_Name(object_id), 'wide (more than 15 columns)', 2
			FROM sys.tables /* see whether the table has more than 15 columns */
			WHERE max_column_id_used > 15

		UNION ALL

	        SELECT DISTINCT Object_Name(sys.tables.object_id), 'heap (table should have a clustered index)', 4
	        FROM sys.indexes /* see whether the table is a heap */
	        INNER JOIN sys.tables ON sys.tables.object_id = sys.indexes.object_id
	        WHERE sys.indexes.type = 0

		UNION ALL

	        SELECT Object_Name(s.object_id), 'Undocumented table', 1
	        FROM sys.objects AS s /* it has no extended properties */
	        LEFT OUTER JOIN sys.extended_properties AS ep ON s.object_id = ep.major_id AND minor_id = 0
	        WHERE type_desc = 'USER_TABLE' AND ep.value IS NULL

        UNION ALL

	        SELECT Object_Name(sys.tables.object_id), 'No primary key (Not explicitly declaring which index is the clustered one)', 4
	        FROM sys.tables /* see whether the table has a primary key */
	        WHERE ObjectProperty(object_id, 'TableHasPrimaryKey') = 0

		UNION ALL

        	SELECT Object_Name(sys.tables.object_id), 'has ANSI NULLs set to OFF', 2
          	FROM sys.tables /* see whether the table has ansii NULLs off*/
          	WHERE ObjectPropertyEx(object_id, 'IsAnsiNullsOn') = 0

		UNION ALL

       		SELECT Object_Name(sys.tables.object_id), 'No index at all', 2
          	FROM sys.tables /* see whether the table has any index */
          	WHERE ObjectProperty(object_id, 'TableHasIndex') = 0

		UNION ALL

        	SELECT Object_Name(sys.tables.object_id), 'No candidate key', 2
          	FROM sys.tables /* if no unique constraint then it isn't relational */
          	WHERE ObjectProperty(object_id, 'TableHasUniqueCnst') = 0
            	AND ObjectProperty(object_id, 'TableHasPrimaryKey') = 0

		UNION ALL

        	SELECT DISTINCT Object_Name(object_id), 'disabled Index(es)', 3
          	FROM sys.indexes /* don't leave these lying around */
          	WHERE is_disabled = 1

		UNION ALL

        	SELECT DISTINCT Object_Name(object_id), 'leftover fake index(es) (restos de índice(s) falso(s))', 3
          	FROM sys.indexes /* don't leave these lying around */
          	WHERE is_hypothetical = 1

		UNION ALL

        	SELECT Object_Name(c.object_id), 'has a column ''[' + c.name + ']'' that has a collation ''' + collation_name + ''' different from the database', 3
          	FROM sys.columns AS c
          	WHERE Coalesce(collation_name, '') <> DatabasePropertyEx(Db_Id(), 'Collation')

		UNION ALL

        	SELECT DISTINCT Object_Name(object_id), 'low Fill-Factor less than 80%', 3
          	FROM sys.indexes /* a fill factor of less than 80 raises eyebrows */
          	WHERE fill_factor <> 0
	            AND fill_factor < 80
	            AND is_disabled = 0
	            AND is_hypothetical = 0

		UNION ALL

        	SELECT DISTINCT Object_Name(parent_object_id), 'disabled constraint(s)', 3
          	FROM sys.check_constraints /* hmm. i wonder why */
          	WHERE is_disabled = 1

		UNION ALL

        	SELECT DISTINCT Object_Name(parent_object_id), 'untrusted constraint(s)', 3
          	FROM sys.check_constraints /* ETL gone bad? */
          	WHERE is_not_trusted = 1

		UNION ALL

        	SELECT DISTINCT Object_Name(parent_object_id), 'disabled FK', 3
          	FROM sys.foreign_keys /* build script gone bad? */
          	WHERE is_disabled = 1

		UNION ALL

        	SELECT DISTINCT Object_Name(parent_object_id), 'untrusted FK', 3
          	FROM sys.foreign_keys /* Why do you have untrusted FKs?	Constraint was enabled without checking existing rows;	therefore, the constraint may not hold for all rows. */
          	WHERE is_not_trusted = 1

		UNION ALL

        	SELECT Object_Name(object_id), 'unrelated to any other table', 1
          	FROM sys.tables /* found a simpler way! */
          	WHERE ObjectPropertyEx(object_id, 'TableHasForeignKey') = 0
            AND ObjectPropertyEx(object_id, 'TableHasForeignRef') = 0

		UNION ALL

        	SELECT Object_Name(object_id), 'deprecated LOB datatype', 3
          	FROM sys.tables /* found a simpler way! */
          	WHERE ObjectPropertyEx(object_id, 'TableHasTextImage') = 1 

		UNION ALL

       		SELECT DISTINCT Object_Name(object_id), 'unintelligible column names', 1
          	FROM sys.columns /* column names with no letters in them */
          	WHERE name COLLATE Latin1_General_CI_AI NOT LIKE '%[A-Z]%' COLLATE Latin1_General_CI_AI

		UNION ALL
        
        	SELECT Object_Name(keys.parent_object_id), 'foreign key [' + keys.name + '] that has no supporting index', 3
          	FROM sys.foreign_keys AS keys
            INNER JOIN sys.foreign_key_columns 	AS TheColumns 	ON keys.object_id = constraint_object_id
            LEFT OUTER JOIN sys.index_columns 	AS ic			ON ic.object_id = TheColumns.parent_object_id AND ic.column_id = TheColumns.parent_column_id AND TheColumns.constraint_column_id = ic.key_ordinal
          	WHERE ic.object_id IS NULL

		UNION ALL

        	SELECT Object_Name(Ic.object_id), Col_Name(Ic.object_id, Ic.column_id) + ' is a GUID in a clustered index', 2 /* GUID in a clustered IX */
          	FROM sys.index_columns AS Ic
			INNER JOIN sys.tables AS tables ON tables.object_id = Ic.object_id
            INNER JOIN sys.columns AS c ON c.object_id = Ic.object_id AND c.column_id = Ic.column_id
            INNER JOIN sys.types AS t ON t.system_type_id = c.system_type_id
            INNER JOIN sys.indexes AS i ON i.object_id = Ic.object_id AND i.index_id = Ic.index_id
          	WHERE t.name = 'uniqueidentifier'
            	AND i.type_desc = 'CLUSTERED'

		UNION ALL

        	SELECT DISTINCT Object_Name(object_id), 'non-compliant column names', 3
          	FROM sys.columns /* column names that need delimiters*/
          	WHERE name COLLATE Latin1_General_CI_AI LIKE '%[^_@$#A-Z0-9]%' COLLATE Latin1_General_CI_AI

		UNION ALL

        	SELECT Object_Name(ta.object_id), 'This table''s trigger [' + Object_Name(tr.object_id) + '] has''nt got NOCOUNT ON', 2
			FROM sys.tables AS ta /* Triggers lacking `SET NOCOUNT ON`, which can cause unexpected results WHEN USING OUTPUT */
			INNER JOIN sys.triggers 	AS tr ON tr.parent_id = ta.object_id
			INNER JOIN sys.sql_modules 	AS mo ON tr.object_id = mo.object_id
        	WHERE definition NOT LIKE '%set nocount on%'
        	
		UNION ALL

			SELECT Object_Name(sys.tables.object_id), 'not referenced by procedure, view or function', 2
			FROM sys.tables /* table not referenced by any routine */
			LEFT OUTER JOIN sys.sql_expression_dependencies	ON referenced_id = sys.tables.object_id
			WHERE referenced_id IS NULL

		UNION ALL

			SELECT DISTINCT Object_Name(parent_id), 'has a disabled trigger', 3
			FROM sys.triggers
			WHERE is_disabled = 1 AND parent_id > 0

		UNION ALL

			SELECT Object_Name(sys.tables.object_id), 'can''t be indexed', 3
			FROM sys.tables /* see whether the table has a primary key */
			WHERE ObjectProperty(object_id, 'IsIndexable') = 0
	        
	        
		UNION ALL -- EXTRAS (Adaptados by Joir)
          
			SELECT Object_Name(a.object_id), 'hardcoded database name reference: ' + type_desc COLLATE SQL_Latin1_General_CP1_CI_AI + ' [' + object_name(a.object_id) + '] in ' + DB_NAME() + ' pointing to ' + x.name, 2
			FROM sys.sql_modules a
			LEFT JOIN sys.objects o ON o.object_id = a.object_id 
			CROSS  apply (select name from master.sys.databases where name <> DB_NAME() and database_id > 4 and len(name) > 3) x
			WHERE patindex(concat('%from%',x.name,'.%.%') collate database_default, a.definition collate database_default ) > 0
		
		
		UNION ALL

        	SELECT Object_Name(object_id), 'procedure [' + Object_Name(object_id) + '] has''nt got NOCOUNT ON', 2
			FROM sys.procedures AS p /* Triggers lacking `SET NOCOUNT ON`, which can cause unexpected results WHEN USING OUTPUT */
        	WHERE object_definition(object_id) NOT LIKE '%set nocount on%'
        	

			
--	28/ Dont use Views with `ORDER BY`
--	29/ Triggers using `EXEC`, Don’t use EXEC to run dynamic SQL. It is there only for backward compatibility and is a commonly used vector for SQL injection
			
			
			-- has more than 3 index per table

			
			
			
		IF @DisplayEvidence = 1
		BEGIN 
			SELECT 
--				( SELECT Object_Schema_Name(Object_ID) + '.' + Object_Name(Object_ID) ) AS [TableName],
				[TableName],
				CASE
				WHEN TypeEvidenceOf = 1 THEN 'info'
				WHEN TypeEvidenceOf = 2 THEN 'note'
				WHEN TypeEvidenceOf = 3 THEN 'warning'
				ELSE 'ERROR'
				END [EvidenceOf],
				--	STUFF( ( SELECT '; ' + US.[Problem] 
				--		      FROM  ##TEMP US
				--		      WHERE US.[Object_ID] = t1.[Object_ID] AND US.TypeEvidenceOf = t1.TypeEvidenceOf
				--		      FOR XML PATH('') ), 1, 1, '') AS [Problem],
				[Problem]
			FROM  ##TEMP t1
			WHERE TypeEvidenceOf = 3
				--GROUP BY t1.[Object_ID], t1.[Problem], t1.TypeEvidenceOf
			ORDER BY 1, 2 DESC
		END 
			
			
		SELECT @Errors = (SELECT COUNT(*) FROM ##TEMP WHERE TypeEvidenceOf = 4), @Warnings = (SELECT COUNT(*) FROM ##TEMP WHERE TypeEvidenceOf = 3)
END
			
	--SELECT * FROM ##TEMP
          

--13mai22
	--https://www.red-gate.com/simple-talk/blogs/sql-server-table-smells/

	--Rolling up multiple rows into a single row and column for SQL Server data
		--concatenar campo de vários registros em um só
		--https://www.mssqltips.com/sqlservertip/2914/rolling-up-multiple-rows-into-a-single-row-and-column-for-sql-server-data/

	--	SQL Server (T-SQL) Data Types to system_type_id list (2022 update)
		--SELECT system_type_id, name as datatype	FROM sys.types	WHERE system_type_id = user_type_id
/*
	--https://www.esrf.fr/computing/scientific/FIT2D/FIT2D_REF/node18.html
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

--PRINT @CountError
--PRINT @CountWarning
*/


--IF OBJECT_ID('dbo.sp_ObjectSmells', 'P') IS NULL	EXECUTE('CREATE PROCEDURE dbo.sp_ObjectSmells AS SELECT 1')




--						https://rules.sonarsource.com/tsql


--CREATE PROCEDURE dbo.sp_ObjectSmells
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
	BEGIN
		DROP TABLE dbo._database_smells
		--		TRUNCATE TABLE dbo._database_smells
				
		--		IF NOT EXISTS (
		--						  SELECT * 
		--						  FROM   sys.columns 
		--						  WHERE  object_id = OBJECT_ID(N'dbo._database_smells') 
		--						         AND name = 'Explication' )
		--			ALTER TABLE dbo._database_smells ADD Explication VARCHAR(1024) NULL;
		--
		--		IF NOT EXISTS (
		--						  SELECT * 
		--						  FROM   sys.columns 
		--						  WHERE  object_id = OBJECT_ID(N'dbo._database_smells') 
		--						         AND name = 'Command' )
		--			ALTER TABLE dbo._database_smells ADD Command VARCHAR(2048) NULL;
		CREATE TABLE dbo._database_smells ( IdDatabaseSmells INT NOT NULL IDENTITY(1,1), EvidenceOf VARCHAR(16), TypeObjectOf VARCHAR(32), [ObjectName] SYSNAME, Problem VARCHAR(1024), Explication VARCHAR(1024), Command VARCHAR(1024) ) -- , FalsoPositivo BIT NOT NULL  DEFAULT 0
	END

		
	IF OBJECT_ID('dbo._column_details_extended_property') IS NULL
	BEGIN		
		CREATE TABLE dbo.[_column_details_extended_property] (
			[Database] nvarchar(128) COLLATE SQL_Latin1_General_CP1_CI_AI NULL,
			Owner nvarchar(128) COLLATE SQL_Latin1_General_CP1_CI_AI NULL,
			TableType varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AI NULL,
			TableName sysname COLLATE SQL_Latin1_General_CP1_CI_AI NOT NULL,
			ColumnName sysname COLLATE SQL_Latin1_General_CP1_CI_AI NULL,
			OrdinalPosition int NULL,
			DefaultSetting nvarchar(4000) COLLATE SQL_Latin1_General_CP1_CI_AI NULL,
			DataType nvarchar(128) COLLATE SQL_Latin1_General_CP1_CI_AI NULL,
			MaxLength int NULL,
			DatePrecision smallint NULL,
			IsNullable bit NULL,
			IsPrimaryKey bit NULL,
			IsError bit DEFAULT 0 NOT NULL,
			Description varchar(512) COLLATE SQL_Latin1_General_CP1_CI_AI NULL
		)		
	END		
		
		
	IF OBJECT_ID('TEMPDB..##TEMP') IS NOT NULL
		DROP TABLE TEMPDB..##TEMP
	
	CREATE TABLE TEMPDB..##TEMP ( [TypeObjectOf] VARCHAR(32), [ObjectName] SYSNAME, Problem VARCHAR(1024), TypeEvidenceOf TINYINT, Explication VARCHAR(1024), Command VARCHAR(1024)  )
	
 	
	
	INSERT INTO TEMPDB..##TEMP ( TypeObjectOf, [ObjectName], [Problem], TypeEvidenceOf, Explication, Command ) 
	
		/*
		 * 
		 *	CODE
		 */
			--EI017 Hardcoded current database name in procedure call
			SELECT 'DATABASE', Object_Name(a.object_id), 'hardcoded database name reference in ' + type_desc COLLATE SQL_Latin1_General_CP1_CI_AI + ' [' + object_name(a.object_id) + '] in ' + DB_NAME() + ' pointing to ' + x.name, 3, 'https://documentation.red-gate.com/codeanalysis/code-analysis-for-sql-server/execution-rules/ei026', ''
			FROM sys.sql_modules a
			LEFT JOIN sys.objects o ON o.object_id = a.object_id 
			CROSS  apply (select name from master.sys.databases where name <> DB_NAME() and database_id > 4 and len(name) > 3) x
			WHERE patindex(concat('%from%',x.name,'.%.%') collate database_default, a.definition collate database_default ) > 0
			
		UNION ALL

			--APX1207 – Missing SET NOCOUNT ON before Unatteended DML execution
			--PE009 No SET NOCOUNT ON before DML
			SELECT 'PROCEDURE', Object_Name(object_id), 'procedure [' + Object_Name(object_id) + '] has''nt got NOCOUNT ON', 2, 'https://www.sqlshack.com/sql-server-set-options-affect-query-result-set-concat_null_yields_null-set-numeric_roundabort-set-quoted_identifier-set-nocount-set-xact_abort/', ''
			FROM sys.procedures AS p /* Triggers lacking `SET NOCOUNT ON`, which can cause unexpected results WHEN USING OUTPUT */
        	WHERE object_definition(object_id) NOT LIKE '%SET NOCOUNT ON%'

		UNION ALL

			--APX1207 – Missing SET NOCOUNT ON before Unatteended DML execution
			--PE009 No SET NOCOUNT ON before DML
			SELECT 'PROCEDURE', Object_Name(object_id), 'procedure [' + Object_Name(object_id) + '] has got NOCOUNT ON', 2, 'https://www.sqlshack.com/sql-server-set-options-affect-query-result-set-concat_null_yields_null-set-numeric_roundabort-set-quoted_identifier-set--set-xact_abort/', ''
			FROM sys.procedures AS p /* Triggers lacking `SET NOCOUNT ON`, which can cause unexpected results WHEN USING OUTPUT */
        	WHERE object_definition(object_id) LIKE '%SET NOCOUNT OFF%'

		UNION ALL

			-- APX1271 – SET ANSI_PADDING OFF
			SELECT 'PROCEDURE', Object_Name(object_id), 'procedure [' + Object_Name(object_id) + '] has got ANSI_PADDING OFF', 3, 'https://docs.microsoft.com/en-us/previous-versions/sql/sql-server-2008/ms143729(v=sql.100)?redirectedfrom=MSDN', ''
			FROM sys.procedures AS p 
        	WHERE object_definition(object_id) LIKE '%SET ANSI_PADDING OFF%'

        UNION ALL

			--APX1139 – WAITFOR delay statement
			SELECT 'PROCEDURE', Object_Name(object_id), 'procedure [' + Object_Name(object_id) + '] has got WAITFOR', 4, 'https://www.sqlshack.com/sql-server-wait-type-waitfor/', ''
			FROM sys.procedures AS p 
        	WHERE object_definition(object_id) LIKE '%WAITFOR%' AND Object_Name(object_id) <> 'sp_ObjectSmells'
        	
		UNION ALL

			--APX1308 – Trigger should be enabled
			SELECT DISTINCT 'TRIGGER', Object_Name(parent_id), 'trigger [' + name + '] is disabled', 3, 'https://www.sqlshack.com/triggers-in-sql-server/', ''
			FROM sys.triggers
			WHERE is_disabled = 1 AND parent_id > 0

		UNION ALL

			--MI008 QUOTED_IDENTIFIERS option inside stored procedure, trigger or function
        	SELECT 'TRIGGER', Object_Name(ta.object_id), 'trigger [' + Object_Name(tr.object_id) + '] has''nt got NOCOUNT ON', 2, '', ''
			FROM sys.tables AS ta /* Triggers lacking `SET NOCOUNT ON`, which can cause unexpected results WHEN USING OUTPUT */
			INNER JOIN sys.triggers 	AS tr ON tr.parent_id = ta.object_id
			INNER JOIN sys.sql_modules 	AS mo ON tr.object_id = mo.object_id
        	WHERE definition NOT LIKE '%SET NOCOUNT ON%'
	        
        UNION ALL

			--APX1123 – SET NOCOUNT OFF Usage
			--MI008 QUOTED_IDENTIFIERS option inside stored procedure, trigger or function
        	SELECT 'TRIGGER', Object_Name(ta.object_id), 'trigger [' + Object_Name(tr.object_id) + '] has got NOCOUNT OFF', 2, '', ''
			FROM sys.tables AS ta /* Triggers lacking `SET NOCOUNT ON`, which can cause unexpected results WHEN USING OUTPUT */
			INNER JOIN sys.triggers 	AS tr ON tr.parent_id = ta.object_id
			INNER JOIN sys.sql_modules 	AS mo ON tr.object_id = mo.object_id
        	WHERE definition LIKE '%SET NOCOUNT OFF%'
        	
        UNION ALL

			--MI008 QUOTED_IDENTIFIERS option inside stored procedure, trigger or function
        	SELECT 'TRIGGER', Object_Name(ta.object_id), 'trigger [' + Object_Name(tr.object_id) + '] has got WAITFOR', 4, '', ''
			FROM sys.tables AS ta /* Triggers lacking `SET NOCOUNT ON`, which can cause unexpected results WHEN USING OUTPUT */
			INNER JOIN sys.triggers 	AS tr ON tr.parent_id = ta.object_id
			INNER JOIN sys.sql_modules 	AS mo ON tr.object_id = mo.object_id
        	WHERE definition  LIKE '%WAITFOR%'
	        
		UNION ALL
        	
			--APX1123 – SET NOCOUNT OFF Usage
			--MI008 QUOTED_IDENTIFIERS option inside stored procedure, trigger or function
        	SELECT type_desc, name, 'function [' + name + '] has got NOCOUNT OFF', 2, '', ''
		  	FROM sys.sql_modules m 
			INNER JOIN sys.objects o ON m.object_id=o.object_id
			WHERE type_desc like '%function%' AND definition LIKE '%SET NOCOUNT OFF%'
			

		/*
		 * 
		 *	DESIGN
		 */
		UNION ALL

			--APX1237 – ANSI_NULLS or QUOTED_IDENTIFIER OFF
			--DEP028 The SQL module was created with ANSI_NULLS and/or QUOTED_IDENTIFIER options set to OFF.
			SELECT 'TABLE', Object_Name(sys.tables.object_id), 'has ANSI NULLs set to OFF', 2, 'https://docs.microsoft.com/en-us/previous-versions/sql/sql-server-2008/ms143729(v=sql.100)?redirectedfrom=MSDN', ''
          	FROM sys.tables /* see whether the table has ansii NULLs off*/
          	WHERE ObjectPropertyEx(object_id, 'IsAnsiNullsOn') = 0
	        
		UNION ALL
	
			--APX1229 – Missing primary key
	        SELECT 'TABLE', Object_Name(sys.tables.object_id), 'No primary key', 4, 'https://docs.microsoft.com/en-us/sql/relational-databases/tables/create-primary-keys?view=sql-server-2017', ''
	        FROM sys.tables /* see whether the table has a primary key */
	        WHERE ObjectProperty(object_id, 'TableHasPrimaryKey') = 0
	        
    	UNION ALL

			--APX1225 – Missing clustered index
    		SELECT DISTINCT 'TABLE', Object_Name(sys.tables.object_id), 'Heap table (Tabelas sem índices clusterizados)', 3, 'https://docs.microsoft.com/pt-br/sql/relational-databases/indexes/heaps-tables-without-clustered-indexes?view=sql-server-ver15', ''
	        FROM sys.indexes /* see whether the table is a heap */
	        INNER JOIN sys.tables ON sys.tables.object_id = sys.indexes.object_id
	        WHERE sys.indexes.type = 0
          	
		UNION ALL

			--APX1229 – Missing primary key		
			SELECT 'TABLE', Object_Name(sys.tables.object_id), 'No candidate key', 2, 'https://docs.microsoft.com/en-us/sql/relational-databases/tables/create-primary-keys?view=sql-server-2017', ''
          	FROM sys.tables /* if no unique constraint then it isn't relational */
          	WHERE ObjectProperty(object_id, 'TableHasUniqueCnst') = 0	AND ObjectProperty(object_id, 'TableHasPrimaryKey') = 0
          	
		UNION ALL
				
        	SELECT 'TABLE', Object_Name(object_id), 'wide table (contain ' + CAST( max_column_id_used AS VARCHAR) + ' columns)' + ' (more than 15 columns)' , 2, '', ''
			FROM sys.tables /* see whether the table has more than 15 columns */
			WHERE max_column_id_used > 15

		UNION ALL

        	SELECT 'TABLE', Object_Name(object_id), 'unrelated to any other table', 2, '', ''
          	FROM sys.tables /* found a simpler way! */
          	WHERE ObjectPropertyEx(object_id, 'TableHasForeignKey') = 0	AND ObjectPropertyEx(object_id, 'TableHasForeignRef') = 0
            
		UNION ALL

			SELECT 'TABLE', Object_Name(sys.tables.object_id), 'not referenced by procedure, view or function', 2, '', ''
			FROM sys.tables /* table not referenced by any routine */
			LEFT OUTER JOIN sys.sql_expression_dependencies	ON referenced_id = sys.tables.object_id
			WHERE referenced_id IS NULL

		UNION ALL

			SELECT 'TABLE', Object_Name(sys.tables.object_id), 'can''t be indexed', 2, '', ''
			FROM sys.tables /* see whether the table has a primary key */
			WHERE ObjectProperty(object_id, 'IsIndexable') = 0
	        
		UNION ALL

			--APX1303 – Disabled foreign key
			SELECT DISTINCT 'FOREIGN KEY', Object_Name(parent_object_id), 'FK [' + name + '] is disabled', 3, 'https://www.sqlshack.com/commonly-used-sql-server-constraints-foreign-key-check-default/', ''
          	FROM sys.foreign_keys /* build script gone bad? */
          	WHERE is_disabled = 1

        UNION ALL

        	SELECT DISTINCT 'CONSTRAINT', Object_Name(parent_object_id), 'constraint [' + name + '] is disabled', 3, 'https://www.sqlshack.com/commonly-used-sql-server-constraints-foreign-key-check-default/', ''
          	FROM sys.check_constraints /* hmm. i wonder why */
          	WHERE is_disabled = 1

		UNION ALL

        	SELECT DISTINCT 'INDEX', Object_Name(object_id), 'index [' + name + '] is disabled', 3, '', ''
          	FROM sys.indexes /* don't leave these lying around */
          	WHERE is_disabled = 1
          	
		UNION ALL

        	SELECT DISTINCT 'INDEX', Object_Name(object_id), 'low Fill-Factor less than 80%', 3, '', ''
          	FROM sys.indexes /* a fill factor of less than 80 raises eyebrows */
          	WHERE fill_factor <> 0	AND fill_factor < 80	AND is_disabled = 0	AND is_hypothetical = 0

		UNION ALL

          	--Using too many indexes
       		SELECT 'INDEX', t.name, 'Using too many indexes', 2, '', ''
			FROM 	sys.indexes ind 
			INNER JOIN sys.tables t ON ind.object_id = t.object_id 
			GROUP BY t.name
			HAVING count(*) > 3
	
		UNION ALL

        	SELECT DISTINCT 'CONSTRAINT', Object_Name(parent_object_id), 'constraint [' + name + '] is untrusted', 3, 'https://www.sqlshack.com/commonly-used-sql-server-constraints-foreign-key-check-default/', ''
          	FROM sys.check_constraints /* ETL gone bad? */
          	WHERE is_not_trusted = 1

		UNION ALL

        	SELECT DISTINCT 'FOREIGN KEY', Object_Name(parent_object_id), 'FK [' + name + '] is untrusted', 3, '', ''
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

        UNION ALL 

			--APX1222 – Small (N)VARCHAR columns
			SELECT 'COLUMN', o.name , 'Using varchar(1) or varchar(2) in column [' + c.name + ']. Columns of short or fixed length should have a fixed size since variable-length types have a disproportionate storage overhead)', 3, 'https://docs.microsoft.com/en-us/sql/t-sql/data-types/char-and-varchar-transact-sql?view=sql-server-2017', 'ALTER TABLE ...'
			FROM sys.columns AS c
			INNER JOIN sys.objects AS o    ON c.[object_id] = o.[object_id]
			INNER JOIN sys.schemas AS s    ON o.[schema_id] = s.[schema_id]
			WHERE c.system_type_id IN (167, 231) -- varchar, nvarchar
				AND max_length  < 3
			--			SELECT [TableName], 'Using varchar(1) or varchar(2) in [' + ColumnName + '] (Columns of short or fixed length should have a fixed size since variable-length types have a disproportionate storage overhead)', 3
			--	        FROM _column_details_extended_property
			--	        WHERE TableType = 'COLUMN'
			--				AND DataType IN ('varchar', 'nvarchar' )
			--				AND MaxLength < 3

		UNION ALL

			--column has a collation different from the database', 3
			SELECT 'COLUMN', Object_Name(c.object_id), 'has a column ''[' + c.name + ']'' that has a collation ''' + collation_name + ''' different from the database', 3, '', ''
          	FROM sys.columns AS c
          	WHERE COALESCE(collation_name, '') <> DatabasePropertyEx(Db_Id(), 'Collation')

      	UNION ALL

			--BP022 - Avoid use of the MONEY and SMALLMONEY datatypes      	
      		SELECT 'COLUMN', t.name, 'possibility to loss precision due to rounding errors Using money/smallmoney in [' + c.name + '] (Using the DECIMAL data type instead)', 3, 'https://www.red-gate.com/hub/product-learning/sql-prompt/avoid-use-money-smallmoney-datatypes', ''
			FROM  sys.columns c
			JOIN sys.tables t	ON t.object_id = c.object_id
			WHERE type_name(user_type_id) in ('smallmoney', 'money')

      	UNION ALL

			--SQL CODE ANALYSIS - The Dangers of using Float or Real Datatypes      	
      		SELECT 'COLUMN', t.name, 'possibility to loss precision due to rounding errors Using float in [' + c.name + '] (Using the DECIMAL data type instead)', 3, 'https://www.red-gate.com/hub/product-learning/sql-prompt/the-dangers-of-using-float-or-real-datatypes?topic=sql-code-analysis', ''
			FROM  sys.columns c
			JOIN sys.tables t	ON t.object_id = c.object_id
			WHERE type_name(user_type_id) in ('float')
	        
      	UNION ALL

			--SQL CODE ANALYSIS - The Dangers of using Float or Real Datatypes      	
      		SELECT 'COLUMN', t.name, 'possibility to loss precision due to rounding errors Using real in [' + c.name + '] (Using the DECIMAL data type instead)', 3, 'https://www.red-gate.com/hub/product-learning/sql-prompt/the-dangers-of-using-float-or-real-datatypes?topic=sql-code-analysis', ''
			FROM  sys.columns c
			JOIN sys.tables t	ON t.object_id = c.object_id
			WHERE type_name(user_type_id) in ('real')
	        
		/*
		 * 
		 *	Deprecated features
		 */
		UNION ALL

			--APX1152 – Deprecated data types: TEXT, NTEXT and IMAGE		
          	SELECT 'COLUMN', Object_Name(t.object_id), 'field [' + c.name + '] is inadequate table storage (image)', 3 , 'https://docs.microsoft.com/en-us/previous-versions/sql/sql-server-2008/ms143729(v=sql.100)?redirectedfrom=MSDN', ''
          	FROM sys.columns c /* found a simpler way! */
          	LEFT JOIN sys.tables t ON c.object_id = t.object_id
          	WHERE ObjectPropertyEx(t.object_id, 'TableHasTextImage') = 1 AND  system_type_id IN (34)
				
		UNION ALL
	
			--APX1152 – Deprecated data types: TEXT, NTEXT and IMAGE		
			--DEP002 WRITETEXT,UPDATETEXT and READTEXT statements are deprecated.		
          	SELECT 'COLUMN', Object_Name(t.object_id), 'field [' + c.name + '] is deprecated LOB datatype (text/ntext)', 3, 'https://documentation.red-gate.com/scg/sql-code-analysis-documentation/sql-code-guard-ssms-2016-add-in-deprecated/sql-static-code-analysis-rules/deprecated-rules#Deprecatedrules-DEP002DEP002–WRITETEXT,UPDATETEXTandREADTEXTstatementsaredeprecated', ''
          	FROM sys.columns c /* found a simpler way! */
          	LEFT JOIN sys.tables t ON c.object_id = t.object_id
          	WHERE ObjectPropertyEx(t.object_id, 'TableHasTextImage') = 1 AND  system_type_id IN (35, 99)
          	

         /*
		 * 
		 *	QUERY
		 */
		UNION ALL

			--APX1230 – SET ROWCOUNT
			--MI008 QUOTED_IDENTIFIERS option inside stored procedure, trigger or function
        	SELECT 'TRIGGER', Object_Name(ta.object_id), 'trigger [' + Object_Name(tr.object_id) + '] has''nt got NOCOUNT ON', 2, '', ''
			FROM sys.tables AS ta /* Triggers lacking `SET NOCOUNT ON`, which can cause unexpected results WHEN USING OUTPUT */
			INNER JOIN sys.triggers 	AS tr ON tr.parent_id = ta.object_id
			INNER JOIN sys.sql_modules 	AS mo ON tr.object_id = mo.object_id
        	WHERE definition LIKE '%SET ROWCOUNT%'
	       
        	
		/*
		 * 
		 *	Maintenance
		 */
	   	UNION ALL

			--JMR
	        SELECT 'DATABASE', name, 'page_verify_option in [' + name + '] is disable', 4, 'https://docs.microsoft.com/pt-br/sql/relational-databases/policy-based-management/set-the-page-verify-database-option-to-checksum?view=sql-server-ver15', 'ALTER DATABASE [' + name + '] SET PAGE_VERIFY CHECKSUM;'
			FROM	sys.databases DB
			WHERE page_verify_option_desc <> 'CHECKSUM'

			
			
			
			
			
			
			
			

	    /*
		 * 
		 *	3-WARNING
		 */
		UNION ALL

			--Using too many or too few indexes
       		SELECT 'TABLE', Object_Name(sys.tables.object_id), 'No index at all', 2, '', ''
          	FROM sys.tables /* see whether the table has any index */
          	WHERE ObjectProperty(object_id, 'TableHasIndex') = 0

		UNION ALL

       		SELECT DISTINCT 'COLUMN', Object_Name(object_id), 'unintelligible column names', 2, '', ''
          	FROM sys.columns /* column names with no letters in them */
          	WHERE name COLLATE Latin1_General_CI_AI NOT LIKE '%[A-Z]%' COLLATE Latin1_General_CI_AI

		UNION ALL

			--Problems_with_Table_Design
        	SELECT DISTINCT 'COLUMN', Object_Name(object_id), 'non-compliant column names', 3, '', ''
          	FROM sys.columns /* column names that need delimiters*/
          	WHERE name COLLATE Latin1_General_CI_AI LIKE '%[^_@$#A-Z0-9]%' COLLATE Latin1_General_CI_AI


		UNION ALL

        	SELECT 'INDEX', Object_Name(Ic.object_id), Col_Name(Ic.object_id, Ic.column_id) + ' is a GUID in a clustered index', 2, '', '' /* GUID in a clustered IX */
          	FROM sys.index_columns AS Ic
			INNER JOIN sys.tables AS tables ON tables.object_id = Ic.object_id
            INNER JOIN sys.columns AS c ON c.object_id = Ic.object_id AND c.column_id = Ic.column_id
            INNER JOIN sys.types AS t ON t.system_type_id = c.system_type_id
            INNER JOIN sys.indexes AS i ON i.object_id = Ic.object_id AND i.index_id = Ic.index_id
          	WHERE t.name = 'uniqueidentifier'	AND i.type_desc = 'CLUSTERED'

		UNION ALL

			--Problems_with_Table_Design
        	SELECT DISTINCT 'TABLE', Object_Name(object_id), 'leftover fake index(es) (restos de índice(s) falso(s))', 2, '', ''
          	FROM sys.indexes /* don't leave these lying around */
          	WHERE is_hypothetical = 1
		/*
		 * 
		 *	1-INFO
		 */
	        
		UNION ALL

	        SELECT 'COLUMN', Object_Name(s.object_id), 'Undocumented table: it has no extended properties', 1, '', ''
	        FROM sys.objects AS s /* it has no extended properties */
	        LEFT OUTER JOIN sys.extended_properties AS ep ON s.object_id = ep.major_id AND minor_id = 0
	        WHERE type_desc = 'USER_TABLE' AND ep.value IS NULL


			
--	28/ Dont use Views with `ORDER BY`
--	29/ Triggers using `EXEC`, Don’t use EXEC to run dynamic SQL. It is there only for backward compatibility and is a commonly used vector for SQL injection
			
			
		INSERT INTO dbo._database_smells ( EvidenceOf, TypeObjectOf, ObjectName, Problem, Explication, Command )
			SELECT 
				CASE
				WHEN TypeEvidenceOf = 1 THEN 'info'
				WHEN TypeEvidenceOf = 2 THEN 'note'
				WHEN TypeEvidenceOf = 3 THEN 'warning'
				ELSE 'ERROR'
				END [EvidenceOf],
				[TypeObjectOf],
				[ObjectName],
				[Problem],
				[Explication], 
				[Command]
			FROM  ##TEMP t1
			WHERE [ObjectName] NOT IN ('_flyway_schema_history', '_column_details_extended_property', '_database_smells' )
			ORDER BY TypeEvidenceOf DESC, [ObjectName]


			IF @DisplayEvidence = 1
				SELECT TOP 200 * FROM dbo._database_smells		
			
			
		SELECT 	@Errors 	= (SELECT COUNT(*) FROM ##TEMP WHERE TypeEvidenceOf = 4 AND [ObjectName] NOT IN ('_flyway_schema_history', '_column_details_extended_property', '_database_smells' )),
				@Warnings 	= (SELECT COUNT(*) FROM ##TEMP WHERE TypeEvidenceOf = 3 AND [ObjectName] NOT IN ('_flyway_schema_history', '_column_details_extended_property', '_database_smells' ))
END
			
	--SELECT * FROM ##TEMP
          

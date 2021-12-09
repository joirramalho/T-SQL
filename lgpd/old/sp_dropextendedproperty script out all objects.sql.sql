--Note that if you do not specify any schema or table or view you will get all schemas with all their tables and views, by default. To limit the output, merely enter a comma-separated list of table or view objects for the variable "@TableViewListIN" . Similarly to restrict to a set of schemas, enter a comma-separated list of table or view objects for the variable "@SchemaListIN". Replacing 'Append' with 'Drop' will script drop statements for extended properties.
-----------------------------------------------------------------------
-- User-defined variables
-----------------------------------------------------------------------
DECLARE @SchemaListIN VARCHAR(4000)
DECLARE @TableViewListIN VARCHAR(4000)
DECLARE @DropAppend VARCHAR(15)
SET @SchemaListIN = ''
SET @TableViewListIN = ''
SET @DropAppend = 'Append'
-----------------------------------------------------------------------
-- Process variables
-----------------------------------------------------------------------
DECLARE @SchemaList VARCHAR(4000)
DECLARE @TableViewList VARCHAR(4000)
DECLARE @CharPosition int
SET @SchemaList = ''
SET @TableViewList = ''
-----------------------------------------------------------------------
-- Start the process:
IF OBJECT_ID('tempdb..#ModifyDrop') IS NOT NULL
DROP TABLE tempdb..#ModifyDrop
CREATE TABLE #ModifyDrop (PrimaryObjectType VARCHAR(25), SecondaryObjectType VARCHAR(25), SchemaName NVARCHAR(128), PrimaryObjectName NVARCHAR(128), SecondaryObjectName NVARCHAR(128), Classification NVARCHAR(128), DescriptionText NVARCHAR(1700), SQLText NVARCHAR(2500))
-----------------------------------------------------------------------
-- Parse list of schemas to process / get list of schemas according to types required
-----------------------------------------------------------------------
IF OBJECT_ID('tempdb..#SchemaList') IS NOT NULL
DROP TABLE tempdb..#SchemaList
CREATE TABLE #SchemaList (SchemaName VARCHAR(128)) -- Used to hold list of schemata to process
IF @SchemaListIN <> '' -- See if there is a list of columns to process
BEGIN
-- Process list
SET @SchemaList = @SchemaListIN + ','
SET @CharPosition = 0
WHILE CHARINDEX(',', @SchemaList) > 0
 BEGIN
 SET @CharPosition = CHARINDEX(',', @SchemaList)
 INSERT INTO #SchemaList (SchemaName) VALUES (LTRIM(RTRIM(LEFT(@SchemaList, @CharPosition - 1))))
 SET @SchemaList = STUFF(@SchemaList, 1, @CharPosition, '')

 END -- While loop
END -- If test for list of schema names
ELSE
BEGIN -- Use all schema names, to avoid filtering
 INSERT INTO #SchemaList (SchemaName)
 SELECT [name] 
 FROM [sys].[schemas]
 WHERE schema_id < 16000
END -- Else test to get all schema names
-----------------------------------------------------------------------
-- Parse list of schemas to process / get list of schemas according to types required
-----------------------------------------------------------------------
IF OBJECT_ID('tempdb..#TableViewList') IS NOT NULL
DROP TABLE tempdb..#TableViewList
CREATE TABLE #TableViewList (TableViewName VARCHAR(128)) -- Used to hold list of tables & views to process
IF @TableViewListIN <> '' -- See if there is a list of columns to process
BEGIN
-- Process list
SET @TableViewList = @TableViewListIN + ','
SET @CharPosition = 0
WHILE CHARINDEX(',', @TableViewList) > 0
 BEGIN
 SET @CharPosition = CHARINDEX(',', @TableViewList)
 INSERT INTO #TableViewList (TableViewName) VALUES (LTRIM(RTRIM(LEFT(@TableViewList, @CharPosition - 1))))
 SET @TableViewList = STUFF(@TableViewList, 1, @CharPosition, '')

 END -- While loop
END -- If test for list of TableView names
ELSE
BEGIN -- Use all TableView names, to avoid filtering
 INSERT INTO #TableViewList (TableViewName)
 SELECT OBJ.[name] 
 FROM sys.objects OBJ
 WHERE OBJ.type_desc IN ('USER_TABLE','VIEW')
END -- Else test to get all TableView names
-----------------------------------------------------------------------
-- Table or View objects
-----------------------------------------------------------------------
INSERT INTO #ModifyDrop (PrimaryObjectType, SecondaryObjectType, SchemaName, PrimaryObjectName, SecondaryObjectName, Classification, DescriptionText)
SELECT 
CASE
WHEN OBJ.type_desc = 'USER_TABLE' THEN 'Table'
WHEN OBJ.type_desc = 'VIEW' THEN 'View'
END AS PrimaryObjectType
,CAST(NULL AS VARCHAR(25)) AS SecondaryObjectType
,SCH.name AS SchemaName
,OBJ.name AS PrimaryObjectName
,CAST(NULL AS VARCHAR(25)) AS SecondaryObjectName
,SEP.name AS Classification
,CAST(SEP.value AS NVARCHAR(1700)) AS DescriptionText
FROM sys.extended_properties SEP
 INNER JOIN sys.objects OBJ
 ON SEP.major_id = OBJ.object_id 
 INNER JOIN sys.schemas SCH
 ON OBJ.schema_id = SCH.schema_id
 INNER JOIN #SchemaList tmpSCH
 ON tmpSCH.SchemaName = SCH.name
 INNER JOIN #TableViewList tmpTbv
 ON tmpTbv.TableViewName = OBJ.name
WHERE (SEP.minor_id = 0 AND SEP.class_desc = N'OBJECT_OR_COLUMN' AND OBJ.type_desc IN ('USER_TABLE','VIEW'))
 AND SEP.name NOT LIKE 'MS_%'
-----------------------------------------------------------------------
-- Column objects
-----------------------------------------------------------------------
INSERT INTO #ModifyDrop (PrimaryObjectType, SecondaryObjectType, SchemaName, PrimaryObjectName, SecondaryObjectName, Classification, DescriptionText)
SELECT 
CASE
WHEN OBJ.type_desc = N'USER_TABLE' THEN 'Table'
WHEN OBJ.type_desc = N'VIEW' THEN 'View'
END AS PrimaryObjectType
,'Column' AS SecondaryObjectType
,SCH.name AS SchemaName
,OBJ.name AS PrimaryObjectName
,COL.name AS SecondaryObjectName
,SEP.name AS Classification
,CAST(SEP.value AS NVARCHAR(1700)) AS DescriptionText
FROM sys.objects OBJ
 INNER JOIN sys.columns COL
 ON OBJ.object_id = COL.object_id 
 INNER JOIN sys.extended_properties SEP
 ON COL.object_id = SEP.major_id 
 AND COL.column_id = SEP.minor_id 
 INNER JOIN sys.schemas SCH
 ON OBJ.schema_id = SCH.schema_id
 INNER JOIN #SchemaList tmpSCH
 ON tmpSCH.SchemaName = SCH.name
 INNER JOIN #TableViewList tmpTbv
 ON tmpTbv.TableViewName = OBJ.name
WHERE OBJ.type_desc = N'USER_TABLE'
 OR OBJ.type_desc = N'VIEW'
-----------------------------------------------------------------------
-- Index objects
-----------------------------------------------------------------------
INSERT INTO #ModifyDrop (PrimaryObjectType, SecondaryObjectType, SchemaName, PrimaryObjectName, SecondaryObjectName, Classification, DescriptionText)
SELECT 
CASE
WHEN OBJ.type_desc = N'USER_TABLE' THEN 'Table'
WHEN OBJ.type_desc = N'VIEW' THEN 'View'
END AS PrimaryObjectType
,'Index' AS SecondaryObjectType
,SCH.name AS SchemaName
,OBJ.name AS PrimaryObjectName
,SIX.name AS SecondaryObjectName
,SEP.name AS Classification
,CAST(SEP.value AS NVARCHAR(1700)) AS DescriptionText
FROM sys.objects OBJ
 INNER JOIN sys.schemas SCH
 ON OBJ.schema_id = SCH.schema_id 
 INNER JOIN sys.indexes SIX
 ON OBJ.object_id = SIX.object_id 
 INNER JOIN sys.extended_properties SEP
 ON SIX.object_id = SEP.major_id 
 AND SIX.index_id = SEP.minor_id
 INNER JOIN #SchemaList tmpSCH
 ON tmpSCH.SchemaName = SCH.name
 INNER JOIN #TableViewList tmpTbv
 ON tmpTbv.TableViewName = OBJ.name
WHERE SEP.class_desc = N'INDEX'
-----------------------------------------------------------------------
-- Constraints
-----------------------------------------------------------------------
INSERT INTO #ModifyDrop (PrimaryObjectType, SecondaryObjectType, SchemaName, PrimaryObjectName, SecondaryObjectName, Classification, DescriptionText)
SELECT 
CASE
WHEN OBJ.type_desc = N'USER_TABLE' THEN 'Table'
WHEN OBJ.type_desc = N'VIEW' THEN 'View'
END AS PrimaryObjectType
,'Constraint' AS SecondaryObjectType
,SCH.name AS SchemaName
,OBJ.name AS PrimaryObjectName
,OBJ_1.name AS SecondaryObjectName
,SEP.name AS Classification
,CAST(SEP.value AS NVARCHAR(1700)) AS DescriptionText
FROM sys.objects OBJ
 INNER JOIN sys.objects AS OBJ_1 
 ON OBJ.object_id = OBJ_1.parent_object_id 
 INNER JOIN sys.schemas SCH
 ON OBJ.schema_id = SCH.schema_id
 INNER JOIN sys.extended_properties SEP
 ON OBJ_1.object_id = SEP.major_id
 INNER JOIN #SchemaList tmpSCH
 ON tmpSCH.SchemaName = SCH.name
 INNER JOIN #TableViewList tmpTbv
 ON tmpTbv.TableViewName = OBJ.name
WHERE OBJ_1.type_desc IN ('DEFAULT_CONSTRAINT','FOREIGN_KEY_CONSTRAINT','PRIMARY_KEY_CONSTRAINT','UNIQUE_CONSTRAINT')
-----------------------------------------------------------------------
-- Stored Procedures and Functions
-----------------------------------------------------------------------
INSERT INTO #ModifyDrop (PrimaryObjectType, SecondaryObjectType, SchemaName, PrimaryObjectName, SecondaryObjectName, Classification, DescriptionText)
SELECT 
CASE
WHEN OBJ.type_desc = 'SQL_STORED_PROCEDURE' THEN 'Procedure'
WHEN OBJ.type_desc = 'SQL_SCALAR_FUNCTION' THEN 'Function'
END AS PrimaryObjectType
,CAST(NULL AS VARCHAR(25)) AS SecondaryObjectType
,SCH.name AS SchemaName
,OBJ.name AS PrimaryObjectName
,CAST(NULL AS VARCHAR(25)) AS SecondaryObjectName
,SEP.name AS Classification
,CAST(SEP.value AS NVARCHAR(1700)) AS DescriptionText
FROM sys.objects OBJ
 INNER JOIN sys.schemas SCH
 ON OBJ.schema_id = SCH.schema_id
 INNER JOIN sys.extended_properties SEP
 ON OBJ.object_id = SEP.major_id
 INNER JOIN #SchemaList tmpSCH
 ON tmpSCH.SchemaName = SCH.name
WHERE OBJ.type_desc IN ('SQL_STORED_PROCEDURE','SQL_SCALAR_FUNCTION')
-----------------------------------------------------------------------
-- Output
-----------------------------------------------------------------------
IF @DropAppend = 'Append'
BEGIN
 UPDATE #ModifyDrop
 SET SQLText = 
 CASE
 WHEN PrimaryObjectType IN ('Table','View','Procedure','Function') AND SecondaryObjectType IS NULL THEN 'sp_updateextendedproperty @name = N''' + Classification + ''', @level0type = N''Schema'', @level0name = [' + SchemaName + '], @level1type = N''' + PrimaryObjectType + ''', @level1name = [' + PrimaryObjectName + '], @value = ''' + DescriptionText + ''';'
 WHEN SecondaryObjectType IN ('Column','Index','ForeignKey','Default', 'PrimaryKey', 'UniqueConstraint') THEN 'sp_updateextendedproperty @name = N''' + Classification + ''', @level0type = N''Schema'', @level0name = [' + SchemaName + '], @level1type = N''' + PrimaryObjectType + ''', @level1name = [' + PrimaryObjectName + '], @level2type = N''' + ISNULL(SecondaryObjectType,'') + ''', @level2name = [' + ISNULL(SecondaryObjectName,'') + '], @value = ''' + DescriptionText + ''';'
 END
END
ELSE
BEGIN
 UPDATE #ModifyDrop
 SET SQLText = 
 CASE
 WHEN PrimaryObjectType IN ('Table','View','Procedure','Function') AND SecondaryObjectType IS NULL THEN 'sp_dropextendedproperty @name = N''' + Classification + ''', @level0type = N''Schema'', @level0name = [' + SchemaName + '], @level1type = N''' + PrimaryObjectType + ''', @level1name = [' + PrimaryObjectName + '];'
 WHEN SecondaryObjectType IN ('Column','Index','ForeignKey','Default', 'PrimaryKey', 'UniqueConstraint') THEN 'sp_dropextendedproperty @name = N''' + Classification + ''', @level0type = N''Schema'', @level0name = [' + SchemaName + '], @level1type = N''' + PrimaryObjectType + ''', @level1name = [' + PrimaryObjectName + '], @level2type = N''' + ISNULL(SecondaryObjectType,'') + ''', @level2name = [' + ISNULL(SecondaryObjectName,'') + '];'
 END
END
SELECT SQLText FROM #ModifyDrop
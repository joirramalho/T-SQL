CREATE VIEW dbo.v_Missing_Index_Details
AS
SELECT
	Missing_Index_Details_Create_Datetime,
	[Database_Name],
	REVERSE(SUBSTRING(REVERSE(Missing_Index_Details.Table_Name), 2, (CHARINDEX('[', REVERSE(Missing_Index_Details.Table_Name), 2)) - 2)) AS Table_Name,
	'CREATE NONCLUSTERED INDEX [missing_index_'	+ CONVERT (VARCHAR, Missing_Index_Details.Index_Group_Handle) + '_'	+ CONVERT (VARCHAR, Missing_Index_Details.Index_Handle) + '_' +
		LEFT(PARSENAME(REVERSE(SUBSTRING(REVERSE(Missing_Index_Details.Table_Name), 2, (CHARINDEX('[', REVERSE(Missing_Index_Details.Table_Name), 2)) - 2)), 1), 32) + ']' + ' ON ' + REVERSE(SUBSTRING(REVERSE(Missing_Index_Details.Table_Name), 2, (CHARINDEX('[', REVERSE(Missing_Index_Details.Table_Name), 2)) - 2)) +
		' (' + ISNULL(Missing_Index_Details.Equality_Columns, '') + CASE WHEN Missing_Index_Details.Equality_Columns IS NOT NULL
																	 AND Missing_Index_Details.Inequality_Columns IS NOT NULL
																		THEN ','
																	 ELSE ''
																END + 
		ISNULL(Missing_Index_Details.Inequality_Columns, '') + ')' + ISNULL(' INCLUDE (' + Missing_Index_Details.Include_Columns + ')', '') AS Index_Creation_Statement,
	Missing_Index_Details.Avg_Total_User_Cost * (Missing_Index_Details.Avg_User_Impact / 100.0) * Missing_Index_Details.User_Seeks AS Improvement_Measure,
	Equality_Columns,
	Inequality_Columns,
	Include_Columns,
	ISNULL(LEN(Missing_Index_Details.Equality_Columns) - LEN(REPLACE(Missing_Index_Details.Equality_Columns, '[', '')), 0) AS Equality_Column_Count,
	ISNULL(LEN(Missing_Index_Details.Inequality_Columns) - LEN(REPLACE(Missing_Index_Details.Inequality_Columns, '[', '')), 0) AS Inequality_Column_Count,
	ISNULL(LEN(Missing_Index_Details.Include_Columns) - LEN(REPLACE(Missing_Index_Details.Include_Columns, '[', '')), 0) AS Included_Column_Count,
	Last_User_Seek,
	User_Seeks,
	Index_Group_Handle,
	Index_Handle
FROM dbo.Missing_Index_Details
GO
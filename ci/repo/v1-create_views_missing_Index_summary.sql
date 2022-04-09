CREATE VIEW dbo.v_Missing_Index_Summary
AS
SELECT
	[Database_Name],
	REVERSE(SUBSTRING(REVERSE(Missing_Index_Summary.Table_Name), 2, (CHARINDEX('[', REVERSE(Missing_Index_Summary.Table_Name), 2)) - 2)) AS Table_Name,
	'CREATE NONCLUSTERED INDEX [missing_index_'	+ CONVERT (VARCHAR, Missing_Index_Summary.Missing_Index_Summary_Id) + '_' +
		LEFT(PARSENAME(REVERSE(SUBSTRING(REVERSE(Missing_Index_Summary.Table_Name), 2, (CHARINDEX('[', REVERSE(Missing_Index_Summary.Table_Name), 2)) - 2)), 1), 32) + ']' + ' ON ' + REVERSE(SUBSTRING(REVERSE(Missing_Index_Summary.Table_Name), 2, (CHARINDEX('[', REVERSE(Missing_Index_Summary.Table_Name), 2)) - 2)) +
		' (' + Missing_Index_Summary.Equality_Columns + CASE WHEN Missing_Index_Summary.Equality_Columns <> ''
																	 AND Missing_Index_Summary.Inequality_Columns <> ''
																		THEN ','
																	 ELSE ''
																END + 
		ISNULL(Missing_Index_Summary.Inequality_Columns, '') + ')' + CASE WHEN Missing_Index_Summary.Include_Columns = ''
																		THEN ''
																		ELSE ' INCLUDE (' + Missing_Index_Summary.Include_Columns + ')'
																	 END AS Index_Creation_Statement,
	Missing_Index_Summary.Avg_Total_User_Cost * (Missing_Index_Summary.Avg_User_Impact / 100.0) * Missing_Index_Summary.User_Seeks AS Improvement_Measure,
	Missing_Index_Summary.Equality_Columns,
	Missing_Index_Summary.Inequality_Columns,
	Missing_Index_Summary.Include_Columns,
	ISNULL(LEN(Missing_Index_Summary.Equality_Columns) - LEN(REPLACE(Missing_Index_Summary.Equality_Columns, '[', '')), 0) AS Equality_Column_Count,
	ISNULL(LEN(Missing_Index_Summary.Inequality_Columns) - LEN(REPLACE(Missing_Index_Summary.Inequality_Columns, '[', '')), 0) AS Inequality_Column_Count,
	ISNULL(LEN(Missing_Index_Summary.Include_Columns) - LEN(REPLACE(Missing_Index_Summary.Include_Columns, '[', '')), 0) AS Included_Column_Count,
	Missing_Index_Summary.First_Index_Suggestion_Time,
	Missing_Index_Summary.Last_User_Seek,
	Missing_Index_Summary.User_Seeks
FROM dbo.Missing_Index_Summary
GO
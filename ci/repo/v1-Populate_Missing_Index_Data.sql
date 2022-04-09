USE dbLogMonitor
GO

CREATE PROCEDURE dbo.Populate_Missing_Index_Data
	@Retention_Period_for_Detail_Data_Days SMALLINT = 30,

	@Delete_All_Summary_Data BIT = 0
AS
BEGIN
	SET NOCOUNT ON;
 
	DELETE Missing_Index_Details
	FROM dbo.Missing_Index_Details
	WHERE Missing_Index_Details.Last_User_Seek < DATEADD(DAY, -1 * @Retention_Period_for_Detail_Data_Days, CURRENT_TIMESTAMP);
 
	IF @Delete_All_Summary_Data = 1
	BEGIN
		TRUNCATE TABLE dbo.Missing_Index_Summary;
	END
 
	DECLARE @Last_Seek_Time DATETIME;
	SELECT
		@Last_Seek_Time = MAX(Missing_Index_Details.Last_User_Seek)
	FROM dbo.Missing_Index_Details;
	IF @Last_Seek_Time IS NULL
	BEGIN
		SELECT @Last_Seek_Time = DATEADD(WEEK, -1, CURRENT_TIMESTAMP);
	END
 
	SELECT
		databases.name AS [Database_Name],
		dm_db_missing_index_details.statement AS Table_Name,
		dm_db_missing_index_details.Equality_Columns,
		dm_db_missing_index_details.Inequality_Columns,
		dm_db_missing_index_details.Included_Columns AS Include_Columns,
		dm_db_missing_index_group_stats.Last_User_Seek,
		dm_db_missing_index_group_stats.Avg_Total_User_Cost,
		dm_db_missing_index_group_stats.Avg_User_Impact,
		dm_db_missing_index_group_stats.User_Seeks,
		dm_db_missing_index_groups.Index_Group_Handle,
		dm_db_missing_index_groups.Index_Handle
	INTO #Missing_Index_Details
	FROM sys.dm_db_missing_index_groups
	INNER JOIN sys.dm_db_missing_index_group_stats
	ON dm_db_missing_index_group_stats.group_handle = dm_db_missing_index_groups.index_group_handle
	INNER JOIN sys.dm_db_missing_index_details
	ON dm_db_missing_index_groups.index_handle = dm_db_missing_index_details.index_handle
	INNER JOIN sys.databases
	ON databases.database_id = dm_db_missing_index_details.database_id
	WHERE dm_db_missing_index_group_stats.Last_User_Seek > @Last_Seek_Time;
 
	INSERT INTO dbo.Missing_Index_Details
		(Missing_Index_Details_Create_Datetime, [Database_Name], Table_Name, Equality_Columns, Inequality_Columns, Include_Columns, Last_User_Seek,
		 Avg_Total_User_Cost, Avg_User_Impact, User_Seeks, Index_Group_Handle, Index_Handle)
	SELECT
		CURRENT_TIMESTAMP AS Missing_Index_Details_Create_Datetime,
		[Database_Name],
		Table_Name,
		Equality_Columns,
		Inequality_Columns,
		Include_Columns,
		Last_User_Seek,
		Avg_Total_User_Cost,
		Avg_User_Impact,
		User_Seeks,
		Index_Group_Handle,
		Index_Handle
	FROM #Missing_Index_Details;
 
	MERGE INTO dbo.Missing_Index_Summary AS Index_Summary_Target
	USING (SELECT [Database_Name], Table_Name, ISNULL(Equality_Columns, '') AS Equality_Columns, ISNULL(Inequality_Columns, '') AS Inequality_Columns, ISNULL(Include_Columns, '') AS Include_Columns, MAX(Last_User_Seek) AS Last_User_Seek,
				  AVG(Avg_Total_User_Cost) AS Avg_Total_User_Cost, AVG(Avg_User_Impact) AS Avg_User_Impact, SUM(User_Seeks) AS User_Seeks
				  FROM #Missing_Index_Details GROUP BY [Database_Name], Table_Name, Equality_Columns, Inequality_Columns, Include_Columns) AS Index_Summary_Source
	ON (Index_Summary_Source.Database_Name = Index_Summary_Target.Database_Name
		AND Index_Summary_Source.Table_Name = Index_Summary_Target.Table_Name
		AND Index_Summary_Source.Equality_Columns = Index_Summary_Target.Equality_Columns
		AND Index_Summary_Source.Inequality_Columns = Index_Summary_Target.Inequality_Columns
		AND Index_Summary_Source.Include_Columns = Index_Summary_Target.Include_Columns)
	WHEN MATCHED
		THEN UPDATE
			SET Last_User_Seek = Index_Summary_Source.Last_User_Seek,
				User_Seeks = CASE 
								  WHEN Index_Summary_Source.User_Seeks = Index_Summary_Target.User_Seeks_Last_Update
										THEN Index_Summary_Target.User_Seeks
							  	  WHEN Index_Summary_Source.User_Seeks >= Index_Summary_Target.User_Seeks
										THEN Index_Summary_Source.User_Seeks + Index_Summary_Target.User_Seeks - Index_Summary_Target.User_Seeks_Last_Update
								  WHEN Index_Summary_Source.User_Seeks < Index_Summary_Target.User_Seeks
								  AND Index_Summary_Source.User_Seeks < Index_Summary_Target.User_Seeks_Last_Update
										THEN Index_Summary_Target.User_Seeks + Index_Summary_Source.User_Seeks
								  WHEN Index_Summary_Source.User_Seeks < Index_Summary_Target.User_Seeks
								  AND Index_Summary_Source.User_Seeks > Index_Summary_Target.User_Seeks_Last_Update
										THEN Index_Summary_Source.User_Seeks + Index_Summary_Target.User_Seeks - Index_Summary_Target.User_Seeks_Last_Update
							 END,
				User_Seeks_Last_Update = Index_Summary_Source.User_Seeks,
				Avg_Total_User_Cost = Index_Summary_Source.Avg_Total_User_Cost,
				Avg_User_Impact = Index_Summary_Source.Avg_User_Impact
	WHEN NOT MATCHED BY TARGET
		THEN INSERT
			VALUES (Index_Summary_Source.[Database_Name], Index_Summary_Source.Table_Name, Index_Summary_Source.Equality_Columns, Index_Summary_Source.Inequality_Columns,
					Index_Summary_Source.Include_Columns, CURRENT_TIMESTAMP, Index_Summary_Source.Last_User_Seek, Index_Summary_Source.Avg_Total_User_Cost,
					Index_Summary_Source.Avg_User_Impact, Index_Summary_Source.User_Seeks, Index_Summary_Source.User_Seeks);
 
	DROP TABLE #Missing_Index_Details;
END
 
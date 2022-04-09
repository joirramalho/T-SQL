USE dbLogMonitor
GO

IF EXISTS (SELECT * FROM sys.procedures WHERE procedures.name = 'Populate_Index_Utilization_Data')
BEGIN
	DROP PROCEDURE dbo.Populate_Index_Utilization_Data;
END
GO
 
/*	This stored procedure is intended to run semi-regularly (every 4-6 hours is likely sufficient) and will populate the table dbo.Missing_Index_Details
	with missing index data from the appropriate DMVs. This information can then be used in researching which indexes are not used, underused,
	or misused.
*/
CREATE PROCEDURE dbo.Populate_Index_Utilization_Data
	@Retention_Period_for_Detail_Data_Days TINYINT = 30,
	@Truncate_All_Summary_Data BIT = 0
AS
BEGIN
	SET NOCOUNT ON;
 
	-- Remove old detail data based on the proc parameter. There is little need to save this data long-term.
	DELETE Index_Utiliztion_Details
	FROM dbo.Index_Utiliztion_Details
	WHERE Index_Utiliztion_Details.Index_Utiliztion_Details_Create_Datetime < DATEADD(DAY, -1 * @Retention_Period_for_Detail_Data_Days, CURRENT_TIMESTAMP);
 
	IF @Truncate_All_Summary_Data = 1
	BEGIN
		TRUNCATE TABLE Index_Utiliztion_Summary;
	END
 
	DECLARE @Database_List TABLE
		(	[Database_Name] SYSNAME NOT NULL,
			Is_Processed BIT NOT NULL);
 
	DECLARE @Sql_Command NVARCHAR(MAX);
	DECLARE @Current_Database_Name SYSNAME;
 
	INSERT INTO @Database_List
		([Database_Name], Is_Processed)
	SELECT
		databases.name AS [Database_Name],
		0 AS Is_Processed
	FROM sys.databases
	WHERE databases.name NOT IN ('master', 'msdb', 'model', 'tempdb', 'ReportServerTempDB', 'ReportServer') and state = 0;
 
	CREATE TABLE #Index_Utiliztion_Details
	(	Index_Utiliztion_Details_Create_Datetime DATETIME NOT NULL,
		[Database_Name] SYSNAME,
		[Schema_Name] SYSNAME,
		Table_Name SYSNAME,
		Index_Name SYSNAME,
		User_Seek_Count BIGINT,
		User_Scan_Count BIGINT,
		User_Lookup_Count BIGINT,
		User_Update_Count BIGINT,
		Last_User_Seek DATETIME,
		Last_User_Scan DATETIME,
		Last_User_Lookup DATETIME,
		Last_User_Update DATETIME	);
 
	WHILE EXISTS (SELECT * FROM @Database_List Database_List WHERE Database_List.Is_Processed = 0)
	BEGIN
		SELECT TOP 1
			@Current_Database_Name = Database_List.[Database_Name]
		FROM @Database_List Database_List
		WHERE Database_List.Is_Processed = 0
 
		SELECT
			@Sql_Command = 
			'	USE [' + @Current_Database_Name + ']
				INSERT INTO #Index_Utiliztion_Details
					(Index_Utiliztion_Details_Create_Datetime, [Database_Name], [Schema_Name], Table_Name, Index_Name, User_Seek_Count,
					 User_Scan_Count, User_Lookup_Count, User_Update_Count, Last_User_Seek, Last_User_Scan, Last_User_Lookup, Last_User_Update)
				SELECT
					CURRENT_TIMESTAMP AS Index_Utiliztion_Details_Create_Datetime,
					''' + @Current_Database_Name + ''' AS [Database_Name],
					schemas.name AS [Schema_Name],
					tables.name AS Table_Name,
					indexes.name AS Index_Name,
					dm_db_index_usage_stats.user_seeks AS User_Seek_Count,
					dm_db_index_usage_stats.user_scans AS User_Scan_Count,
					dm_db_index_usage_stats.user_lookups AS User_Lookup_Count,
					dm_db_index_usage_stats.user_updates AS User_Update_Count,
					dm_db_index_usage_stats.last_user_seek AS Last_User_Seek,
					dm_db_index_usage_stats.last_user_scan AS Last_User_Scan,
					dm_db_index_usage_stats.last_user_lookup AS Last_User_Lookup,
					dm_db_index_usage_stats.last_user_update AS Last_User_Update
				FROM ' + @Current_Database_Name + '.sys.dm_db_index_usage_stats
				INNER JOIN ' + @Current_Database_Name + '.sys.indexes
				ON indexes.object_id = dm_db_index_usage_stats.object_id
				AND indexes.index_id = dm_db_index_usage_stats.index_id
				INNER JOIN ' + @Current_Database_Name + '.sys.tables
				ON tables.object_id = indexes.object_id
				INNER JOIN ' + @Current_Database_Name + '.sys.schemas
				ON schemas.schema_id = tables.schema_id
				WHERE indexes.name IS NOT NULL AND dm_db_index_usage_stats.database_id = (SELECT DB_ID(''' + @Current_Database_Name + '''));';
		
		EXEC sp_executesql @Sql_Command;
 
		UPDATE Database_List
			SET Is_Processed = 1
		FROM @Database_List Database_List
		WHERE [Database_Name] = @Current_Database_Name;
	END
 
	INSERT INTO dbo.Index_Utiliztion_Details
		(Index_Utiliztion_Details_Create_Datetime, [Database_Name], [Schema_Name], Table_Name, Index_Name, User_Seek_Count,
	 	 User_Scan_Count, User_Lookup_Count, User_Update_Count, Last_User_Seek, Last_User_Scan, Last_User_Lookup, Last_User_Update)
	SELECT
		*
	FROM #Index_Utiliztion_Details;
 
	MERGE INTO dbo.Index_Utiliztion_Summary AS Utilization_Target
	USING (	SELECT
				*
			FROM #Index_Utiliztion_Details	) AS Utilization_Source
	ON (	Utilization_Target.[Database_Name] = Utilization_Source.[Database_Name]
			AND Utilization_Target.[Schema_Name] = Utilization_Source.[Schema_Name]
			AND Utilization_Target.Table_Name = Utilization_Source.Table_Name
			AND Utilization_Target.Index_Name = Utilization_Source.Index_Name	)
	WHEN MATCHED
		THEN UPDATE
			SET User_Seek_Count = CASE 
									 WHEN Utilization_Source.User_Seek_Count = Utilization_Target.User_Seek_Count_Last_Update
										THEN Utilization_Target.User_Seek_Count
							 		 WHEN Utilization_Source.User_Seek_Count >= Utilization_Target.User_Seek_Count
										THEN Utilization_Source.User_Seek_Count + Utilization_Target.User_Seek_Count - Utilization_Target.User_Seek_Count_Last_Update
									 WHEN Utilization_Source.User_Seek_Count < Utilization_Target.User_Seek_Count
									 AND Utilization_Source.User_Seek_Count < Utilization_Target.User_Seek_Count_Last_Update
										THEN Utilization_Target.User_Seek_Count + Utilization_Source.User_Seek_Count
									 WHEN Utilization_Source.User_Seek_Count < Utilization_Target.User_Seek_Count
									 AND Utilization_Source.User_Seek_Count > Utilization_Target.User_Seek_Count_Last_Update
										THEN Utilization_Source.User_Seek_Count + Utilization_Target.User_Seek_Count - Utilization_Target.User_Seek_Count_Last_Update
								 END,
				User_Scan_Count = CASE 
									 WHEN Utilization_Source.User_Scan_Count = Utilization_Target.User_Scan_Count_Last_Update
										THEN Utilization_Target.User_Scan_Count
							 		 WHEN Utilization_Source.User_Scan_Count >= Utilization_Target.User_Scan_Count
										THEN Utilization_Source.User_Scan_Count + Utilization_Target.User_Scan_Count - Utilization_Target.User_Scan_Count_Last_Update
									 WHEN Utilization_Source.User_Scan_Count < Utilization_Target.User_Scan_Count
									 AND Utilization_Source.User_Scan_Count < Utilization_Target.User_Scan_Count_Last_Update
										THEN Utilization_Target.User_Scan_Count + Utilization_Source.User_Scan_Count
									 WHEN Utilization_Source.User_Scan_Count < Utilization_Target.User_Scan_Count
									 AND Utilization_Source.User_Scan_Count > Utilization_Target.User_Scan_Count_Last_Update
										THEN Utilization_Source.User_Scan_Count + Utilization_Target.User_Scan_Count - Utilization_Target.User_Scan_Count_Last_Update
								 END,
				User_Lookup_Count = CASE 
									 WHEN Utilization_Source.User_Lookup_Count = Utilization_Target.User_Lookup_Count_Last_Update
										THEN Utilization_Target.User_Lookup_Count
							 		 WHEN Utilization_Source.User_Lookup_Count >= Utilization_Target.User_Lookup_Count
										THEN Utilization_Source.User_Lookup_Count + Utilization_Target.User_Lookup_Count - Utilization_Target.User_Lookup_Count_Last_Update
									 WHEN Utilization_Source.User_Lookup_Count < Utilization_Target.User_Lookup_Count
									 AND Utilization_Source.User_Lookup_Count < Utilization_Target.User_Lookup_Count_Last_Update
										THEN Utilization_Target.User_Lookup_Count + Utilization_Source.User_Lookup_Count
									 WHEN Utilization_Source.User_Lookup_Count < Utilization_Target.User_Lookup_Count
									 AND Utilization_Source.User_Lookup_Count > Utilization_Target.User_Lookup_Count_Last_Update
										THEN Utilization_Source.User_Lookup_Count + Utilization_Target.User_Lookup_Count - Utilization_Target.User_Lookup_Count_Last_Update
								 END,
				User_Update_Count = CASE 
									 WHEN Utilization_Source.User_Update_Count = Utilization_Target.User_Update_Count_Last_Update
										THEN Utilization_Target.User_Update_Count
							 		 WHEN Utilization_Source.User_Update_Count >= Utilization_Target.User_Update_Count
										THEN Utilization_Source.User_Update_Count + Utilization_Target.User_Update_Count - Utilization_Target.User_Update_Count_Last_Update
									 WHEN Utilization_Source.User_Update_Count < Utilization_Target.User_Update_Count
									 AND Utilization_Source.User_Update_Count < Utilization_Target.User_Update_Count_Last_Update
										THEN Utilization_Target.User_Update_Count + Utilization_Source.User_Update_Count
									 WHEN Utilization_Source.User_Update_Count < Utilization_Target.User_Update_Count
									 AND Utilization_Source.User_Update_Count > Utilization_Target.User_Update_Count_Last_Update
										THEN Utilization_Source.User_Update_Count + Utilization_Target.User_Update_Count - Utilization_Target.User_Update_Count_Last_Update
								 END,
				Last_User_Seek = CASE
									WHEN Utilization_Source.Last_User_Seek IS NULL THEN Utilization_Target.Last_User_Seek
									WHEN Utilization_Source.Last_User_Seek < Utilization_Target.Last_User_Seek THEN Utilization_Target.Last_User_Seek
									ELSE Utilization_Source.Last_User_Seek
								 END,
				Last_User_Scan = CASE
									WHEN Utilization_Source.Last_User_Scan IS NULL THEN Utilization_Target.Last_User_Scan
									WHEN Utilization_Source.Last_User_Scan < Utilization_Target.Last_User_Scan THEN Utilization_Target.Last_User_Scan
									ELSE Utilization_Source.Last_User_Scan
								 END,
				Last_User_Lookup = CASE
									WHEN Utilization_Source.Last_User_Lookup IS NULL THEN Utilization_Target.Last_User_Lookup
									WHEN Utilization_Source.Last_User_Lookup < Utilization_Target.Last_User_Lookup THEN Utilization_Target.Last_User_Lookup
									ELSE Utilization_Source.Last_User_Lookup
								 END,
				Last_User_Update = CASE
									WHEN Utilization_Source.Last_User_Update IS NULL THEN Utilization_Target.Last_User_Update
									WHEN Utilization_Source.Last_User_Update < Utilization_Target.Last_User_Update THEN Utilization_Target.Last_User_Update
									ELSE Utilization_Source.Last_User_Update
								 END,
				Index_Utiliztion_Summary_Last_Update_Datetime = CURRENT_TIMESTAMP,
				User_Seek_Count_Last_Update = Utilization_Source.User_Seek_Count,
				User_Scan_Count_Last_Update = Utilization_Source.User_Scan_Count,
				User_Lookup_Count_Last_Update = Utilization_Source.User_Lookup_Count,
				User_Update_Count_Last_Update = Utilization_Source.User_Update_Count
	WHEN NOT MATCHED BY TARGET
		THEN INSERT
			(	[Database_Name], [Schema_Name], Table_Name, Index_Name, User_Seek_Count, User_Scan_Count, User_Lookup_Count, User_Update_Count, Last_User_Seek,
	 			Last_User_Scan, Last_User_Lookup, Last_User_Update, Index_Utiliztion_Summary_Create_Datetime, Index_Utiliztion_Summary_Last_Update_Datetime,
				User_Seek_Count_Last_Update, User_Scan_Count_Last_Update, User_Lookup_Count_Last_Update, User_Update_Count_Last_Update	)
		VALUES
			(	Utilization_Source.[Database_Name],
				Utilization_Source.[Schema_Name],
				Utilization_Source.Table_Name,
				Utilization_Source.Index_Name,
				Utilization_Source.User_Seek_Count,
				Utilization_Source.User_Scan_Count,
				Utilization_Source.User_Lookup_Count,
				Utilization_Source.User_Update_Count,
				Utilization_Source.Last_User_Seek,
	 			Utilization_Source.Last_User_Scan,
				Utilization_Source.Last_User_Lookup,
				Utilization_Source.Last_User_Update,
				CURRENT_TIMESTAMP,
				CURRENT_TIMESTAMP,
				Utilization_Source.User_Seek_Count,
				Utilization_Source.User_Scan_Count,
				Utilization_Source.User_Lookup_Count,
				Utilization_Source.User_Update_Count
			);
 
	DROP TABLE #Index_Utiliztion_Details;
END
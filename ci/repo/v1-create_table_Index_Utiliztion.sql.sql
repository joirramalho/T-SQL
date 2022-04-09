USE dbLogMonitor;

CREATE TABLE dbo.Index_Utiliztion_Details
	(	Index_Utiliztion_Metrics_Id INT NOT NULL IDENTITY(1,1) CONSTRAINT PK_Index_Utiliztion_Metrics PRIMARY KEY CLUSTERED,
		Index_Utiliztion_Details_Create_Datetime DATETIME NOT NULL,
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
		Last_User_Update DATETIME,
	);

CREATE NONCLUSTERED INDEX IX_Index_Utiliztion_Details_indexUtiliztionDetailsCreateDatetime ON dbo.Index_Utiliztion_Details (Index_Utiliztion_Details_Create_Datetime);



CREATE TABLE dbo.Index_Utiliztion_Summary
	(	Index_Utiliztion_Summary_Id INT NOT NULL IDENTITY(1,1) CONSTRAINT PK_Index_Utiliztion_Summary PRIMARY KEY CLUSTERED,
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
		Last_User_Update DATETIME,
		Index_Utiliztion_Summary_Create_Datetime DATETIME NOT NULL,
		Index_Utiliztion_Summary_Last_Update_Datetime DATETIME NOT NULL,
		User_Seek_Count_Last_Update BIGINT,
		User_Scan_Count_Last_Update BIGINT,
		User_Lookup_Count_Last_Update BIGINT,
		User_Update_Count_Last_Update BIGINT
	);
USE dbLogMonitor;

CREATE TABLE dbo.Missing_Index_Details
(	Missing_Index_Details_Id INT NOT NULL IDENTITY(1,1) CONSTRAINT PK_Missing_Index_Details PRIMARY KEY CLUSTERED,
	Missing_Index_Details_Create_Datetime DATETIME NOT NULL,
	[Database_Name] SYSNAME NOT NULL,
	Table_Name VARCHAR(256) NOT NULL,
	Equality_Columns VARCHAR(MAX) NULL,
	Inequality_Columns VARCHAR(MAX) NULL,
	Include_Columns VARCHAR(MAX) NULL,
	Last_User_Seek DATETIME NOT NULL,
	Avg_Total_User_Cost FLOAT NOT NULL,
	Avg_User_Impact FLOAT NOT NULL,
	User_Seeks BIGINT NOT NULL,
	Index_Group_Handle INT NOT NULL,
	Index_Handle INT NOT NULL
);
 
CREATE NONCLUSTERED INDEX IX_Missing_Index_Details_lastUserSeek ON dbo.Missing_Index_Details(Last_User_Seek);


CREATE TABLE dbo.Missing_Index_Summary
(	Missing_Index_Summary_Id INT NOT NULL IDENTITY(1,1) CONSTRAINT PK_Missing_Index_Summary PRIMARY KEY CLUSTERED,
	[Database_Name] SYSNAME NOT NULL,
	Table_Name VARCHAR(256) NOT NULL,
	Equality_Columns VARCHAR(MAX) NOT NULL,
	Inequality_Columns VARCHAR(MAX) NOT NULL,
	Include_Columns VARCHAR(MAX) NOT NULL,
	First_Index_Suggestion_Time DATETIME NOT NULL,
	Last_User_Seek DATETIME NOT NULL,
	Avg_Total_User_Cost FLOAT NOT NULL,
	Avg_User_Impact FLOAT NOT NULL,
	User_Seeks BIGINT NOT NULL,
	User_Seeks_Last_Update BIGINT NOT NULL
);
 
CREATE NONCLUSTERED INDEX IX_Missing_Index_Summary_lastUserSeek ON dbo.Missing_Index_Summary(Last_User_Seek);
 
CREATE NONCLUSTERED INDEX IX_Missing_Index_Summary_databaseName_tableName ON dbo.Missing_Index_Summary([Database_Name], Table_Name);
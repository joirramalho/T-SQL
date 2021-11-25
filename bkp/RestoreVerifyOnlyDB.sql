-- RestoreVerifyOnlyDB

-- VERSION 15Ago20 - CHECKSUM; RESTORE VERIFYONLY

-- DROP table RestoreVerifyOnlyDB

/* To prevent any potential data loss issues, you should review this script in detail before running it outside the context of the database designer.*/
BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.RestoreVerifyOnlyDB
	(
	IdRestoreVerifyOnlyDB int NOT NULL IDENTITY (1, 1),
	NomeDatabase varchar(128) NOT NULL,
	DataHora datetime NOT NULL,
    OK Bit NOT NULL,
	Mensagem varchar(MAX) NOT NULL
	)  ON [PRIMARY]
	 TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE dbo.RestoreVerifyOnlyDB ADD CONSTRAINT
	DF_RestoreVerifyOnlyDB_DataHora DEFAULT getdate() FOR DataHora
GO
ALTER TABLE dbo.RestoreVerifyOnlyDB ADD CONSTRAINT
	DF_RestoreVerifyOnlyDB_OK DEFAULT 1 FOR OK
GO
ALTER TABLE dbo.RestoreVerifyOnlyDB ADD CONSTRAINT
	DF_RestoreVerifyOnlyDB_NomeDatabase DEFAULT DB_NAME() FOR NomeDatabase
GO
ALTER TABLE dbo.RestoreVerifyOnlyDB ADD CONSTRAINT
	PK_RestoreVerifyOnlyDB PRIMARY KEY CLUSTERED 
	(
	IdRestoreVerifyOnlyDB DESC
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.RestoreVerifyOnlyDB SET (LOCK_ESCALATION = TABLE)
GO
COMMIT



-- TENTAR CRIAR PROCEDURE PARA RestoreVerifyOnlyDB da forma abaixo...

-- IF (OBJECT_ID('tempdb..#Login_Failed') IS NOT NULL) DROP TABLE #Login_Failed
-- CREATE TABLE #Login_Failed ( 
--     [LogDate] DATETIME, 
--     [ProcessInfo] NVARCHAR(50) COLLATE SQL_Latin1_General_CP1_CI_AI, 
--     [Text] NVARCHAR(MAX) COLLATE SQL_Latin1_General_CP1_CI_AI,
--     [Username] AS LTRIM(RTRIM(REPLACE(REPLACE(SUBSTRING(REPLACE([Text], 'Login failed for user ''', ''), 1, CHARINDEX('. Reason:', REPLACE([Text], 'Login failed for user ''', '')) - 2), CHAR(10), ''), CHAR(13), ''))),
--     [IP] AS LTRIM(RTRIM(REPLACE(REPLACE(REPLACE((SUBSTRING([Text], CHARINDEX('[CLIENT: ', [Text]) + 9, LEN([Text]))), ']', ''), CHAR(10), ''), CHAR(13), '')))
-- )

-- INSERT INTO #Login_Failed (LogDate, ProcessInfo, [Text]) 
-- EXEC master.dbo.xp_readerrorlog 0, 1, N'Login failed'

-- SELECT * FROM #Login_Failed
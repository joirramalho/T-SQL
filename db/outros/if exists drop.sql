IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dbcc_history]') AND type in (N'U'))
DROP TABLE [dbo].[dbcc_history]
GO
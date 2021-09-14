--v1__drop_table_cloudwatch.sql

USE dbLogMonitor;

--DROP TABLE dbLogMonitor.dbo.Cloudwatch;


IF EXISTS (
SELECT
	*
FROM
	sys.objects
WHERE
	object_id = OBJECT_ID(N'[dbo].[Cloudwatch]')
		AND TYPE IN (N'U'))
	DROP TABLE [dbo].[Cloudwatch]
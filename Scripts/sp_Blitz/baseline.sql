--How to Capture Baselines with sp_BlitzFirst
--	https://www.brentozar.com/archive/2019/02/video-how-to-capture-baselines-with-sp_blitzfirst/

EXEC sp_BlitzFirst 
  @OutputDatabaseName = 'DBAtools', 
  @OutputSchemaName = 'dbo', 
  @OutputTableName = 'BlitzFirst',
  @OutputTableNameFileStats = 'BlitzFirst_FileStats',
  @OutputTableNamePerfmonStats = 'BlitzFirst_PerfmonStats',
  @OutputTableNameWaitStats = 'BlitzFirst_WaitStats',
  @OutputTableNameBlitzCache = 'BlitzCache';
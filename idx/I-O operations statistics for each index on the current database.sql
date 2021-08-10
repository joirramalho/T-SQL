-- I/O operations statistics for each index on the current database
USE dbCrmActivesoft

SELECT DB_NAME()

SELECT OBJECT_NAME(IXOS.OBJECT_ID)  Table_Name 
       ,IX.name  Index_Name
	,IX.type_desc Index_Type
	,SUM(PS.[used_page_count]) * 8 IndexSizeKB
       ,IXOS.LEAF_INSERT_COUNT NumOfInserts, IXOS.LEAF_UPDATE_COUNT NumOfupdates, IXOS.LEAF_DELETE_COUNT NumOfDeletes 
FROM   SYS.DM_DB_INDEX_OPERATIONAL_STATS (NULL,NULL,NULL,NULL ) IXOS 
INNER JOIN SYS.INDEXES AS IX ON IX.OBJECT_ID = IXOS.OBJECT_ID AND IX.INDEX_ID = IXOS.INDEX_ID 
INNER JOIN sys.dm_db_partition_stats PS on PS.object_id=IX.object_id
WHERE         OBJECTPROPERTY(IX.[OBJECT_ID],'IsUserTable') = 1

--       AND OBJECT_NAME(IXOS.OBJECT_ID)  = 'TbAccessToken'

GROUP BY      OBJECT_NAME(IXOS.OBJECT_ID), IX.name, IX.type_desc,IXOS.LEAF_INSERT_COUNT, IXOS.LEAF_UPDATE_COUNT, IXOS.LEAF_DELETE_COUNT
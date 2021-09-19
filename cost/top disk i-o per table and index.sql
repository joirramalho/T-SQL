--18set21
--HTTPS://DBA.STACKEXCHANGE.COM/QUESTIONS/72163/HOW-TO-FIGURE-OUT-DISK-I-O-BY-TABLE

--USER_SEEKS + USER_SCANS + USER_LOOKUPS + USER_UPDATES

DECLARE @db	VARCHAR(64) = 'dbSigaNeves'

SELECT
	D.NAME AS [DATABASE],
	OBJECT_NAME(S.[OBJECT_ID]) AS [OBJECT NAME],
	I.[NAME] AS [INDEX NAME],
	USER_SEEKS,
	USER_SCANS,
	USER_LOOKUPS,
	USER_UPDATES
FROM
	SYS.DM_DB_INDEX_USAGE_STATS AS S
INNER JOIN SYS.INDEXES AS I ON
	I.[OBJECT_ID] = S.[OBJECT_ID]
	AND I.INDEX_ID = S.INDEX_ID
JOIN SYS.DATABASES D ON
	S.DATABASE_ID = D.DATABASE_ID
WHERE
	OBJECTPROPERTY(S.[OBJECT_ID],
	'ISUSERTABLE') = 1

	AND D.NAME = @db

ORDER BY
	USER_SEEKS + USER_SCANS + USER_LOOKUPS + USER_UPDATES DESC


	
--LEAF_INSERT_COUNT + LEAF_UPDATE_COUNT + LEAF_DELETE_COUNT DESC
SELECT
	D.NAME,
	T.NAME,
	OBJECT_NAME(A.[OBJECT_ID]) AS [OBJECT NAME],
	I.[NAME] AS [INDEX NAME],
	A.LEAF_INSERT_COUNT,
	A.LEAF_UPDATE_COUNT,
	A.LEAF_DELETE_COUNT
FROM
	SYS.DM_DB_INDEX_OPERATIONAL_STATS (NULL,
	NULL,
	NULL,
	NULL ) A
INNER JOIN SYS.INDEXES AS I ON
	I.[OBJECT_ID] = A.[OBJECT_ID]
JOIN SYS.TABLES T ON
	I.OBJECT_ID = T.OBJECT_ID
JOIN SYS.DATABASES D ON
	A.DATABASE_ID = D.DATABASE_ID
	AND I.INDEX_ID = A.INDEX_ID
WHERE
	OBJECTPROPERTY(A.[OBJECT_ID],
	'ISUSERTABLE') = 1
	
	AND D.NAME = @db

ORDER BY
	A.LEAF_INSERT_COUNT + A.LEAF_UPDATE_COUNT + A.LEAF_DELETE_COUNT DESC
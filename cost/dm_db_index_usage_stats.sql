--18set21
--HTTPS://DBA.STACKEXCHANGE.COM/QUESTIONS/72163/HOW-TO-FIGURE-OUT-DISK-I-O-BY-TABLE

--USER_SEEKS + USER_SCANS + USER_LOOKUPS + USER_UPDATES

DECLARE @db	VARCHAR(64) = 'dbSigaSemiBatista'

select
	d.name as [database],
	object_name(s.[object_id]) as [object name],
	i.[name] as [index name],
	user_seeks,
	user_scans,
	user_lookups,
	user_updates
from
	sys.dm_db_index_usage_stats as s
inner join sys.indexes as i on
	i.[object_id] = s.[object_id]
	and i.index_id = s.index_id
join sys.databases d on
	s.database_id = d.database_id
where
	objectproperty(s.[object_id],
	'isusertable') = 1

	and d.name = @db

order by
	user_seeks + user_scans + user_lookups + user_updates desc


	
--leaf_insert_count + leaf_update_count + leaf_delete_count desc
select
	d.name,
	t.name,
	object_name(a.[object_id]) as [object name],
	i.[name] as [index name],
	a.leaf_insert_count,
	a.leaf_update_count,
	a.leaf_delete_count
from
	sys.dm_db_index_operational_stats (null,
	null,
	null,
	null ) a
inner join sys.indexes as i on
	i.[object_id] = a.[object_id]
join sys.tables t on
	i.object_id = t.object_id
join sys.databases d on
	a.database_id = d.database_id
	and i.index_id = a.index_id
where
	objectproperty(a.[object_id],
	'isusertable') = 1
	
	and d.name = @db

order by
	a.leaf_insert_count + a.leaf_update_count + a.leaf_delete_count desc
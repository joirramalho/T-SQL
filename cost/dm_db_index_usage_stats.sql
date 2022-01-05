--04dez22
	--https://dba.stackexchange.com/questions/72163/how-to-figure-out-disk-i-o-by-table
	--user_seeks + user_scans + user_lookups + user_updates

--sys.dm_db_index_usage_stats por Database

--USE dbSigaFACHO


select TOP 50
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
order by
	user_seeks + user_scans + user_lookups + user_updates desc


	
--leaf_insert_count + leaf_update_count + leaf_delete_count desc
select TOP 50
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
order by
	a.leaf_insert_count + a.leaf_update_count + a.leaf_delete_count desc
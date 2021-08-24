-- 24fev21

 USE dbSigaCEFuturoFeliz;;

SELECT 	name as username, create_date, modify_date, type_desc as type, authentication_type_desc as authentication_type
FROM	sys.database_principals
where type not in ('A', 'G', 'R', 'X') and sid is not null and name != 'guest'
order by username;
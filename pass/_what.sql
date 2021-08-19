--18ago21

use dbSigaElo;

SELECT
    DB_NAME(DB_ID()) AS DBNAME,
    (CASE princ.type WHEN 'S' THEN princ.name WHEN 'U' THEN ulogin.name COLLATE Latin1_General_CI_AI END) AS UserName,
    (CASE princ.type WHEN 'S' THEN 'SQL User' WHEN 'U' THEN 'Windows User' END) AS UserType,
    princ.name AS DatabaseUserName,
    NULL AS Role,
    perm.[permission_name] AS PermissionType,
    perm.state_desc AS PermissionState,
    obj.type_desc AS ObjectType,
    OBJECT_NAME(perm.major_id) AS ObjectName,
    col.name AS ColumnName
FROM
    sys.database_principals			princ	WITH(NOLOCK)
    LEFT JOIN sys.login_token			ulogin	WITH(NOLOCK)	ON princ.[sid] = ulogin.[sid]
    LEFT JOIN sys.database_permissions		perm	WITH(NOLOCK)	ON perm.grantee_principal_id = princ.principal_id
    LEFT JOIN sys.columns			col	WITH(NOLOCK)	ON col.[object_id] = perm.major_id AND col.column_id = perm.minor_id
    LEFT JOIN sys.objects			obj	WITH(NOLOCK)	ON perm.major_id = obj.[object_id]
WHERE
    princ.type IN ('S', 'U')

UNION

SELECT
    DB_NAME(DB_ID()) AS DBNAME,
    (CASE memberprinc.type WHEN 'S' THEN memberprinc.name WHEN 'U' THEN ulogin.name COLLATE Latin1_General_CI_AI END) AS UserName,
    (CASE memberprinc.type WHEN 'S' THEN 'SQL User' WHEN 'U' THEN 'Windows User' END) AS UserType,
    memberprinc.name AS DatabaseUserName,
    roleprinc.name AS [Role],
    perm.[permission_name] AS PermissionType,
    perm.state_desc AS PermissionState,
    obj.type_desc AS ObjectType,
    OBJECT_NAME(perm.major_id) AS ObjectName,
    col.name AS ColumnName
FROM
    sys.database_role_members				members		WITH(NOLOCK)
    JOIN sys.database_principals			roleprinc	WITH(NOLOCK)	ON roleprinc.principal_id = members.role_principal_id
    JOIN sys.database_principals			memberprinc	WITH(NOLOCK)	ON memberprinc.principal_id = members.member_principal_id
    LEFT JOIN sys.login_token				ulogin		WITH(NOLOCK)	ON memberprinc.[sid] = ulogin.[sid]
    LEFT JOIN sys.database_permissions		perm		WITH(NOLOCK)	ON perm.grantee_principal_id = roleprinc.principal_id
    LEFT JOIN sys.columns					col			WITH(NOLOCK)	ON col.[object_id] = perm.major_id AND col.column_id = perm.minor_id
    LEFT JOIN sys.objects					obj			WITH(NOLOCK)	ON perm.major_id = obj.[object_id]

UNION

SELECT
    DB_NAME(DB_ID()) AS DBNAME,
    '{All Users}' AS UserName,
    '{All Users}' AS UserType,
    '{All Users}' AS DatabaseUserName,
    roleprinc.name AS [Role],
    perm.[permission_name] AS PermissionType,
    perm.state_desc AS PermissionState,
    obj.type_desc AS ObjectType,
    OBJECT_NAME(perm.major_id) AS ObjectName,
    col.name AS ColumnName
FROM
    sys.database_principals					roleprinc	WITH(NOLOCK)
    LEFT JOIN sys.database_permissions		perm		WITH(NOLOCK)	ON perm.grantee_principal_id = roleprinc.principal_id
    LEFT JOIN sys.columns					col			WITH(NOLOCK)	ON col.[object_id] = perm.major_id AND col.column_id = perm.minor_id
    JOIN sys.objects						obj			WITH(NOLOCK)	ON obj.[object_id] = perm.major_id
WHERE
    roleprinc.[type] = 'R'
    AND roleprinc.name = 'public'
    AND obj.is_ms_shipped = 0
ORDER BY
    princ.name,
    OBJECT_NAME(perm.major_id),
    col.name,
    perm.[permission_name],
    perm.state_desc,
    obj.type_desc

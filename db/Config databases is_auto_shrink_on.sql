--  02ago21

SELECT	name,	CASE WHEN page_verify_option_desc <> 'CHECKSUM' THEN 'ALTER DATABASE [' + name + '] SET PAGE_VERIFY CHECKSUM' ELSE '' END AS [page verify option]
FROM sys.databases DB
WHERE	CASE WHEN page_verify_option_desc <> 'CHECKSUM' THEN 'ALTER DATABASE [' + name + '] SET PAGE_VERIFY CHECKSUM' ELSE '' END <> ''		-- PAGE VERIFY
ORDER BY name

SELECT	name,	CASE WHEN is_auto_close_on = 1 THEN 'ALTER DATABASE [' + name + '] SET AUTO_CLOSE OFF' ELSE '' END AS [auto close]
FROM sys.databases DB
WHERE	CASE WHEN is_auto_close_on = 1 THEN 'ALTER DATABASE [' + name + '] SET AUTO_CLOSE OFF' ELSE '' END <> ''							-- AUTO CLOSE
ORDER BY name

SELECT	name,	CASE WHEN is_auto_shrink_on = 1 THEN 'ALTER DATABASE [' + name + '] SET AUTO_SHRINK OFF' ELSE '' END AS [auto shrink]
FROM sys.databases DB
WHERE	CASE WHEN is_auto_shrink_on = 1 THEN 'ALTER DATABASE [' + name + '] SET AUTO_SHRINK OFF' ELSE '' END <> ''							-- AUTO SHRINK
ORDER BY name

SELECT	name,	CASE WHEN is_auto_create_stats_on = 0 THEN 'ALTER DATABASE [' + name + '] SET AUTO_CREATE_STATISTICS ON' ELSE '' END AS [auto create statistics]
FROM sys.databases DB
WHERE	CASE WHEN is_auto_create_stats_on = 0 THEN 'ALTER DATABASE [' + name + '] SET AUTO_CREATE_STATISTICS ON' ELSE '' END <> ''			-- AUTO CREATE STATISTICS
ORDER BY name

SELECT	name,	CASE WHEN is_auto_update_stats_on = 0 THEN 'ALTER DATABASE [' + name + '] SET AUTO_UPDATE_STATISTICS ON' ELSE '' END AS [auto update statistics]
FROM sys.databases DB
WHERE	CASE WHEN is_auto_update_stats_on = 0 THEN 'ALTER DATABASE [' + name + '] SET AUTO_UPDATE_STATISTICS ON' ELSE '' END <> ''			-- AUTO UPDATE STATISTICS
ORDER BY name


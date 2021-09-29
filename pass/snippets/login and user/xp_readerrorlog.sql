--24ago21

use master;

CREATE USER [active.kezio] FOR LOGIN [active.kezio] WITH DEFAULT_SCHEMA=[dbo];


GRANT  EXECUTE ON dbo.xp_readerrorlog TO [active.kezio];

-- REVOKE EXECUTE ON xp_readerrorlog TO [active.teste];
use master;

CREATE USER [active.wantuilson] FOR LOGIN [active.wantuilson] WITH DEFAULT_SCHEMA=[dbo];


GRANT  EXECUTE ON dbo.xp_readerrorlog TO [active.wantuilson];

-- REVOKE EXECUTE ON xp_readerrorlog TO [active.teste];
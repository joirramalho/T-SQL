sp_configure 'show advanced options', 1;
GO

RECONFIGURE;
GO

sp_configure 'max server memory', 3686; -- medium
-- sp_configure 'max server memory', 7373; -- large

-- sp_configure 'max server memory', 14746; -- xlarge
    -- Configuration option 'max server memory (MB)' changed from 14746 to 3686. Run the RECONFIGURE statement to install.
-- GO

RECONFIGURE;
GO
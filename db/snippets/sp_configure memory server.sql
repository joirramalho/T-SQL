--21Jan21

-- https://docs.microsoft.com/pt-br/sql/database-engine/configure-windows/server-memory-server-configuration-options?view=sql-server-ver15#example-a-set-the-max-server-memory-option-to-4-gb

sp_configure 'show advanced options', 1;
GO
RECONFIGURE;
GO
sp_configure 'max server memory', 30720;
GO
RECONFIGURE;
GO


-- jan 18 16:49:10 ip-172-31-29-224.sa-east-1.compute.internal sqlservr[15590]: 2021-01-18 16:49:10.84 spid52      Configuration option 'show advanced options' changed from 1 to 1. Run the RECON...o install.
-- jan 18 16:49:11 ip-172-31-29-224.sa-east-1.compute.internal sqlservr[15590]: 2021-01-18 16:49:11.65 spid52      Configuration option 'max server memory (MB)' changed from 3686 to 30720. Run t...o install.
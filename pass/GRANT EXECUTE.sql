-- GRANT EXECUTE from PROCEDURE to ROLE/User

use [dbLogRestore]
GO
-- GRANT EXECUTE ON [dbo].sp_foreachdb TO [PUBLIC]
-- GO

GRANT EXECUTE ON [dbo].sp_JobEspacoLivreInMB TO [roleOperacaoRestore]
GO


-- GRANT UPDATE ON [dbo].Documento_ContasDeGestao TO role_SiaiAnalise_Escrita;
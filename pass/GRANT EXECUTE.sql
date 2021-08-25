-- GRANT EXECUTE from PROCEDURE to ROLE/User

use [dbLogRestore]
GO
-- GRANT EXECUTE ON [dbo].sp_foreachdb TO [PUBLIC]
-- GO

GRANT EXECUTE ON [dbo].sp_JobEspacoLivreInMB TO [roleOperacaoRestore]
GO

--24ago21
-- GRANT EXECUTE ON OBJECT::FnAnoMes TO [active.filipe]

-- GRANT EXECUTE ON OBJECT::sp_DesmascararBanco TO [active.pinto]

-- GRANT EXECUTE ON OBJECT::sp_restore TO [roleDesmascararDados]



-- REVOKE EXECUTE ON OBJECT::sp_restore FROM [active.pinto]

-- REVOKE EXECUTE ON OBJECT::sp_DesmascararBanco FROM [active.pinto]

-- REVOKE ALL ON dbo.MyObject TO MyUser


-- GRANT UPDATE ON [dbo].Documento_ContasDeGestao TO role_SiaiAnalise_Escrita;


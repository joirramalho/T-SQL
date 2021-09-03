
use dbLogMonitor;


-- Gerando deadlock
BEGIN TRAN
UPDATE Tabela1 set Nome = 'teste' where Id = 1


-- BEGIN TRAN
UPDATE Tabela2 set Nome = 'teste' where Id = 1



--ROLLBACK
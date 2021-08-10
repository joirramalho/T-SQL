--  10ago21 #backup

BACKUP DATABASE dbActiveVendasPadraoInst TO DISK = N'/TEMP/dbActiveVendasPadraoInst.bak'


-- chown ec2-user dbSigaPadraoInst.bak


-- mv /TEMP/dbSigaPadraoInst.bak /home/ec2-user
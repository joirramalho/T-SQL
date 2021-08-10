#!/bin/bash

# VERSION 1.00 20mar21


timestamp=single-backup-$(date "+%Y.%m.%d-%H.%M.%S").error;


source /root/credential.restore >>/root/$timestamp 2>&1;


/opt/mssql-tools/bin/sqlcmd -S localhost,1435 -U $LOGIN -P $PASSWORD -Q "
    IF EXISTS( SELECT * FROM sys.databases WHERE NAME = '$1' AND user_access_desc = 'MULTI_USER' )
        BEGIN
        -- -- ALTER DATABASE [$1]    SET  READ_WRITE WITH NO_WAIT;
        -- -- ALTER DATABASE [$1] SET  MULTI_USER WITH ROLLBACK IMMEDIATE;

        -- ALTER DATABASE [$1] SET  SINGLE_USER WITH ROLLBACK IMMEDIATE;

        USE [$1];
        SELECT DB_NAME();

        IF EXISTS( SELECT * FROM sys.databases WHERE NAME = '$1' AND user_access_desc = 'MULTI_USER' )
        BEGIN
--            INSERT INTO [$1].[dbo].[TbAuditoria] ([Tabela],[Operacao],[DescricaoOperacao], [Datahora]) VALUES ('TbAuditoria', 'I','REGISTRO DE MIGRACAO DE SERVIDOR', GETDATE());


--            IF EXISTS( SELECT TOP 1 * FROM [$1].[dbo].[TbAuditoria] WHERE [DescricaoOperacao] LIKE 'REGISTRO DE MIGRACAO DE SERVIDOR' ORDER BY DataHora DESC )
                BACKUP DATABASE [$1] TO  DISK = '/TEMP/$1_diff.bak' WITH FORMAT, INIT, NAME = '$1-diff', SKIP, NOREWIND, NOUNLOAD, DIFFERENTIAL, STATS = 100;


            -- ALTER DATABASE [$1] SET  OFFLINE WITH ROLLBACK IMMEDIATE;
            -- -- ALTER DATABASE [$1] SET  ONLINE WITH ROLLBACK IMMEDIATE;
        END

        END
"

# if EXIST FILE _bak





if [ $? -eq 0 ]; then
        scp -i "activesoft-saopaulo-zip-sql.pem" /TEMP/$1_diff.bak ec2-user@ec2-172-31-19-119.sa-east-1.compute.amazonaws.com:/home/ec2-user/diff-1 >> /root/$timestamp 2>&1;

        if [ $? -eq 0 ]; then
                rm /TEMP/$1_diff.bak >>/root/$timestamp 2>&1;

                if [ $? -eq 0 ]; then
                        rm /root/$timestamp

                        echo -n "fiz"
                fi
        fi
fi
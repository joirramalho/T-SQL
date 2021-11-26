--26nov21
Configure SQL Server on Linux with the mssql-conf tool


-- Configure SQL Server on Linux with the mssql-conf tool
    -- https://docs.microsoft.com/en-us/sql/linux/sql-server-linux-configure-mssql-conf?view=sql-server-ver15

ami-014e9f560325b4e33 
    (Amazon Linux 2 with SQL Server 2017 Web Edition AMI provided by Amazon) 
    
    REGION [SÃO PAULO]
    
    
 
-- Security Group SQL Linux

-- Open SSH IP/port

-- eIP Allocation

-- ROLE SSM Server associated (ckecked)
    
    
    
ssh -i "activesoft-saopaulo.pem" ece2-user@ec2-18-231-106-62.sa-east-1.compute.amazonaws.com

sudo yum update

sudo su 

reboot



-- Config Inicial
	sudo systemctl status mssql-server
	
	sudo systemctl stop mssql-server
	
	sudo /opt/mssql/bin/mssql-conf setup
	
	    Idioma, VERSION (WEB), sa PASSWORD
	
	systemctl status mssql-server
	
	sqlcmd -S localhost -U SA -P '<YourPassword>'





-- Config Firewall da Amazon Linux 2 - Abrir porta 1435
--  How to Fix “firewall-cmd: command not found” Error in RHEL/CentOS 7
	-- https://www.tecmint.com/fix-firewall-cmd-command-not-found-error/


		-- Status do firewall
			sudo firewall-cmd --state

		-- Listas portas abertas
			sudo firewall-cmd --zone=public --list-ports

		-- Add Porta 1435
			sudo firewall-cmd --zone=public --add-port=1435/tcp --permanent
			sudo firewall-cmd --reload

		Remove porta 1433
			sudo firewall-cmd --zone=public --remove-port=1433/tcp --permanent
			sudo firewall-cmd --reload


-- Alterar a porta TCP
	
	-- Sintaxe: sudo /opt/mssql/bin/mssql-conf set network.tcpport <new_tcp_port>
		
	sudo systemctl stop mssql-server
		sudo /opt/mssql/bin/mssql-conf set network.tcpport 1435
			sudo systemctl restart mssql-server

	-- Exibir as configurações atuais
		sudo cat /var/opt/mssql/mssql.conf

	-- Validar conf
		sudo /opt/mssql/bin/mssql-conf validate


	-- Testar conexão via nova Porta 1435
		sqlcmd -S localhost,1435 -U sa
		
		
		
	
	-- Enable the SQL Server Agent
    sudo /opt/mssql/bin/mssql-conf set sqlagent.enabled true

    sudo systemctl restart mssql-server
    
    
    
    
    -- Change the SQL Server collation

	    sudo /opt/mssql/bin/mssql-conf set-collation
	        Latin1_General_CI_AI
	
	
			SELECT Name from sys.fn_helpcollations() where Name LIKE 'Latin%'
		
		
		
	-- turns off customer feedback

	    -- Can I disable the spyware in SQL Server?  
	    -- 	https://dba.stackexchange.com/questions/187093/can-i-disable-the-spyware-in-sql-server
	
	    -- What Queries Does Microsoft’s Telemetry Service Run On Your SQL Server?
	    -- 	https://www.brentozar.com/archive/2019/02/what-queries-does-microsofts-telemetry-service-run-on-your-sql-server/
	
	    sudo /opt/mssql/bin/mssql-conf set telemetry.customerfeedback false
	
	    sudo systemctl restart mssql-server
    
    
    
    
    -- Change the default data or log directory location

	    sudo mkdir /SQL
	
	    sudo chown mssql /SQL
	    sudo chgrp mssql /SQL
	
	    sudo /opt/mssql/bin/mssql-conf set filelocation.defaultdatadir /SQL
	
	    sudo systemctl restart mssql-server
	
	    sudo /opt/mssql/bin/mssql-conf set filelocation.defaultlogdir /SQL
	
	    sudo systemctl restart mssql-server
    
    
    
    
    -- System databases Directory DEFAULT installation

sudo su

[root@ip-172-31-16-72 /]# ll /var/opt/mssql/data
total 65604
-rw-r----- 1 mssql mssql  4194304 out  3 19:43 master.mdf
-rw-r----- 1 mssql mssql  2097152 out  3 19:43 mastlog.ldf
-rw-r----- 1 mssql mssql  8388608 out  3 19:43 modellog.ldf
-rw-r----- 1 mssql mssql  8388608 out  3 19:43 model.mdf
-rw-rw---- 1 mssql mssql      713 out  3 19:11 MS_AgentSigningCertificate.cer
-rw-r----- 1 mssql mssql 18743296 out  3 19:43 msdbdata.mdf
-rw-r----- 1 mssql mssql  8585216 out  3 19:43 msdblog.ldf
-rw-r----- 1 mssql mssql  8388608 out  3 19:43 tempdb.mdf
-rw-r----- 1 mssql mssql  8388608 out  3 19:43 templog.ldf
[root@ip-172-31-16-72 /]# 





-- Definir o limite de memória
    --  Para garantir que haja memória física livre suficiente para o sistema operacional Linux, o processo de SQL Server usa apenas 80% da RAM física por padrão...
            -- https://docs.microsoft.com/pt-br/sql/linux/sql-server-linux-performance-best-practices?view=sql-server-ver15

        sudo /opt/mssql/bin/mssql-conf set memory.memorylimitmb 30720
		
			--Opções de configuração de memória do servidor
				-- https://docs.microsoft.com/pt-br/sql/database-engine/configure-windows/server-memory-server-configuration-options?view=sql-server-ver15#example-a-set-the-max-server-memory-option-to-4-gb
			
			sp_configure 'show advanced options', 1;
			
			RECONFIGURE;
			
			sp_configure 'max server memory', 30720;
			
			RECONFIGURE;
			
			
			-- jan 18 16:49:10 ip-172-31-29-224.sa-east-1.compute.internal sqlservr[15590]: 2021-01-18 16:49:10.84 spid52      Configuration option 'show advanced options' changed from 1 to 1. Run the RECON...o install.
			-- jan 18 16:49:11 ip-172-31-29-224.sa-east-1.compute.internal sqlservr[15590]: 2021-01-18 16:49:11.65 spid52      Configuration option 'max server memory (MB)' changed from 3686 to 30720. Run t...o install.
        
        
		        sudo systemctl restart mssql-server
		
		
		
	
-- Change the default dump(BACKUP) directory location
    
    sudo su

    [root@ip-172-31-16-72 /]# ll /var/opt/mssql/log 

    -- NÃO ALTERADO
    
        -- sudo /opt/mssql/bin/mssql-conf set filelocation.defaultdumpdir /var/opt/mssql/log

        -- sudo systemctl restart mssql-server

-- Remove a setting
        sudo /opt/mssql/bin/mssql-conf unset filelocation.defaultdumpdir
        
        
        
        
 --    Change the default backup directory location
   
    sudo mkdir /TEMP

    sudo chown mssql /TEMP
    sudo chgrp mssql /TEMP

    sudo /opt/mssql/bin/mssql-conf set filelocation.defaultbackupdir /TEMP

    sudo systemctl restart mssql-server
    
    
    
    
    
    
    -- Criar segundo arquivo tempdb (.ndf). Um para 'core' de CPU

	USE [master]
	GO
	ALTER DATABASE [tempdb] ADD FILE ( NAME = N'tempdb2', FILENAME = N'/var/opt/mssql/data/tempdb2.ndf' , SIZE = 8192KB , FILEGROWTH = 65536KB )
	GO

	-- sudo systemctl restart mssql-server


-- 	ALTER DATABASE [tempdb]  REMOVE FILE [tempdb2]
-- GO
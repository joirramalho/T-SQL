--09mar22
	--https://www.sqlshack.com/t-sql-regex-commands-in-sql-server/

--manipulação de dados
--https://www.sqlshack.com/sql-string-functions-for-data-munging-wrangling/

--https://www.sqlshack.com/overview-of-the-sql-like-operator/

--https://www.sqlshack.com/replace-ascii-special-characters-sql-server/


declare @Temp VarChar(1000)='ValorNominalRPPS'
Declare @KeepValues as varchar(50)
    Set @KeepValues = '%[^ ][A-Z]%'
    While PatIndex(@KeepValues collate Latin1_General_Bin, @Temp) > 0
        Set @Temp = Stuff(@Temp, PatIndex(@KeepValues collate Latin1_General_Bin, @Temp) + 1, 0, ' ')

        
        PRINT @TEMP
        

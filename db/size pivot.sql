SELECT instance_name,
       [Data File(s) Size (KB)],
       [LOG File(s) Size (KB)],
       [Log File(s) Used Size (KB)],
       [Percent Log Used]
       into ##Logsize
FROM
(
   SELECT *
   FROM sys.dm_os_performance_counters
   WHERE counter_name IN
   (
       'Data File(s) Size (KB)',
       'Log File(s) Size (KB)',
       'Log File(s) Used Size (KB)',
       'Percent Log Used'
   )
 --    AND instance_name = 'database your interested in' 
) AS Src
PIVOT
(
   MAX(cntr_value)
   FOR counter_name IN
   (
       [Data File(s) Size (KB)],
       [LOG File(s) Size (KB)],
       [Log File(s) Used Size (KB)],
       [Percent Log Used]
   )
) AS pvt 
go
declare @logsize int
Select @logsize = [Percent Log Used] from ##Logsize

If @logsize >0 --the maximum percent you want the log to fill too i.e 90
    BEGIN
        --Do your thing here
        Select * FROM ##Logsize order by [Data File(s) Size (KB)] DESC
    END

Drop table ##Logsize
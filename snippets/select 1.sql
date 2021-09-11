--10set21
--https://stackoverflow.com/questions/28079724/difference-between-if-exists-select-1-from-and-select-0-from/28079756

Your performance would be identical. 

--When you use exists, SQL Server doesn't evaluate anything in the SELECT portion of the statement. It simply resolves to a boolean. 
--This can be proven by doing 1 divided by 0. Normally this would throw an error, but inside an EXISTS, it runs without error.

--With regards to your specific use, the expense in the EXISTS check is almost nothing. If you are running into performance issues, it's not the EXISTS part of your script.

IF EXISTS(SELECT 1/0 FROM <TABLE> WHERE 1=1) BEGIN SELECT 'In the exists' END
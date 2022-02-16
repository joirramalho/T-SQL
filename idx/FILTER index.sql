--13fev22

funcionamento dos índices
	--https://www.dirceuresende.com/blog/entendendo-o-funcionamento-dos-indices-no-sql-server/

Impact of the Column order in SQL Server Composite Indexes
	--https://www.sqlshack.com/impact-of-the-column-order-in-composite-index-sql-server/

SQL Server index structure and concepts
--	https://www.sqlshack.com/sql-server-index-structure-and-concepts/



https://www.red-gate.com/simple-talk/databases/sql-server/performance-sql-server/introduction-to-sql-server-filtered-indexes/


https://www.red-gate.com/simple-talk/databases/sql-server/database-administration-sql-server/brads-sure-guide-to-indexes/


https://www.sqlshack.com/introduction-to-sql-server-filtered-indexes/


https://www.mssqltips.com/sqlservertip/1785/sql-server-filtered-indexes-what-they-are-how-to-use-and-performance-advantages/



What You Can (and Can’t) Do With Filtered Indexes
    https://www.brentozar.com/archive/2013/11/what-you-can-and-cant-do-with-filtered-indexes/

Filtered Indexes and Dynamic SQL
    https://www.brentozar.com/archive/2013/11/filtered-indexes-and-dynamic-sql/


-- Script 1

-- Create Employee table with a clustered index on primary key
CREATE TABLE Employee
(
EmpID INT PRIMARY KEY CLUSTERED,
EmpName VARCHAR(100) NOT NULL,
HireDate DATE NULL, --DATE is a new data type in SQL Server 2008
DOJ DATE NULL, --DATE is a new data type in SQL Server 2008
)
GO
-- Creating a non clustered index on HireDate column
CREATE NONCLUSTERED INDEX NC_Employee_HireDate
ON Employee(HireDate) 
GO
-- Creating a non clustered Filetered index on DOJ column
CREATE NONCLUSTERED INDEX FI_Employee_DOJ
ON Employee(DOJ)
WHERE DOJ IS NOT NULL --Notice here the filter criteria for the index
GO
DECLARE @intCounter INT = 1 --With SQL 2008, you can assign value in variable declaration as well
WHILE @intCounter <= 10000
BEGIN
IF (@intCounter % 100) = 0
BEGIN
INSERT INTO Employee(EmpID, EmpName, HireDate, DOJ)
VALUES (@intCounter, 'ABC' + CAST(@intCounter AS VARCHAR), CAST((GETDATE() - @intCounter) AS DATE)
, CAST((GETDATE() - @intCounter) AS DATE))
END
ELSE
BEGIN
INSERT INTO Employee(EmpID, EmpName, HireDate, DOJ)
VALUES (@intCounter, 'ABC' + CAST(@intCounter AS VARCHAR), NULL, NULL)
END
SET @intCounter = @intCounter + 1
END


SELECT ind.index_id, ind.name, ind.type_desc, par.reserved_page_count, par.used_page_count, 
par.row_count, ind.filter_definition FROM sys.dm_db_partition_stats par
INNER JOIN sys.indexes ind ON par.object_id = ind.object_id AND par.index_id = ind.index_id
WHERE par.object_id = OBJECT_ID('Employee')



CHECKPOINT
DBCC DROPCLEANBUFFERS -- It clears out the SQL Server buffer cache
GO
SET STATISTICS IO ON
SELECT * FROM Employee WITH(INDEX(NC_Employee_HireDate))
WHERE DOJ IS NOT NULL
SELECT * FROM Employee WITH(INDEX(FI_Employee_DOJ))
WHERE DOJ IS NOT NULL
SET STATISTICS IO OFF


--


-- Creating a non clustered index on DOJ column
CREATE NONCLUSTERED INDEX NC_Employee_HireDate
ON Employee(HireDate) 
INCLUDE(EmpName, DOJ) --Including remaining columns in the index
GO
-- Creating a non clustered Filetered index on DOJ column
CREATE NONCLUSTERED INDEX FI_Employee_DOJ
ON Employee(DOJ)
INCLUDE(EmpName, HireDate) --Including remaining columns in the index
WHERE DOJ IS NOT NULL --Notice here the filter criteria for the index
GO
---------------------------------------------------------------------------------------
CHECKPOINT
DBCC DROPCLEANBUFFERS -- It clears out the SQL Server buffer cache
GO
SET STATISTICS IO ON
SELECT * FROM Employee WITH(INDEX(NC_Employee_HireDate))
WHERE DOJ IS NOT NULL
SELECT * FROM Employee WITH(INDEX(FI_Employee_DOJ))
WHERE DOJ IS NOT NULL
SET STATISTICS IO OFF

	--SET SHOWPLAN_ALL ON
	--SET SHOWPLAN_ALL OFF




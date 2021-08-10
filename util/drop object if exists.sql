IF EXISTS (SELECT * 
  FROM sys.foreign_keys 
   WHERE object_id = OBJECT_ID(N'dbo.FK_TableName_TableName2')
   AND parent_object_id = OBJECT_ID(N'dbo.TableName')
)
  ALTER TABLE [dbo.TableName] DROP CONSTRAINT [FK_TableName_TableName2]



--   ou


IF (OBJECT_ID('dbo.FK_ConstraintName', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.TableName DROP CONSTRAINT FK_ConstraintName
END

-- If you need to drop another type of constraint, these are the applicable codes to pass into the OBJECT_ID() function in the second parameter position:

-- Full List of types here:

-- C = CHECK constraint
-- D = DEFAULT (constraint or stand-alone)
-- F = FOREIGN KEY constraint
-- PK = PRIMARY KEY constraint
-- UQ = UNIQUE constraint

-- others Object type:

-- AF = Aggregate function (CLR)
-- D = DEFAULT (constraint or stand-alone)
-- FN = SQL scalar function
-- FS = Assembly (CLR) scalar-function
-- FT = Assembly (CLR) table-valued function
-- IF = SQL inline table-valued function
-- IT = Internal table
-- P = SQL Stored Procedure
-- PC = Assembly (CLR) stored-procedure
-- PG = Plan guide
-- R = Rule (old-style, stand-alone)
-- RF = Replication-filter-procedure
-- S = System base table
-- SN = Synonym
-- SO = Sequence object
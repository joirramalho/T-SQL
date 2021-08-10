-- DROP SCRIPT OF ALL FOREIGN KEY CONSTRAINTS, SCRIPT TO GENERATE
    -- https://www.mssqltips.com/sqlservertip/3443/script-all-primary-keys-unique-constraints-and-foreign-keys-in-a-sql-server-database-using-tsql/


USE dbSigaEstacao;

declare @ForeignKeyName varchar(4000)
declare @ParentTableName varchar(4000)
declare @ParentTableSchema varchar(4000)

declare @TSQLDropFK varchar(max)

declare CursorFK cursor for 
    select t.name ParentTableName, fk.name ForeignKeyName, t2.name ReferencedTable -- schema_name(t.schema_id) ParentTableSchema
    from    sys.foreign_keys fk  
    inner join sys.tables t on fk.parent_object_id = t.object_id

    inner join sys.foreign_key_columns fkc on fk.object_id=fkc.constraint_object_id -- Joir
    inner join sys.tables t2 on t2.object_id = fkc.referenced_object_id             -- Joir

    -- WHERE t2.name = 'TbAlunoTurmaDocumento' -- ReferencedTable
    -- WHERE t.name = 'TbAluno' -- ParentTable
    order by ParentTableName

open CursorFK
fetch next from CursorFK into  @ForeignKeyName, @ParentTableSchema, @ParentTableName
while (@@FETCH_STATUS=0)
begin
    set @TSQLDropFK ='ALTER TABLE '+quotename(@ParentTableSchema)+'.'+quotename(@ParentTableName)+' DROP CONSTRAINT '+quotename(@ForeignKeyName)+ char(13) + 'GO'
 
    print @TSQLDropFK
    fetch next from CursorFK into  @ForeignKeyName, @ParentTableSchema, @ParentTableName
end
close CursorFK
deallocate CursorFK
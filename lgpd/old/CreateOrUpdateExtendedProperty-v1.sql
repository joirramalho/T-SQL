CREATE PROCEDURE CreateOrUpdateExtendedProperty	(@TableName varchar(50), @ColumnName varchar(50), @Description varchar(500))
AS
BEGIN
	IF NOT EXISTS (SELECT * FROM::fn_listextendedproperty('MS_Description', 'schema', 'dbo', 'table', @TableName, 'column', @ColumnName))
		EXEC sp_addextendedproperty   
				@name = N'MS_Description',   
				@value = @Description,  
				@level0type = N'Schema', @level0name = 'dbo',  
				@level1type = N'Table',  @level1name = @TableName,  
				@level2type = N'Column', @level2name = @ColumnName;    
	ELSE
		EXEC sp_updateextendedproperty   
				@name = N'MS_Description',   
				@value = @Description,  
				@level0type = N'Schema', @level0name = 'dbo',  
				@level1type = N'Table',  @level1name = @TableName,  
				@level2type = N'Column', @level2name = @ColumnName;    
    RETURN 1;
END;

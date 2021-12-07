--06dez21

IF (OBJECT_ID('dbo.sp_CreateOrUpdateExtendedProperty') IS NOT NULL) DROP PROCEDURE sp_CreateOrUpdateExtendedProperty;

CREATE PROCEDURE sp_CreateOrUpdateExtendedProperty( @ObjectType CHAR(8), @ObjectName sysname, @ColumnName sysname, @Description VARCHAR(512) )
AS
BEGIN
    SET NOCOUNT ON;

	IF NOT EXISTS (SELECT * FROM::fn_listextendedproperty('MS_Description', 'schema', 'dbo', @ObjectType, @ObjectName, 'column', @ColumnName) )
		    IF @ColumnName IS NOT NULL -- @ColumnName
				EXEC sp_addextendedproperty   
						@name = N'MS_Description',   
						@value = @Description,  
						@level0type = N'Schema', @level0name = 'dbo',  
						@level1type = @ObjectType,  @level1name = @ObjectName,  
						@level2type = N'Column', @level2name = @ColumnName;
			ELSE
				EXEC sp_addextendedproperty   -- @ObjectName table/view description only
						@name = N'MS_Description',   
						@value = @Description,  
						@level0type = N'Schema', @level0name = 'dbo',  
						@level1type = N'Table',  @level1name = @ObjectName;
	ELSE
		    IF @ColumnName IS NOT NULL -- @ColumnName
				EXEC sp_updateextendedproperty   
						@name = N'MS_Description',   
						@value = @Description,  
						@level0type = N'Schema', @level0name = 'dbo',  
						@level1type = @ObjectType,  @level1name = @ObjectName,  
						@level2type = N'Column', @level2name = @ColumnName;
			ELSE
				EXEC sp_updateextendedproperty   -- @ObjectName table/view description only
						@name = N'MS_Description',   
						@value = @Description,  
						@level0type = N'Schema', @level0name = 'dbo',  
						@level1type = N'Table',  @level1name = @ObjectName;

	RETURN 1;
END;

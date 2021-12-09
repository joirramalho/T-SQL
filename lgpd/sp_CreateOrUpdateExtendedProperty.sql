--08dez21

--IF (OBJECT_ID('dbo.sp_CreateOrUpdateExtendedProperty') IS NOT NULL) DROP PROCEDURE sp_CreateOrUpdateExtendedProperty;

IF OBJECT_ID('dbo.sp_CreateOrUpdateExtendedProperty', 'P') IS NULL
	EXECUTE('CREATE PROCEDURE dbo.sp_CreateOrUpdateExtendedProperty AS SELECT 1');

ALTER PROCEDURE dbo.sp_CreateOrUpdateExtendedProperty( @ObjectType CHAR(8), @ObjectName VARCHAR(128), @Description VARCHAR(512), @ColumnName VARCHAR(128) = NULL )
AS
BEGIN
	SET NOCOUNT ON
	
	IF 	@ObjectType = 'Column'
		BEGIN
						
			IF EXISTS (SELECT * FROM::fn_listextendedproperty('MS_Description', 'schema', 'dbo', 'Table', @ObjectName, 'column', @ColumnName) )
				BEGIN
					EXEC sp_updateextendedproperty   
							@name = N'MS_Description',   
							@value = @Description,  
							@level0type = N'Schema', @level0name = 'dbo',  
							@level1type = N'Table',  @level1name = @ObjectName,  
							@level2type = N'Column', @level2name = @ColumnName
				END
			ELSE
				BEGIN
					EXEC sp_addextendedproperty   
								@name = N'MS_Description',   
								@value = @Description,  
								@level0type = N'Schema', @level0name = 'dbo',  
								@level1type = N'Table',  @level1name = @ObjectName,  
								@level2type = N'Column', @level2name = @ColumnName
				END				
		END
	ELSE -- @ObjectName table/view description only
		BEGIN
			IF EXISTS (SELECT * FROM::fn_listextendedproperty('MS_Description', 'schema', 'dbo', @ObjectType, @ObjectName, null, null ) )
				BEGIN
					EXEC sp_updateextendedproperty   
							@name = N'MS_Description',   
							@value = @Description,  
							@level0type = N'Schema', @level0name = 'dbo',  
							@level1type = @ObjectType,  @level1name = @ObjectName
				END
			ELSE
				BEGIN
					EXEC sp_addextendedproperty
						@name = N'MS_Description',   
						@value = @Description,  
						@level0type = N'Schema', @level0name = 'dbo',  
						@level1type = @ObjectType,  @level1name = @ObjectName
				END
		END	
	
	RETURN 1
END

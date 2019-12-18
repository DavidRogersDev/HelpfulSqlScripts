DECLARE @tableName NVARCHAR(MAX), @schemaName NVARCHAR(MAX), @className NVARCHAR(MAX)
 
--------------- Input arguments ---------------
SET @tableName = 'CompletedJobs'
SET @schemaName = 'dbo'
SET @className = 'CompletedJobsDto'
--------------- Input arguments end -----------

DECLARE tableColumns CURSOR LOCAL FOR
SELECT cols.name, cols.system_type_id, cols.is_nullable FROM sys.columns cols
	JOIN sys.tables tbl ON cols.object_id = tbl.object_id
	WHERE tbl.name = @tableName
 
PRINT 'public class ' + @className
PRINT '{'
 
OPEN tableColumns
DECLARE @name NVARCHAR(MAX), @typeId INT, @isNullable BIT, @typeName NVARCHAR(MAX)
FETCH NEXT FROM tableColumns INTO @name, @typeId, @isNullable
WHILE @@FETCH_STATUS = 0
BEGIN
	SET @typeName =
	CASE @typeId
		WHEN 36 THEN 'Guid'
		WHEN 56 THEN 'int'
		WHEN 61 THEN 'DateTime'
		WHEN 104 THEN 'bool'
		WHEN 231 THEN 'string'
		WHEN 239 THEN 'string'
		WHEN 241 THEN 'XElement'
		ELSE 'TODO(' + CAST(@typeId AS NVARCHAR) + ')'
	END;
	IF @isNullable = 1 AND @typeId != 231 AND @typeId != 239 AND @typeId != 241
		SET @typeName = @typeName + '?'
	PRINT '    public ' + @typeName + ' ' + @name + ' { get; set; }'	
	FETCH NEXT FROM tableColumns INTO @name, @typeId, @isNullable
END
 
PRINT '}'
 
CLOSE tableColumns
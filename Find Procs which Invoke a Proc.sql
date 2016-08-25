DECLARE @ProcName NVARCHAR(255)
SET @ProcName = '%ProcNameHere%'

SELECT 
	OBJECT_NAME(id) 
FROM 
	syscomments 
WHERE 
	[text] LIKE @ProcName
GROUP 
	BY OBJECT_NAME(id)
DECLARE @VewName NVARCHAR(255)
SET @VewName = '%v_UserProfile%'

SELECT 
	OBJECT_NAME(id) 
FROM 
	syscomments 
WHERE 
	[text] LIKE @VewName
GROUP 
	BY OBJECT_NAME(id)	
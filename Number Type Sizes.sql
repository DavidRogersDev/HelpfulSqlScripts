DECLARE @src BIGINT = 2;
SELECT [type],minval,maxval FROM 
(VALUES
  (N'bit',      0, 1),
  (N'tinyint',  0, 255),
  (N'smallint', -(POWER(@src,15)),       (POWER(@src,15)-1)),
  (N'int',      -(POWER(@src,31)),       (POWER(@src,31)-1)),
  (N'bigint',   -(POWER(@src,62)-1)*2-2, (POWER(@src,62)-1)*2+1)
) AS v([type],minval,maxval);
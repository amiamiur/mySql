DECLARE @dt datetime = SysDateTime()
DECLARE @days datetime = '2020-05-05'

--SELECT @dt
--SELECT Cast(@dt AS int) - Cast(@days AS int)
----46275
----46275 - 2321
--SELECT Cast (2345 AS datetime)

--SELECT Convert(varchar,@dt)
SELECT TRY_CONVERT(char,@dt,1)
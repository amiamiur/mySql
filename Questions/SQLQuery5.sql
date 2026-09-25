USE TestIndex2
go

CREATE PROCEDURE p_CreateOrderNotSale3
	@Param1 varchar(20),
	@Param2 int,
	@Param3 float = NULL

AS
BEGIN
	INSERT INTO order2(number_order,price,quantity)
	VALUES (@Param1, @Param2, @Param3)
	RETURN @Param2
END

DECLARE @V int EXECUTE p_CreateOrderNotSale3 'num1234', 100
SELECT * FROM orders2
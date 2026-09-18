USE TestIndex
go

--CREATE TABLE orders(
--	id uniqueidentifier,
--	product_id uniqueidentifier,
--	customer_id uniqueidentifier,
--	price money
--)
--go

--INSERT INTO orders
--VALUES(
--	NewId(), NewId(), NewId(),
--	DATEPART(MILLISECOND, GetDate())
--)
--go 1000000


SET STATISTICS IO ON 

SELECT *
FROM orders
WHERE id  = 'C462BEB5-2862-4C52-90B5-00CA7B7F79B7'


--CREATE CLUSTERED INDEX pk_orders_1
--ON orders(id)
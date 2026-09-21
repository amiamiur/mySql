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

SELECT product_id, customer_id
from orders
  


--CREATE CLUSTERED INDEX pk_orders_1
--ON orders(id)
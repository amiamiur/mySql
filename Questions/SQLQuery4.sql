USE TestIndex2
go

--CREATE TABLE orders2(
--	id int PRIMARY KEY IDENTITY(1,1),
--	number_order varchar(20),
--	price money,
--	quantity int,
--	sale float NOT NULL DEFAULT 1,
--	sum_price AS ((price * quantity) * sale) PERSISTED,
--	date_created datetime DEFAULT getdate(),
--	date_finish as (date_created + Day(10))
--)

--INSERT INTO orders2 (number_order, price, quantity, sale)
--VALUES ('dhas235', 230, 2, 0.5),
--('gkdi989', 450, 3, 0.8)


--INSERT INTO orders2 (number_order, price, quantity)
--VALUES ('jgoq482', 600, 1)

CREATE PROCEDURE p

SELECT * FROM dbo.orders2
USE TestIndex2
go

CREATE CLUSTERED INDEX pk_orders_1
	ON orders(id)
	-- = PK

CREATE NONCLUSTERED INDEX fk_orders_2
	ON orders(product_id)
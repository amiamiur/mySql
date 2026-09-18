CREATE INDEX fk_1
	ON orders(product_id)

CREATE INDEX fk_2
	ON orders(customer_id)

CREATE UNIQUE INDEX fk_3
	ON orders(customer_id, product_id)


CREATE NONCLUSTERED INDEX fk_4
	ON orders(customer_id, product_id, price)
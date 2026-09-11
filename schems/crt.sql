USE DB0
go
CREATE SCHEMA sales
go
CREATE SCHEMA customer
go
CREATE TABLE sales.products(
	id int NOT NULL,
	name nvarchar(100),
	balance money,
	created_at datetime
)
USE [TestIndex2]
GO

CREATE TABLE users(
	id int IDENTITY(1,1) PRIMARY KEY,
	name varchar(50),
	balance money,
	credit money,
	diff_balance AS (balance - credit)
)

INSERT INTO users
VALUES ('misha', 200, 200),
	('oleg', 300, 150),
	('roma', 1000, 500)
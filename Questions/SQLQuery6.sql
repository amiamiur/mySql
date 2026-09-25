USE TestIndex

CREATE TABLE accounts(
	id int PRIMARY KEY IDENTITY(1,1)
)

CREATE TABLE users2(
	id int PRIMARY KEY IDENTITY(1,1),
	person_type varchar(10),
	first_name varchar(50),
	middle_name varchar(50),
	last_name varchar(50),
	rowguid uniqueidentifier,
	id_account int,
	modified_date datetime

	CONSTRAINT ind_1 
	FOREIGN KEY (id_account)
	REFERENCES accounts(id)
)
go 
INSERT users2(person_type,
first_name,
middle_name,
last_name,
rowguid,
modified_date)
SELECT 
	PersonType,
	FirstName,
	MiddleName,
	LastName,
	rowguid,
	ModifiedDate
FROM AdventureWorks2022.Person.Person
go

--DROP TABLE users2
--DROP TABLE accounts

SELECT * FROM users2

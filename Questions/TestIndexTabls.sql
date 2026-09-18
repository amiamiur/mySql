USE TestIndex
GO

CREATE TABLE accaunt(
	id int PRIMARY KEY IDENTITY(1, 1),
	created_at datetime DEFAULT GetDate()
 )

CREATE TABLE user_profile(
	id int PRIMARY KEY IDENTITY(1, 1),
	accaunt_id int NOT NULL,
	created_at datetime DEFAULT GetDate(),

	FOREIGN KEY (accaunt_id) REFERENCES accaunt(id) 
)

CREATE TABLE users(
	id int PRIMARY KEY IDENTITY(1, 1),
	full_name nvarchar(150) NOT NULL,
	email nvarchar(150) UNIQUE NOT NULL,
	balance money DEFAULT 0.00,
	accaunt_id int NOT NULL,
	created_at datetime DEFAULT GetDate()

	FOREIGN KEY (accaunt_id) REFERENCES accaunt(id)
)
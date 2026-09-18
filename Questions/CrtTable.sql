USE test
GO

CREATE TABLE account(
    id int PRIMARY KEY IDENTITY(1,1),
    created_at datetime DEFAULT GetDate()
)

CREATE TABLE users(
    id int PRIMARY KEY IDENTITY(1,1),
    full_name nvarchar(150) NOT NULL,
    email nvarchar(150) UNIQUE NOT NULL,
    balance money DEFAULT 0.00,
    account_id int NOT NULL,
    created_at datetime DEFAULT GetDate(),
    FOREIGN KEY (account_id) REFERENCES account(id)
)

CREATE TABLE products(
    id int PRIMARY KEY IDENTITY(1,1),
    product_name nvarchar(150),
    about nvarchar(300),
    price int NOT NULL
)

CREATE TABLE orders(
    id int PRIMARY KEY IDENTITY(1,1),
    user_id int NOT NULL,        
    product_id int NOT NULL,       
    created_at datetime DEFAULT GetDate(),
    order_status nvarchar(150),
    price int NOT NULL,
    FOREIGN KEY (user_id)    REFERENCES users(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
)

CREATE TABLE stock(
    id int PRIMARY KEY IDENTITY(1,1),
    product_id int NOT NULL,      
    added_to datetime DEFAULT GetDate(),
    ordered_in datetime,          
    out_of_stock datetime,      
    count_in_stock int,
    FOREIGN KEY (product_id) REFERENCES products(id)
)

CREATE TABLE payments(
    id int PRIMARY KEY IDENTITY(1,1),
    order_id int NOT NULL,      
    transaction_way nvarchar(10) NOT NULL,
    payment_status nvarchar(10) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(id)
)
SELECT 
    o.id           AS order_id,
    u.full_name,
    p.product_name,
    o.order_status,
    o.price
FROM orders o
JOIN users    u ON u.id = o.user_id
JOIN products p ON p.id = o.product_id;

SELECT 
    pay.id AS payment_id,
    o.id   AS order_id,
    u.full_name,
    pay.transaction_way,
    pay.payment_status
FROM payments pay
JOIN orders o ON o.id = pay.order_id
JOIN users  u ON u.id = o.user_id;

SELECT p.product_name, s.count_in_stock, s.out_of_stock
FROM stock s
JOIN products p ON p.id = s.product_id
WHERE s.count_in_stock = 0;
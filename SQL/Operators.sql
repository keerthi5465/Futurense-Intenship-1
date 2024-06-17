SELECT SUM(price) AS total_revenue
FROM products;

SELECT *
FROM products
WHERE price % 3 = 0;

SELECT price, (price - (SELECT AVG(price) FROM products)) AS price_difference
FROM products;

SELECT *
FROM products
WHERE price >= 50000;

SELECT *
FROM customers
WHERE age <> 30;

SELECT *
FROM orders
WHERE order_amount <= 10000;


SELECT 6 & 3 AS result; 
SELECT 6 | 3 AS result; 
SELECT 6 ^ 3 AS result;

SELECT *
FROM products
WHERE location = 'Mumbai'
AND stock > 10;

SELECT *
FROM customers
WHERE city = 'Mumbai'
OR customer_id IN (SELECT customer_id FROM orders WHERE order_amount > 20000);

SELECT *
FROM orders
WHERE payment_mode <> 'upi'
AND status = 'completed';


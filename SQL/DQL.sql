
CREATE DATABASE sales_db;
USE sales_db;


CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    address VARCHAR(255),
    age INT
);

CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100),
    description TEXT,
    price DECIMAL(10, 2),
    stock INT,
    location VARCHAR(100)
);

CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    order_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);


INSERT INTO customers (first_name, last_name, email, address, age) VALUES
('John', 'Doe', 'john.doe@example.com', '123 Elm St', 28),
('Jane', 'Smith', 'jane.smith@example.com', '456 Oak St', 34),
('Alice', 'Johnson', 'alice.johnson@example.com', '789 Pine St', 45);

INSERT INTO products (product_name, description, price, stock, location) VALUES
('Laptop', 'High performance laptop', 1200.00, 10, 'New York'),
('Smartphone', 'Latest model smartphone', 800.00, 25, 'San Francisco'),
('Tablet', 'Lightweight tablet', 600.00, 15, 'Los Angeles');

INSERT INTO orders (customer_id, order_date, order_amount) VALUES
(1, '2024-01-15', 1200.00),
(2, '2024-02-20', 800.00),
(3, '2024-03-25', 600.00),
(1, '2024-04-10', 500.00);




SELECT customer_id, SUM(order_amount) AS total_order_amount
FROM orders
GROUP BY customer_id;

-- ORDER BY: Retrieve all products ordered by price in descending order
SELECT * FROM products
ORDER BY price DESC;

-- HAVING: Find locations where the total stock of products is greater than 20
SELECT location, SUM(stock) AS total_stock
FROM products
GROUP BY location
HAVING SUM(stock) > 20;

-- SELECT with LIKE (%): Find customers with email addresses ending in 'example.com'
SELECT * FROM customers
WHERE email LIKE '%example.com';

-- SELECT with CASE: Categorize products based on price range
SELECT product_id, product_name,
    CASE
        WHEN price < 500 THEN 'Budget'
        WHEN price BETWEEN 500 AND 1000 THEN 'Mid-range'
        ELSE 'Premium'
    END AS price_category
FROM products;

-- SELECT with IF: Use IF to create a binary condition column
SELECT customer_id, first_name, last_name,
    IF(age > 30, 'Older than 30', '30 or younger') AS age_group
FROM customers;

-- SELECT with LIMIT Clause: Retrieve the first 2 products
SELECT * FROM products
LIMIT 2;
SELECT * FROM orders;
SELECT c.first_name, c.last_name, o.order_date, o.order_amount
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id;
SELECT product_name, stock
FROM products
WHERE stock < 50;
SELECT AVG(age) AS average_age
FROM customers;

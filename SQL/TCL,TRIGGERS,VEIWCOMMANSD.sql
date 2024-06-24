CREATE DATABASE shop;

USE shop;
-- Products Table
CREATE TABLE products (
    pid INT(3) PRIMARY KEY,
    pname VARCHAR(50) NOT NULL,
    price INT(10) NOT NULL,
    stock INT(5),
    location VARCHAR(30) CHECK(location IN ('Mumbai', 'Delhi'))
);

-- Customer Table
CREATE TABLE customer (
    cid INT(3) PRIMARY KEY,
    cname VARCHAR(30) NOT NULL,
    age INT(3),
    addr VARCHAR(50)
);

-- Orders Table
CREATE TABLE orders (
    oid INT(3) PRIMARY KEY,
    cid INT(3),
    pid INT(3),
    amt INT(10) NOT NULL,
    FOREIGN KEY(cid) REFERENCES customer(cid),
    FOREIGN KEY(pid) REFERENCES products(pid)
);

-- Payment Table
CREATE TABLE payment (
    pay_id INT(3) PRIMARY KEY,
    oid INT(3),
    amount INT(10) NOT NULL,
    mode VARCHAR(30) CHECK(mode IN ('upi', 'credit', 'debit')),
    status VARCHAR(30),
    FOREIGN KEY(oid) REFERENCES orders(oid)
);
-- Insert values into products table
INSERT INTO products VALUES (1, 'HP Laptop', 50000, 15, 'Mumbai');
INSERT INTO products VALUES (2, 'Realme Mobile', 20000, 30, 'Delhi');
INSERT INTO products VALUES (3, 'Boat Earpods', 3000, 50, 'Delhi');
INSERT INTO products VALUES (4, 'Lenovo Laptop', 40000, 15, 'Mumbai');
INSERT INTO products VALUES (5, 'Charger', 1000, 0, 'Mumbai');
INSERT INTO products VALUES (6, 'Mac Book', 78000, 6, 'Delhi');
INSERT INTO products VALUES (7, 'JBL Speaker', 6000, 2, 'Delhi');

-- Insert values into customer table
INSERT INTO customer VALUES (101, 'Ravi', 30, 'Mumbai');
INSERT INTO customer VALUES (102, 'Rahul', 25, 'Delhi');
INSERT INTO customer VALUES (103, 'Simran', 32, 'Delhi');
INSERT INTO customer VALUES (104, 'Purvesh', 28, 'Mumbai');
INSERT INTO customer VALUES (105, 'Sanjana', 22, 'Delhi');

-- Insert values into orders table
INSERT INTO orders VALUES (10001, 102, 3, 2700);
INSERT INTO orders VALUES (10002, 104, 2, 18000);
INSERT INTO orders VALUES (10003, 105, 5, 900);
INSERT INTO orders VALUES (10004, 101, 1, 46000);

-- Insert values into payment table
INSERT INTO payment VALUES (1, 10001, 2700, 'upi', 'completed');
INSERT INTO payment VALUES (2, 10002, 18000, 'credit', 'completed');
INSERT INTO payment VALUES (3, 10003, 900, 'debit', 'in process');
-- Commit: Save transactions
COMMIT;

-- Rollback: Undo transactions
ROLLBACK;

-- Savepoint: Create a savepoint
SAVEPOINT a;

-- Rollback to savepoint
ROLLBACK TO a;
DELIMITER //
CREATE TRIGGER products_after_insert
AFTER INSERT ON products
FOR EACH ROW
BEGIN
    INSERT INTO product_log (pid, pname, price, stock, location, inserted_at)
    VALUES (NEW.pid, NEW.pname, NEW.price, NEW.stock, NEW.location, NOW());
END //
DELIMITER ;
DELIMITER //
CREATE TRIGGER products_after_update
AFTER UPDATE ON products
FOR EACH ROW
BEGIN
    IF OLD.pid <> NEW.pid OR OLD.pname <> NEW.pname OR OLD.price <> NEW.price OR OLD.stock <> NEW.stock OR OLD.location <> NEW.location THEN
        INSERT INTO product_log (pid, pname, price, stock, location, updated_at)
        VALUES (OLD.pid, OLD.pname, OLD.price, OLD.stock, OLD.location, NOW());
    END IF;
END //
DELIMITER ;
DELIMITER //
CREATE TRIGGER products_after_delete
AFTER DELETE ON products
FOR EACH ROW
BEGIN
    DECLARE has_orders INT DEFAULT 0;

    SELECT COUNT(*) INTO has_orders
    FROM orders
    WHERE pid = OLD.pid;

    IF has_orders > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot delete product with existing orders. Update or delete orders first.';
    END IF;
END //
DELIMITER ;
DELIMITER //
CREATE TRIGGER set_default_payment_status
BEFORE INSERT ON payment
FOR EACH ROW
BEGIN
    IF NEW.status IS NULL THEN
        SET NEW.status = 'Pending';
    END IF;
END //
DELIMITER ;
-- Trigger to update payment status after an order is completed
DELIMITER //
CREATE TRIGGER update_payment_status
AFTER UPDATE ON orders
FOR EACH ROW
BEGIN
    IF NEW.status = 'completed' THEN
        UPDATE payment
        SET status = 'completed'
        WHERE oid = NEW.oid;
    END IF;
END //
DELIMITER ;

-- Trigger to check stock availability before inserting an order
DELIMITER //
CREATE TRIGGER check_stock_before_order
BEFORE INSERT ON orders
FOR EACH ROW
BEGIN
    DECLARE available_stock INT;
    SELECT stock INTO available_stock FROM products WHERE pid = NEW.pid;
    IF available_stock < NEW.amt THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Insufficient stock for this product';
    END IF;
END //
DELIMITER ;

-- Trigger to update stock after an order is placed
DELIMITER //
CREATE TRIGGER update_stock_after_order
AFTER INSERT ON orders
FOR EACH ROW
BEGIN
    UPDATE products
    SET stock = stock - NEW.amt
    WHERE pid = NEW.pid;
END // 
DELIMITER ;
-- View for Customer Orders
CREATE VIEW CustomerOrders AS
SELECT c.cid, c.cname, o.oid, o.amt, p.pname
FROM customer c
JOIN orders o ON c.cid = o.cid
JOIN products p ON o.pid = p.pid;

-- View for Payment Details with Order and Customer Information
CREATE OR REPLACE VIEW payment_order_customer_details AS
SELECT p.pay_id, p.oid, o.cid, c.cname, c.age, c.addr, p.amount, p.mode, p.status
FROM payment p
JOIN orders o ON p.oid = o.oid
JOIN customer c ON o.cid = c.cid;
-- Drop view if exists
DROP VIEW IF EXISTS payment_order_customer_details;
DROP VIEW IF EXISTS CustomerOrders;
INSERT INTO example_table VALUES (1, 'Example 1', 'This is an example description.');
INSERT INTO example_table VALUES (2, 'Example 2', 'This is another example description.');


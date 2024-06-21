
CREATE DATABASE sample_db;


USE sample_db;


CREATE TABLE employees (
    emp_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_name VARCHAR(100),
    department_id INT,
    salary DECIMAL(10, 2)
);


CREATE TABLE departments (
    dept_id INT AUTO_INCREMENT PRIMARY KEY,
    dept_name VARCHAR(100)
);


INSERT INTO employees (emp_name, department_id, salary) VALUES
('Alice', 1, 50000.00),
('Bob', 2, 60000.00),
('Charlie', 1, 55000.00),
('David', 3, 70000.00);


INSERT INTO departments (dept_name) VALUES
('HR'),
('Finance'),
('Engineering');
DELIMITER //
CREATE PROCEDURE get_employees_by_dept(IN dept_id INT)
BEGIN
    SELECT * FROM employees WHERE department_id = dept_id;
END //
DELIMITER ;


CALL get_employees_by_dept(1);
DELIMITER //
CREATE PROCEDURE get_employee_count(OUT emp_count INT)
BEGIN
    SELECT COUNT(*) INTO emp_count FROM employees;
END //
DELIMITER ;


CALL get_employee_count(@emp_count);
SELECT @emp_count AS employee_count;
DELIMITER //
CREATE PROCEDURE print_employee_names()
BEGIN
    DECLARE emp_name VARCHAR(100);
    DECLARE done INT DEFAULT FALSE;
    DECLARE emp_cursor CURSOR FOR SELECT emp_name FROM employees;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN emp_cursor;

    get_names: LOOP
        FETCH emp_cursor INTO emp_name;
        IF done THEN
            LEAVE get_names;
        END IF;
        SELECT emp_name;
    END LOOP get_names;

    CLOSE emp_cursor;
END //
DELIMITER ;


CALL print_employee_names();
DELIMITER $$
CREATE FUNCTION get_total_salary()
RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    DECLARE total_salary DECIMAL(10, 2);
    SELECT SUM(salary) INTO total_salary FROM employees;
    RETURN total_salary;
END $$
DELIMITER ;


SELECT get_total_salary() AS total_salary;
DELIMITER //
CREATE PROCEDURE get_department_details(IN dept_id INT)
BEGIN
    SELECT * FROM departments WHERE dept_id = dept_id;
END //
DELIMITER ;


CALL get_department_details(2);
DELIMITER //
CREATE PROCEDURE get_department_count(OUT dept_count INT)
BEGIN
    SELECT COUNT(*) INTO dept_count FROM departments;
END //
DELIMITER ;


CALL get_department_count(@dept_count);
SELECT @dept_count AS department_count;

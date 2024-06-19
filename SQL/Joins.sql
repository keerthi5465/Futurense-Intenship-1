CREATE TABLE employees (
    employee_id INT,
    employee_name VARCHAR(50),
    department_id INT
);

INSERT INTO employees (employee_id, employee_name, department_id)
VALUES
    (1, 'Alice', 1),
    (2, 'Bob', 2),
    (3, 'Charlie', 1),
    (4, 'David', 3),
    (5, 'Eve', NULL);
CREATE TABLE departments (
    department_id INT,
    department_name VARCHAR(50)
);

INSERT INTO departments (department_id, department_name)
VALUES
    (1, 'HR'),
    (2, 'IT'),
    (3, 'Finance');
CREATE TABLE managers (
    manager_id INT,
    manager_name VARCHAR(50),
    department_id INT
);

INSERT INTO managers (manager_id, manager_name, department_id)
VALUES
    (101, 'Alice Manager', 1),
    (102, 'Bob Manager', 2),
    (103, 'Charlie Manager', 1);
-- Inner Join

SELECT e.employee_id, e.employee_name, d.department_name
FROM employees e
INNER JOIN departments d ON e.department_id = d.department_id;
-- Left Outer JOin

SELECT e.employee_id, e.employee_name, d.department_name
FROM employees e
LEFT JOIN departments d ON e.department_id = d.department_id;

-- RightOuter

SELECT e.employee_id, e.employee_name, d.department_name
FROM employees e
RIGHT JOIN departments d ON e.department_id = d.department_id;

-- self Join


SELECT e1.employee_name AS employee1, e2.employee_name AS employee2, d.department_name
FROM employees e1
JOIN employees e2 ON e1.department_id = e2.department_id AND e1.employee_id < e2.employee_id
LEFT JOIN departments d ON e1.department_id = d.department_id;

-- Cross Join


SELECT e.employee_name, d.department_name
FROM employees e
CROSS JOIN departments d;




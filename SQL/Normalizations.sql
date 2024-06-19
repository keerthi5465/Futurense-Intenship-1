CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

INSERT INTO employees (employee_id, employee_name, department_id)
VALUES
    (1, 'Alice', 1),
    (2, 'Bob', 2),
    (3, 'Charlie', 1),
    (4, 'David', 3),
    (5, 'Eve', NULL);
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

INSERT INTO departments (department_id, department_name)
VALUES
    (1, 'HR'),
    (2, 'IT'),
    (3, 'Finance');
CREATE TABLE projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(50),
    employee_id INT,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

INSERT INTO projects (project_id, project_name, employee_id)
VALUES
    (101, 'Project A', 1),
    (102, 'Project B', 2),
    (103, 'Project C', 3),
    (104, 'Project D', 1);

INSERT INTO projects (project_id, project_name)
VALUES (105, 'Project E');



DELETE FROM employees WHERE employee_id = 1;

UPDATE departments SET department_name = 'Human Resources' WHERE department_id = 1;

-- Also NOrmalization - 1Nf (Single- Valued attributes) & (No repeated groups)
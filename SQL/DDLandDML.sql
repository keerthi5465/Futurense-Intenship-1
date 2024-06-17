CREATE TABLE employee (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    position VARCHAR(100),
    salary DECIMAL(10, 2)
);

INSERT INTO employee (id, name, position, salary)
VALUES (1, 'John Doe', 'Manager', 75000.00);


UPDATE employee
SET salary = 80000.00
WHERE id = 1;


DELETE FROM employee
WHERE id = 1;

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    course_id INT
);


CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100)
);


ALTER TABLE students
ADD CONSTRAINT fk_course
FOREIGN KEY (course_id) REFERENCES courses(course_id);


INSERT INTO courses (course_id, course_name)
VALUES (1, 'Computer Science'), (2, 'Mathematics');

INSERT INTO students (student_id, name, age, course_id)
VALUES (1, 'Alice Smith', 20, 1), (2, 'Bob Johnson', 22, 2);


SELECT * FROM products
WHERE price > 50.00
AND manufacture_date >= '2023-01-01';


UPDATE products
SET last_updated = CURRENT_TIMESTAMP
WHERE product_id = 1;


DELETE FROM products
WHERE stock < 10;

create database school;
use school;

CREATE TABLE students (
  student_id INT PRIMARY KEY,
  student_name VARCHAR(100)
);

INSERT INTO students (student_id, student_name)
VALUES
  (1, 'Aarav'),
  (2, 'Priya'),
  (3, 'Ishaan');


CREATE TABLE employees (
  employee_id INT PRIMARY KEY,
  employee_name VARCHAR(100)
);

INSERT INTO employees (employee_id, employee_name)
VALUES
  (101, 'Meena'),
  (102, 'Diya'),
  (103, 'Aarav');

SELECT student_name AS name
FROM students
UNION
SELECT employee_name AS name
FROM employees;


SELECT student_name AS name
FROM students
UNION ALL
SELECT employee_name AS name
FROM employees;


SELECT student_name
FROM students
UNION
SELECT employee_id
FROM employees;

SELECT * 
FROM students
UNION
SELECT *
FROM employees;

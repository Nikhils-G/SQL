-- Create Tables
CREATE TABLE Departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    dept_id INT,
    joining_date DATE,
    salary INT,
    manager_id INT,
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);

-- Insert Sample Data
INSERT INTO Departments VALUES (1, 'Engineering'), (2, 'HR'), (3, 'Sales');

INSERT INTO Employees VALUES
(101, 'Alice', 1, '2020-01-15', 70000, NULL),
(102, 'Bob', 1, '2019-03-12', 60000, 101),
(103, 'Charlie', 2, '2021-07-01', 50000, 101),
(104, 'David', 3, '2018-11-23', 55000, 102),
(105, 'Eva', 2, '2022-01-10', 45000, 103),
(106, 'Frank', 3, '2020-05-05', 65000, 104);

-- 1. SELECT with WHERE
SELECT emp_name, salary FROM Employees WHERE salary > 55000;

-- 2. DISTINCT values
SELECT DISTINCT dept_id FROM Employees;

-- 3. ORDER BY
SELECT emp_name, salary FROM Employees ORDER BY salary DESC;

-- 4. GROUP BY with COUNT
SELECT dept_id, COUNT(*) AS total_employees FROM Employees GROUP BY dept_id;

-- 5. HAVING
SELECT dept_id, AVG(salary) AS avg_sal FROM Employees GROUP BY dept_id HAVING AVG(salary) > 55000;

-- 6. JOIN (INNER JOIN)
SELECT e.emp_name, d.dept_name FROM Employees e JOIN Departments d ON e.dept_id = d.dept_id;

-- 7. LEFT JOIN
SELECT e.emp_name, m.emp_name AS manager_name
FROM Employees e LEFT JOIN Employees m ON e.manager_id = m.emp_id;

-- 8. Subquery
SELECT emp_name FROM Employees
WHERE salary > (SELECT AVG(salary) FROM Employees);

-- 9. CASE Statement
SELECT emp_name,
       CASE
           WHEN salary >= 65000 THEN 'High'
           WHEN salary >= 50000 THEN 'Medium'
           ELSE 'Low'
       END AS salary_category
FROM Employees;

-- 10. Window Function (RANK)
SELECT emp_name, dept_id, salary,
       RANK() OVER(PARTITION BY dept_id ORDER BY salary DESC) AS salary_rank
FROM Employees;

-- 11. UPDATE
UPDATE Employees SET salary = salary + 5000 WHERE emp_name = 'Bob';

-- 12. DELETE
DELETE FROM Employees WHERE emp_name = 'Eva';

-- 13. LIMIT
SELECT * FROM Employees LIMIT 3;

-- 14. IN, BETWEEN, LIKE
SELECT emp_name FROM Employees
WHERE dept_id IN (1, 3)
AND salary BETWEEN 50000 AND 70000
AND emp_name LIKE 'D%';

-- 15. ALIAS
SELECT emp_name AS "Employee", salary AS "Monthly Salary" FROM Employees;

-- Step 1: Create a table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,  -- Unique identifier for each employee
    Name VARCHAR(100) NOT NULL,  -- Employee name (mandatory)
    Age INT CHECK (Age >= 18),   -- Ensures age is at least 18
    Department VARCHAR(50),      -- Employee's department
    Salary DECIMAL(10,2)         -- Employee's salary with 2 decimal places
);

-- Step 2: Insert data into the table
INSERT INTO Employees (EmployeeID, Name, Age, Department, Salary)
VALUES 
(1, 'John Doe', 30, 'HR', 50000.00),
(2, 'Jane Smith', 25, 'IT', 60000.50),
(3, 'Alice Johnson', 28, 'Finance', 55000.75),
(4, 'Bob Brown', 35, 'IT', 62000.00);

-- Step 3: Retrieve all employee records
SELECT * FROM Employees;

-- Step 4: Retrieve employees from IT department
SELECT Name, Salary FROM Employees WHERE Department = 'IT';

-- Step 5: Increase salary by 10% for employees in Finance
UPDATE Employees SET Salary = Salary * 1.10 WHERE Department = 'Finance';

-- Step 6: Delete employees older than 40
DELETE FROM Employees WHERE Age > 40;

-- Step 7: Get the average salary of all employees
SELECT AVG(Salary) AS Average_Salary FROM Employees;

-- Step 1: Create a table
CREATE TABLE Students (
    ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT
);

-- Step 2: Insert data into the table
INSERT INTO Students (ID, Name, Age) VALUES (1, 'Nikhil', 21);
INSERT INTO Students (ID, Name, Age) VALUES (2, 'Ravi', 22);
INSERT INTO Students (ID, Name, Age) VALUES (3, 'Priya', 20);

-- Step 3: Retrieve all data from the table
SELECT * FROM Students;

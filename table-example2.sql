-- Step 1: Create 'Customers' Table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY, 
    Name VARCHAR(100) NOT NULL,
    City VARCHAR(50)
);

-- Step 2: Create 'Orders' Table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    Amount DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)  -- Establishing Relationship
);

-- Step 3: Insert Data into 'Customers'
INSERT INTO Customers (CustomerID, Name, City) 
VALUES 
(1, 'Alice Johnson', 'New York'),
(2, 'Bob Smith', 'Los Angeles'),
(3, 'Charlie Brown', 'Chicago');

-- Step 4: Insert Data into 'Orders'
INSERT INTO Orders (OrderID, CustomerID, OrderDate, Amount) 
VALUES 
(101, 1, '2024-01-15', 250.75),
(102, 2, '2024-02-10', 300.00),
(103, 1, '2024-02-20', 150.25),
(104, 3, '2024-03-05', 400.50);

-- Step 5: Retrieve all Orders with Customer Details (JOIN)
SELECT Orders.OrderID, Customers.Name, Orders.OrderDate, Orders.Amount
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID;

-- Step 6: Get Total Spending by Each Customer (GROUP BY)
SELECT Customers.Name, SUM(Orders.Amount) AS TotalSpent
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID
GROUP BY Customers.Name;

-- Step 7: Retrieve Orders Sorted by Amount in Descending Order
SELECT * FROM Orders ORDER BY Amount DESC;

-- Step 8: Find Customers Who Have Placed Orders Greater Than $200
SELECT DISTINCT Customers.Name 
FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
WHERE Orders.Amount > 200;

DROP TABlE IF EXISTS Customers;

DROP TABlE IF EXISTS Orders;


CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    City VARCHAR(50),
    Country VARCHAR(50)
);


CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Customers (CustomerID, CustomerName, City, Country) 
VALUES 
(1, 'John Doe', 'New York', 'USA'),
(2, 'Jane Smith', 'Los Angeles', 'USA'),
(3, 'Michael Johnson', 'Chicago', 'USA'),
(4, 'Emily Brown', 'Houston', 'USA');


INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount) 
VALUES 
(101, 1, '2024-05-10', 150.00),
(102, 2, '2024-05-11', 200.00),
(103, 1, '2024-05-12', 100.00),
(104, 3, '2024-05-13', 300.00);

SELECT * FROM CUSTOMERS

SELECT * FROM ORDERS

--You are given customers and orders table with columns
--customers has columns  cx_id, cx_name, city, country

--orders table has COLUMNS order_id, cx_id, order_date, totalamount

--Write an SQL query to retrive customer details along with their total order amounts(if any). 
    
--Include the customer's name, city, country, and total order amount. 
    
--If a customer hasn't placed any orders, display 'NULL' for the total order amount."


--customer's name, city, country, and total order amount.
--Total Order Amount

SELECT customername,city,country,
COALESCE(SUM(o.totalamount),NULL)AS TOTAL_AMOUNT
FROM CUSTOMERS c
LEFT JOIN ORDERS o
ON c.customerid=o.customerid
GROUP BY 1,2,3


--Zero Analyst Solution

SELECT 
    c.*,
    SUM(o.totalamount) as total_orders
FROM customers as c
LEFT JOIN
orders as o
ON o.customerid = c.customerid
GROUP BY 1




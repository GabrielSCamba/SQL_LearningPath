/*
Exercise 1 – ROW_NUMBER()

List all orders and assign a row number to each order per customer, ordered by OrderDate.
*/

SELECT OrderID, CustomerID, ROW_NUMBER() OVER(PARTITION BY CustomerID ORDER BY OrderDate) AS RowNumber
FROM Orders

/*
Exercise 2 – RANK() and DENSE_RANK()

Find the top 3 most expensive products in each category. Use RANK() or DENSE_RANK() to assign the rank.
*/

WITH cte AS (
SELECT ProductName, CategoryID, UnitPrice, DENSE_RANK() OVER(PARTITION BY CategoryID ORDER BY UnitPrice DESC) AS Rank
FROM Products
)

SELECT ProductName, CategoryID, UnitPrice
FROM cte
WHERE Rank <= 3

/*
Exercise 3 – LAG()

For each order, show the previous order date of the same customer. Include OrderID, CustomerID, OrderDate, and PreviousOrderDate.
*/

SELECT CustomerID, OrderID, OrderDate, LAG(OrderDate) OVER(PARTITION BY CustomerID ORDER BY OrderDate) AS PreviousOrderDate
FROM Orders

/*
Exercise 4 – LEAD()

For each employee, display their current order and the next order they handled. Include EmployeeID, OrderID, OrderDate, and NextOrderID.
*/

SELECT Employeeid, OrderID, OrderDate, LEAD(OrderDate) OVER(PARTITION BY EmployeeID ORDER BY OrderDate) AS NextOrderID
FROM Orders

/*
Exercise 5 – SUM() OVER()

Calculate a running total of UnitPrice * Quantity per customer for all their orders in [Order Details]. Include OrderID, CustomerID, and RunningTotal.
*/

SELECT OD.OrderID, O.CustomerID, SUM(OD.UnitPrice * OD.Quantity) OVER(PARTITION BY O.CustomerID  ORDER BY O.OrderDate, O.OrderID) AS RunningTotal
FROM [Order Details] OD
JOIN Orders O ON O.OrderID = OD.OrderID

/*
Exercise 6 – AVG() OVER()

Find the average unit price of products per category and display it alongside each product. Include ProductID, ProductName, CategoryID, UnitPrice, and AveragePrice.
*/

SELECT ProductID, ProductName, CategoryID, UnitPrice, AVG(UnitPrice) OVER(PARTITION BY CategoryID) AS AveragePrice
FROM Products 

/*
Exercise 7 – NTILE()

Divide products into 4 quartiles based on UnitPrice. Include ProductID, ProductName, UnitPrice, and PriceQuartile.
*/

SELECT ProductID, ProductName, UnitPrice,
    NTILE(4) OVER(ORDER BY UnitPrice) AS PriceQuartile
FROM Products

/*
Exercise 8 – Combined Window Functions

For each employee, show total sales, number of orders, and their rank among all employees based on total sales. Include EmployeeID, FullName, TotalSales, OrdersCount, SalesRank.
*/

WITH MyCTE AS (
    SELECT 
        E.EmployeeID, 
        (E.FirstName + ' ' + E.LastName) AS FullName, 
        SUM(OD.Quantity * OD.UnitPrice * (1- OD.Discount)) AS TotalSales, 
        COUNT(O.OrderID) AS OrderCount
    FROM [Order Details] OD
    JOIN Orders O ON O.OrderID = OD.OrderID 
    JOIN Employees E ON E.EmployeeID = O.EmployeeID
    GROUP BY E.EmployeeID, E.FirstName + ' ' + E.LastName
)

SELECT *,
    RANK() OVER(ORDER BY TotalSales DESC) AS SalesRank
FROM MyCTE



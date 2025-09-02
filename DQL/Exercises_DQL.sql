/*
Northwind DQL Exercises
1. SELECT – Retrieve all data
Get all columns and rows from the Employees table.
*/

SELECT *
FROM Employees

/*
2. SELECT specific columns
Retrieve only FirstName, LastName, and Title from the Employees table.
*/

SELECT FirstName, LastName, Title 
FROM Employees

/*
3. DISTINCT – Unique values
List all unique Country values from the Customers table.
*/

SELECT DISTINCT(Country)
FROM Employees

/*
4. WHERE – Filtering
Find all employees whose Title is "Sales Representative".
*/

SELECT *
FROM Employees
WHERE Title = 'Sales Representative'

/*
5. WHERE with operators
Get all products with UnitPrice greater than 20 and less than 50.
*/

SELECT *
FROM Products 
WHERE UnitPrice > 20 AND UnitPrice < 50

SELECT *
FROM Products 
WHERE UnitPrice BETWEEN 20 AND 50

/*
6. WHERE with pattern matching
Retrieve all customers whose CompanyName starts with "A".
*/

SELECT *
FROM Customers
WHERE CompanyName LIKE 'A%'

/*
7. WHERE with dates
List all orders placed after 1997-01-01.
*/

SELECT *
FROM Orders
WHERE OrderDate > '1997-01-01'

/*
8. ORDER BY – Sorting
Get all customers ordered by Country (ascending) and then by CompanyName (descending).
*/

SELECT *
FROM Customers
ORDER BY Country ASC, CompanyName DESC

/*
9. ORDER BY with numbers
List all products sorted by UnitPrice in descending order.
*/

SELECT ProductName
FROM Products
ORDER BY UnitPrice DESC

/*
10. GROUP BY – Aggregation
Show the number of customers per Country.
*/

SELECT Country, COUNT(CustomerID) AS CustomersCount
FROM Customers
GROUP BY Country

/*
11. GROUP BY with aggregation function
Get the average UnitPrice of products grouped by CategoryID.
*/

SELECT CategoryID, AVG(UnitPrice) AS Average
FROM Products
GROUP BY CategoryID

/*
12. HAVING – Filter groups
Find all categories where the average UnitPrice is greater than 30.
*/

SELECT CategoryID, AVG(UnitPrice) AS Average
FROM Products
GROUP BY CategoryID
HAVING AVG(UnitPrice)  > 30

/*
13. COUNT with GROUP BY
Show how many orders each customer has made.
*/

SELECT CustomerID, COUNT(OrderID) AS Count
FROM Orders
GROUP BY CustomerID

/*
14. JOIN – Basic INNER JOIN
List all orders with the corresponding customer name (Orders + Customers).
*/

SELECT O.OrderID, C.ContactName
FROM Orders O 
INNER JOIN Customers C ON O.CustomerID = C.CustomerID

/*
15. JOIN with multiple tables
Get a list of all orders with the OrderID, customer name, and employee name.
*/

SELECT O.OrderID, C.ContactName AS CustomerName, E.FirstName AS EmployeeFirstName, E.LastName AS EmployeeLastName
FROM Orders O 
INNER JOIN Customers C ON O.CustomerID = C.CustomerID
INNER JOIN Employees E ON O.EmployeeID = E.EmployeeID

/*
16. JOIN with WHERE
Retrieve all orders shipped to Germany with customer and shipper details.
*/

SELECT O.OrderID, C.ContactName, O.ShipName
FROM Orders O
INNER JOIN Customers C ON O.CustomerID = C.CustomerID
WHERE O.ShipCountry = 'Germany'

/*
17. LEFT JOIN
List all customers and their orders, including those who have not placed any orders.
*/

SELECT  C.ContactName, O.OrderID
FROM Customers C 
LEFT JOIN Orders O ON C.CustomerID = O.CustomerID

/*
18. Aggregation with JOIN
Show the total order amount per customer (use OrderDetails joined with Orders).
*/

SELECT O.OrderID, SUM(OD.UnitPrice * OD.Quantity) AS Total_Amount
FROM "Order Details" OD
LEFT JOIN Orders O ON O.OrderID = OD.OrderID
GROUP BY o.OrderID

/*
19. Nested queries (subquery)
Find all products whose UnitPrice is greater than the average price of all products.
*/

SELECT ProductID, UnitPrice
FROM Products
WHERE UnitPrice >  (SELECT AVG(UnitPrice) AS AveragePrice FROM Products)

/*
20. Complex GROUP BY + JOIN
List each employee and the number of orders they handled in 1997.
*/

SELECT E.FirstName, E.LastName, COUNT(O.OrderID) AS CountOrders
FROM Orders O
JOIN Employees E ON E.EmployeeID = O.EmployeeID
WHERE YEAR(OrderDate) = 1997
GROUP BY E.FirstName, E.LastName
select * from Employees

/*
Exercise – Top Customers by Sales in 1997
Write a query that returns the top 5 customers who spent the most money on orders in 1997.

The query should include:

Customer CompanyName
The total sales amount (sum of UnitPrice * Quantity * (1 - Discount))
Number of orders placed in 1997
Order the results by total sales amount (descending)
Limit to top 5 customers
*/

SELECT TOP 5 C.CompanyName, SUM(OD.UnitPrice * OD.Quantity * (1 - OD.Discount)) AS TotalSales, COUNT(DISTINCT O.OrderID) AS OrdersCount
FROM Orders O
INNER JOIN [Order Details] OD ON O.OrderID = OD.OrderID
INNER JOIN Customers C ON C.CustomerID = O.CustomerID
WHERE YEAR(O.OrderDate) = 1997
GROUP BY C.CompanyName
ORDER BY TotalSales DESC
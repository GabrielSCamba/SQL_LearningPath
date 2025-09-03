/*
Exercise 1 – Single-Row Subquery

Retrieve the FirstName and LastName of the employee with the latest HireDate.
*/

SELECT FirstName, LastName 
FROM Employees 
WHERE HireDate = (SELECT TOP 1 HireDate FROM Employees ORDER BY HireDate DESC)

/*
Exercise 2 – Multiple-Row Subquery

List all CompanyName from Customers who have placed orders in 1997.
*/

SELECT DISTINCT CompanyName
FROM Customers 
WHERE CustomerID IN (SELECT CustomerID FROM Orders WHERE YEAR(OrderDate) = 1997)


/*
Exercise 3 – Subquery in FROM Clause (Inline View)

Find customers with more than 5 orders. Display CustomerID and TotalOrders.
*/

SELECT Sub.CustomerID, TotalOrders
FROM (SELECT CustomerID, COUNT(OrderID) AS TotalOrders FROM Orders GROUP BY CustomerID) Sub
WHERE TotalOrders > 5

/*
Exercise 4 – Single-Row with Comparison

Retrieve the ProductName and UnitPrice of the most expensive product in the Products table.
*/

SELECT ProductName, UnitPrice
FROM Products
WHERE UnitPrice = (SELECT MAX(UnitPrice) FROM Products)

/*
Exercise 5 – Multiple-Row with IN

List all orders where the CustomerID matches a customer who placed orders in July 1997.
*/


SELECT CustomerID, OrderID 
FROM Orders
WHERE CustomerID IN (SELECT CustomerID FROM Orders WHERE OrderDate >= '01-07-1997' AND OrderDate < '01-08-1997') 

/*
Exercise 6 – Correlated Subquery with Aggregation

Retrieve EmployeeID and LastName of employees who have handled more orders than the average number of orders per employee.
*/

SELECT O.EmployeeID, E.LastName, COUNT(O.OrderID) AS CountOrders
FROM Orders O
JOIN Employees E ON E.EmployeeID = O.EmployeeID
GROUP BY O.EmployeeID, E.LastName
HAVING COUNT(O.OrderID) > (SELECT AVG(Sub.NumOrders) AvgOrdersPerEmployee
                        FROM (SELECT EmployeeID, COUNT(OrderID) NumOrders FROM Orders GROUP BY EmployeeID) Sub)


/*
Exercise 7 – Nested Subqueries

List CompanyName of customers who have placed orders that include products from the 'Beverages' category.
*/


SELECT CompanyName
FROM Customers
WHERE CustomerID IN (SELECT CustomerID 
                    FROM Orders 
                    WHERE OrderID IN (SELECT OrderID 
                                        FROM "Order Details" 
                                        WHERE ProductID IN (SELECT ProductID 
                                                            FROM Products 
                                                            WHERE CategoryID IN (SELECT CategoryID 
                                                                                FROM Categories 
                                                                                WHERE CategoryName = 'Beverages'
                                                                                )
                                                            )
                                        )
                    )
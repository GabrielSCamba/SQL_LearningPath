/*
Exercise 1 – Simple CTE

Write a CTE to select all employees with their full name (FirstName + ' ' + LastName) and their HireDate.
*/

WITH cte AS (
    SELECT (FirstName + ' ' + LastName) AS FullName, HireDate
    FROM Employees
) 

SELECT * 
FROM cte

/*
Exercise 2 – CTE with Aggregation

Create a CTE that calculates the total number of orders per customer. Then, select all customers with more than 10 orders.
*/

WITH cte AS (
    SELECT CustomerID, COUNT(OrderID) AS CountOrders
    FROM Orders
    GROUP BY CustomerID
)

SELECT CustomerID
FROM cte
WHERE CountOrders > 10


/*
Exercise 3 – CTE in a Multi-CTE Query

First CTE: Count the number of orders per employee.

Second CTE: Calculate the average orders across all employees.

Final query: Select employees who handled more orders than the average.
*/

WITH cte AS(
    SELECT EmployeeID, COUNT(OrderID) AS CountOrders
    FROM Orders
    GROUP BY EmployeeID
),

cte1 AS(
    SELECT AVG(CountOrders) AS AvgOrders
    FROM cte
)

SELECT EmployeeID
FROM cte
WHERE CountOrders > (SELECT AvgOrders FROM cte1)

/*
Exercise 4 – Nested CTEs

Use a CTE to find the top 5 most expensive products. Then use another CTE (based on the first one) to list only those products whose UnitPrice is greater than the overall average UnitPrice of all products.
*/

WITH cte AS(
    SELECT TOP 5 ProductID, UnitPrice
    FROM Products
    ORDER BY UnitPrice DESC
),

cte1 AS(
    SELECT AVG(UnitPrice) AS AvgUnitPrice
    FROM Products
)

SELECT ProductID, UnitPrice
FROM cte
WHERE UnitPrice > (SELECT AvgUnitPrice FROM cte1)


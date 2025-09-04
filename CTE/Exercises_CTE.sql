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
Exercise 3 – CTE with JOIN

Write a CTE that lists each employee and the total number of orders they handled. Then query the CTE to return employees who processed more than 100 orders.
*/

/*
Exercise 4 – Recursive CTE

Use a recursive CTE to list the hierarchy of employees, starting with managers and including their subordinates (based on ReportsTo column in Employees table).
*/

/*
Exercise 5 – CTE with Multiple References

Create a CTE that calculates the average UnitPrice per category from the Products table. Then, select only the categories where the average price is higher than 30.
*/

/*
Exercise 6 – CTE in a Multi-CTE Query

First CTE: Count the number of orders per employee.

Second CTE: Calculate the average orders across all employees.

Final query: Select employees who handled more orders than the average.
*/

/*
Exercise 7 – Nested CTEs

Use a CTE to find the top 5 most expensive products. Then use another CTE (based on the first one) to list only those products whose UnitPrice is greater than the overall average UnitPrice of all products.
*/

/*
Exercise 8 – CTE with Window Function

Write a CTE that assigns a row number (ROW_NUMBER()) to each order per customer, ordered by OrderDate. Then, select only the most recent order for each customer.
*/
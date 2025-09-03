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
Exercise 3 – Multiple-Column Subquery

Retrieve EmployeeID and HireDate from Employees for employees whose (EmployeeID, HireDate) matches the earliest hire date per employee.
*/

SELECT EmployeeID, HireDate 
FROM Employees
WHERE EmployeeID IN (SELECT EmployeeID, HireDate FROM Employees GROUP BY EmployeeID, HireDate  )
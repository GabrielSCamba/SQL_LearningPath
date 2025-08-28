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
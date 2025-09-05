/*
1. Basic Stored Procedure

Create a stored procedure that returns all customers from the Customers table.

Input: none

Output: all columns from Customers
*/

CREATE PROCEDURE sp_Customers AS
BEGIN
    SELECT *
    FROM Customers;
END;

EXECUTE sp_Customers;
GO
/*
2. Stored Procedure with Input Parameter

Create a stored procedure that takes a CustomerID as input and returns all orders placed by that customer.
*/

CREATE PROCEDURE sp_CustomerOrders 
@Customer VARCHAR(5)
AS
BEGIN
    SELECT OrderID
    FROM Orders
    WHERE CustomerID = @Customer;
END;

EXEC sp_CustomerOrders @Customer = 'ALFKI';
GO

/*
3. Stored Procedure with Multiple Input Parameters

Create a stored procedure that takes StartDate and EndDate as input and returns all orders within that date range.
*/

CREATE PROCEDURE sp_RangeDates
@StartDate DATE,
@EndDate DATE
AS BEGIN
    SELECT OrderId
    FROM Orders
    WHERE OrderDate BETWEEN @StartDate AND @EndDate;
END;

EXEC sp_RangeDates
@StartDate = '1996-01-01', @EndDate = '1996-12-31';
GO
/*
4. Stored Procedure with Output Parameter

Create a stored procedure that takes an EmployeeID as input and returns the number of orders handled by that employee using an OUTPUT parameter.
*/

CREATE PROCEDURE sp_OrdersHandled
    @EmployeeID INT,
    @NumOrders INT OUTPUT
AS 
BEGIN
    SELECT @NumOrders = COUNT(OrderID)
    FROM Orders
    WHERE EmployeeID = @EmployeeID;
END;

DECLARE @CountOrders INT;

EXEC sp_OrdersHandled
    @EmployeeID = 1,
    @NumOrders = @CountOrders OUTPUT;

SELECT @CountOrders AS TotalOrders;

/*
5. Stored Procedure with Default Parameter

Create a stored procedure that returns all products with a price greater than a given value.

If no value is provided, it should default to 20.
*/

/*
6. Stored Procedure with Transactions

Create a stored procedure that inserts a new order and its order details. Ensure that if any step fails, the transaction is rolled back.
*/

/*
7. Stored Procedure with TRY...CATCH

Create a stored procedure that attempts to update the price of a product.

If the product does not exist, catch the error and return a custom message.
*/


/*
8. Stored Procedure with Dynamic SQL

Create a stored procedure that takes a table name as input and returns the total number of rows in that table using dynamic SQL.
*/

/*
9. Stored Procedure with Cursor

Create a stored procedure that loops through all employees using a cursor and prints their names.
*/

/*
10. Stored Procedure for Ranking

Create a stored procedure that ranks employees by their total sales and returns only the top N employees (where N is an input parameter).
*/
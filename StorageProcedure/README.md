# Stored Procedures in SQL Server

A **Stored Procedure** is a prepared SQL code that you can save and
reuse. Instead of writing queries repeatedly, you can store them in the
database and execute them whenever needed.

## Benefits of Stored Procedures

-   **Reusability**: Write once, use multiple times.
-   **Performance**: Compiled and optimized by SQL Server.
-   **Security**: Helps in controlling access to data.
-   **Maintainability**: Easier to update and manage business logic.

## Syntax

``` sql
CREATE PROCEDURE ProcedureName
    @Parameter1 DataType,
    @Parameter2 DataType
AS
BEGIN
    -- SQL statements
END;
```

## Example

``` sql
CREATE PROCEDURE GetCustomerOrders
    @CustomerID nchar(5)
AS
BEGIN
    SELECT OrderID, OrderDate, ShipCountry
    FROM Orders
    WHERE CustomerID = @CustomerID;
END;
```

## Executing a Stored Procedure

``` sql
EXEC GetCustomerOrders @CustomerID = 'ALFKI';
```

## Conclusion

Stored Procedures are a powerful feature in SQL Server to encapsulate
business logic, improve performance, and enhance maintainability of
database applications.
# SQL Subqueries

This document explains the concept of **subqueries** in SQL, their types, and how to use them effectively to perform complex data retrieval operations.

---

## What is a Subquery?

A **subquery** is a query nested inside another SQL query. It can be used in `SELECT`, `INSERT`, `UPDATE`, or `DELETE` statements. Subqueries allow you to use the result of one query as input for another, enabling more advanced data filtering, calculation, and comparison.

**Syntax:**
```sql
SELECT column1, column2
FROM table_name
WHERE column3 = (
    SELECT columnX
    FROM another_table
    WHERE condition
);
```

---

## Types of Subqueries

### 1. **Single-Row Subquery**
- Returns **only one row** and one column.  
- Often used with comparison operators: `=, <, >, <=, >=`.  

**Example:**  
```sql
SELECT FirstName, LastName
FROM Employees
WHERE EmployeeID = (
    SELECT MAX(EmployeeID)
    FROM Employees
);
```

---

### 2. **Multiple-Row Subquery**
- Returns **more than one row**.  
- Often used with `IN`, `ANY`, `ALL`.  

**Example:**  
```sql
SELECT CompanyName
FROM Customers
WHERE CustomerID IN (
    SELECT CustomerID
    FROM Orders
    WHERE OrderDate >= '1997-01-01'
);
```

---

### 3. **Multiple-Column Subquery**
- Returns **more than one column**.  
- Can be used with operators like `IN` or in the `FROM` clause.  

**Example:**  
```sql
SELECT EmployeeID, LastName
FROM Employees
WHERE (EmployeeID, HireDate) IN (
    SELECT EmployeeID, MIN(HireDate)
    FROM Employees
    GROUP BY EmployeeID
);
```

---

### 4. **Correlated Subquery**
- The subquery references a column from the **outer query**.  
- Evaluated **once for each row** of the outer query.  

**Example:**  
```sql
SELECT E1.FirstName, E1.LastName
FROM Employees E1
WHERE E1.HireDate = (
    SELECT MIN(E2.HireDate)
    FROM Employees E2
    WHERE E2.ReportsTo = E1.EmployeeID
);
```

---

### 5. **Subquery in FROM Clause (Inline View)**
- The subquery acts as a temporary table for the main query.  

**Example:**  
```sql
SELECT Sub.CustomerID, Sub.TotalOrders
FROM (
    SELECT CustomerID, COUNT(OrderID) AS TotalOrders
    FROM Orders
    GROUP BY CustomerID
) AS Sub
WHERE Sub.TotalOrders > 5;
```

---

## Key Points
- Subqueries can be **nested multiple levels** deep.  
- Use subqueries when **direct joins are complex or not possible**.  
- Performance: correlated subqueries may be slower than joins; consider indexing and query optimization.  

---

### Summary
- **Single-row subquery:** returns one value.  
- **Multiple-row subquery:** returns multiple values, used with `IN`, `ANY`, `ALL`.  
- **Multiple-column subquery:** returns multiple columns, used with `IN` or `FROM`.  
- **Correlated subquery:** depends on outer query row by row.  
- **Subquery in FROM clause:** acts as an inline view for complex calculations.  

Subqueries are a powerful tool in SQL for **dynamic filtering, aggregation, and complex query construction**.

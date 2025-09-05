# Window Functions in SQL

Window functions are powerful SQL features that allow you to perform calculations across a set of rows related to the current row without collapsing the result set into groups (like `GROUP BY` does). They "look through a window" of rows and return values for each row.

---

## Key Concepts

1. **OVER() Clause**  
   Defines the "window" of rows that the function will use for its calculation.

2. **PARTITION BY**  
   Divides the result set into partitions (similar to groups). The function is applied separately to each partition.

3. **ORDER BY**  
   Orders the rows within each partition, often necessary for ranking and cumulative calculations.

---

## Common Window Functions

### 1. Aggregate Functions as Window Functions
- `SUM()`, `AVG()`, `MIN()`, `MAX()`, `COUNT()`
- Example:
  ```sql
  SELECT EmployeeID, OrderID,
         SUM(UnitPrice * Quantity) OVER(PARTITION BY EmployeeID) AS TotalSalesByEmployee
  FROM [Order Details] od
  JOIN Orders o ON o.OrderID = od.OrderID;
  ```

### 2. Ranking Functions
- `ROW_NUMBER()`: assigns a unique sequential number to each row.
- `RANK()`: assigns a rank, with gaps if there are ties.
- `DENSE_RANK()`: assigns a rank without gaps for ties.
- Example:
  ```sql
  SELECT ProductID, ProductName, UnitPrice,
         RANK() OVER(ORDER BY UnitPrice DESC) AS PriceRank
  FROM Products;
  ```

### 3. Value Functions
- `LAG()`: returns the value from the previous row.
- `LEAD()`: returns the value from the next row.
- Example:
  ```sql
  SELECT OrderID, CustomerID, OrderDate,
         LAG(OrderDate) OVER(PARTITION BY CustomerID ORDER BY OrderDate) AS PreviousOrderDate
  FROM Orders;
  ```

### 4. NTILE()
- Divides rows into a specified number of groups.
- Example:
  ```sql
  SELECT ProductID, ProductName, UnitPrice,
         NTILE(4) OVER(ORDER BY UnitPrice DESC) AS PriceQuartile
  FROM Products;
  ```

---

## Why Use Window Functions?
- They allow detailed row-level analysis without losing row context.
- Useful for rankings, running totals, moving averages, period comparisons, etc.
- More efficient and expressive than using subqueries or self-joins for the same purpose.

---

## Key Notes
- Unlike `GROUP BY`, window functions do **not** collapse rows; each row in the result is preserved.
- The `OVER()` clause can include both `PARTITION BY` and `ORDER BY`, or neither.
- Can be combined with CTEs and subqueries for more advanced analysis.

---

## Example Use Case

"Find the top 3 most expensive products in each category."
```sql
WITH RankedProducts AS (
    SELECT CategoryID, ProductName, UnitPrice,
           ROW_NUMBER() OVER(PARTITION BY CategoryID ORDER BY UnitPrice DESC) AS RankInCategory
    FROM Products
)
SELECT CategoryID, ProductName, UnitPrice
FROM RankedProducts
WHERE RankInCategory <= 3;
```

---

Window functions are a core tool in advanced SQL analytics and should be mastered for complex reporting and data analysis tasks.

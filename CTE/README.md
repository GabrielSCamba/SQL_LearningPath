# Common Table Expressions (CTEs) in SQL

This document explains what **Common Table Expressions (CTEs)** are, how they work, and why they are useful in SQL.

---

## 📌 What is a CTE?
A **Common Table Expression (CTE)** is a temporary, named result set that you can reference within a single SQL statement. It is defined using the `WITH` keyword and improves readability, reusability, and maintainability of complex queries.

---

## 🛠️ Syntax
```sql
WITH cte_name (optional_column_list) AS (
    -- Your query here
    SELECT ...
)
SELECT ...
FROM cte_name;
```

- `cte_name` → the name of the temporary result set.
- `optional_column_list` → aliases for the columns inside the CTE.
- The CTE must be followed by a main query that references it.

---

## ✅ Benefits of Using CTEs
- **Improved readability** → complex queries are broken into logical building blocks.
- **Reusability** → a CTE can be referenced multiple times in the main query.
- **Recursion** → CTEs support recursive queries (useful for hierarchical data like org charts or folder structures).
- **Replacement for subqueries** → makes queries cleaner and easier to debug compared to deeply nested subqueries.

---

## 📖 Examples

### 1. Simple CTE
Find customers who placed more than 5 orders:
```sql
WITH OrdersPerCustomer AS (
    SELECT CustomerID, COUNT(OrderID) AS TotalOrders
    FROM Orders
    GROUP BY CustomerID
)
SELECT CustomerID, TotalOrders
FROM OrdersPerCustomer
WHERE TotalOrders > 5;
```

### 2. Recursive CTE
Generate numbers from 1 to 10:
```sql
WITH Numbers AS (
    SELECT 1 AS n
    UNION ALL
    SELECT n + 1
    FROM Numbers
    WHERE n < 10
)
SELECT n FROM Numbers;
```

---

## 🚀 Conclusion
CTEs make SQL queries easier to write, read, and maintain. They are especially useful when dealing with:
- Complex aggregations
- Recursive problems
- Queries requiring multiple references to the same intermediate result
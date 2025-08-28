# Data Query Language (DQL) Functions in SQL

This document provides an overview of the main DQL functions in SQL, focusing on how to **query and retrieve data** from a database. DQL stands for **Data Query Language**.

---

## 1. SELECT

**Purpose:** Retrieve data from one or more tables.

**Basic Syntax:**
```sql
SELECT column1, column2, ...
FROM table_name
WHERE condition
ORDER BY column1 ASC|DESC
GROUP BY column1
HAVING condition;
```

**Key Points:**
- `SELECT *` retrieves all columns.
- Can retrieve single or multiple columns.
- Supports filtering (`WHERE`), sorting (`ORDER BY`), and grouping (`GROUP BY`).
- Can include calculations, expressions, and functions.

**Example:**
```sql
SELECT employee_name, salary
FROM employees
WHERE active = 1
ORDER BY salary DESC;
```

---

## 2. DISTINCT

**Purpose:** Return unique values for the selected columns.

**Basic Syntax:**
```sql
SELECT DISTINCT column1, column2
FROM table_name;
```

**Key Points:**
- Removes duplicate rows based on the selected columns.

**Example:**
```sql
SELECT DISTINCT department_id
FROM employees;
```

---

## 3. WHERE

**Purpose:** Filter rows based on conditions.

**Basic Syntax:**
```sql
SELECT column1, column2
FROM table_name
WHERE condition;
```

**Key Points:**
- Supports operators like `=, <>, >, <, >=, <=, IN, BETWEEN, LIKE, IS NULL`.
- Can combine conditions using `AND`, `OR`, and `NOT`.

**Example:**
```sql
SELECT employee_name, salary
FROM employees
WHERE salary > 5000 AND active = 1;
```

---

## 4. ORDER BY

**Purpose:** Sort query results.

**Basic Syntax:**
```sql
SELECT column1, column2
FROM table_name
ORDER BY column1 ASC|DESC, column2 ASC|DESC;
```

**Key Points:**
- Default is `ASC` (ascending).
- Can sort by multiple columns.

**Example:**
```sql
SELECT employee_name, hire_date
FROM employees
ORDER BY hire_date DESC;
```

---

## 5. GROUP BY

**Purpose:** Aggregate data by one or more columns.

**Basic Syntax:**
```sql
SELECT column1, COUNT(*), SUM(column2)
FROM table_name
GROUP BY column1;
```

**Key Points:**
- Often used with aggregate functions: `COUNT, SUM, AVG, MIN, MAX`.
- Combine with `HAVING` to filter aggregated results.

**Example:**
```sql
SELECT department_id, AVG(salary) AS avg_salary
FROM employees
GROUP BY department_id
HAVING AVG(salary) > 5000;
```

---

## 6. JOIN (Optional in Queries)

**Purpose:** Combine rows from two or more tables.

**Types:** `INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN`, `FULL OUTER JOIN`

**Basic Syntax:**
```sql
SELECT a.column1, b.column2
FROM table_a a
INNER JOIN table_b b ON a.key = b.key;
```

**Example:**
```sql
SELECT e.employee_name, d.department_name
FROM employees e
INNER JOIN departments d ON e.department_id = d.department_id;
```

---

**Summary:**
- `SELECT` → retrieve data.
- `DISTINCT` → unique results.
- `WHERE` → filter rows.
- `ORDER BY` → sort results.
- `GROUP BY` → aggregate data.
- `JOIN` → combine data from multiple tables.

DQL functions are essential for extracting insights from a database efficiently and effectively.

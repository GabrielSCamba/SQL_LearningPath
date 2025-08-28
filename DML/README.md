# Data Manipulation Language (DML) Functions in SQL

This document provides an overview of the main DML functions in SQL, focusing on how to manipulate data within a database. DML stands for **Data Manipulation Language** and is used to manage the data stored in relational database tables.

---

## 1. INSERT

**Purpose:** Add new records to a table.

**Basic Syntax:**
```sql
INSERT INTO table_name (column1, column2, ...)
VALUES (value1, value2, ...);
```

**Key Points:**
- Can insert single or multiple rows.
- Must respect constraints like `NOT NULL` or `CHECK`.
- Can be used with a `SELECT` statement to insert multiple records from another table.

**Example:**
```sql
INSERT INTO employees (employee_name, birth_date, hire_date, salary, modified_date, valid_from)
VALUES ('John Doe', '1990-05-15', '2023-01-10', 5000, GETDATE(), GETDATE());
```

---

## 2. UPDATE

**Purpose:** Modify existing records in a table.

**Basic Syntax:**
```sql
UPDATE table_name
SET column1 = value1, column2 = value2, ...
WHERE condition;
```

**Key Points:**
- The `WHERE` clause is crucial to prevent updating all rows unintentionally.
- Can update one or multiple columns at the same time.
- Can use expressions and calculations for updates.

**Example:**
```sql
UPDATE employees
SET salary = salary * 1.1, modified_date = GETDATE()
WHERE active = 1;
```

---

## 3. DELETE

**Purpose:** Remove records from a table.

**Basic Syntax:**
```sql
DELETE FROM table_name
WHERE condition;
```

**Key Points:**
- The `WHERE` clause is essential to avoid deleting all rows.
- Can delete single or multiple rows based on conditions.

**Example:**
```sql
DELETE FROM employees
WHERE active = 0;
```

---

## 4. MERGE / UPSERT

**Purpose:** Insert new records or update existing ones in a single operation.

**Basic Syntax:**
```sql
MERGE INTO target_table AS target
USING source_table AS source
ON target.key_column = source.key_column
WHEN MATCHED THEN
    UPDATE SET column1 = source.column1, column2 = source.column2
WHEN NOT MATCHED THEN
    INSERT (column1, column2, ...)
    VALUES (source.column1, source.column2, ...);
```

**Key Points:**
- `MERGE` allows conditional logic to insert, update, or even delete records.
- Useful for synchronizing tables or performing bulk operations.
- Ensures data consistency and reduces the need for multiple separate queries.

**Example:**
```sql
MERGE INTO employees AS target
USING employees_staging AS source
ON target.employee_id = source.employee_id
WHEN MATCHED THEN
    UPDATE SET salary = source.salary, modified_date = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (employee_name, birth_date, hire_date, salary, modified_date, valid_from)
    VALUES (source.employee_name, source.birth_date, source.hire_date, source.salary, GETDATE(), source.valid_from);
```

---

**Summary:**
- `INSERT` → add new data.
- `UPDATE` → modify existing data.
- `DELETE` → remove data.
- `MERGE/UPSERT` → insert or update conditionally.

DML functions are essential for managing data efficiently and maintaining database integrity.

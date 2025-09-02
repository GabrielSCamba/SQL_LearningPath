# Data Transaction Language (DTL) in SQL

This document provides an overview of the main DTL commands in SQL. **Data Transaction Language (DTL)** is used to manage transactions in a relational database, ensuring data consistency, reliability, and integrity.

---

## 1. BEGIN TRANSACTION / START TRANSACTION

**Purpose:** Start a new transaction.

**Basic Syntax:**
```sql
BEGIN TRANSACTION;
```

**Key Points:**
- Marks the beginning of a transaction.
- All subsequent SQL statements will be executed as part of this transaction until it is either committed or rolled back.

**Example:**
```sql
BEGIN TRANSACTION;
UPDATE employees SET salary = salary * 1.1 WHERE active = 1;
```

---

## 2. COMMIT

**Purpose:** Save all the changes made during the current transaction.

**Basic Syntax:**
```sql
COMMIT;
```

**Key Points:**
- Once committed, changes are permanent.
- Ensures that all operations in the transaction are applied to the database.

**Example:**
```sql
COMMIT;
```

---

## 3. ROLLBACK

**Purpose:** Undo all changes made during the current transaction.

**Basic Syntax:**
```sql
ROLLBACK;
```

**Key Points:**
- Restores the database to the state before the transaction began.
- Useful in case of errors or unexpected results.

**Example:**
```sql
ROLLBACK;
```

---

## 4. SAVEPOINT

**Purpose:** Create a checkpoint within a transaction to which you can roll back.

**Basic Syntax:**
```sql
SAVEPOINT savepoint_name;
```

**Key Points:**
- Allows partial rollback within a transaction.
- Multiple savepoints can be defined in a single transaction.

**Example:**
```sql
BEGIN TRANSACTION;
UPDATE employees SET salary = salary * 1.1 WHERE active = 1;
SAVEPOINT before_bonus;
UPDATE employees SET salary = salary + 500 WHERE hire_date < '2015-01-01';
ROLLBACK TO SAVEPOINT before_bonus;
COMMIT;
```

---

## 5. ROLLBACK TO SAVEPOINT

**Purpose:** Roll back part of a transaction to a specific savepoint.

**Basic Syntax:**
```sql
ROLLBACK TO SAVEPOINT savepoint_name;
```

**Key Points:**
- Only undoes changes after the savepoint.
- The transaction is still active and can be committed afterward.

**Example:**
```sql
ROLLBACK TO SAVEPOINT before_bonus;
```

---

**Summary:**
- `BEGIN TRANSACTION` / `START TRANSACTION` → start a transaction.
- `COMMIT` → permanently save all changes.
- `ROLLBACK` → undo all changes in the current transaction.
- `SAVEPOINT` → set a checkpoint within a transaction.
- `ROLLBACK TO SAVEPOINT` → undo changes after a specific savepoint.

DTL commands are essential for ensuring **data consistency** and supporting the **ACID properties** (Atomicity, Consistency, Isolation, Durability) of a database.

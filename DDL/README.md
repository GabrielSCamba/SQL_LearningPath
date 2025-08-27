## DDL – Data Definition Language

DDL (Data Definition Language) is used to **define and manage the structure of database objects** such as tables, schemas, and indexes.

### CREATE TABLE
Creates a new table in the database.

```sql
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    Email NVARCHAR(100) UNIQUE,
    RegistrationDate DATE DEFAULT GETDATE()
);
```

**Explanation:**
- `CustomerID INT PRIMARY KEY` → Unique identifier for the table.
- `Name NVARCHAR(100) NOT NULL` → Name cannot be null.
- `Email NVARCHAR(100) UNIQUE` → Email must be unique.
- `RegistrationDate DATE DEFAULT GETDATE()` → Sets current date as default.

### ALTER TABLE
Used to **modify an existing table**.

```sql
-- Add a new column
ALTER TABLE Customers
ADD Phone NVARCHAR(15);

-- Change column data type
ALTER TABLE Customers
ALTER COLUMN Name NVARCHAR(150);
```

### DROP TABLE
Deletes a table from the database permanently.

```sql
DROP TABLE Customers;
```

**Warning:** All data in the table will be lost.

---

## Data Types

| Type        | Description               | Example           |
|------------|---------------------------|-----------------|
| INT        | Integer numbers           | 1, 100, -50      |
| DECIMAL    | Numbers with decimals     | 10.5, 99.99      |
| NVARCHAR   | Variable-length text      | 'Gabriel'        |
| CHAR       | Fixed-length text         | 'M', 'F'         |
| DATE       | Date only                 | '2025-08-27'     |
| DATETIME   | Date and time             | '2025-08-27 10:00' |
| BIT        | Boolean (0 or 1)          | 1                |
| VARBINARY  | Binary data               | image, file      |

---

## Constraints

| Constraint        | Description                                | Example                                      |
|------------------|--------------------------------------------|---------------------------------------------|
| PRIMARY KEY       | Unique identifier for the table           | `CustomerID INT PRIMARY KEY`                 |
| FOREIGN KEY       | Relates tables                             | `FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)` |
| UNIQUE            | Ensures unique values in a column         | `Email NVARCHAR(100) UNIQUE`               |
| DEFAULT           | Default value if not provided             | `RegistrationDate DATE DEFAULT GETDATE()`   |
| CHECK             | Enforces specific rules                   | `CHECK (Age >= 18)`                         |
| NOT NULL          | Column cannot be null                      | `Name NVARCHAR(100) NOT NULL`              |

---
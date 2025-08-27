## DQL – Data Query Language

DQL is used to **query and retrieve data**.

### SELECT
```sql
SELECT Name, Email
FROM Customers;
```

### WHERE
```sql
SELECT Name
FROM Customers
WHERE Name = 'Gabriel';
```

### ORDER BY
```sql
SELECT Name
FROM Customers
ORDER BY Name ASC;
```

### DISTINCT
```sql
SELECT DISTINCT City
FROM Customers;
```

---

## Aliases (AS)

Used to **rename columns or tables temporarily**.

```sql
SELECT Name AS CustomerName, Email AS CustomerEmail
FROM Customers AS C;
```

---

## Operators

### Arithmetic Operators
`+`, `-`, `*`, `/`
```sql
SELECT 10 + 5 AS Sum, 10 / 2 AS Division;
```

### Logical Operators
`AND`, `OR`, `NOT`
```sql
SELECT *
FROM Customers
WHERE City = 'Belo Horizonte' AND Age >= 18;
```

### Comparison Operators
`=`, `<>`, `<`, `>`, `<=`, `>=`, `BETWEEN`, `LIKE`, `IN`
```sql
-- Equal and not equal
SELECT * FROM Customers WHERE Name = 'Gabriel';
SELECT * FROM Customers WHERE Name <> 'Gabriel';

-- Between values
SELECT * FROM Customers WHERE Age BETWEEN 18 AND 30;

-- Pattern matching
SELECT * FROM Customers WHERE Name LIKE 'G%';

-- List of values
SELECT * FROM Customers WHERE City IN ('BH', 'SP');
```
---
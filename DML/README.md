## DML – Data Manipulation Language

DML is used to **manipulate data** in tables.

### INSERT
```sql
INSERT INTO Customers (CustomerID, Name, Email)
VALUES (1, 'Gabriel', 'gabriel@email.com');
```

### UPDATE
```sql
UPDATE Customers
SET Email = 'gabriel.camba@email.com'
WHERE CustomerID = 1;
```

### DELETE
```sql
DELETE FROM Customers
WHERE CustomerID = 1;
```

### MERGE
```sql
MERGE INTO Customers AS target
USING (SELECT 1 AS CustomerID, 'Gabriel' AS Name) AS source
ON target.CustomerID = source.CustomerID
WHEN MATCHED THEN
    UPDATE SET Name = source.Name
WHEN NOT MATCHED THEN
    INSERT (CustomerID, Name) VALUES (source.CustomerID, source.Name);
```
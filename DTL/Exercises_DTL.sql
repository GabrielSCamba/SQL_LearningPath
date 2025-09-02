/*
Exercise 1 – Controlled Updates

Start a transaction.
Update the Title of employees hired before 2010, prefixing it with "Senior ".
Commit the transaction.
*/

BEGIN TRANSACTION
UPDATE Employees
SET Title = 'Senior ' + Title
WHERE YEAR(HireDate) < 2010
COMMIT

/*
Exercise 2 – Undo Unwanted Deletion

Start a transaction.
Delete all employees whose City = 'London'.
Roll back the transaction so no employees are deleted.
*/

BEGIN TRANSACTION;

DELETE FROM Employees
WHERE City = 'London';

ROLLBACK

/*
Exercise 3 – Savepoints for Partial Rollback

Start a transaction.
Update Region of all employees to 'NA'.
Create a savepoint after_region_update.
Update Region to 'EU' for employees from Country = 'UK'.
Roll back to after_region_update.
Commit the transaction.
*/

BEGIN TRANSACTION;

UPDATE Employees
SET Region = 'NA';

SAVE TRANSACTION after_region_update;

UPDATE Employees
SET Region = 'EU'
WHERE Country = 'UK';

ROLLBACK TRANSACTION after_region_update;

COMMIT;
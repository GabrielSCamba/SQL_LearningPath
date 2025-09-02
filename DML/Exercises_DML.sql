/*
1. INSERT

Exercise 1 – New Employee Onboarding
Your company just hired 3 new employees. How would you add them to the employees table while making sure:
Every employee gets a unique employee_id.
*/

INSERT INTO staff(employee_id, employee_full_name, birth_date, hire_date, salary, email, modified_date, valid_from)
VALUES(1, 'employee1', '1990-01-01', '2025-01-01', '10000', 'employee1@email.com', '2025-01-01', '2025-01-01'),
    (2, 'employee2', '1991-01-01', '2025-02-01', '15000.50', 'employee2@email.com', '2025-02-01', '2025-02-01'),
    (3, 'employee3', '1992-01-01', '2025-03-01', '5000.50', 'employee3@email.com', '2025-03-01', '2025-03-01')

/*
Exercise 2 – Bulk Insert from External Source
You received a CSV file with employee information from HR. How would you insert multiple employees at once while checking that all constraints (salary ≥ 0, birth_date not null) are respected?
*/

BULK INSERT staff  
FROM '<file_name>'
WITH (
    FIELDTERMINATOR = ',',     
    ROWTERMINATOR = '\n',      
    FIRSTROW = 2             
);

/*
3. UPDATE

Exercise 3 – Update salary of a single employee
Update the salary of the employee with employee_id = 3 to 7000.
*/

UPDATE staff
SET salary = 7000
WHERE employee_id = 3

/*
Exercise 4 – Update multiple employees
Give a 10% salary increase to all employees who are currently active (active = 1).
*/

UPDATE staff
SET salary = salary * 1.1
WHERE active = 1

/*
Exercise 9 – Update multiple columns at once
For the employee with employee_id = 10, set:
salary = 8000
active = 1
modified_date = current date
*/

UPDATE staff
SET salary = 8000, active = 1, modified_date = GETDATE()
WHERE employee_id = 10

/*
3. DELETE

Exercise 5 – Delete a single employee
Delete the employee with employee_id = 5.
*/

DELETE FROM staff
WHERE employee_id = 5
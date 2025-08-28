--1. Create a database
--Create a database and choose a name for it.

CREATE DATABASE MyLearning;

/*
Step 1: Designing Tables

Task 1 – Employees Table:
Design a table to store employee information: ID, name, birth date, hire date, salary.
Think about primary keys, data types, and constraints (e.g., salary should not be negative).
*/
drop TABLE staff
CREATE TABLE employees(
    employee_id INT IDENTITY(1,1) PRIMARY KEY ,
    employee_name VARCHAR(50) NOT NULL,
    birth_date DATE NOT NULL,
    hire_date DATE NOT NULL,
    active BIT DEFAULT 1,
    salary DECIMAL CHECK (salary >=0)
);

/*
Task 2 – Departments Table:
Design a table to store department information: ID, name, location.
Ensure department names are unique.
*/

CREATE TABLE departments(
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50) UNIQUE,
    dept_location VARCHAR(50)
);

/*
Task 3 – Projects Table:
Design a table to store project information: project ID, name, start date, end date.
Later, you will link this table to employees.
*/

CREATE TABLE projects(
    project_id INT PRIMARY KEY,
    start_date DATE NOT NULL,
    end_date DATE,
    CONSTRAINT project_start_end_date_check CHECK(end_date>start_date);
)

/*
Step 2: Modifying Tables

Task 4 – Adding Columns:
Employees need an email column.
Projects need a budget column.
*/

ALTER TABLE employees
ADD email VARCHAR(50);

ALTER TABLE projects
ADD budget DECIMAL(38,2);

/*
Task 5 – Changing Columns:
Employee salary column needs higher precision.
*/

ALTER TABLE employees
ALTER COLUMN salary DECIMAL(8,2);

/*
Task 6 – Removing Columns:
Suppose the dept_location column in departments is no longer used. How would you remove it safely?
*/

ALTER TABLE departments
DROP COLUMN depat_location;

/*
Task 7 – Renaming Tables/Columns:
Rename employees to staff and projects to company_projects.
Rename employee_name column to employee_full_name.
*/

EXEC sp_rename 'employees', 'staff';
EXEC sp_rename 'projects', 'company_projects';
EXEC sp_rename 'staff.employee_name', 'employee_full_name', 'COLUMN';

/*
Step 3: Relationships
Task 8 – Adding Foreign Keys:
Link employees to departments.
Link employees to projects (one employee manages one project).
*/

ALTER TABLE company_projects
ADD project_manager_id INT;
ALTER TABLE company_projects
ADD CONSTRAINT fk_project_manager_id FOREIGN KEY (project_manager_id) REFERENCES staff(employee_id)

/*
Step 4: Cleaning & Removing Data
Task 9 – Truncating Data:
Clear all records from the company_projects table at the start of a new fiscal year.
*/

TRUNCATE TABLE company_projects

/*
Task 10 – Dropping Tables:
Suppose the company discontinues tracking projects. How would you drop the table?
*/

DROP TABLE company_projects

/*
Step 5: Optional Advanced Challenge
Modify table "staff" to store history of the employees to track changes over time.
Use appropriate constraints and DDL to manage table creation, modification, and data integrity.
*/

ALTER TABLE staff
ADD modified_date DATE NOT NULL,
    valid_from DATE NOT NULL,
    valid_to DATE NULL
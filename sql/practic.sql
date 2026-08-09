create database mydb;

show database;

--If you want a Snowflake EMPLOYEE table with 10 sample records, you can use:

use mydb;
CREATE OR REPLACE TABLE employee (
    employee_id INT,
    employee_name VARCHAR(100),
    department VARCHAR(50),
    salary DECIMAL(10,2)
);

INSERT INTO employee (employee_id, employee_name, department, salary)
VALUES
    (1, 'Amit',   'IT',      75000),
    (2, 'Raj',    'Finance', 68000),
    (3, 'Priya',  'HR',      62000),
    (4, 'John',   'IT',      82000),
    (5, 'Neha',   'Sales',   71000),
    (6, 'David',  'Finance', 79000),
    (7, 'Anita',  'IT',      88000),
    (8, 'Rahul',  'HR',      65000),
    (9, 'Sneha',  'Sales',   73000),
    (10,'Vikram', 'IT',      91000);
--Check the data:
    select * from mydb.employee;

--Then you can create your even and odd tables:

CREATE OR REPLACE TABLE employee_even AS
SELECT *
FROM employee
WHERE MOD(employee_id, 2) = 0;

CREATE OR REPLACE TABLE employee_odd AS
SELECT *
FROM employee
WHERE MOD(employee_id, 2) = 1;

show tables in mydb;
--Check the data:
    select 'employee_even' as table_name,* from mydb.employee_even union all
    select 'employee_odd' as table_name,* from mydb.employee_odd;
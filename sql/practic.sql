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


CREATE TABLE employees2 (
    emp_id      INT PRIMARY KEY,
    emp_name    VARCHAR(50),
    department  VARCHAR(50),
    salary      INT,
    hire_date   DATE
);
 
 INSERT INTO employees2 VALUES
(1,  'Alice',   'Engineering', 95000, '2019-03-15'),
(2,  'Bob',     'Engineering', 95000, '2020-06-01'),
(3,  'Carol',   'Engineering', 87000, '2021-01-10'),
(4,  'David',   'Engineering', 78000, '2018-11-20'),
(5,  'Eve',     'Sales',       62000, '2020-02-14'),
(6,  'Frank',   'Sales',       62000, '2019-07-30'),
(7,  'Grace',   'Sales',       58000, '2022-04-05'),
(8,  'Heidi',   'Marketing',   71000, '2017-09-01'),
(9,  'Ivan',    'Marketing',   71000, '2021-12-12'),
(10, 'Judy',    'Marketing',   69000, '2020-08-23');

--For each department, find the  employees details who earn more than the average salary for that department.

select e.* 
from employees2 e
join (
    select department, avg(salary) as avg_salary
    from employees2
    group by department
) dept_avg
on e.department = dept_avg.department
where e.salary > dept_avg.avg_salary;
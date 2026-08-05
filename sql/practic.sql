CREATE DATABASE IF NOT EXISTS corp_db;


CREATE TABLE IF NOT EXISTS corp_db.employees (
    emp_id STRING,
    emp_name STRING,    
    emp_dept STRING,
    emp_salary DOUBLE,
    emp_years_in_org INT,
    emp_age INT
);

CREATE TABLE IF NOT EXISTS corp_db.products(
    product_id INT,
    product_name STRING,
    product_cost DOUBLE,
    qty_available INT,
    qty_sold INT,
    product_category STRING
);


CREATE TABLE IF NOT EXISTS corp_db.clients(
    cl_name STRING,
    cl_age INT,
    cl_profession STRING,
    cl_retention INT,
    product_id INT,
    total_puchase DOUBLE,
    cl_phone STRING,
    emp_id STRING
)
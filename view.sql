-- Views => A view is a virtual table based on the result of a SQL query.
-- It does not store data physically.
-- Uses of Views :
-- 1) View are used to give the access to specific rows and columns.
-- 2) It is used to make complex query easier.
-- 3) In View, we can write joins and multiple aggregations.
-- 4) Views is reusable 

create database viewdb;
use viewdb;


CREATE TABLE departments (
    dept_id   INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

CREATE TABLE employees (
    emp_id   INT PRIMARY KEY,
    name     VARCHAR(50),
    dept_id  INT,
    salary   DECIMAL(10,2),
    city     VARCHAR(50),
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

create or replace view emp_view as
select e.emp_id, e.name, d.dept_name from employees as e join departments d where e.dept_id=d.dept_id;

update emp_view set e.emp_id=100, e.name='happy', dept_name='jga';

select * from emp_view;

INSERT INTO departments VALUES
(1,'HR'), (2,'IT'), (3,'Finance');

select * from departments;

create view dept_view as select * from departments where dept_id < 3;

select * from dept_view;

INSERT INTO employees VALUES
(101,'Aman',    2, 70000, 'Jaipur'),
(102,'Priya',   1, 45000, 'Delhi'),
(103,'Rahul',   2, 90000, 'Mumbai'),
(104,'Sneha',   3, 55000, 'Jaipur'),
(105,'Vikram',  2, 30000, 'Pune');

select * from employees;

create view city_sum as select city, sum(salary) from employees group by city;

select * from city_sum;

create view emp_2_col as select emp_id, name from employees;
select salary from emp_2_col; -- give error
select * from emp_2_col;

insert into emp_2_col values(107,'yash');
select * from emp_2_col;
select * from employees;

-- delete and update on view
delete from emp_2_col where emp_id=101;
update emp_2_col set name='amanaa' where emp_id=102;
select * from emp_2_col;
select * from employees;
/*
A View generally becomes non-updatable (read-only) if its definition contains any of the following :

Aggregate Functions - SUM, AVG, COUNT, MIN, MAX
Group by or Having clauses
Distinct
Set Operations - Union, Intersect, Except / Minus
Joins (in many DBMSs you can update only one side; some disallow it entirely)
Subqueries in the SELECT list
Window Functions (Row_Number(), Rank(), etc)
Computed / derived columns - eg, salary * 12 as annual (you can't update annual directly)
Views built on top of other non-updatable views 
*/
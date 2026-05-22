-- DML 
-- delete is a DML operation

use regex1;
drop table actor_cp;

create table actor_cp as select first_name
as fname ,last_name as last from sakila.actor
where actor_id between 10 and 14;

select * from actor_cp;
update actor_cp set last = "goyal" where fname = "zero";

delete from actor_cp;

select * from actor_cp;
-- truncate is a DDL statement : in truncate we don't provide any condition 
-- don't revert (rollback/undo) 

-- delete : we provide condition
-- in delete we can rollback

-- in case if you have any executed ddl statement then you can't rollback 
-- object means a structure to manage , store or refer the data 

-- windows function: is a type of function is used to perform the calculation on set of rows 
-- it perform a calculation on multiple rows and gives calculated the output 
-- it perform a calulation across a set of rows related to current row without collapsing 
-- Ye rows par calculation karta hai without rows ko collapse kiye.

-- GROUP BY : Rows ko merge/collapse kar deta hai
-- group by :is used to arrange similar data into groups and columns on each group 
-- are used to apply with reference to current row

-- window functions are majorly have 3 parts: 
-- 1. over clause : to apply the function over a window 
-- we apply aggregate function in each row 
select * from sakila.actor;
select * from sakila.payment;

use world;
select code, name, continent, population, (select sum(population) from country) from country;

select sum(population) from country;

select code, name, continent, population , sum(population) over() from country;

select code, name, continent, population , sum(population) over() ,
avg(population) over() from country;

-- 2. partition by : divides the rows into groups 
select continent, sum(population) from country group by continent;

select code, name, continent, population,
sum(population) over(partition by continent) from country; 

-- running sum, cummulative sum 
select code, name, continent, population,
sum(population) over(order by population) from country;


use shadidb;
select * from employees;
select avg(salary) from employees;
select emp_id, name, salary, avg(salary) over() from employees ;

select emp_id, name, salary, max(salary) over(), 
avg(salary) over() from employees ;

select emp_id, name, salary, avg(salary) over(), salary-avg(salary) over()  from employees ;

select emp_id, name, count(*) over(), max(salary) over(), min(salary) over(), avg(salary) over() from employees;

select emp_id, name, salary, sum(salary) over(), 
concat(round((salary/sum(salary) over())*100), '%') from employees;

-- running sum/cumulative sum/total sum:
select emp_id, name, salary, sum(salary) over(order by salary) from employees;

select emp_id, name, salary, sum(salary) over(order by emp_id desc) from employees;

select emp_id, name, salary, sum(salary) over(order by department) from employees;

-- partition by :divide rows into groups 
select *, sum(salary) over(partition by department), sum(salary) over() from employees; 

select *, sum(salary) over(partition by name) from employees; 

select *, sum(salary) over(partition by manager_id) from employees; 

-- running sum on department
select *, sum(salary) over(partition by department order by salary) from employees; 

select name, department, salary, sum(salary) over(partition by department) ,
(salary / sum(salary) over(partition by department)) *100 from employees;



create database windowsdb;
use windowsdb;

drop database windowsdb;
-- ============================================
--  Create the employees table
-- ============================================
CREATE TABLE employees (
  emp_id    INT,
  name      VARCHAR(50),
  dept      VARCHAR(30),
  salary    INT,
  hire_year INT
);
 
-- ============================================
--  Insert sample data (12 employees)
-- ============================================
INSERT INTO employees VALUES
  (1,  'Alice',   'IT',      90000, 2019),
  (2,  'Bob',     'IT',      75000, 2020),
  (3,  'Charlie', 'IT',      82000, 2018),
  (4,  'Diana',   'HR',      68000, 2021),
  (5,  'Eve',     'HR',      72000, 2019),
  (6,  'Frank',   'HR',      65000, 2022),
  (7,  'Grace',   'Sales',   55000, 2021),
  (8,  'Henry',   'Sales',   60000, 2021),
  (9,  'Iris',    'Sales',   58000, 2019),
  (10, 'Jack',    'Finance', 95000, 2017),
  (11, 'Karen',   'Finance', 88000, 2018),
  (12, 'Leo',     'Finance', 91000, 2020);

select * from employees;

select * , sum(salary) over(partition by hire_year ) from employees;

select * , sum(salary) over(partition by hire_year order by salary) from employees;

select * , max(salary) over(partition by dept order by hire_year) from employees;

select * , max(salary) over(partition by dept, hire_year) from employees;

select * , max(salary) over(partition by dept, hire_year) from employees;

select * , avg(salary) over(partition by dept),
case 
    when salary >  avg(salary) over(partition by dept) then 'above avg salary'
    else 'less avg salary'
    end  from employees;
    
-- function related to windows 
-- 1: row_number(): give unique numbers 
select *, row_number() over() from employees;

select *, row_number() over(order by salary) from employees;

select *, row_number() over(partition by dept) from employees;

-- rank(): based on condition
select *, rank() over() from employees;

select *, rank() over(order by salary) from employees;

select *, rank() over(partition by dept order by salary desc) from employees;

select *, row_number() over(order by salary) ,
rank() over(order by salary),
dense_rank() over(order by salary) from employees;

-- rank, dense_rank == order by compulsory
select *, rank() over(partition by dept order by salary) ,
dense_rank() over(partition by dept order by salary) from employees;

select *, rank() over(partition by dept order by hire_year) ,
dense_rank() over(partition by dept order by hire_year) from employees;

select * from employees as e 
where salary = (select max(salary) from employees where dept = e.dept);

-- where clause: sbse phle execute hota h or only un rows p kam krta h jo table m phle se exist krti h 
-- max, rank
select * from
(select *, max(salary) over(partition by dept) as deptSalary from employees) as trh 
where salary = deptSalary;

select *, rank() over(partition by dept order by salary desc) `rank` from employees;

select * from 
(select *, rank() over(partition by dept order by salary desc) `rank` from employees) as temp
where `rank` = 1;

-- person with second highest salary
select * from 
(select *, dense_rank() over(order by salary desc) as drnk from employees) as tem
where drnk = 2;

-- in interviews don't use order by , limit for second highest salary
select * from employees where salary =
(select max(salary) from employees where salary <(select max(salary) from employees));

-- second highest salary --> only use subquery
select max(salary) from employees where salary < (select max(salary) from employees);

-- find out the fourth largest salary
select * from  
(select *, dense_rank() over(order by salary) as drnk from employees) as tem
where drnk = 4;

 
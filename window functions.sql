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



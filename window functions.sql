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

-- windows function: 
-- is used to perform the calculation on set of rows
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
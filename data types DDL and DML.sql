-- data types sql
-- numbers: integer values, decimal values
-- tinyint, smallint, mediumint, int, bigint
-- 1 byte, 2 byte, 3 byte, 4 byte, 8 byte
-- 1 byte = 8 bit
-- range = 2**8 = 256: range( -128 to 127) 

use regex1;
create table avani(salary tinyint);
insert into avani values(127);

-- decimal values 
-- float, double

-- float : occupy 4 byte
-- double : occupy 8 byte
create table avani2(salary float, price double);
insert into avani2 values (100.6781241, 100.6781241);
select * from avani2;

-- string
-- implicit, explicit
insert into avani2 values (100.6781241, '100.6781241');

-- to store string values: char() , varchar()
-- fixed length/size character
-- varchar(): variable length character  
create table avani4 (name varchar(20), gender char(20));
insert into avani4 values('hemant', 'male'), ('avani', 'female');
select * from avani4;
insert into avani4 values('raj      ', 'male      ');
-- char will truncate all the white space from the last 
-- varchar will have of white space upto the size of subcolumn
select *, length(name), length(gender) from avani4;

-- DDL statements (data definition language):
-- create, drop, truncate, alter

create table raj123 (col int);

use sakila;
-- create table using select (CTAS)
create table actor_cp as select first_name , last_name from sakila.actor;

select * from actor_cp;

-- drop: table structure and data both are deleted
drop table actor_cp;

create table actor_cp as select first_name as fname , last_name as last from sakila.actor
where actor_id between 10 and 14;
select * from actor_cp;

-- use Alter: changes in structure not data
-- alter table to add column in my table
alter table actor_cp add column (salary int);
select * from actor_cp;

-- primary key added
alter table actor_cp add constraint new_key primary key(fname);
desc actor_cp;

-- column drop
alter table actor_cp drop column last;
desc actor_cp;

-- change column name
alter table actor_cp rename column salary to newsalary; 
desc actor_cp;

select * from actor_cp;
-- DML (data manipulation language): 
-- insert , update
-- update set col = value
set SQL_SAFE_UPDATES = 0;
update actor_cp set newsalary = 900;

update actor_cp set newsalary = 888 where fname = 'UMA';
select * from actor_cp;
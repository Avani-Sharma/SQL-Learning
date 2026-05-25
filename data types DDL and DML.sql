-- data types sql: define what kind of data can be stored in a table column.
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


create database if not exists datatypedb;
use datatypedb;

-- numeric data type: int, float  
-- tinyint --> 1 byte -->  store positive, negative values but in only range (-128 to 127)
create table test1( id tinyint);
insert into test1 values(-1) , (10);
insert into test1 values(128);  -- out of range error (1 byte = 8 bit ==> 2**8 = 256 ==> (-128 to 127))
select * from test1;

-- smallint --> 2 byte
-- mediumint --> 3 byte
-- int --> 4 byte
-- bigint --> 8 byte 
create table test2( age tinyint unsigned);
insert into test2 values (250);
select * from test2;

-- decimal values
-- float : occupy 4 byte
-- double : occupy 8 byte
create table test3( salary float, salary2 double);
insert into test3 values(1989.9301934, 1989.9301934);
select * from test3;

create table test4(price double(6,2)); -- total is 6, 2 is decimal value, 4 are the value before 
insert into test4 values(0.756453424); -- only 2 decimal values
insert into test4 values(44.34354534);
insert into test4 values(4445.34354534);
insert into test4 values(4443);
insert into test4 values(44531); -- error --> 5 integer value 
select * from test4; 

-- string datatype
-- char : fixed length/size character. Doesn't consider whitespace after word (before word it consider whitespace)
-- char will truncate all the white space from the last 
create table test5(countrycode char(3));
insert into test5 values('Ind');
insert into test5 values('india');   -- error
insert into test5 values('he     '); 
select * from test5;
select *, char_length(countrycode) from test5;

-- varchar : variable length character . no fixed size 
-- varchar will have of white space upto the size of subcolumn
create table test6(countrycode varchar(3));
insert into test6 values('Ind');
insert into test6 values('india');   -- error
insert into test6 values('he     '); 
select * from test6;
select *, char_length(countrycode) from test6;

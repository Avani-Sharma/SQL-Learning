-- table
-- DDL statemnet  (data definition language)
-- create, alter, drop, truncate
-- creating a database
create database regex1;
use regex1;

-- table create (sno column name)
create table test1 (sno int);

describe test1;

-- DML (data manipulation langugae)
-- use insert statement
insert into test1 values(10);
select * from test1;
insert into test1(sno) values(11);

-- insert multiple values 
insert into test1(sno) values(20), (null), (30);
-- count(sno) : give output 4 : not count null values
select count(sno) from test1;
-- count(*) : give output 5 : it count null values also
select count(*) from test1;

-- not null constraints: 
create table test2( sno int not null, salary int);
insert into test2( sno, salary) values(20, 1000);
insert into test2( sno, salary) values(20, null);
-- we have set constraint(error)
insert into test2( sno, salary) values(null, 1000);

insert into test2(sno) values(1000);
-- error (because no null and no default set)
insert into test2(salary) values(500000);

select * from test2;

-- default constraints
create table test3( sno int not null default 80, salary int);
insert into test3(salary) values(1000);
insert into test3(sno) values(5000);
select * from test3;

-- unique constraint
create table test4( sno int not null, salary int unique default 100);
select * from test4;
insert into test4(sno, salary) values(1000, 20000);
-- error duplicate values
insert into test4(sno, salary) values(1001, 20000);

insert into test4(sno) values(600);
select * from test4;

-- error 100 is a value already in table
insert into test4(sno) values(700);

-- multiple null values can be inserted
insert into test4(sno, salary) values(1001, null);
insert into test4(sno, salary) values(1001225, null);
select * from test4;

-- check constraint: give condition: check conditions
create table test7( sno int, salary int,
check (sno between 1 and 100),
check (salary in (1000, 2000)));

drop table test7;
create table test7( sno int, salary int,
constraint regex_test7_sno_chk check (sno between 1 and 100),
constraint regex_test7_salary_chk check (salary in (1000, 2000)));

insert into test7( sno, salary) values(4, 1000);
select * from test7;
-- give error: out of range
insert into test7(sno, salary) values(150, 1000);
insert into test7(sno, salary) values(90, 1500);
select * from test7;

-- ques1. create table name emloyee [emp_id with primary key, emp_name varchar, email with unique constriant
-- college with default value , age with condition > 18 and guardian_name should be a palindrome ]
create table employee(emp_id int primary key, employee_name varchar(20), email_id varchar(20) unique,
 college varchar(20) default 'JECRC',
 age int, gardian_name varchar(20), constraint employee_age check(age >18),
 constraint employee_gard check(gardian_name = reverse(gardian_name)));
 
 
use regex1;
drop table customer9;
create table customer9(cid int primary key, cname varchar(20));
insert into customer9 values(10,'aman'),(11,'shubham');
drop table orders9;

-- primary key and foreign key
create table orders9(oid int primary key,city varchar(20),cid int,
foreign key (cid) references customer9(cid));
insert into orders9 values(1009,'jaipur',10),(1010,'goa',11),(1011,'JK',10);
insert into orders9 values (9123,'japan',90);

select * from customer9;
select * from orders9;
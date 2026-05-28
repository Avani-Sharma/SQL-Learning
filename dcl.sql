-- dcl: data control language
select * from mysql.user;
create user avni identified by '1234';

-- to find current user
select current_user();

create database testdb;
use testdb;
create table emp(id int, name varchar(20));
insert into emp values(20, 'abhi'), (21,'kjl');
select * from emp;

-- to check the permission for specific user
show grants for avni;

grant select on testdb.emp to avni;
grant delete on testdb.emp to avni;
grant delete on testdb.* to avni;

-- also create one more table in testdb 
create table emp2(id int, name varchar(20));
insert into emp2 values(25, 'abhi'), (27,'kjl');
select * from emp2;
-- select query , delete query 
grant select on testdb.emp2 to avni;
grant delete on testdb.emp2 to avni;

-- revoke this delete priviledge from the avni user 
revoke delete on testdb.emp2 from avni;

-- give select and insert priviledge to particular table 
grant select on testdb.emp2 to avni;
grant insert on testdb.emp2 to avni;

-- create a table  3 column and insert atleast 2 rows 
create database testdb4;
use testdb4;
create table employee( id int, name varchar(10), salary int );
insert into employee values (1, 'raj', 20000), (2, 'shyam', 30000);
select * from employee;

-- now give one column access to this avni user select statement 
grant select(salary) on testdb4.employee to avni;

-- also give the update priviledge to 2 or 3 column 
grant update (id, name) on employee to avni;
grant select(id) on testdb4.employee to avni;

-- remove all the priviledge from this avni user 
REVOKE ALL PRIVILEGES ON testdb.employee FROM 'avni'@'%';
REVOKE ALL PRIVILEGES ON testdb.emp2 FROM 'avni'@'%';

-- login user and have permissions or not
-- create three users and create a group(role) named as sales
create user avani identified by '5678';
create user rahul identified by '123';
create user simran identified by '1234';
create role sales;

-- give permission to roll --> select, insert, update
grant select, insert, update on employee to sales;

-- add 2 user to roll(group) to this particular role
grant sales to avani;
grant sales to rahul;

show grants for sales;
-- login user and have permissions or not
show grants for avani;
show grants for rahul;
show grants for simran;
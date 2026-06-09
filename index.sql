-- indexes: is a database object which is used to improve the data retrieval from a table 

create database indexdb;
use indexdb;

create table employees(id int , emp_name varchar(20), age int);
insert into employees values (1, 'abc', 90), (3, 'def', 100), (2, 'abhi', 23),
(5, 'naina', 7899), (6, 'shyam' , 100), (4, 'tushar', 60);

select * from employees;

explain select * from employees where id = 2;


-- types of index: clustered and non-clustered
-- clustered index: use of primary key and stored in sorted way, data is not duplicate
-- searching is more faster 
alter table employees add primary key (id);

select * from employees; -- because it store the data in b-tree data struncture format
explain select * from employees where id =  2;

explain select * from employees where emp_name = 'tushar';

-- non clustered index: duplicate value aa skti h , sorted ni hota data 
-- is a type of index in which a separate data structure will be created 
-- slow
create database indexdb2;
use indexdb2;
create table employees(id int , emp_name varchar(20), age int);
insert into employees values (1, 'abc', 90), (3, 'def', 100), (2, 'abhi', 23),
(5, 'naina', 7899), (6, 'shyam' , 100), (4, 'tushar', 60);

select * from employees;
show indexes from employees;

create index age_indx on employees (age);

explain select * from employees where age = 100;


-- multiple non-clustered index
create database indexdb3;
use indexdb3;
create table employees(id int , emp_name varchar(20), age int);
insert into employees values (1, 'abc', 90), (3, 'def', 100), (2, 'abhi', 23),
(5, 'naina', 7899), (6, 'shyam' , 100), (4, 'tushar', 60);

select * from employees;
show indexes from employees;  -- it will show the indexes on table
create index comp_indx on employees (age, emp_name);
explain select * from employees where age = 100 and emp_name ='def';
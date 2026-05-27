use regex;
-- ddl statement : 
-- drop statement (delete both structure and table)
create table test10(id int, name varchar(20));
insert into test10 values(1, 'avani'), (2, 'chinki'), (3, 'abhi');
select * from test10;
drop table test10;
select * from test10;


-- truncate (delete the data and delete the table and then recreate the table)
create table test12(id int, name varchar(20));
insert into test12 values(1, 'avani'), (2, 'chinki'), (3, 'abhi');
select * from test12;
truncate test10;
select * from test10;


-- change in structure use ddl statement : alter
alter table test12 add column (salary int);  -- to add column 
alter table test12 add column (age int default 18);
alter table test12 drop column salary; -- to delete column 
alter table test12 rename column age to newage; -- rename
alter table test12 add constraint primary key (id);
desc test12;


-- add a column before a name column 
-- change the datatype of name column to integer
-- add a not null constraint to the name and age column
-- add a foreign key of a column name as dept_id reference to dept_table
create table test12 (name varchar(20));
drop table test12;
create table test12(name varchar(20));
alter table test12 add column (age int);
alter table test12 modify column name int;
ALTER TABLE test12;
select * from test12;
insert into test12 values(null,12);



select database();
select * from sakila.actor;
select actor_id, first_name from sakila.actor;

-- CTAS(create table as select)  
create table avani12 as 
select actor_id, first_name from sakila.actor;
select * from avani12;

-- dml statement
-- insert
insert into avani12 values(3455, 'india');

-- update
update avani12 
set first_name ='avni' where actor_id = 5;
select * from avani12;

-- delete : specific row delete 
delete from avani12 where actor_id = 3; 
delete from avani12;


-- interview ques:
-- what is ddl and dml statement
-- difference between truncate, delete, drop 
-- what is normalization 
-- difference between char and varchar datatype 
/*
TCL =>
Transaction control language
use to handle set of logical statements
        Transaction -> set of logical statement (which is not permanent)
in case if you run any dml operation or you write down start transaction
                        then start transaction key word written
                        -> when my transaction will be automatically closed
if  use any command rollback and commit then any transaction are off automatically
                        in case if  use any DDL or DCL operation then the transaction will be closed
                       
*/

use regex1;
drop table actor_cp;
create table actor_cp as select actor_id, first_name from sakila.actor
where actor_id between 1 and 5;

insert into actor_cp values(6,'abhishek');
select * from actor_cp;


-- autocommit =>  by default enable
select @@autocommit;
set @@autocommit=0;
set @@autocommit=1;
insert into actor_cp values(7,'abhi');
insert into actor_cp values(8,'ashish');
set sql_safe_updates=0;
update actor_cp set actor_id=1000;
select * from actor_cp;
commit;
rollback;


start transaction;
--  if autocommit is on then by this keyword autocommit is not work. 
-- jo bhi ho vo sirf panding stage me hi hota hai
insert into actor_cp values(11,'amazon');
select * from actor_cp;
-- to permanent it use can use commit
--  or also use any ddl command
create table xyz(id int);

start transaction;
insert into actor_cp values(12,'abc');
 insert into actor_cp values(13,'cdf');
 delete from actor_cp where actor_id in (1,2);
 rollback;
 select * from actor_cp;
 
start transaction;
insert into actor_cp values(15,'abcasdf');
insert into actor_cp values(16,'cdf654');
savepoint in_actor_cp;
delete from actor_cp where actor_id in (5,1);
rollback to in_actor_cp;
select * from actor_cp;



-- Transactions: A transaction is a group of SQL statements that work together as a single unit.
-- TCL (Transaction Control Language): TCL commands are used to manage transactions in the database.
-- TCL ensures data accuracy and reliability by following the ACID properties.
-- 1. Atomicity:
-- Either all operations of a transaction are completed successfully,
-- or none of them are performed (all are rolled back).
-- 2. Consistency:
-- A transaction keeps the database in a valid and consistent state
-- before and after execution.
-- 3. Isolation:
-- Multiple transactions execute independently without affecting each other.
-- 4. Durability:
-- Once a transaction is committed, the changes are permanently saved
-- in the database even if a system failure occurs.

use company;
create table rjdb(id int);
insert into rjdb values (10);
select  * from rjdb;

-- manage insert, update, delete use tcl
start transaction;
insert into rjdb values (100), (99);
select * from rjdb;
commit;

-- Transaction Start:
-- A transaction starts with the START TRANSACTION command
-- or automatically when DML commands (INSERT, UPDATE, DELETE) are executed.
-- Transaction End:
-- A transaction ends by using COMMIT or ROLLBACK.
-- It can also end automatically after executing DDL statements
-- like CREATE, ALTER, DROP because they perform an implicit COMMIT.
start transaction;
update rjdb set id= 50;
select * from rjdb;
rollback;


select * from rjdb;
delete from rjdb;
select * from rjdb;
rollback;


start transaction;
insert into rjdb values(10), (100), (400);
delete from rjdb where id = 10;
select * from rjdb;
commit;
rollback;

-- savepoint: to recover the data
start transaction;
insert into rjdb values(101), (120), (440);
select * from rjdb;
savepoint rjdb_savepoint_ds;
update rjdb set id = 101;
rollback to rjdb_savepoint_ds; -- rollback to savepoint to revert upto specific point 



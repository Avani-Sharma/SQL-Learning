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
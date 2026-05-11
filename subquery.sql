use sakila;
show tables;

-- subquery: subquery is a query within another query
-- it is used to filter or apply calculation data based on dynamic condition

-- ques1. to get information about all the payments whose amount is equal to amount of payment Id is 4
-- now i need all the details from the payment table whose amount is equal to 0.99 
select amount from payment where payment_Id= 4;
select * from payment where amount = 0.99;

-- ():  nested query
select * from payment where amount = (select amount from payment where payment_Id= 4);

-- ques2. get the payment_id and amount where the amount is not equal to amount of payment_id 23
select amount from payment where payment_id = 23;
select * from payment where amount != 3.99;

-- (): subquery
select payment_id, amount from payment where amount != (select amount from payment where payment_id = 23);

-- ques3. to get the payment_id, customer_id, amount, payment_date where the month of payment should be same as 
--  of payment_id 6
select month(payment_date) from payment where payment_id = 6;
select payment_id, customer_id, amount, payment_date from payment where month(payment_date) = 6;

-- (): nested query
select payment_id, customer_id, amount, payment_date from payment 
where month(payment_date) = (select month(payment_date) from payment where payment_id = 6);

-- ques4. get all the columns of payment table where the staff serving the customers should be same 
-- as of payment_id = 7
select staff_id from payment where payment_id = 7;
select * from payment where staff_id = 1;

-- (): nested query
select * from payment where staff_id = (select staff_id from payment where payment_id = 7);

-- ques5. get all the payment information where the amount is same as of highest amount of payment table
select max(amount) from payment;
select * from payment where amount = 11.99;

-- (): nested query
select * from payment where amount = (select max(amount) from payment);

-- ques6. get the amount and the total payments of each amount only for those payment whose amount is less than 
-- the amount of rental_id 1725
select amount from payment where rental_id = 1725;
select amount, count(amount) from payment where amount < 4.99 group by amount;

-- (): nested query
select amount, count(amount) from payment where amount < (select amount from payment where rental_id = 1725)
 group by amount;

-- ques7. get the month and total amount spend only for those customers whose month of payment > customer_is 1 and 
-- payment_id 3
select month(payment_date) from payment where customer_id =1 and payment_id = 3;
select month(payment_date), sum(amount) from payment where month(payment_date)>6 group by payment_date;

-- (): nested query
select month(payment_date), sum(amount) from payment where month(payment_date)> 
(select month(payment_date) from payment where customer_id =1 and payment_id = 3)
 group by payment_date;
 

create database shadidb;
use shadidb;
create table biodata(id int, name varchar(20), age int);
insert into biodata values(1, 'Rahul', 28),
                   (2, 'Anjali', 28),
                   (3, 'Aishwarya', 40),
                   (4, 'Naina', 23);
                   
-- types of subquery: single row subquery: it is a type of query in which inner query return only one row

select * from biodata;
select age from biodata where name = 'Rahul';  -- age of rahul
select * from biodata where age = 28; 

select * from biodata where age = (select age from biodata where name = 'Rahul'); 

select max(age) from biodata;
select * from biodata where age = 40;

select * from biodata where age = (select max(age) from biodata);

select char_length(name) from biodata where name = 'Rahul';
select name, char_length(name) from biodata ;

select name from biodata where char_length(name) = (select char_length(name) from biodata where name = 'Rahul');

use sakila;
select * from film;

-- find movies where the rental rate is same for the movie of african egg 
select rental_rate from film where title = 'african egg';
select title, rental_rate from film where rental_Rate = 2.99;

select title, rental_rate from film where rental_Rate = (select rental_rate from film where title = 'african egg');

-- get the movie_id , movie_name where the rental_rate is equal to minimum rental_rate
select film_id, title, rental_rate from film where rental_rate = (select min(rental_rate) from film);

-- get movie_id, movie_name, duration, where the duration is greater than avg duration of the movies
select film_id, title, rental_duration from film where rental_duration > (select avg(rental_duration) from film);

-- get movie_id, for the movies where the release year of movie should be equal to alone trip and 
-- rating should be same as of the movie apollo teen
select film_id from film where release_year = (select release_year from film where title = 'alone trip') 
and rating = (select rating from film where title ='apollo teen');

-- multi row subquery : it returns multiple rows and don't use arithmetic operations 
-- use operator: in , not in
use shadidb;
select * from biodata;

select * from biodata where age in
(select age from biodata where name ='anjali' or name = 'aishwarya') and name != 'Rahul';

-- find the name for rahul where age is not equal to age of anjalai and aishwarya
select * from biodata where age not in
(select age from biodata where name ='anjali' or name = 'aishwarya') and name != 'Rahul';
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
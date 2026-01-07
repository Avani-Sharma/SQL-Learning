-- single row subquery
-- only 1 row return
use sakila;
select amount from payment where payment_id = 2;
select * from payment where amount = 0.99;

select * from payment where amount = (select amount from payment where payment_id = 2);

-- multi row subquery: don't use directly greater than , less than or equals to 
-- in operator
select * from payment where amount in (select amount from payment where payment_id = 3 or payment_id = 2);
-- not in operator
select * from payment where amount not in (select amount from payment where payment_id = 3 or payment_id = 2);

-- any operator [use operator : >, <, =]
-- 0.99 , 5.99
select * from payment where amount =any (select amount from payment where payment_id = 3 or payment_id = 2);

select * from payment where amount >any (select amount from payment where payment_id = 3 or payment_id = 2);

-- all operator 
select * from payment where amount <=all (select amount from payment where payment_id = 3 or payment_id = 2);

select * from payment where amount >all (select amount from payment where payment_id = 3 or payment_id = 2);

-- ques1. get all the payment information where the month of payment should be same as of payment_id 2 or 3
select month(payment_date) from payment where payment_id =2 or payment_id = 3;
select * from payment where month(payment_date) in (5, 6);

select  * from payment where month(payment_date) in( select month(payment_date)
    from payment where payment_id in (2, 3));

-- ques2. get all the payment information whose amount is larger than among all the amount of payment_id 2 to 8
SELECT *
FROM payment
WHERE amount > ALL (
    SELECT amount
    FROM payment
    WHERE payment_id BETWEEN 2 AND 8
);
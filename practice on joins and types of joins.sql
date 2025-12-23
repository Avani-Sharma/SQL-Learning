CREATE DATABASE REGEX;
USE REGEX;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);

desc customers;
-- customer_id = pk
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    amount DECIMAL(10,2)
);
desc orders;
-- order_id = pk

INSERT INTO customers (customer_id, customer_name, city) VALUES
(1, 'Alice', 'New York'),
(2, 'Bob', 'Los Angeles'),
(3, 'Charlie', 'Chicago'),
(4, 'David', 'Houston'),
(5, 'Eva', 'Phoenix'),
(6, 'Frank', 'Philadelphia'),
(7, 'Grace', 'San Antonio'),
(8, 'Henry', 'San Diego'),
(9, 'Ivy', 'Dallas'),
(10, 'Jack', 'San Jose');


INSERT INTO orders (order_id, customer_id, order_date, amount) VALUES
(101, 1, '2024-01-05', 250.00),
(102, 2, '2024-01-06', 150.00),
(103, 3, '2024-01-07', 300.00),
(104, 1, '2024-01-10', 120.00),
(105, 5, '2024-01-12', 450.00),
(106, 6, '2024-01-15', 200.00),
(107, 2, '2024-01-18', 175.00),
(108, 8, '2024-01-20', 500.00),
(109, 11, '2024-01-22', 90.00),
(110, 12, '2024-01-25', 60.00);

select * from customers;
select * from orders;

-- join 
select c.customer_id, c.customer_name, o.order_id, o.customer_id, o.amount from customers as c
join orders as o 
where c.customer_id = o.customer_id;

-- inner join 
select c.customer_id, c.customer_name, o.order_id, o.customer_id, o.amount from customers as c
inner join orders as o 
on c.customer_id = o.customer_id;

-- left outer join: 
select c.customer_id, c.customer_name, o.order_id, o.customer_id, o.amount from customers as c
left join orders as o 
on c.customer_id = o.customer_id;

-- non matching rows: null 
-- right outer join: 
select c.customer_id, c.customer_name, o.order_id, o.customer_id, o.amount from customers as c
right join orders as o 
on c.customer_id = o.customer_id;

-- natural join [no condition ] on common column 
-- not use in sql: because if have common column then it use natural join and it work like as inner join 
-- otherwise use cross join 

select c.customer_id, c.customer_name, o.order_id, o.customer_id, o.amount from customers as c
natural join orders as o ;

alter table customers rename column customer_id to cid;
desc customers;

select cid, c.customer_name, o.order_id, o.customer_id, o.amount from customers as c
natural join orders as o ;

-- cross join/ Cartesian join: many to many relationships
select cid, c.customer_name, o.order_id, o.customer_id, o.amount from customers as c
cross join orders as o ;


select customer_name, sum(amount) from customers as ca
join orders as o 
where ca.cid= o.customer_id group by customer_name;


use sakila;
-- find actor_id, actor_name and total no. of movies he has worked 
select a.actor_id ,a.first_name,  count(fa.film_id) from actor as a
join film_actor as fa
where a.actor_id = fa.actor_id
group by actor_id, a.first_name;

select fa.film_id, fa.actor_id from film_actor as fa;
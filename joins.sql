-- joins in sql

create database regexjoin;

use regexjoin;

-- Create first table: customers
CREATE TABLE customers (
    customer_id INT,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);

-- Insert records into customers
INSERT INTO customers VALUES
(1, 'Amit', 'Delhi'),
(2, 'Priya', 'Mumbai'),
(3, 'Rahul', 'Pune'),
(4, 'Sneha', 'Jaipur'),
(5, 'Karan', 'Chennai');


-- Create second table: orders
CREATE TABLE orders (
    order_id INT,
    customer_id INT,
    product_name VARCHAR(50)
);

-- Insert records into orders
-- Duplicate customer_id is present because some customers ordered multiple products
INSERT INTO orders VALUES
(101, 1, 'Laptop'),
(102, 2, 'Mobile'),
(103, 1, 'Keyboard'),
(104, 3, 'Mouse'),
(105, 2, 'Headphones');

select * from customers;
select * from orders;

insert into orders values (106, 11, 'ice cream');
select customers.customer_id, customers.customer_name, orders.product_name from customers
join orders where customers.customer_id = orders.customer_id;

-- inner join
select customers.customer_id, customers.customer_name, orders.customer_id, orders.product_name from customers
join orders on customers.customer_id = orders.customer_id;

-- left join 
select customers.customer_id, customers.customer_name, orders.customer_id, orders.product_name from customers
left join orders on customers.customer_id = orders.customer_id;

select customers.customer_id, customers.customer_name, orders.customer_id, orders.product_name from customers
left join orders on customers.customer_id = orders.customer_id
where product_name is null;

select customers.customer_id, customers.customer_name, orders.customer_id, orders.product_name from customers
left join orders on customers.customer_id = orders.customer_id
where product_name is not null;

-- right join
select customers.customer_id, customers.customer_name, orders.customer_id, orders.product_name from customers
right join orders on customers.customer_id = orders.customer_id;

-- natural join: acts as a inner join based on the common column name 
select customers.customer_id, customers.customer_name, orders.customer_id, orders.product_name from customers
natural join orders
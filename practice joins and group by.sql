-- Create Database
CREATE DATABASE company_db;
USE company_db;
drop table employees;
-- Create Employee Table
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(30),
    gender VARCHAR(10),
    city VARCHAR(30),
    salary INT,
    age INT,
    experience INT
);

-- Insert Data
INSERT INTO employees VALUES
(1, 'Aman', 'IT', 'Male', 'Delhi', 55000, 24, 2),
(2, 'Neha', 'HR', 'Female', 'Mumbai', 45000, 26, 3),
(3, 'Rohit', 'IT', 'Male', 'Delhi', 70000, 29, 5),
(4, 'Simran', 'Finance', 'Female', 'Pune', 65000, 31, 6),
(5, 'Karan', 'Sales', 'Male', 'Delhi', 40000, 23, 1),
(6, 'Priya', 'IT', 'Female', 'Mumbai', 75000, 30, 7),
(7, 'Ankit', 'Sales', 'Male', 'Pune', 50000, 27, 4),
(8, 'Meera', 'HR', 'Female', 'Delhi', 48000, 25, 2),
(9, 'Vikas', 'Finance', 'Male', 'Mumbai', 68000, 32, 8),
(10, 'Riya', 'IT', 'Female', 'Pune', 72000, 28, 5),
(11, 'Suresh', 'Sales', 'Male', 'Delhi', 42000, 26, 2),
(12, 'Pooja', 'HR', 'Female', 'Mumbai', 47000, 24, 1),
(13, 'Rahul', 'Finance', 'Male', 'Pune', 80000, 35, 10),
(14, 'Sneha', 'IT', 'Female', 'Delhi', 77000, 29, 6),
(15, 'Arjun', 'Sales', 'Male', 'Mumbai', 53000, 28, 4);

select * from employees;

-- Find total number of employees in each department.
select department, count(emp_id) from employees group by department;

-- Find average salary department wise.
select department, avg(salary) from employees group by department;

-- Find maximum salary in each department.
select department, max(salary) from employees  group by department;

-- Find minimum salary in each department.
select department, min(salary) from employees group by department;

-- Find total salary department wise.
select department, sum(salary) from employees group by department;

-- Count male and female employees separately.
select gender, count(*)  from employees group by gender;

-- Find average age department wise.
select department, avg(age) from employees group by department;

-- Find total employees city wise.
select  city, count(emp_name) from employees group by city;

-- Find highest salary city wise.
select city, max(salary) from employees group by city; 

-- Find lowest salary city wise.
select city, min(salary) from employees group by city; 

-- Find total salary city wise.
select city, sum(salary) from employees group by city; 

-- Find average experience department wise.
select department, avg(experience) from employees group by department; 

-- Find department having more than 3 employees.
select department, count(emp_name) from employees group by department having count(emp_name) >3;

-- Find cities where average salary is greater than 50000.
select city , avg(salary) from employees group by city having avg(salary) > 50000;

-- Find total employees based on gender.
select gender, count(emp_name) from employees group by gender;

-- Find maximum experience department wise.
select department, max(experience) from employees group by department;

-- Find minimum age city wise.
select city, min(age) from employees group by city;

-- Find total salary of male and female employees separately.
select gender, sum(salary) from employees group by gender;

-- Find average salary gender wise.
select gender, avg(salary) from employees group by gender;

-- Find departments where total salary is greater than 200000.
select department, sum(salary) from employees group by department having sum(salary) > 200000;

-- Find count of employees department and city wise.
select department, city, count(emp_name) from employees group by department, city;

-- Find average age gender wise.
select gender, avg(age) from employees group by gender;

-- Find highest salary gender wise.
select gender, max(salary) from employees group by gender;

-- Find department wise total experience.
select department, sum(experience) from employees group by department;

-- Find cities having more than 2 employees.
select city, count(emp_name) from employees group by city having count(emp_name) > 2;


CREATE TABLE customers (
    customer_id INT,
    customer_name VARCHAR(50),
    city VARCHAR(30)
);

INSERT INTO customers VALUES
(1, 'Aman', 'Delhi'),
(2, 'Neha', 'Mumbai'),
(3, 'Rohit', 'Pune'),
(4, 'Simran', 'Jaipur'),
(5, 'Karan', 'Delhi');


CREATE TABLE orders (
    order_id INT,
    customer_id INT,
    product_id INT,
    order_amount INT
);

INSERT INTO orders VALUES
(101, 1, 201, 25000),
(102, 2, 202, 40000),
(103, 1, 203, 15000),
(104, 3, 201, 25000),
(105, 6, 204, 30000);


CREATE TABLE products (
    product_id INT,
    product_name VARCHAR(50),
    category VARCHAR(30)
);

INSERT INTO products VALUES
(201, 'Laptop', 'Electronics'),
(202, 'Mobile', 'Electronics'),
(203, 'Chair', 'Furniture'),
(204, 'Table', 'Furniture'),
(205, 'Watch', 'Accessories');


CREATE TABLE employee (
    emp_id INT,
    emp_name VARCHAR(50),
    department VARCHAR(30)
);

INSERT INTO employee VALUES
(1, 'Arjun', 'Sales'),
(2, 'Priya', 'HR'),
(3, 'Rahul', 'IT'),
(4, 'Sneha', 'Finance');

select * from customers;
select * from orders;
select * from products;
select * from employee;
-- Show customer names with their order ids.
select customers.customer_name, orders.order_id from customers 
join orders on customers.customer_id = orders.customer_id;

-- Show customer names and order amounts.
select c.customer_name, o.order_amount from customers as c
join orders as o on c.customer_id = o.customer_id;

-- Show customer names with product names.
select c.customer_name,  p.product_name from customers as c 
join orders as o on c.customer_id = o.customer_id
join products as p on o.product_id = p.product_id;

-- Show order id, customer name, and city.
select c.customer_name, c.city, o.order_id  from customers as c
join orders as o on c.customer_id = o.customer_id;

-- Show product names with order amounts.
select p.product_name, o.order_amount from products as p
join orders as o on p.product_id = o.product_id;

-- Show customer name, product name, and order amount.
select c.customer_name, p.product_name, o.order_amount from customers as c
join orders as o on c.customer_id = o.customer_id 
join products as p on o.product_id = p.product_id;

-- Show all customers who placed orders.
select c.* from customers as c
join orders as o on c.customer_id = o.customer_id;

-- Show all ordered products.
select o.*, p.* from orders as o 
join products as p on o.product_id = p.product_id;

-- Show customer names who ordered Laptop.
select c.customer_name ,p.product_name from customers as c
join orders as o on c.customer_id = o.customer_id
join products as p on o.product_id = p.product_id
where p.product_name = 'laptop';

-- Show customer names who ordered Furniture products.
select c.customer_name ,p.category from customers as c
join orders as o on c.customer_id = o.customer_id
join products as p on o.product_id = p.product_id
where p.category = 'furniture';

-- Show customer names and product categories.
select c.customer_name ,p.category from customers as c
join orders as o on c.customer_id = o.customer_id
join products as p on o.product_id = p.product_id;

-- Show order details with customer city and product name.
select o.order_id, o.customer_id, o.product_id, o.order_amount, c.city, p.product_name from customers as c
join orders as o on c.customer_id = o.customer_id
join products as p on o.product_id = p.product_id;

-- Find total order amount customer wise.
select c.customer_name ,sum(o.order_amount) from customers as c 
join orders as o on c.customer_id = o.customer_id
group by c.customer_name;


-- Find average order amount customer wise.
select c.customer_name ,avg(o.order_amount) from customers as c 
join orders as o on c.customer_id = o.customer_id
group by c.customer_name;

-- Find maximum order amount customer wise.
select c.customer_name ,max(o.order_amount) from customers as c 
join orders as o on c.customer_id = o.customer_id
group by c.customer_name;

-- Find minimum order amount customer wise.
select c.customer_name , min(o.order_amount) from customers as c 
join orders as o on c.customer_id = o.customer_id
group by c.customer_name;

-- Find total orders product wise.
select p.product_name, sum(o.order_amount) from orders as o
join products as p on o.product_id = p.product_id
group by p.product_name;

-- Find total sales category wise.
select p.category, sum(o.order_amount) from orders as o
join products as p on o.product_id = p.product_id
group by p.category;

-- Find customers from Delhi who placed orders.
select c.customer_name from customers as c
join orders as o on c.customer_id = o.customer_id
where c.city = 'delhi';

-- Find products ordered by customers from Mumbai.
select p.product_name from customers as c 
join orders as o on c.customer_id = o.customer_id
join products as p on o.product_id = p.product_id
where c.city = 'Mumbai';

-- Find customer name and product name where order amount is greater than 20000.
select c.customer_name, p.product_name, o.order_amount from customers as c
join orders as o on c.customer_id = o.customer_id
join products as p on o.product_id = p.product_id 
where o.order_amount >20000;

-- Find total number of orders customer wise.
select c.customer_name, count(o.order_id) from customers as c
join orders as o on c.customer_id = o.customer_id
group by c.customer_name;

-- Find customer names whose order amount is highest.
select c.customer_name, o.order_amount
from customers as c join orders as o
on c.customer_id = o.customer_id
where o.order_amount = (
    select max(order_amount)
    from orders);

-- Find all Electronics products ordered by customers.
select c.customer_name, p.product_name, p.category from customers as c
join orders as o on c.customer_id = o.customer_id
join products as p on o.product_id = p.product_id
where p.category = 'Electronics';

-- Show customer name, product name, category, and order amount together.
select c.customer_name, p.product_name, p.category, o.order_amount from customers as c 
join  orders as o on c.customer_id = o.customer_id
join products as p on o.product_id = p.product_id;
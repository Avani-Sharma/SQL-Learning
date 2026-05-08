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
natural join orders;

-- practice sheet 
-- Create employees table
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    dept_id INT
);

-- Insert data into employees table
INSERT INTO employees (emp_id, emp_name, dept_id) VALUES
(1, 'Alice', 10),
(2, 'Bob', 20),
(3, 'Charlie', 30),
(4, 'Diana', 10),
(5, 'Edward', NULL);


-- Create departments table
CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

-- Insert data into departments table
INSERT INTO departments (dept_id, dept_name) VALUES
(10, 'HR'),
(20, 'IT'),
(40, 'Finance');

select * from employees;
select * from departments;

-- 1. List the names of all employees along with their department names. Show only employees who belong to a department.
select  e.emp_name, d.dept_name
from employees as e
inner join departments as d
on e.dept_id = d.dept_id;

-- 2. List ALL employees with their department names. If an employee has no department, show NULL for department name.
select e.emp_name, d.dept_name 
from employees as e
left join departments as d 
on e.dept_id = d.dept_id;

-- 3. Show all departments and the number of employees in each. Include departments with ZERO employees.
SELECT d.dept_name,
COUNT(e.emp_id) AS employee_count
FROM employees e
RIGHT JOIN departments d
ON e.dept_id = d.dept_id
GROUP BY d.dept_name;

-- 4. Display employee names along with their department names.
select e.emp_name, d.dept_name
from employees as e
 inner join departments as d
on e.dept_id = d.dept_id;

-- 5. Show all employees who belong to a valid department.
select e.emp_name , d.dept_name
from employees as e
inner join departments as d
on e.dept_id = d.dept_id;

-- 6. Retrieve employee id, employee name, and department name
select e.emp_id, e.emp_name, d.dept_name
from employees as e
inner join departments as d
on e.dept_id = d.dept_id;

-- 7. Count the number of employees in each department.
select d.dept_id, count(e.emp_id) 
from employees as e
join departments as d
on e.dept_id = d.dept_id
group by d.dept_id;

-- 8. Display department names with total employees.
select d.dept_id, count(e.emp_id) 
from employees as e
join departments as d
on e.dept_id = d.dept_id
group by d.dept_id;
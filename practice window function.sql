CREATE TABLE employees_sales (
sale_id INT,
employee_name VARCHAR(50),
department VARCHAR(50),
sale_date DATE,
sales_amount INT
);

INSERT INTO employees_sales VALUES
(1, 'Amit', 'Electronics', '2026-01-01', 500),
(2, 'Amit', 'Electronics', '2026-01-03', 700),
(3, 'Amit', 'Electronics', '2026-01-05', 600),
(4, 'Neha', 'Electronics', '2026-01-02', 800),
(5, 'Neha', 'Electronics', '2026-01-04', 900),
(6, 'Neha', 'Electronics', '2026-01-06', 750),
(7, 'Raj', 'Furniture', '2026-01-01', 300),
(8, 'Raj', 'Furniture', '2026-01-03', 450),
(9, 'Raj', 'Furniture', '2026-01-05', 500),
(10, 'Simran', 'Furniture', '2026-01-02', 400),
(11, 'Simran', 'Furniture', '2026-01-04', 550),
(12, 'Simran', 'Furniture', '2026-01-06', 650),
(13, 'Vikas', 'Clothing', '2026-01-01', 200),
(14, 'Vikas', 'Clothing', '2026-01-03', 250),
(15, 'Vikas', 'Clothing', '2026-01-05', 300),
(16, 'Priya', 'Clothing', '2026-01-02', 350),
(17, 'Priya', 'Clothing', '2026-01-04', 400),
(18, 'Priya', 'Clothing', '2026-01-06', 450),
(19, 'Karan', 'Electronics', '2026-01-07', 1000),
(20, 'Karan', 'Electronics', '2026-01-08', 1200);

-- employee_attendance
CREATE TABLE employee_attendance (
attendance_id INT,
employee_name VARCHAR(50),
department VARCHAR(50),
attendance_date DATE,
hours_worked INT
);

INSERT INTO employee_attendance VALUES
(1, 'Amit', 'Electronics', '2026-01-01', 8),
(2, 'Amit', 'Electronics', '2026-01-02', 9),
(3, 'Amit', 'Electronics', '2026-01-03', 7),
(4, 'Neha', 'Electronics', '2026-01-01', 8),
(5, 'Neha', 'Electronics', '2026-01-02', 10),
(6, 'Neha', 'Electronics', '2026-01-03', 9),
(7, 'Raj', 'Furniture', '2026-01-01', 6),
(8, 'Raj', 'Furniture', '2026-01-02', 7),
(9, 'Raj', 'Furniture', '2026-01-03', 8),
(10, 'Simran', 'Furniture', '2026-01-01', 9),
(11, 'Simran', 'Furniture', '2026-01-02', 8),
(12, 'Simran', 'Furniture', '2026-01-03', 10),
(13, 'Vikas', 'Clothing', '2026-01-01', 5),
(14, 'Vikas', 'Clothing', '2026-01-02', 6),
(15, 'Vikas', 'Clothing', '2026-01-03', 7),
(16, 'Priya', 'Clothing', '2026-01-01', 8),
(17, 'Priya', 'Clothing', '2026-01-02', 8),
(18, 'Priya', 'Clothing', '2026-01-03', 9),
(19, 'Karan', 'Electronics', '2026-01-01', 10),
(20, 'Karan', 'Electronics', '2026-01-02', 11);

select * from employees_sales;
select * from employee_attendance;

-- Find total sales by each department.
select employee_name , department, sales_amount, 
sum(sales_amount) over(partition by department) as total_department_salary from employees_sales;

-- Find average sales per employee.
select employee_name, sales_amount, 
avg(sales_amount) over(order by employee_name) as avg_sales from employees_sales;

-- Rank employees by sales within each department.
select employee_name, department, sales_amount , 
rank() over(partition by department order by sales_amount desc) as sales_rank from employees_sales;

-- Find previous sale amount for each employee.
select employee_name, sale_date, sales_amount,
lag(sales_amount) over(partition by employee_name order by sale_date)  as previous_sale from employees_sales;

-- Find next sale amount for each employee.
select employee_name, sale_date sales_amount, 
lead(sales_amount) over(partition by employee_name order by sale_date) as next_sale from employees_sales;

-- Calculate running total using ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW.
select employee_name, sale_date, sales_amount,
sum(sales_amount) over(partition by employee_name order by sale_date
ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) as running_total from employees_sales;

-- Calculate moving average of current row and previous row.
select employee_name, sale_date, sales_amount, 
avg(sales_amount) over(partition by employee_name order by sale_date 
ROWS BETWEEN 1 PRECEDING AND CURRENT ROW) as moving_avg from employees_sales;

-- Calculate sum of current row and next row.
select employee_name, sale_date, sales_amount, 
sum(sales_amount) over(partition by employee_name order by sale_date
rows between current row and 1 following) as current_next_salary from employees_sales;

-- Calculate 3-row moving total.
select employee_name, sale_date, sales_amount, 
sum(sales_amount) over(partition by employee_name order by sale_date
rows between 1 preceding  and 1 following) as moving_total from employees_sales;

-- Find cumulative hours worked for each employee.
select employee_name, attendance_date, hours_worked,
sum(hours_worked) over(partition by employee_name order by attendance_date
ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) as cumulative_hour from employee_attendance;

-- Find maximum sales within each department.
select employee_name, department sales_amount, 
max(sales_amount) over(partition by department)
as max_department_sale from employees_sales;

-- Assign row numbers within each department.
select employee_name, department sales_amount, 
row_number() over(partition by department order by sales_amount desc)
as row_num from employees_sales;

-- Find difference between current sale and previous sale.
select employee_name, sale_date, sales_amount,
sales_amount - lag(sales_amount) over(partition by employee_name order by sale_date) as sales_difference
from employees_sales;
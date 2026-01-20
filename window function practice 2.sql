USE window_fn_practice;

select * from employees;

select * from sales;

-- Add a row number for employees sorted by salary (highest first)
select * , row_number() over(order by salary desc) from employees;

-- Rank employees by salary (ties share rank)
select *, rank() over(order by salary desc) from employees;

-- Dense rank employees by salary (no gaps in rank numbers)
select *, dense_rank() over(order by salary desc) from employees;

-- Row number within each department by salary desc
select *, row_number() over(partition by department order by salary desc) from employees;

-- Rank within each department by salary desc
select *, rank() over(partition by department order by salary desc) from employees;

-- Show previous and next salary in overall salary order (LAG/LEAD)
select *, lag(salary) over(order by salary desc),
lead(salary) over(order by salary desc)  from employees;

select * from sales;

-- Running total of sales amounts by date (overall)
select *, sum(amount) over(order by sale_date) from sales;

-- Running total of sales per employee by date
select *, sum(amount) over(partition by emp_id order by sale_date) from sales;

-- Total sales per row (same total repeated using window SUM)
select *, sum(amount) over() from sales;

-- Average salary per department shown on every employee row
select *, avg(salary) over(partition by department) from employees;

-- intermediate level questions

-- subquery isaved to a variable name as "tempdata"
-- first the subquery is solved save to the variable
-- and then we access the column and we filter out the data 
-- Top 2 salaries in each department (use ROW_NUMBER)
select * from
(select *, row_number() over(partition by department order by salary ) as row_value 
from employees) tempdata where row_value <=2 ;

-- Salary difference vs department average
select *, avg(salary) over(partition by department),
salary - avg(salary) over(partition by department)  from employees;

-- Percent rank of employees by salary (overall)
select *, sum(salary) over(),
rank() over(order by salary), 
percent_rank() over(order by salary)
from employees;

-- Salary distribution into 4 buckets (NTILE)
select *,ntile(4) over(order by salary) from employees;

-- Find each employee’s first and last sale date (MIN/MAX window)
select *, min(sale_date) over(partition by emp_id order by sale_date),
max(sale_date) over(partition by emp_id order by sale_date )
from sales;

-- Month-wise running total of sales (per month)
SELECT sale_date, amount,
  YEAR(sale_date) , MONTH(sale_date) , SUM(amount) OVER (PARTITION BY YEAR(sale_date), MONTH(sale_date)
    ORDER BY sale_date) FROM sales ORDER BY sale_date;
  
-- Moving 3-row average of sales amount (overall)
SELECT sale_id, sale_date, amount,
AVG(amount) OVER (ORDER BY sale_date, sale_id
ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS moving_avg_3 FROM sales;
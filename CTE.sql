show databases;
use sakila;
select * , month(payment_date) from sakila.payment;

select *, dense_rank() over(order by amount desc) from sakila.payment;

with cte as 
(select *, dense_rank() over(partition by customer_id order by amount desc) as rankings from sakila.payment)
select * from cte where rankings = 2;

with cte as 
(select *, dense_rank() over(order by amount desc) as rankings from sakila.payment)
select * from cte where rankings = 2;

CREATE DATABASE company_db;
USE company_db;

CREATE TABLE employees (
  emp_id      INT PRIMARY KEY,
  emp_name    VARCHAR(50) NOT NULL,
  department  VARCHAR(30) NOT NULL,
  job_role    VARCHAR(40),
  salary      INT NOT NULL,
  hire_date   DATE NOT NULL,
  manager_id  INT
);

INSERT INTO employees 
(emp_id, emp_name, department, job_role, salary, hire_date, manager_id)
VALUES
(1, 'Amit',   'IT',      'Developer',        60000, '2022-01-10', NULL),
(2, 'Neha',   'IT',      'Developer',        65000, '2021-07-15', 1),
(3, 'Rohit',  'IT',      'Tester',           50000, '2023-03-20', 1),
(4, 'Priya',  'HR',      'HR Executive',     45000, '2020-11-05', NULL),
(5, 'Ankit',  'HR',      'Recruiter',        40000, '2022-06-18', 4),
(6, 'Suman',  'Finance', 'Accountant',       55000, '2021-09-12', NULL),
(7, 'Karan',  'Finance', 'Analyst',           70000, '2019-04-01', 6),
(8, 'Pooja',  'Sales',   'Sales Executive',  48000, '2023-01-25', NULL),
(9, 'Rahul',  'Sales',   'Sales Executive',  52000, '2022-08-30', 8),
(10,'Sneha',  'IT',      'Team Lead',         90000, '2018-02-14', NULL);

SELECT * FROM employees ORDER BY emp_id;

-- Show all employees with salary greater than 60,000
WITH high_salary AS (
  SELECT *
  FROM employees
  WHERE salary > 60000
)
SELECT * FROM high_salary;

-- Show average salary of each department using CTE
WITH dept_avg AS (
  SELECT department, AVG(salary) AS avg_salary
  FROM employees
  GROUP BY department
)
SELECT * FROM dept_avg;

-- Count employees in each department
WITH dept_count AS (
  SELECT department, COUNT(*) AS emp_count
  FROM employees
  GROUP BY department
)
SELECT * FROM dept_count;

-- Employees earning more than their department’s average salary
WITH dept_avg AS (
  SELECT department, AVG(salary) AS avg_salary
  FROM employees
  GROUP BY department
)
SELECT e.*
FROM employees e
JOIN dept_avg d
  ON e.department = d.department
WHERE e.salary > d.avg_salary;

-- Highest paid employee in each department
WITH ranked_emp AS (
  SELECT *,
         RANK() OVER (
           PARTITION BY department
           ORDER BY salary DESC
         ) AS rnk
  FROM employees
)
SELECT *
FROM ranked_emp
WHERE rnk = 1;

-- Employees hired after 2021 with salary above department average
WITH dept_avg AS (
  SELECT department, AVG(salary) AS avg_salary
  FROM employees
  GROUP BY department
)
SELECT e.*
FROM employees e
JOIN dept_avg d
  ON e.department = d.department
WHERE e.hire_date > '2021-12-31'
  AND e.salary > d.avg_salary;

-- Department-wise total salary and company-wide average of department totals
WITH dept_total AS (
  SELECT department, SUM(salary) AS total_salary
  FROM employees
  GROUP BY department
)
SELECT *,
       AVG(total_salary) OVER () AS company_avg_dept_salary
FROM dept_total;

-- Find employees who report to managers earning more than 70,000
WITH manager_salary AS (
  SELECT emp_id, salary
  FROM employees
)
SELECT e.*
FROM employees e
JOIN manager_salary m
  ON e.manager_id = m.emp_id
WHERE m.salary > 70000;

-- Running total of salary by hire date
WITH salary_run AS (
  SELECT *,
         SUM(salary) OVER (
           ORDER BY hire_date
         ) AS running_salary
  FROM employees
)
SELECT * FROM salary_run;
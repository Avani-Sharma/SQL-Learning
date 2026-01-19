-- DATABASE: world
USE world;

-- Q1: Display country code, name, continent, and population.
SELECT code, name, continent, population FROM country;

-- Q2: Why does the following query give an error?
-- SELECT population, AVG(population) FROM country;
-- Answer:
-- Because aggregate function (AVG) is used with a non-aggregated column without GROUP
-- Correct Solution:
SELECT AVG(population) FROM country;

-- Q3: Find total population continent-wise.
SELECT continent, SUM(population) FROM country GROUP BY continent;

-- WINDOW FUNCTIONS:

-- Q4: Find total population of all countries without reducing rows.
SELECT code, name, continent, population,
       SUM(population) OVER() AS total_population
FROM country;

-- Q5: Find continent-wise population for each country.
SELECT code, name, continent, population,
       SUM(population) OVER(PARTITION BY continent) AS continent_population
FROM country;

-- Q6: Show total population, continent population, global average,
-- and continent-wise average population.
SELECT code, name, continent, population,
       SUM(population) OVER() AS total_population,
       SUM(population) OVER(PARTITION BY continent) AS continent_population,
       AVG(population) OVER() AS global_avg_population,
       AVG(population) OVER(PARTITION BY continent) AS continent_avg_population
FROM country;

-- Q7: Find continent-wise sum and region-wise average population.
SELECT code, name, continent, population,
       SUM(population) OVER(PARTITION BY continent) AS continent_sum,
       AVG(population) OVER(PARTITION BY continent, region) AS region_avg
FROM country;

-- DATABASE: window_fn_practice
CREATE DATABASE IF NOT EXISTS window_fn_practice;
drop database window_fn_practice;
USE window_fn_practice;

-- EMPLOYEES TABLE
CREATE TABLE employees (
  emp_id      INT PRIMARY KEY,
  full_name   VARCHAR(100) NOT NULL,
  department  VARCHAR(50) NOT NULL,
  city        VARCHAR(50) NOT NULL,
  salary      INT NOT NULL,
  hire_date   DATE NOT NULL
);

-- sale table
CREATE TABLE sales (
  sale_id     INT PRIMARY KEY,
  emp_id      INT NOT NULL,
  sale_date   DATE NOT NULL,
  amount      DECIMAL(10,2) NOT NULL,
  FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
);


INSERT INTO employees (emp_id, full_name, department, city, salary, hire_date) VALUES
(101, 'Asha Nair',   'Sales',      'Mumbai',    65000, '2022-04-10'),
(102, 'Rohan Mehta', 'Sales',      'Pune',      72000, '2021-07-05'),
(103, 'Neha Singh',  'Sales',      'Delhi',     68000, '2023-01-15'),
(104, 'Kabir Rao',   'Engineering','Bengaluru', 120000,'2020-09-20'),
(105, 'Isha Verma',  'Engineering','Hyderabad', 110000,'2021-11-12'),
(106, 'Vikram Das',  'Engineering','Bengaluru', 125000,'2019-03-08'),
(107, 'Pooja Shah',  'HR',         'Mumbai',    60000, '2020-02-01'),
(108, 'Arjun Iyer',  'HR',         'Chennai',   58000, '2022-06-18');

INSERT INTO sales (sale_id, emp_id, sale_date, amount) VALUES
(1, 101, '2026-01-02', 12000.00),
(2, 101, '2026-01-05',  8000.00),
(3, 102, '2026-01-03', 15000.00),
(4, 102, '2026-01-09',  5000.00),
(5, 103, '2026-01-04',  7000.00),
(6, 103, '2026-01-10', 11000.00),
(7, 101, '2026-02-02', 14000.00),
(8, 102, '2026-02-03',  9000.00),
(9, 103, '2026-02-05', 13000.00),
(10,101, '2026-02-08',  6000.00),
(11,102, '2026-02-10', 16000.00),
(12,103, '2026-02-12',  4000.00);

-- Q8: Find total salary of all employees.
SELECT *, SUM(salary) OVER() AS total_salary FROM employees;

-- Q9: Find department-wise total salary.
SELECT *, SUM(salary) OVER(PARTITION BY department) AS dept_salary
FROM employees;

-- Q10: Find department + city wise salary.
SELECT *, SUM(salary) OVER(PARTITION BY department, city) AS dept_city_salary
FROM employees;

-- RUNNING / CUMULATIVE SUM
-- Q11: Find running salary based on salary order.
SELECT *, SUM(salary) OVER(ORDER BY salary) AS running_salary
FROM employees;

-- Q12: Find running salary based on hire date.
SELECT *, SUM(salary) OVER(ORDER BY hire_date) AS running_salary
FROM employees;

-- Q13: Find department-wise running salary.
SELECT *, SUM(salary) OVER(PARTITION BY department ORDER BY salary) AS dept_running_salary
FROM employees;

-- ROW_NUMBER(): 
-- Q14: Assign a unique row number to each employee.
SELECT *, ROW_NUMBER() OVER() AS row_num FROM employees;

-- Q15: Assign row numbers department-wise.
SELECT *, ROW_NUMBER() OVER(PARTITION BY department) AS dept_row_num
FROM employees;

-- Q16: Assign row numbers department-wise by hire date.
SELECT *, ROW_NUMBER() OVER(PARTITION BY department ORDER BY hire_date) AS dept_join_order
FROM employees;

-- RANK() and DENSE_RANK():
-- in windows function rank(), dense_rank() and row_number(): 

-- | Feature                             | ROW_NUMBER()                         | RANK()                                 | DENSE_RANK()                        |
-- | ----------------------------------- | ------------------------------------  | ------------------------------------- | ----------------------------------- |
-- | Purpose                             | Gives **unique number** to every row  | Gives rank based on order             | Gives rank based on order           | 
-- | Duplicate values (ties)             | ❌ Not allowed (still unique)         | Same rank for ties                    |  Same rank for ties                 |
-- | Gap after tie                       | ❌ No gap                             | Gap happens                           |  No gap                             |
-- | Output example (Salary: 100,100,90) | 1,2,3                                 | 1,1,3                                 | 1,1,2                               |
-- | Best use case                       | When you need **exact row position**  | When you want **competition ranking** | When you want **continuous ranking**|

-- Q17: Rank employees by salary within each department.
SELECT *, RANK() OVER(PARTITION BY department ORDER BY salary DESC) AS salary_rank
FROM employees;

-- Q18: Dense rank employees by salary within each department.
SELECT *, DENSE_RANK() OVER(PARTITION BY department ORDER BY salary DESC) AS dense_salary_rank
FROM employees;

-- Q19: Difference between GROUP BY and WINDOW FUNCTION?
-- GROUP BY: reduces rows, 
-- Window Functions: do not reduce rows.
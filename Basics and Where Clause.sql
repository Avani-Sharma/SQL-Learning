select current_user();
show databases;         -- to show all the databases
use sakila;
show tables;            -- table in the databases

select * from customer;
-- 1 column access
select customer_id from customer;
-- 2 column access
select customer_id , first_name from customer;

select * from payment;
select payment_id, amount from payment;

select customer_id, first_name from customer;
select customer_id, first_name, customer_id+10 from customer;    -- not seen changes in original 

select customer_id, customer_id*10-1+6 from customer;
select customer_id, CUSTOMER_id, cUstOMER_id from customer;     -- case insensitive

-- where clause: to filter the rows 
select * from customer where customer_id =4 ;
select customer_id, first_name from customer where first_name = 'Maria';

-- to utilize the database for which data will be stored
use world;

-- to see column of table country 
describe country;

-- to print the data 
select * from country;

-- to see three column
select name , population, region  from country; 

-- any order you can print column
select population, name, region from country;

-- any mathematical work
select name, population ,region ,population-500 from country;

-- When performing mathematical operations, use AS to give a column a new name (alias)
-- Using an alias does not change the original data; it only changes the column name in the result output.	 
select name, population, region, population-500+20*67 as 'new population' from country;

-- to filter use WHERE clause 
select * from country where continent='asia';
select * from country where indepyear='1984';

-- where clause have some operators:
-- arithmetic operators: +, -, *, /, %
-- comparison operators: =, !=, >, <, >=, <=
-- logical operatos: AND, OR, NOT, IN, bETWEEN, LIKE

-- Ques1.--> Select all countries where the continent is Asia.
SELECT * FROM country WHERE continent = 'Asia';

-- Ques2.--> Find countries where population is greater than 10,000,000.
SELECT * FROM country wHERE population > 10000000;

-- Ques3.--> Display countries where life expectancy is less than 60.
SELECT *  FROM country WHERE LifeExpectancy < 60;

-- Ques4.--> Select countries where government form is 'Republic'.
SELECT * FROM country WHERE GovernmentForm = 'Republic';

-- Ques5.--> US cities with population less than 500,000
SELECT * FROM city WHERE Population < 500000 AND CountryCode = 'USA';

-- Ques6.--> Cities in California district
SELECT * FROM city WHERE District = 'California';

-- Ques7.--> Countries with population between 1M and 5M
SELECT * FROM country WHERE Population BETWEEN 1000000 AND 5000000;

-- Ques8.--> Countries in Asia or Africa
SELECT * FROM country WHERE Continent IN ('Asia', 'Africa');

-- Ques9.--> Countries not Asia or Africa
SELECT * FROM country WHERE Continent not IN ('Asia', 'Africa');

-- Find countries whose continent is 'Asia' AND population > 1 crore
select * from country where continent = 'Asia' and population > 10000000;

-- Get countries whose region is 'Southern Europe' AND population < 50 lakh
select * from country where region = 'Southern Europe' and population < 5000000;

-- Find countries whose IndepYear > 1950 AND continent is 'Africa'
select * from country where indepyear > 1950 and continent = 'Africa';

-- Get countries whose population BETWEEN 10 lakh AND 1 crore AND continent is 'Europe'
select * from country where population between 1000000 and 10000000 and continent = 'Europe';

-- Find countries whose name starts with 'A' AND continent is not 'Asia'
select * from country where name like 'A%' and continent != 'Asia';

-- Get countries whose continent is 'Asia' OR 'Europe' AND population > 2 crore
select * from country where (continent = 'Asia' OR continent = 'Europe') and population > 20000000;

-- Find countries whose IndepYear is NULL AND population > 1 crore
select * from country where indepyear is null and population > 10000000;

-- Get countries whose region is 'Western Europe' AND name ends with 'y'
select * from country where region = 'Western Europe' and name like '%y';

-- Find countries whose population < 5 lakh AND continent is 'Oceania'
select * from country where population <500000 and continent = 'Oceania';

-- Get countries whose name contains 'land' AND population > 10 lakh
select * from country where name like '%land%' and population > 1000000;

CREATE TABLE students (
    id INT,
    name VARCHAR(50),
    age INT,
    marks INT,
    city VARCHAR(50)
);

INSERT INTO students (id, name, age, marks, city) VALUES
(1, 'Avani', 20, 85, 'Jaipur'),
(2, 'Rohit', 22, 72, 'Delhi'),
(3, 'Sneha', 19, 90, 'Mumbai'),
(4, 'Amit', 21, 65, 'Pune'),
(5, 'Priya', 20, 78, 'Jaipur'),
(6, 'Karan', 23, 55, 'Delhi'),
(7, 'Neha', 18, 88, 'Chandigarh'),
(8, 'Rahul', 22, 40, 'Bangalore'),
(9, 'Simran', 21, 95, 'Amritsar'),
(10, 'Vikas', 24, 60, 'Lucknow');


-- practice questions based on table student:-- 
-- Fetch all students whose marks are greater than 50 
select name from students where marks> 50;

-- Display students whose age is 18
select name from students where age = 18;

-- Get students whose city is 'Delhi'
select name from students where city = 'Delhi';

-- Find students whose marks are between 40 and 80
select name from students where marks between 40 and 80;

-- Fetch students whose marks are less than 60 AND city is 'Mumbai'
select name from students where marks <60 and city = 'Mumbai';

-- Find students whose name starts with 'A'
select name from students where name like 'A%';

-- Find students whose name ends with 'a'
select name from students where name like '%a';

-- Get students whose age is 18 OR 20
select name from students where age in (18, 20);

-- Fetch students whose marks are 50, 60, or 70
select name from students where marks in (50, 60, 70); 

-- Find students whose city is NULL
select name from students where city is Null;

CREATE TABLE employees (
    emp_id INT,
    emp_name VARCHAR(50),
    salary INT,
    department VARCHAR(50),
    experience INT
);

INSERT INTO employees (emp_id, emp_name, salary, department, experience) VALUES
(1, 'Amit', 30000, 'HR', 2),
(2, 'Neha', 45000, 'IT', 4),
(3, 'Rahul', 50000, 'Finance', 5),
(4, 'Priya', 35000, 'HR', 3),
(5, 'Karan', 60000, 'IT', 6),
(6, 'Sneha', 40000, 'Marketing', 4),
(7, 'Vikas', 55000, 'Finance', 5),
(8, 'Simran', 32000, 'Marketing', 2),
(9, 'Ankit', 70000, 'IT', 8),
(10, 'Rohit', 28000, 'HR', 1);

-- Fetch employees whose salary is greater than 30000
select emp_name from employees where salary > 30000;

-- Get employees whose department is 'IT'
select emp_name from employees where department =  'IT';

-- Find employees whose salary is between 20000 and 50000
select emp_name from employees where salary >= 20000 AND salary <= 50000;

-- Fetch employees whose experience is less than 5 years
select emp_name from employees where experience < 5;

-- Find employees whose name starts with 'R'
select emp_name from employees where emp_name like 'R%';

-- Get employees whose department is 'HR' OR 'Finance'
select emp_name from employees where department in ('HR', 'Finance');

-- Fetch employees whose salary is not equal to 40000
select emp_name from employees where salary <> 40000;

-- Find employees whose experience is 3, 5, or 7
select emp_name from employees where experience in (3, 5, 7);

-- Get employees whose department is NULL
select emp_name from employees where department is null;

-- Fetch employees whose salary is less than 25000 OR greater than 60000
select emp_name from employees where salary < 25000 or salary >60000;
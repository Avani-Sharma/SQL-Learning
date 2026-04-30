-- order by clause:
-- to sort in ascending (ASC) and descending (DESC) order.
-- by default always ascending
-- ORDER BY is written at the end of the query.

-- Display countries ordered by population (ascending):
SELECT Name, Population FROM country ORDER BY Population;

-- Display countries ordered by population (descending):
SELECT Name, Population FROM country ORDER BY Population DESC;

-- Display countries ordered by name alphabetically:
SELECT Name FROM country ORDER BY Name ASC;

-- ORDER BY with alias:
SELECT Name, Population * 2 AS double_population FROM country ORDER BY double_population DESC;

-- ORDER BY with multiple columns:
SELECT Continent, Name, Population FROM country ORDER BY Continent ASC, Population DESC;

-- ORDER BY with WHERE: WHERE filters rows first, then ORDER BY sorts the filtered result.
-- Display Asian countries ordered by population (highest first).
-- WHERE → selects only Asian countries
-- ORDER BY → sorts them by population (descending)
SELECT Name, Population FROM country WHERE Continent = 'Asia' ORDER BY Population DESC;

-- Display cities in India ordered alphabetically.
SELECT Name FROM city WHERE CountryCode = 'IND' ORDER BY Name ASC;

-- ORDER BY with GROUP BY: GROUP BY groups data, and ORDER BY sorts the grouped result.
-- Display total population of each continent, ordered by total population.
-- GROUP BY → continent-wise grouping
-- ORDER BY → sorts continents by total population
SELECT Continent, SUM(Population) FROM country GROUP BY Continent ORDER BY total_population DESC;

-- Display number of countries in each continent, ordered by count.
SELECT Continent, COUNT(Name) FROM country GROUP BY Continent ORDER BY country_count DESC;

-- WHERE + GROUP BY + ORDER BY (Together)
-- Display regions in Asia with average life expectancy, ordered by average life expectancy.
SELECT Region, AVG(LifeExpectancy) FROM country WHERE Continent = 'Asia' GROUP BY Region ORDER BY avg_life DESC;


select * from employees;
select * from employees order by salary desc;

select first_name, department, salary from employees order by department, salary;

select salary, hire_date, year(hire_date) from employees order by year(hire_date) , salary desc;

-- functions : multi-row functions/aggregate functions
-- distinct: unique values
select distinct(department) from employees;

select distinct department, salary from employees;

-- calculation on your data : aggregate function
select count(department) from employees;
select count(first_name) from employees;

select count(district) from address;
select count(district) , count(address_id) , count(address2) from address;

select * from address;
select * from employees;
select count(department), count(distinct department) from employees;

-- select salary, count(salary) from employees;   : error no direct access 
select sum(salary), count(salary) from employees;
select max(salary), min(salary), avg(salary) from employees;


-- practice questions 
use sakila;
select * from employees;
-- Show all employees who work in the IT department.
select emp_id, first_name from employees where department = 'IT';

-- Find employees whose salary is greater than 80,000.
select emp_id, first_name from employees where salary >80000;

-- List employees who are currently active.
select emp_id, first_name from employees where is_active = 'Y';

-- Show employees from the HR department who earn more than 60,000.
select emp_id, first_name from employees where department = 'HR' and salary >60000;

-- Find employees hired after January 1, 2020.
select emp_id, first_name from employees where hire_date > '2020-01-01';

-- Display employees whose city is either Dallas or Seattle.
select emp_id, first_name from employees where city in ('Dallas' ,'seattle');

-- Show employees whose salary is between 70,000 and 90,000.
select emp_id, first_name from employees  where salary between 70000 and 90000;

-- Find inactive employees.
select emp_id, first_name from employees where is_active = 'N';

-- List employees who are not from the Marketing department.
select emp_id, first_name from employees where department != 'Marketing';

-- Show employees born after 1992.
select emp_id, first_name from employees where year(birth_date)>1992;

-- Display each employee's full name using first name and last name.
select emp_id, concat_ws(' ', first_name, last_name)as full_name from employees;

-- Convert all employee email addresses to uppercase.
select emp_id, first_name, upper(email) from employees;

-- Show first names in lowercase.
select lower(first_name) from employees;

-- Extract the first 3 characters of each first name.
select left(first_name, 3) from employees;

-- Find the length of each employee's last name.
select char_length(last_name) from employees;

-- Extract the username from each email address.
select left(email, instr(email, '@')-1) from employees;

-- Replace 'gmail.com' with 'company.com' in email addresses.
select replace(email, 'gmail.com' , 'company.com') from employees;

-- Show employees whose first name starts with 'A'.
select emp_id, first_name from employees where first_name like 'A%';

-- Find employees whose last name ends with 'son'.
select emp_id, first_name, last_name from employees where last_name like '%son';

-- Display first and last names with leading/trailing spaces removed.
select trim(first_name), trim(last_name) from employees;

-- Round each employee's salary to the nearest thousand.
select emp_id, first_name, round(salary, -3) from employees;

-- Display the absolute difference between salary and 75,000.
select abs(salary - 75000) from employees;

-- Show the square root of each employee's salary.
select sqrt(salary) from employees;

-- Find employees whose salary modulus 5000 equals zero.
select emp_id, first_name   from employees where mod(salary, 5000) = 0;

-- Display salary divided by 12 as monthly salary.
select (salary/ 12) as monthly_salary from employees;

-- Round monthly salary to 2 decimal places.
select round(salary/12, 2) from employees;

-- Show salary raised to the power of 2 for the first five employees.
select pow(salary, 2) from employees  limit 5 ;

-- Find the ceiling value of salary divided by 1000.
select ceil(salary/ 1000) from employees;

-- Find the floor value of salary divided by 1000.
select floor(salary/1000) from employees;

-- Calculate 15% bonus for each employee.
select salary + (salary*15/100) from employees;

-- Show employees hired in the year 2020.
select emp_id, first_name from employees where year(hire_date)  = 2020;

-- Find employees born in June.
select emp_id, first_name from employees where month(birth_date) = '06';

-- Display the number of years each employee has worked in the company.
select emp_id, first_name, timestampdiff(year,hire_date, now()) from employees;

-- Show employees hired in the last 5 years.
SELECT emp_id, first_name
FROM employees
WHERE hire_date >= DATE_SUB(CURDATE(), INTERVAL 5 YEAR);

-- Find employees whose birthday is in the current month.
select emp_id, first_name from employees where month(birth_date) = month(current_date);

-- Display hire month name for each employee.
SELECT emp_id, first_name,
       DATE_FORMAT(hire_date, '%M') AS hire_month
FROM employees;

-- Find employees hired before 2019.
select emp_id, first_name from employees where year(hire_date) <2019;

-- Show the day of the week each employee was hired.
select dayname(hire_date) from employees;

-- Calculate each employee's current age.
select emp_id, timestampdiff(year, birth_Date, now()) from employees;

-- Find employees who joined in March.
select emp_id , first_name from employees where month(hire_date) = '03';

-- Find the total number of employees.
select count(emp_id) from employees;

-- Calculate the average salary of all employees.
select avg(salary) from employees;

-- Find the highest salary.
select max(salary) from employees;

-- Find the lowest salary.
select min(salary) from employees;

-- Calculate the total salary paid to all active employees.
select sum(salary) from employees where is_active = 'Y';

-- Find the average salary of IT department employees.
select avg(salary) from employees where department = 'IT';

-- Count how many employees are in each department.
select department, count(emp_id) from employees group by department;

-- Find the maximum salary in the Sales department.
select max(salary) from employees where department = 'sales';

-- Calculate the total salary of inactive employees.
select sum(salary) from employees where is_active = 'N';

-- Find the minimum salary among HR employees.
select min(salary) from employees where department = 'HR';

-- Display all employees sorted by salary in ascending order.
select emp_id, first_name from employees order by salary;

-- Show employees sorted by salary in descending order.
select emp_id, first_name from employees order by salary desc;

-- Sort employees by hire date (oldest first).
select emp_id, first_name, hire_date from employees order by hire_date;

-- Display employees alphabetically by first name.
select emp_id, first_name from employees order by first_name;

-- Sort employees by department and then salary descending.
select emp_id, first_name from employees order by department, salary desc;

-- Show the top 5 highest-paid employees.
select emp_id, first_name from employees order by salary desc limit 5;

-- Display youngest employees first.
select emp_id, first_name from employees order by birth_date desc;

-- Sort employees by city name.
select emp_id, first_name from employees order by city;

-- Show active employees ordered by hire date.
select emp_id, first_name from employees where is_active= 'Y' order by hire_date;

-- Display employees ordered by country and city.
select emp_id, first_name from employees order by country, city;

-- Show all unique department names.
select distinct(department) from employees;

-- Display distinct cities.
select distinct(city) from employees;

-- Find all unique email domains.
select distinct substr(email, instr(email, '@')+1) from employees;

-- Show distinct job titles.
select distinct(job_title) from employees;

-- Display unique active status values.
select distinct(is_active) from employees;

-- Find distinct countries.
select distinct(country) from employees;

-- Show unique combinations of department and city.
select distinct department, city from employees;

-- Display distinct hire years.
select distinct(year(hire_date)) from employees;

-- Find distinct birth months.
select distinct(month(birth_date)) from employees;

-- Show all unique salary values.
select distinct(salary) from employees;

-- Find active IT employees earning more than 75,000.
select emp_id, first_name, is_active from employees WHERE department = 'IT'
  AND is_active = 'Y'
  AND salary > 75000;

-- Show employees whose email domain is Gmail.
select emp_id, first_name from employees where email like '%gmail.com';

-- List employees hired in 2020, ordered by salary descending.
select emp_id, first_name from employees where year(hire_date) = 2020 order by salary desc;

-- Find the average salary department-wise.
select department, avg(salary) from employees group by department;

-- Display top 3 highest-paid employees in the IT department.
select emp_id, first_name from employees where department = 'IT' limit 3;

-- Show employees whose first name contains the letter 'a'.
select emp_id, first_name from employees where first_name like '%a%';

-- Display employees born in the 1990s.
select emp_id, first_name from employees where YEAR(birth_date) BETWEEN 1990 AND 1999;

-- Show the highest-paid employee in each department.
select department, emp_id, first_name, max(salary) from employees group by department;

-- Find employees whose work anniversary is in the current month.
select emp_id, first_name from employees WHERE MONTH(hire_date) = MONTH(CURDATE()) ;

-- Find the second highest salary in the company.
SELECT DISTINCT salary
FROM employees
ORDER BY salary DESC
LIMIT 1,1;
use sakila;
CREATE TABLE employees (
    emp_id       INT            PRIMARY KEY,
    first_name   VARCHAR(50)    NOT NULL,
    last_name    VARCHAR(50)    NOT NULL,
    email        VARCHAR(100)   NOT NULL,
    department   VARCHAR(50),
    job_title    VARCHAR(60),
    salary       DECIMAL(10,2),
    hire_date    DATE,
    birth_date   DATE,
    phone        VARCHAR(20),
    city         VARCHAR(50),
    country      VARCHAR(50),
    is_active    CHAR(1)
);

INSERT INTO employees VALUES
(1,  'Alice',  'Smith',    'alice.smith@gmail.com', 'IT',        'Software Engineer',    85000.00,'2019-03-15','1990-06-20','555-1001','New York',     'USA','Y'),
(2,  'Bob',    'Johnson',  'bob.j@yahoo.com',       'HR',        'HR Manager',           72000.00,'2020-07-01','1985-11-05','555-1002','Chicago',      'USA','Y'),
(3,  'Carol',  'Williams', 'carol.w@gmail.com',     'Finance',   'Accountant',           65000.00,'2018-01-10','1992-03-14','555-1003','Houston',      'USA','Y'),
(4,  'David',  'Brown',    'david.b@outlook.com',   'IT',        'DevOps Engineer',      90000.00,'2021-05-20','1988-09-25','555-1004','Los Angeles',  'USA','Y'),
(5,  'Emma',   'Jones',    'emma.j@gmail.com',      'Marketing', 'Marketing Lead',       78000.00,'2017-11-30','1991-07-08','555-1005','Phoenix',      'USA','Y'),
(6,  'Frank',  'Garcia',   'frank.g@yahoo.com',     'Sales',     'Sales Representative', 55000.00,'2022-02-14','1994-02-28','555-1006','Philadelphia', 'USA','N'),
(7,  'Grace',  'Martinez', 'grace.m@gmail.com',     'IT',        'QA Engineer',          68000.00,'2020-09-01','1993-12-01','555-1007','San Antonio',  'USA','Y'),
(8,  'Henry',  'Davis',    'henry.d@outlook.com',   'Finance',   'Financial Analyst',    76000.00,'2019-06-15','1989-04-17','555-1008','San Diego',    'USA','Y'),
(9,  'Isla',   'Wilson',   'isla.w@gmail.com',      'HR',        'Recruiter',            60000.00,'2021-10-05','1995-08-22','555-1009','Dallas',       'USA','Y'),
(10, 'Jack',   'Moore',    'jack.m@yahoo.com',      'Marketing', 'SEO Specialist',       58000.00,'2023-01-09','1997-01-15','555-1010','San Jose',     'USA','Y'),
(11, 'Karen',  'Taylor',   'karen.t@gmail.com',     'Sales',     'Sales Manager',        82000.00,'2016-04-20','1984-05-30','555-1011','Austin',       'USA','Y'),
(12, 'Liam',   'Anderson', 'liam.a@outlook.com',    'IT',        'Data Scientist',       95000.00,'2020-11-15','1987-10-10','555-1012','Jacksonville', 'USA','Y'),
(13, 'Mia',    'Thomas',   'mia.t@gmail.com',       'Finance',   'Tax Consultant',       71000.00,'2022-06-01','1993-06-15','555-1013','Columbus',     'USA','Y'),
(14, 'Noah',   'Jackson',  'noah.j@yahoo.com',      'IT',        'System Admin',         80000.00,'2018-08-25','1990-02-14','555-1014','Charlotte',    'USA','N'),
(15, 'Olivia', 'White',    'olivia.w@gmail.com',    'HR',        'HR Assistant',         50000.00,'2023-03-20','1998-09-05','555-1015','Indianapolis', 'USA','Y'),
(16, 'Paul',   'Harris',   'paul.h@outlook.com',    'Marketing', 'Content Writer',       52000.00,'2021-07-10','1996-11-20','555-1016','San Francisco','USA','Y'),
(17, 'Quinn',  'Clark',    'quinn.c@gmail.com',     'Sales',     'Sales Representative', 56000.00,'2022-09-15','1995-04-11','555-1017','Seattle',      'USA','Y'),
(18, 'Rachel', 'Lewis',    'rachel.l@yahoo.com',    'Finance',   'Budget Analyst',       73000.00,'2019-12-01','1991-01-30','555-1018','Denver',       'USA','Y'),
(19, 'Sam',    'Robinson', 'sam.r@gmail.com',       'IT',        'Cloud Architect',     105000.00,'2017-05-22','1986-07-19','555-1019','Nashville',    'USA','Y'),
(20, 'Tina',   'Walker',   'tina.w@outlook.com',    'HR',        'Training Manager',     69000.00,'2020-03-08','1988-12-03','555-1020','Baltimore',    'USA','Y'),
(21, 'Uma',    'Hall',     'uma.h@gmail.com',       'Marketing', 'Brand Manager',        77000.00,'2018-10-17','1990-08-25','555-1021','Louisville',   'USA','N'),
(22, 'Victor', 'Young',    'victor.y@yahoo.com',    'Sales',     'Sales Director',       98000.00,'2015-02-10','1980-03-07','555-1022','Portland',     'USA','Y');

select * from employees;

-- 1. Find employees with salary between 65,000 and 85,000
SELECT emp_id, first_name, last_name, department, salary
FROM employees WHERE salary BETWEEN 65000 AND 85000;

-- 2. List employees in the IT or Finance department
SELECT emp_id, first_name, last_name, department, job_title
FROM employees WHERE department IN ('IT', 'Finance');

-- 3. Find employees whose last name ends with 'son'
SELECT emp_id, first_name, last_name, department
FROM employees WHERE last_name LIKE '%son';

-- 4. Find active employees (is_active = 'Y') in the IT department
SELECT emp_id, first_name, last_name, job_title, salary
FROM employees WHERE department = 'IT' AND is_active = 'Y';

-- 5. Display first_name in UPPERCASE and last_name in lowercase for Finance employees
SELECT emp_id, UPPER(first_name) AS first_name_upper, LOWER(last_name) AS last_name_lower, salary
FROM employees WHERE department = 'Finance';

-- 6. Find employees whose first name has more than 4 characters
SELECT emp_id, first_name, LENGTH(first_name) AS name_length, department
FROM employees WHERE first_name LIKE '_____%';

-- 7. Show full name and its character length for Marketing employees
select emp_id, concat(first_name, ' ', last_name) as full_name, char_length(concat(first_name, ' ', last_name))
as full_name_length , department from employees where department = 'Marketing';

-- 8. Display hire year and years-ago for each Finance employee
select emp_id, first_name, last_name, hire_date, extract(year from hire_date) as hire_year, 
year(now()) - year(hire_date) as years_ago
from employees where department = 'Finance';

-- 9. Show each IT employee salary rounded to nearest 10,000 and its remainder
SELECT emp_id, first_name, last_name, salary,
ROUND(salary, -4) AS rounded_salary,
MOD(salary, 10000) AS salary_remainder
FROM employees WHERE department = 'IT';

-- 10. Find employees using an Outlook email address
select emp_id, first_name, last_name, email 
from employees where email like '%@outlook.com';

-- 11. Find employees hired more than 2,000 days ago (from April 28, 2026)
select emp_id, first_name, last_name, hire_Date, DATEDIFF('2026-04-28', hire_date) AS days_employed
from employees WHERE DATEDIFF('2026-04-28', hire_date) > 2000;

-- 12. Extract the email username (part before '@') for all HR employees
select emp_id, first_name, last_name, email, LEFT(email, INSTR(email, '@') - 1) AS username 
from employees WHERE department = 'HR';

-- 13. Find non-IT/Finance employees with salary outside the 60,000–80,000 range
select concat(first_name, ' ', last_name) as full_name, department, salary from employees 
where department NOT IN ('IT', 'Finance')
AND salary NOT BETWEEN 60000 AND 80000 ;

-- 14. Extract and uppercase the email username; show only those with username length > 6 characters
select emp_id, first_name, last_name , email, upper(LEFT(email, INSTR(email, '@') - 1)) as username_upper,
char_length(upper(LEFT(email, INSTR(email, '@') - 1))) as username_length
from employees where char_length(upper(LEFT(email, INSTR(email, '@') - 1))) > 6 ;

-- 15. Find active employees aged 30–38 (from birth_date) earning more than 65,000
select emp_id, concat(first_name, ' ', last_name) as full_name, birth_date, 
timestampdiff(year, birth_date, now()) as age ,  salary, department 
from employees where is_Active = 'Y' and timestampdiff(year, birth_date, now()) between 30 and 38 and 
salary > 65000 ;


-- more practice questions
-- Find all employees who work in IT department.
select * from employees where department = 'IT';

-- Show employees whose salary is greater than 80,000.
select emp_id, first_name, last_name, salary from employees where salary >80000;

-- Find employees who are active (is_active = 'Y').
select emp_id, first_name, last_name from employees where is_active = 'Y';

-- List employees who live in New York or Chicago.
select emp_id, first_name, last_name from employees where city in ('new york', 'chicago');

-- Show employees from Sales department with salary < 60000.
select emp_id, first_name, last_name from employees where department = 'Sales' and salary < 60000;

-- Find employees whose job title is 'Sales Representative'.
select emp_id, first_name, last_name from employees where job_title = 'sales representative';

-- Show employees hired after 2020-01-01.
select emp_id, first_name, last_name  from employees where hire_date > '2020-01-01';

-- Find employees not working in HR department.
select emp_id, first_name, last_name from employees where department != 'HR';

-- Display full name using first_name + last_name.
select concat_ws(' ', first_name, last_name) as full_name from employees;
 
-- Show emails in uppercase.
select upper(email) from employees;

-- Extract first 3 characters of first_name.
select left(first_name, 3) from employees;

-- Find length of last_name.
select char_length(last_name) from employees;

-- Replace domain "@gmail.com" with "@company.com".
select replace(email, '@gmail.com', '@company.com') from employees;

-- Extract username from email (before @).
select left(email, instr(email, '@') -1) from employees;

-- Convert city names into lowercase.
select lower(city) from employees;

-- Find employees whose first_name starts with 'A' or 'J'.
select first_name from employees where first_name like 'a%' or first_name like 'J%';

-- Show employees with hire year only.
SELECT emp_id, first_name, YEAR(hire_date) AS hire_year  FROM employees;

-- Calculate age of employees from birth_date.
SELECT emp_id, first_name,
TIMESTAMPDIFF(YEAR, birth_date, now()) AS age
FROM employees;

-- Find employees hired in the year 2022.
select emp_id, hire_date from employees where year(hire_date) = 2022;

-- Show number of years an employee has worked in company.
SELECT emp_id, first_name,
TIMESTAMPDIFF(YEAR, hire_date, CURDATE()) AS years_worked
FROM employees;

-- Find employees whose birthday is in March.
SELECT emp_id, first_name, birth_date
FROM employees
WHERE MONTH(birth_date) = 3;

-- Display current date minus hire_date (experience days).
SELECT emp_id, first_name,
TIMESTAMPDIFF(DAY, hire_date, CURDATE()) AS experience_days
FROM employees;

-- Show employees older than 30 years.
SELECT emp_id, first_name, birth_date,
TIMESTAMPDIFF(YEAR, birth_date, CURDATE()) AS age
FROM employees
WHERE TIMESTAMPDIFF(YEAR, birth_date, CURDATE()) > 30;

-- Round all salaries to nearest integer.
select round(salary) from employees;

-- Show salary after adding 10% bonus.
select salary+(salary*10/100) from employees;

-- Find highest salary.
select max(salary) from employees;

-- Find lowest salary.
select min(salary) from employees;

-- Calculate average salary of IT department.
select avg(salary) from employees where department = 'IT';

-- Find total salary of all employees.
select sum(salary) from employees;

-- Show salary difference between highest and lowest salary.
select max(salary)- min(salary) as salary_diff from employees;

-- Display salary in thousands (salary / 1000).
select salary, round(salary/1000, 2) from employees;

-- Show full name + email + department of active IT employees.
select concat(first_name, ' ', last_name) as full_name , email, department from employees 
where department = 'IT' and is_active = 'Y';

-- Find employees whose salary is between 60,000 and 90,000.
select emp_id, first_name , salary from employees where salary between 60000 and 90000;

-- Show employees whose name length > 5 and salary > 70000.
select emp_id, first_name, char_length(first_name) , salary from employees 
where char_length(first_name)>5 and salary >70000;

-- Find employees hired before 2020 and still active.
select emp_id, first_name, hire_date from employees 
where year(hire_date) < 2020 and is_active = 'Y';

-- Show full name and email of employees whose first_name starts with 'A' or 'M' and are active.
select concat_ws(' ', first_name, last_name), email from employees where (first_name like 'A%'
or first_name like 'M%') and is_active = 'Y';

-- Find employees whose city contains 'San' and salary > 60000.
select emp_id, first_name, city from employees where city like '%san%' and salary > 60000;

-- Display employees whose email ends with 'gmail.com' and department is IT or HR.
select emp_id, first_name, email, department from employees where
email like '%gmail.com' and (department = 'IT' or department = 'HR');

-- Show employees whose last_name length > 6 and are in Sales department.
select emp_id, first_name, last_name from employees where char_length(last_name) > 6 and department = 'Sales';

-- Find employees hired after 2019 and still active.
select emp_id, first_name, last_name, hire_date from employees where year(hire_date) >2019 and 
is_active = 'Y';

-- Show employees whose birthday month is 6 or 12 and salary > 70000.
select emp_id, first_name, last_name, birth_date from employees where 
(month(birth_date) = '06' or month(birth_date) = '12') and salary > 70000;

-- Find employees who joined in last 3 years and work in IT.
select emp_id, first_name, last_name from employees where hire_date >= date_sub(current_Date(), interval 3 year)
and department = 'IT';

-- Display employees whose age is greater than 30 AND salary > 75000.
select emp_id, first_name, last_name, timestampdiff(year, birth_date, now()) from employees 
where timestampdiff(year, birth_date, now()) > 30 and salary>  75000;

-- Find employees whose salary is between 50000 and 80000 and department is Marketing or Finance.
select emp_id, first_name, last_name from employees where salary between 50000 and 80000 and 
department in ('Marketing', 'Finance') ;

-- Show employees whose salary after 10% bonus becomes > 90000.
select emp_id, first_name, last_name, salary+(salary*10/100) as salary_bonus
from employees where salary+(salary*10/100) > 90000 ;

-- Find employees whose salary is not between 60000 and 90000.
select emp_id, first_name, last_name, salary from employees where salary not between 60000 and 90000;

-- Show employees whose name starts with 'J' or 'S', hired after 2020, and salary > 60000.
select emp_id, first_name, last_name  from employees where (first_name like 'J%' or first_name like 'S%') and
year(hire_date) >2020 and salary > 60000;

-- Find employees whose email contains 'yahoo', joined before 2022, and are active.
select emp_id, first_name, last_name, email from employees 
where email like '%yahoo%' and year(hire_date)<2022 and is_active = 'Y';

-- Display employees whose first_name length > 5, age < 35, and salary > 70000.
select emp_id, first_name, last_name from employees
where char_length(first_name)> 5 and 
timestampdiff(year, birth_date, now()) <35 and
salary > 70000;

-- Find employees whose: city contains 'o' hired before 2021
select emp_id, first_name, last_name from employees where city like '%o%' and year(hire_date) <2021;

-- Show employees whose: age > 30 department is not HR salary increased after 10% bonus is > 80000
select emp_id, first_name, last_name, salary from employees
where timestampdiff(year, birth_date, now()) > 30
and department != 'HR' and
salary+(salary*10/100) > 80000;

-- Find employees whose: email domain is gmail salary > 60000 experience > 3 years
select emp_id, first_name, last_name, salary from employees
where email like '%gmail%' and 
salary >60000 and 
timestampdiff(year, hire_date, now())>3;
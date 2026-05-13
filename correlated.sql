use shadidb;
-- Create Table
CREATE TABLE Employees (
EMP_ID INT PRIMARY KEY,
NAME VARCHAR(50),
DEPARTMENT VARCHAR(50),
SALARY INT,
MANAGER_ID INT);

-- Insert Data
INSERT INTO Employees (EMP_ID, NAME, DEPARTMENT, SALARY, MANAGER_ID) VALUES
(101, 'Alice', 'HR', 50000, NULL),
(102, 'Bob', 'IT', 80000, 101),
(103, 'Charlie', 'IT', 75000, 101),
(104, 'Diana', 'Finance', 90000, NULL),
(105, 'Eve', 'HR', 48000, 101),
(106, 'Frank', 'Finance', 95000, 104),
(107, 'Grace', 'IT', 82000, 101);

select * from Employees;
SELECT NAME, SALARY FROM EMPLOYEES WHERE SALARY > 74285.71;
select avg(salary) from employees;

SELECT * FROM EMPLOYEES WHERE SALARY > (select avg(salary) from employees);

SELECT * FROM EMPLOYEES WHERE SALARY = (select max(salary) from employees);

-- find employee who earn more than the alice
select * from employees;
select salary from employees where emp_id = 101;
select * from employees where salary > (select salary from employees where emp_id = 101);

-- Find the department of the lowest-paid employee
select min(salary) from employees;
select * from employees where salary = 48000;
select * from employees where salary = (select min(salary) from employees);

-- multi row subquery: return more than one row but one column

select salary from employees where name = 'Alice' or name = 'Bob';
select * from employees where salary = 50000 or salary = 80000;
select * from employees where department ='Marketing' or department ='HR';

select * from employees where department 
in (select department from employees where name = 'Alice' or name = 'Bob');

-- find those employees jinki salary 103, 105 k equal ni ho 

select salary from employees where emp_id = 103 or emp_id = 105;

select * from employees where salary not in (
select salary from employees where emp_id = 103 or emp_id = 105);


-- any operator:  use when it is atleast, min
-- find employees whose salary is salary >103 salary> 107
select * from employees where salary >any (
select salary from employees where emp_id= 103 or emp_id =107);

select * from employees where salary <any (
select salary from employees where emp_id= 103 or emp_id =107);

-- Find all employees who work in the IT or Finance department (using IN)
SELECT NAME, DEPARTMENT
FROM EMPLOYEES
WHERE DEPARTMENT IN (SELECT DEPARTMENT FROM EMPLOYEES
GROUP BY DEPARTMENT
HAVING AVG(SALARY) > 70000);

-- Find employees who earn more than at least one HR employee (using ANY)
SELECT *
FROM EMPLOYEES
WHERE SALARY > ANY (SELECT SALARY FROM EMPLOYEES WHERE DEPARTMENT ='HR');

-- all 
SELECT *
FROM EMPLOYEES
WHERE SALARY > All (SELECT SALARY FROM EMPLOYEES WHERE DEPARTMENT ='HR');

SELECT *
FROM EMPLOYEES
WHERE SALARY > All (SELECT SALARY FROM EMPLOYEES WHERE DEPARTMENT ='IT');

select * from employees;
-- find the employees detail who works in IT departement and have salary > salary of emp_id = 101
select * from employees where department = 'IT' and salary > 
( select salary from employees where emp_id = 101);

-- find the name of person whose salary is greater than all the salaries of HR or IT
select salary from employees where department ='HR' or department = 'IT';
select *  from employees where salary > all
(select salary from employees where department ='HR' or department = 'IT');

-- find the emp_id and emp_name of the users whose salary is greater than the salary of any employee working
-- under manager id 101
select emp_id, name  from employees where salary > any
(select salary from employees where manager_id = 101);

-- find second highest salary from this table 
select max(salary) from employees where salary <(
select max(salary) from employees);

use shadidb;
select * from employees;  -- pk emp_id, fk department

create table departments(dept_id int, dept_name varchar(20), location varchar(20));
insert into departments values(10, 'HR', 'Mumbai'), (20, 'IT', 'Banglore'), (30, 'Finance', 'Delhi');

select * from departments;  -- pk dept_id

select dept_name from departments where location in('Banglore', 'Delhi');
select * from employees where department in('It', 'Finance');
select * from employees where department = any
 (select dept_name from departments where location in('Banglore', 'Delhi'));

-- correlated subquery : is a type of subquery where the inner query is executed for each value of the outer query 
-- inner query also refer to the column of outer query 
-- it is dependent query also 
select avg(salary) from employees;

-- select * from table where salary( select avg(salary) from table where department = outer(department)
select * from employees where department = 'IT' and
salary > ( select avg(salary) from employees where department = 'IT');

select * from employees as e where 
salary > ( select avg(salary) from employees where department = e.department);

-- find those data of employees who have the highest salary as of their own department 
select * from employees;
select * from employees as e where 
salary = ( select max(salary) from employees where department = e.department);

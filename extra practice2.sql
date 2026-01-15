create database example;
use example;
create table employees (emp_id int, 
						emp_name varchar(20),
                        department varchar(20),
                        gender varchar(20),
                        salary int, 
                        city varchar(20),
                        age int, 
                        joining_year int
                        );

INSERT INTO employees VALUES
(1, 'Amit', 'IT', 'Male', 50000, 'Delhi', 28, 2020),
(2, 'Neha', 'HR', 'Female', 35000, 'Jaipur', 26, 2021),
(3, 'Rahul', 'IT', 'Male', 60000, 'Delhi', 32, 2019),
(4, 'Pooja', 'Finance', 'Female', 45000, 'Mumbai', 29, 2022),
(5, 'Ankit', 'HR', 'Male', 30000, 'Jaipur', 25, 2020),
(6, 'Sneha', 'IT', 'Female', 70000, 'Bangalore', 34, 2018),
(7, 'Vikas', 'Finance', 'Male', 55000, 'Delhi', 31, 2019),
(8, 'Riya', 'IT', 'Female', 40000, 'Mumbai', 27, 2021),
(9, 'Karan', 'HR', 'Male', 38000, 'Delhi', 28, 2022),
(10, 'Meena', 'Finance', 'Female', 48000, 'Jaipur', 30, 2020);

-- practice questions: 

-- Display the total salary for each department where the total salary is greater than 100000.
select department, sum(salary) from employees group by department having sum(salary) > 100000;

-- Show the list of employees who belong to Delhi or Jaipur and earn more than 35000. Display the result in 
-- descending order of salary.
select emp_name , city, salary from employees where city = 'Delhi' or city = 'Jaipur'
and salary > 35000 order by salary desc;

-- Find the number of employees in each city and display only those cities having more than 2 employees.
select city, count(emp_name) from employees group by city having count(emp_name) >2;

-- Display the employee details who has the highest salary.
select * from employees order by salary desc limit 1;

-- Find the average salary of each department and display only those departments where the 
-- average salary is more than 40000.
select department, avg(salary) from employees group by department having avg(salary) > 40000 ;

-- Display the details of the 3 youngest employees.
select * from employees order by age asc limit 3;

-- Count the total number of employees who joined after the year 2020.
select count(emp_name) from employees where joining_year  > 2020;

-- Display the maximum salary in each department and sort the result by maximum salary in ascending order.
select department, max(salary) from employees group by department order by max(salary) asc;

-- Display the top 2 highest-paid female employees who are not from Mumbai.
select  emp_name, salary from employees where gender = 'female' and city <> 'mumbai' order by salary limit 2;

-- Find the average age of employees in each city and display only those cities where the average age is less than 30.
select city, avg(age) from employees group by city having avg(age) <30;

-- Display the count of employees in each department and sort the result in descending order of count.
select department, count(emp_name) from employees group by department order by count(emp_name) desc;

-- Display the name and joining year of the employee who joined the company first.
select emp_name, joining_year from employees order by joining_year limit 1;

-- Display total salary for each city and show only those cities where the total salary is less than 150000.
select city, sum(salary) from employees group by city having sum(salary) <  150000;

-- Display employee names whose name length is greater than 4.
select emp_name  , char_length(emp_name) from employees  where char_length(emp_name) > 4;
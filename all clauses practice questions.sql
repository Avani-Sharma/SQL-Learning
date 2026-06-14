use company_db;

create table employees(
              emp_id int primary key,
              emp_name varchar(30),
              department varchar(10),
              salary int ,
              city varchar(10),
              experience int
          );
          
insert into employees values
(101, 'Amit',   'IT',      70000, 'Delhi',     5),
(102, 'Neha',   'HR',      50000, 'Mumbai',    3),
(103, 'Raj',    'IT',      80000, 'Delhi',     6),
(104, 'Priya',  'Finance', 60000, 'Pune',      4),
(105, 'Karan',  'IT',      75000, 'Mumbai',    5),
(106, 'Simran', 'HR',      55000, 'Delhi',     2),
(107, 'Mohit',  'Finance', 65000, 'Pune',      7),
(108, 'Anjali', 'IT',      90000, 'Bangalore', 8),
(109, 'Ravi',   'HR',      52000, 'Mumbai',    3),
(110, 'Pooja',  'Finance', 70000, 'Delhi',     6),
(111, 'Arjun',  'IT',      85000, 'Bangalore', 7),
(112, 'Sneha',  'HR',      58000, 'Pune',      4);

-- Find all departments that have more than 3 employees. Display the department name and total number of employees.
select department, count(emp_id) as total_emp from employees
group by department 
having count(emp_id)>3;

-- Find departments whose average salary is greater than 70000. Display department and average salary.
select department , avg(salary) as avg_salary from employees
group by department
having avg(salary) >70000;

-- Find cities where at least 3 employees work. Display city and employee count.
select city , count(emp_id) as emp_count from employees
group by city
having count(emp_id)>=3;

-- Find departments whose maximum salary is greater than 85000. Display department and highest salary.
select department, max(salary) as highest_salary from employees
group by department
having max(salary) >85000;

-- Find departments whose minimum salary is at least 55000. Display department and minimum salary.
select department, min(Salary) as min_salary from employees 
group by department
having min(salary) >= 55000;

-- Find cities where the total salary paid to employees exceeds 200000. Display city and total salary.
select city, sum(salary) as total_salary from employees
group by city
having sum(salary) >200000;

-- Find departments having an average experience greater than 5 years. Display department and average experience.
select department , avg(experience) as avg_experience from employees
group by department
having avg(experience) >5;

-- Find cities that contain employees from more than one department. Display city and number of distinct departments.
select city , count(distinct department) as distinct_dept from employees
group by city
having count(distinct department)>1;

-- Find departments where the difference between highest and lowest salary is greater than 20000. 
-- Display department and salary difference.
select department , max(salary) -min(salary) as salary_diff from employees
group by department 
having max(salary) -min(salary) >20000;

-- Find departments having exactly 3 employees. Display department and employee count.
select department, count(emp_id) as employee_count from employees
group by department 
having count(emp_id) =3;

-- Find cities whose average salary is less than 65000. Display city and average salary.
select city, avg(salary) as avg_salary from employees
group by city
having avg(salary) <65000;
 
-- Find departments where the total experience of employees is greater than 20 years. 
-- Display department and total experience.
select department , sum(experience) as total_exp from employees
group by department
having sum(experience) >20;

-- Find cities where the highest salary is at least 80000. Display city and highest salary.
select city, max(salary) as max_salary from employees
group by city
having max(salary) >=80000;

-- Find departments having more than one employee with salary above 70000. Display department and 
-- count of such employees.
select department , count(emp_id) as emp_count from employees
where salary >70000
group by department
having count(emp_id)>1; 

-- Find cities where the minimum experience is greater than 2 years. Display city and minimum experience.
select city, min(experience) as exp_min from employees
group by city
having min(experience) >2;

-- Find departments whose average salary lies between 60000 and 80000. Display department and average salary.
select department , avg(salary) as avg_salary from employees
group by department 
having avg(salary) between 60000 and 80000;

-- Find cities where the total number of employees is an even number. Display city and employee count.
select city, count(emp_id) as emp_count from employees
group by city
having count(emp_id)%2=0 ;

-- Find departments whose total salary exceeds 250000. Display department and total salary.
select department, sum(salary) as total_salary from employees
group by department 
having sum(salary) >250000;

-- Find departments where the average experience is equal to or greater than 6 years. Display 
-- department and average experience
select department, avg(experience) as avg_exp from employees
group by department
having avg(Experience) >=6;

-- Find cities that have exactly 2 employees. Display city and employee count.
select city, count(emp_id) as emp_count from employees
group by city 
having count(emp_id) =2;

-- Find the top 2 departments with the highest average salary among departments
-- that have at least 2 employees earning more than 60000.
select department, avg(salary) as avg_salary from employees
where salary > 60000
group by department 
having count(emp_id) >=2
order by avg(salary) desc
limit 2;

-- Find the top 3 cities with the highest total salary where employees have at least 3 years of experience 
-- and the city has more than 2 such employees.
select city , sum(salary) as total_salary from employees
where experience >=3
group by city
having count(city)>2
order by sum(salary) desc
limit 3;

-- Find the 2 departments with the lowest average experience among departments 
-- where all considered employees have salary greater 
-- than 50000 and the department has at least 2 employees.
select department, avg(experience) from employees 
where salary >50000
group by department
having count(emp_id) >=2
order by avg(experience) 
limit 2;

-- Find the top 3 cities with the highest number of employees whose salary is at least 55000. 
-- Only include cities having more than 1 such employee.
select city , count(emp_id) from employees
where salary >= 55000
group by city
having count(emp_id)>1
order by count(emp_id) desc
limit 3;

-- Find the department with the highest total salary among departments where 
-- employees have at least 4 years of experience
--  and the department has more than 2 such employees.
select department, sum(salary) from employees 
where experience >=4
group by department 
having count(emp_id) >2
order by sum(salary) desc
limit 1;

-- Find the top 2 cities with the lowest average salary where employees have more than 2 years of 
-- experience and the city has at least 2 such employees.
select city, avg(salary) from employees
where experience >2
group by city
having  count(emp_id) >2
order by avg(salary)
limit 2;

-- Find the top 3 departments with the highest maximum salary among departments where employees earn more than
--  50000 and the department has at least 2 such employees.
select department, max(salary) from employees
where salary > 50000 
group by department 
having count(emp_id) >2
order by max(salary) desc
limit 3;

-- Find the 2 cities with the highest average experience where employees 
-- earn at least 55000 and the city has more than 1 such employee.
select city, avg(experience) from employees
where salary >= 55000 
group by city having count(emp_id) >1
order by avg(experience) desc
limit 2;

-- Find the top 3 departments with the lowest minimum salary among departments where employees 
-- have at least 3 years of experience and the department has more than 1 such employee.
select department, min(salary) from employees
where experience >= 3
group by department having count(emp_id) >1
order by min(salary)
limit 3;

-- Find the city with the highest total experience among cities
--  where employees earn more than 50000 and the city has at least 2 such employees.
select city, sum(experience) from employees
where salary > 50000 
group by city having count(emp_id) >=2
order by sum(experience) desc
limit 1;
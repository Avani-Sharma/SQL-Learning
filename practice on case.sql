-- case: 
/*
if (condition , true, false)
if (conditon, true , if (condition, true, if)

case:
   when condition | expression then output 
   when condition, then output
   end 
   True --> 1 
   False --> 0
*/
use sakila;
select * from employees;
select first_name , department, salary, if (department = 'IT' , True, False) from employees;
select first_name, department, salary, if(department= 'IT', salary*1.5, salary*1.05) from employees;

select first_name, department, salary, 
if(department = 'IT', salary*1.1, if(department= 'Hr', salary*0.5, salary)) from employees;

-- case statement
/* 
select col1, col2
case
    when condition then statement
end 
from table_name
*/

select first_name, department, salary, 
case 
    when department = 'IT' then True
    else False
end
from employees;


select first_name, department, salary, 
case 
    when department = 'IT' or department = 'HR'  then 'A category'
    else 'B category'
end
from employees;

select first_name, department, salary, 
case 
    when department = 'IT' then salary*1.1
    when department = 'IT' then salary*1.05
    else salary
end as 'New salary'
from employees;

select * from employees;
-- if the hiring date of an employee is before 2020 year print job_title with senior if 2021 print associate
select first_name, job_title, year(hire_date),
case
    when year(hire_date) <2020  then CONCAT('senior ', job_title)
    when year(hire_date) = 2021 then CONCAT('associate ', job_title)
    else job_title
end as title
from employees;

-- if salary >70000, create the category name as avg salary if the salary is > 85000 high salary 
-- if salary >100000 then extreme high salary othewise print the category name as low salary
SELECT first_name, salary,
CASE
    WHEN salary > 100000 THEN 'extreme high salary'
    WHEN salary > 85000 THEN 'high salary'
    WHEN salary > 70000 THEN 'avg salary'
    ELSE 'low salary'
END AS update_slry
FROM employees;

-- select the job_title and print the column value based on the following cond 
SELECT job_title,
       CASE 
           WHEN COUNT(*) = 1 THEN CONCAT(job_title, ' has 1 person')
           ELSE CONCAT(job_title, ' has ', COUNT(*), ' persons')
       END AS job_info
FROM employees
GROUP BY job_title;

use world;

select * from country;

select name, population, 
case
   when population = 0 then 'no population'
   when population between 8000 and 70000 then 'med population'
   else 'condition is false'
end from world .country;


select name, population, 
case
   when population = 0 then 'no population'
   when population between 8000 and 70000 then 'med population'
   else 'condition is false'
end as 'status' from world.country;


-- case + group by 
select count(*),
case
   when population = 0 then 'no population'
   when population between 8000 and 70000 then 'med population'
   else 'condition is false'
end as 'status' from world.country
group by status;


-- how many countries which have population 8000 and 70000
-- by using count 
select continent , 
count(case 
    when population between 8000 and 70000 then 1
    else 0 
    end )
from world.country
group by continent;

-- by using sum
select continent , 
sum(case 
    when population between 8000 and 70000 then 1
    else 0 
    end )
from world.country
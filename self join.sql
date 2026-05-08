use regex;
CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100) NOT NULL,
    job_title VARCHAR(100),
    manager_id INT,
    salary DECIMAL(10,2),
    FOREIGN KEY (manager_id) REFERENCES employee(emp_id)
);
INSERT INTO employee (emp_id, emp_name, job_title, manager_id, salary) VALUES
(1, 'Alice', 'CEO', NULL, 120000),
(2, 'Bob', 'CTO', 1, 95000),
(3, 'Carol', 'CFO', 1, 90000),
(4, 'David', 'HR Manager', 1, 85000),
(5, 'Eve', 'Tech Lead', 2, 75000),
(6, 'Frank', 'Senior Developer', 2, 72000),
(7, 'Grace', 'Senior Developer', 2, 71000),
(8, 'Heidi', 'Developer', 5, 60000),
(9, 'Ivan', 'Developer', 5, 58000),
(10, 'Judy', 'Developer', 6, 59000),
(11, 'Mallory', 'Accountant', 3, 65000),
(12, 'Niaj', 'Financial Analyst', 3, 62000),
(13, 'Olivia', 'HR Executive', 4, 55000),
(14, 'Peggy', 'HR Executive', 4, 54000),
(15, 'Sybil', 'Intern', 8, 35000);

select * from employee;

-- in terms of employee
select emp.emp_id, emp.emp_name, emp.manager_id from employee as emp;

-- in reference of manager
select manager.emp_id, manager.emp_name from employee as manager;

-- self join
select emp.emp_id, emp.emp_name, emp.manager_id, manager.emp_id, manager.emp_name from employee as emp
join employee as manager
where emp.manager_id = manager.emp_id;


select emp.emp_id, emp.emp_name, emp.manager_id, emp.salary, manager.emp_id, manager.emp_name , manager.salary
from employee as emp join employee as manager
where emp.manager_id = manager.emp_id;


-- Self join: a table when joined with itself 
create database joindb;

use joindb;

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    manager_id INT,
    salary INT
);

INSERT INTO employees (emp_id, emp_name, department, manager_id, salary) VALUES
(1, 'Amit', 'Management', NULL, 120000),
(2, 'Neha', 'HR', 1, 75000),
(3, 'Raj', 'IT', 1, 90000),
(4, 'Simran', 'Finance', 1, 85000),
(5, 'Karan', 'IT', 3, 70000),
(6, 'Priya', 'IT', 3, 72000),
(7, 'Rohit', 'HR', 2, 50000),
(8, 'Anjali', 'HR', 2, 52000),
(9, 'Vikas', 'Finance', 4, 65000),
(10, 'Sneha', 'Finance', 4, 62000),
(11, 'Arjun', 'IT', 5, 55000),
(12, 'Pooja', 'IT', 5, 53000),
(13, 'Meera', 'HR', 7, 45000),
(14, 'Dev', 'Finance', 9, 48000),
(15, 'Nitin', 'IT', 6, 51000);



/*

Amit
 ├── Neha
 │    ├── Rohit
 │    │     └── Meera
 │    └── Anjali
 │
 ├── Raj
 │    ├── Karan
 │    │     ├── Arjun
 │    │     └── Pooja
 │    └── Priya
 │           └── Nitin
 │
 └── Simran
      ├── Vikas
      │     └── Dev
      └── Sneha

*/

select * from employees;

select empl.emp_id, empl.emp_name, empl.manager_id , mngr.emp_id, mngr.emp_name 
from employees as empl
join employees as mngr
where empl.manager_id = mngr.emp_id;

-- find that employees has whose department is same as of the manager
select e.emp_id, e.emp_name, e.manager_id, e.department, m.emp_id, m.emp_name, m.department
from employees as e join employees as m
where e.manager_id = m.emp_id and e.department = m.department;

-- find the employees name an its salary if it is greater than the salary manager
select e.emp_id, e.emp_name, e.manager_id, m.emp_id, m.emp_name, e.salary, m.salary
from employees as e join employees as m
where e.manager_id = m.emp_id and e.salary > m.salary;

-- show all employee name with all the managers name
select e.emp_id, e.emp_name, m.emp_id, m.emp_name
from employees as e join employees as m
where e.manager_id = m.emp_id;

-- show employee and its grandmanager -------- employee, manager, grandmanager
select 
    e.emp_name as employee,
    m.emp_name as manager,
    g.emp_name as grandmanager
from employees as e
join employees as m
on e.manager_id = m.emp_id
join employees as g
on m.manager_id = g.emp_id;

-- find employees who are also managers -------- emp_id , emp_name
select distinct
    e.emp_id,
    e.emp_name
from employees as e
join employees as m
on e.emp_id = m.manager_id;
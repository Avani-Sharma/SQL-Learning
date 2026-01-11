create database company;
use  company;
CREATE TABLE Departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

INSERT INTO Departments VALUES
(10, 'HR'),
(20, 'IT'),
(30, 'Finance'),
(40, 'Sales');

CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    dept_id INT,
    salary INT,
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);

INSERT INTO Employees VALUES
(1, 'Amit', 10, 50000),
(2, 'Neha', 20, 60000),
(3, 'Ravi', 10, 55000),
(4, 'Simran', 30, 70000),
(5, 'Karan', NULL, 40000);

SELECT * FROM Employees;
SELECT * FROM Departments;

-- ques1. Show employee name with their department name
select e.name , d.dept_name from departments as d join employees as e on e.dept_id = d.dept_id;

-- ques2. Display only employees who belong to a department
select e.name , e.dept_id from departments as d join employees as e on e.dept_id = d.dept_id
where e.dept_id = d.dept_id;

-- ques3. Show all employees even if they are not assigned to any department
SELECT e.name, d.dept_name FROM Employees as e LEFT JOIN Departments as d ON e.dept_id = d.dept_id;

-- ques4. List all departments even if no employee works there
SELECT d.dept_name, e.name FROM Departments as d LEFT JOIN Employees as e ON e.dept_id = d.dept_id;
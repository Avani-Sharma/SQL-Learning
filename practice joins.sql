create database joinpractice;

use joinpractice;


CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary INT,
    dept_id INT,
    manager_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);



INSERT INTO departments VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Finance'),
(4, 'Sales');



INSERT INTO employees VALUES
(101, 'Alice', 70000, 1, NULL),
(102, 'Bob', 60000, 2, 101),
(103, 'Charlie', 55000, 2, 102),
(104, 'David', 50000, 3, 101),
(105, 'Eva', 45000, 4, 104),
(106, 'Frank', 75000, 1, 101),
(107, 'Grace', 80000, 2, 102),
(108, 'Helen', 62000, 3, 104),
(109, 'Ian', 47000, 4, 105),
(110, 'Jack', 53000, 2, 102),
(111, 'Kevin', 49000, 3, 104),
(112, 'Laura', 72000, 1, 101),
(113, 'Mike', 58000, 4, 105),
(114, 'Nina', 61000, 2, 107),
(115, 'Oscar', 52000, NULL, 101);


/*
Display employee names along with their department names.
| emp_name | dept_name |
| -------- | --------- |
| Alice    | HR        |
| Bob      | IT        |
| Charlie  | IT        |
| David    | Finance   |
| Eva      | Sales     |
| Frank    | HR        |
| Grace    | IT        |
| Helen    | Finance   |
| Ian      | Sales     |
| Jack     | IT        |
| Kevin    | Finance   |
| Laura    | HR        |
| Mike     | Sales     |
| Nina     | IT        |
*/
select * from departments;
select * from employees;

select e.emp_name, d.dept_name 
from employees as e 
inner join departments as d
on e.dept_id = d.dept_id
order by e.emp_name;

  
/*
Display all employees and their department names, including employees without departments.
| emp_name | dept_name |
| -------- | --------- |
| Alice    | HR        |
| Bob      | IT        |
| Charlie  | IT        |
| David    | Finance   |
| Eva      | Sales     |
| Frank    | HR        |
| Grace    | IT        |
| Helen    | Finance   |
| Ian      | Sales     |
| Jack     | IT        |
| Kevin    | Finance   |
| Laura    | HR        |
| Mike     | Sales     |
| Nina     | IT        |
| Oscar    | NULL      |
*/
select e.emp_name, d.dept_name 
from employees as e 
left join departments as d
on e.dept_id = d.dept_id
order by emp_name;



/*
Find the number of employees in each department.
| dept_name | total_employees |
| --------- | --------------- |
| HR        | 3               |
| IT        | 5               |
| Finance   | 3               |
| Sales     | 3               |

*/
select d.dept_name , count(e.emp_id)
from employees as e 
inner join departments as d
on e.dept_id = d.dept_id
group by d.dept_name;


/*
Display all departments and the total salary paid in each department.
| dept_name | total_salary |
| --------- | ------------ |
| HR        | 217000       |
| IT        | 309000       |
| Finance   | 161000       |
| Sales     | 150000       |
*/
select d.dept_name , sum(e.salary)
from employees as e 
 join departments as d
on e.dept_id = d.dept_id
group by d.dept_name;

/*
Find how many employees report to each manager.
| manager | team_size |
| ------- | --------- |
| Alice   | 5         |
| Bob     | 4         |
| David   | 4         |
| Eva     | 2         |
| Grace   | 1         |
*/
select m.emp_name , count(*)
from employees as e
join employees as m
on e.manager_id = m.emp_id
group by m.emp_name;
/*
Display average salary department-wise where average salary is greater than 60000.
| dept_name | avg_salary |
| --------- | ---------- |
| HR        | 72333.33   |
| IT        | 61800      |
*/

select d.dept_name , avg(e.salary)
from employees as e 
left join departments as d
on e.dept_id = d.dept_id
group by d.dept_name
having avg(e.salary)>60000
order by d.dept_name;


use sakila;
select * from actor;  -- actor_id pk, first_name, last_name, last_update
select * from film_actor;   -- actor_id pk, film_id pk, last_update
select * from film;   -- film_id pk, title, description, release_year, lang_id, 

-- 1. select actor_id, actor_full name, film_id 
select a.actor_id, concat_ws(' ', first_name, last_name) as actor_full_name , fa.film_id
from actor as a
join film_actor as fa
on a.actor_id = fa.actor_id;

-- 2. get the film_id , film_title, and actor_id 
select fa.film_id, f.title, fa.actor_id
from film_actor as fa
join film as f
on fa.film_id = f.film_id;

-- 3. find actor_id, actor_name, and the movie he has worked
select a.actor_id, concat_ws(' ', a.first_name, a.last_name) as actor_name, f.title as movie_name 
from actor as a
join film_actor as fa 
on a.actor_id = fa.actor_id 
join film as f
on fa.film_id = f.film_id;

-- 4. get actor_id, actor_name, only for the movie whose length is greater than 120 
select a.actor_id, concat_ws(' ', a.first_name, a.last_name) as actor_name, f.title , f.length
from actor as a
join film_actor as fa 
on a.actor_id = fa.actor_id 
join film as f
on fa.film_id = f.film_id
where f.length > 120;

-- 5. get the actor_id, actor_name, and the total no of movies he has worked
select a.actor_id, concat_ws(' ', a.first_name, a.last_name) as actor_name, count(f.title) as total_movies
from actor as a
join film_actor as fa 
on a.actor_id = fa.actor_id 
join film as f
on fa.film_id = f.film_id
group by actor_id, a.first_name, a.last_name;

-- 6. get the film_title, and no. of actors that have worked on that film
select f.title as film_title, count(fa.actor_id) as total_actors
from film as f
join film_actor as fa
on f.film_id = fa.film_id
group by f.title;
-- recursive cte
use sakila;
select actor_id, first_name from sakila.actor where actor_id between 1 and 4
union all
select first_name, actor_id from sakila.actor where actor_id between 3 and 5;

with recursive cte as(
select 10 as num       -- assinging values to this num column (starting point) 
union all 
select num +1 from cte   -- to call cte
where num <15    -- terminating condition (stop point)
)
select * from cte;

-- employee hierarchy 
use regex1;
CREATE TABLE employees (
    employeeid INT PRIMARY KEY,
    name VARCHAR(50),
    managerid INT
);

INSERT INTO employees (employeeid, name, managerid) VALUES
(1, 'Alice', NULL),      -- CEO
(2, 'Bob', 1),           -- Reports to Alice
(3, 'Charlie', 2),       -- Reports to Bob
(4, 'Diana', 2),         -- Reports to Bob
(5, 'Eve', 3);           -- Reports to Charlie

select * from employees;

WITH xyz AS (
    SELECT employeeid, name, name AS hierarchy_path 
    FROM employees  WHERE managerid IS NULL 
)
SELECT e.employeeid, e.name, CONCAT(x.hierarchy_path, ' -> ', e.name) AS hierarchy_path
FROM employees e JOIN xyz x ON e.managerid = x.employeeid;

-- in a hierarchy path
with recursive cte as (
select employeeid, name, name as hierarchy_path from employees where managerid is null   
union all
select e.employeeid, e.name, concat(e.name , '->', cte.hierarchy_path) from 
employees as e
join cte where e.managerid = cte.employeeid and e.employeeid < 5
)
select * from cte;

-- in level 
WITH RECURSIVE cte AS (
    SELECT employeeid, name, managerid, 0 AS level
    FROM employees WHERE managerid IS NULL 
    UNION ALL
    SELECT e.employeeid, e.name, e.managerid,
        cte.level + 1 AS level FROM employees e
    JOIN cte ON e.managerid = cte.employeeid
)
SELECT * FROM cte;
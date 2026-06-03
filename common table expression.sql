-- cte (common table expression): 
-- storing a result on temperory
select * from sakila.film_actor;

with test as
(select actor_id, count(film_id) as moviesCount 
from sakila.film_actor group by actor_id)

select sum(moviesCount) from test where actor_id >10;

-- precendence order 
-- from/join --> where --> group by --> having --> select --> distinct --> order by --> limit

use windowsdb;
select * from employes;
-- correlated subquery
select * from employes as e where salary = (select max(salary) from employes where dept= e.dept);

-- windrow function
select * from 
(select *, max(salary) over(partition by dept) as deptmax from employes) as temp
where salary = deptmax;

-- cte
with abc as 
(select *, max(salary) over(partition by dept) as deptmax from employes) 
select * from abc where salary = deptmax;

-- cte
with xyz as 
(select dept, max(salary) as deptmax from employes group by dept)
select * from employes join xyz where employes.dept = xyz.dept and employes.salary = xyz.deptmax;
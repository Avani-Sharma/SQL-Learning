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
group by continent;

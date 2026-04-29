-- order by clause:
-- to sort in ascending (ASC) and descending (DESC) order.
-- by default always ascending
-- ORDER BY is written at the end of the query.

-- Display countries ordered by population (ascending):
SELECT Name, Population FROM country ORDER BY Population;

-- Display countries ordered by population (descending):
SELECT Name, Population FROM country ORDER BY Population DESC;

-- Display countries ordered by name alphabetically:
SELECT Name FROM country ORDER BY Name ASC;

-- ORDER BY with alias:
SELECT Name, Population * 2 AS double_population FROM country ORDER BY double_population DESC;

-- ORDER BY with multiple columns:
SELECT Continent, Name, Population FROM country ORDER BY Continent ASC, Population DESC;

-- ORDER BY with WHERE: WHERE filters rows first, then ORDER BY sorts the filtered result.
-- Display Asian countries ordered by population (highest first).
-- WHERE → selects only Asian countries
-- ORDER BY → sorts them by population (descending)
SELECT Name, Population FROM country WHERE Continent = 'Asia' ORDER BY Population DESC;

-- Display cities in India ordered alphabetically.
SELECT Name FROM city WHERE CountryCode = 'IND' ORDER BY Name ASC;

-- ORDER BY with GROUP BY: GROUP BY groups data, and ORDER BY sorts the grouped result.
-- Display total population of each continent, ordered by total population.
-- GROUP BY → continent-wise grouping
-- ORDER BY → sorts continents by total population
SELECT Continent, SUM(Population) FROM country GROUP BY Continent ORDER BY total_population DESC;

-- Display number of countries in each continent, ordered by count.
SELECT Continent, COUNT(Name) FROM country GROUP BY Continent ORDER BY country_count DESC;

-- WHERE + GROUP BY + ORDER BY (Together)
-- Display regions in Asia with average life expectancy, ordered by average life expectancy.
SELECT Region, AVG(LifeExpectancy) FROM country WHERE Continent = 'Asia' GROUP BY Region ORDER BY avg_life DESC;


select * from employees;
select * from employees order by salary desc;

select first_name, department, salary from employees order by department, salary;

select salary, hire_date, year(hire_date) from employees order by year(hire_date) , salary desc;

-- functions : multi-row functions/aggregate functions
-- distinct: unique values
select distinct(department) from employees;

select distinct department, salary from employees;

-- calculation on your data : aggregate function
select count(department) from employees;
select count(first_name) from employees;

select count(district) from address;
select count(district) , count(address_id) , count(address2) from address;

select * from address;
select * from employees;
select count(department), count(distinct department) from employees;

-- select salary, count(salary) from employees;   : error no direct access 
select sum(salary), count(salary) from employees;
select max(salary), min(salary), avg(salary) from employees;

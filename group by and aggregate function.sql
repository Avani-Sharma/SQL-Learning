-- distinct: remove dulicate values 
select distinct continent, region from country;

-- aggregate func: are sql function that perform a calculation on a set of rows & return one single value as result
-- aggregate func are count, sum, avg, min, max 
select count(indepyear) from country;

select count(*) from country;

select count(population),sum(population),avg(population), min(population),max(population) from country;

select count(continent) , count(distinct continent)from country;

select count(indepyear),count(*) from country where continent = 'asia';

-- Ques1.--> get the total countries and total region along with avg life expectancy and total...
-- population for the countries to have got the independence after 1947 and before 1998:
select count(name) , count(region),avg(lifeexpectancy),sum(population) 
  from country where indepyear > 1947 and indepyear < 1998;

-- Ques2.--> get the total numbers of countries the unique regions along with the total population 
-- and highest lifeexpectancy rate with the total capitals for the countries 
-- starting with the letter 'a' and letter 'd':
select count(name) , count(distinct region),sum(population),max(lifeexpectancy),sum(capital)
  from country where name like 'A%' or name like'D%'; 
 
 -- group by: it is used to group rows that have the same values in one or more columns 
 -- and apply aggregate functions on each group.
 select continent , count(name) from country group by continent;
 
 -- Ques3.--> find out the total country and total population for each indepyear 
select indepyear,count(name) , count(population) from country group by indepyear;

select continent ,count(name) from country group by continent;

-- use where with group by: The WHERE clause is used with GROUP BY to filter rows before grouping the data.
-- WHERE is applied before GROUP BY.
-- It is used to limit the rows that will be included in each group.
-- Aggregate functions are not allowed in the WHERE clause.
-- Ques4.--> Display total population of each continent, but include only countries with population > 10 million.
SELECT Continent, SUM(Population) FROM country WHERE Population > 10000000 GROUP BY Continent;

-- Ques5.--> Display number of countries in each region, but only for Asian continent.
SELECT Region, COUNT(Name) AS country_count FROM country WHERE Continent = 'Asia' GROUP BY Region;

-- Use of HAVING with GROUP BY: The HAVING clause is used with GROUP BY to filter groups after grouping is performed.
-- HAVING is applied after GROUP BY. It is used to filter grouped data.
-- Aggregate functions are allowed in the HAVING clause.
-- Ques6.--> Display continents having more than 10 countries.
SELECT Continent, COUNT(Name) FROM country GROUP BY Continent HAVING COUNT(Name) > 10;

-- Ques7.--> Display regions whose average life expectancy is greater than 70.
SELECT Region, AVG(LifeExpectancy) FROM country GROUP BY Region HAVING AVG(LifeExpectancy) > 70;

-- Ques8.--> Display continents where countries belong to Asia or Europe, and total population > 500 million
SELECT Continent, SUM(Population) AS total_population FROM country WHERE Continent IN ('Asia', 'Europe')
  GROUP BY Continent HAVING SUM(Population) > 500000000;
  
-- Ques9.--> Display regions where LifeExpectancy is not NULL, and average life expectancy > 65
SELECT Region, AVG(LifeExpectancy) FROM country WHERE LifeExpectancy IS NOT NULL GROUP BY Region
  HAVING AVG(LifeExpectancy) > 65;
  
-- Ques10.--> find out the maximum amount of transaction , avg transaction amount, total transaction amount, 
-- done through each staff 
select staff_id, max(amount), avg(amount), sum(amount)  from payment group by staff_id;

-- Ques11.--> find out the maximum amount of transaction , avg transaction amount, total transaction amount, 
-- done through each staff which only for even num of customer
select staff_id, max(amount), avg(amount), sum(amount) from payment where customer_id%2=0 group by staff_id;

-- Ques12.--> get the amount and the total transaction done for each amount only for the payments done 
-- through the staff_id 1 and total transaction should be greater than 30
-- amount, total transaction, count, staff_id (filter) , having total_transaction
select amount, count(*) from payment where staff_id group by amount having count(*)>30;

-- Ques13.--> find out no. of customers served avg amount and total amount spend in each month for staff_id 1 and 2
select month(payment_date), count(customer_id) , avg(amount), sum(amount) from payment 
where staff_id = 1 or staff_id =2 group by month(payment_date);

-- Ques14.--> find out no. of customers served avg amount and total amount spend in each month for staff_id 1 and 2
-- for each month and each year
select extract(year from payment_date), count(customer_id) , avg(amount), sum(amount) from payment 
where staff_id = 1 or staff_id =2 group by  extract(year from payment_date), extract(month from payment_date);

create database saledb;
use saledb;

CREATE TABLE sales (
    order_id INT,
    customer_name VARCHAR(50),
    product VARCHAR(50),
    category VARCHAR(50),
    amount INT,
    city VARCHAR(50),
    order_date DATE
);

INSERT INTO sales VALUES
(1, 'Aman', 'Laptop', 'Electronics', 70000, 'Jaipur', '2024-01-10'),
(2, 'Neha', 'Mobile', 'Electronics', 30000, 'Delhi', '2024-01-12'),
(3, 'Rahul', 'Shoes', 'Fashion', 2000, 'Mumbai', '2024-01-15'),
(4, 'Aman', 'Keyboard', 'Electronics', 1500, 'Jaipur', '2024-01-18'),
(5, 'Pooja', 'Dress', 'Fashion', 3500, 'Delhi', '2024-01-20'),
(6, 'Karan', 'Laptop', 'Electronics', 65000, 'Pune', '2024-01-22'),
(7, 'Neha', 'Shoes', 'Fashion', 2500, 'Delhi', '2024-01-25'),
(8, 'Rahul', 'Mobile', 'Electronics', 28000, 'Mumbai', '2024-01-28'),
(9, 'Aman', 'Mouse', 'Electronics', 800, 'Jaipur', '2024-02-01'),
(10, 'Pooja', 'Bag', 'Fashion', 2200, 'Delhi', '2024-02-05');

-- Q1. Find the total sales for the Electronics category.
select sum(amount) from sales where category = 'Electronics' ;

-- Q2. Find the total purchase amount of customers from Delhi.
select sum(amount) from sales where city = 'Delhi';

-- Q3. Count the number of orders where amount > 3000, grouped by category.
select category, count(*) from sales where amount > 3000 group by category;
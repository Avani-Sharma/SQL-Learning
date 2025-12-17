-- to see all the database
show databases;

-- to utilize the database for which data will be stored
use world;

-- to see the tables
show tables;

-- to see column of table country 
describe country;

-- to print the data 
select * from country;

-- to see three column
select name , population, region  from country; 

-- any order you can print column
select population, name, region from country;

-- any mathematical work
select name, population ,region ,population-500 from country;

-- When performing mathematical operations, use AS to give a column a new name (alias)
-- Using an alias does not change the original data; it only changes the column name in the result output.	 
select name, population, region, population-500+20*67 as 'new population' from country;

-- to filter use WHERE clause 
select * from country where continent='asia';
select * from country where indepyear='1984';

-- where clause have some operators:
-- arithmetic operators: +, -, *, /, %
-- comparison operators: =, !=, >, <, >=, <=
-- logical operatos: AND, OR, NOT, IN, bETWEEN, LIKE

-- Ques1.--> Select all countries where the continent is Asia.
SELECT * FROM country WHERE continent = 'Asia';

-- Ques2.--> Find countries where population is greater than 10,000,000.
SELECT * FROM country wHERE population > 10000000;

-- Ques3.--> Display countries where life expectancy is less than 60.
SELECT *  FROM country WHERE LifeExpectancy < 60;

-- Ques4.--> Select countries where government form is 'Republic'.
SELECT * FROM country WHERE GovernmentForm = 'Republic';

-- Ques5.--> US cities with population less than 500,000
SELECT * FROM city WHERE Population < 500000 AND CountryCode = 'USA';

-- Ques6.--> Cities in California district
SELECT * FROM city WHERE District = 'California';

-- Ques7.--> Countries with population between 1M and 5M
SELECT * FROM country WHERE Population BETWEEN 1000000 AND 5000000;

-- Ques8.--> Countries in Asia or Africa
SELECT * FROM country WHERE Continent IN ('Asia', 'Africa');

-- Ques9.--> Countries not Asia or Africa
SELECT * FROM country WHERE Continent not IN ('Asia', 'Africa');
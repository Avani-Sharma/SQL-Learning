show databases;
use world;
show tables;
select * from city;
select * from country;
select * from countrylanguage;
-- practice on where clause: to filter the rows(records)
-- Display all countries that belong to the Asia continent.
select * from country where continent = 'Asia';

-- Show the record of India only.
select * from country where name = 'India';

-- Display countries whose population is greater than 100 million.
select * from country where population > 100000000;

-- Show all countries from Europe.
select * from country where continent = 'Europe';

-- Display all cities that belong to India (IND).
SELECT * FROM city  WHERE CountryCode = 'IND';

-- Show all cities with a population greater than 500,000.
select * from city where population > 500000;

-- Display countries with a surface area greater than 1,000,000.
select * from country where surfacearea >1000000;

-- Show cities whose name starts with the letter 'A'.
select * from city where name like 'A%';

-- Display countries that are in Asia and have a population greater than 50 million.
select * from country where continent = 'Asia' and population > 50000000;

-- Show countries that are in Asia or Europe.
select * from country where continent = 'Asia' or continent = 'europe';

-- Display cities whose population is between 1 million and 3 million.
select * from city where population between 1000000 and 3000000;

-- Show countries that are not in Asia.
select * from country where continent != 'Asia';

-- Display cities whose name ends with "pur".
select * from city where name like '%pur';

-- Show languages that are spoken in India (IND).
select * from countrylanguage where countrycode = 'ind';

-- Display countries whose government form is 'Republic'.
select * from country where governmentform = 'Republic';

-- Show cities that are in India and have a population greater than 1 million.
SELECT Name, Population FROM city WHERE CountryCode = 'IND' AND Population > 1000000;

-- Display countries that are in Asia but not Republics.
select name, continent , governmentform from country where continent = 'asia' and governmentform <> 'republic';

-- Show cities whose names start with 'S' and end with 'a'.
select name from city where name like 'S%a' ;

-- Display languages whose percentage is greater than 50.
select countrycode, language, percentage from countrylanguage where percentage > 50;

-- Display all country names in uppercase where continent is Asia.
select upper(name) from country where continent = 'asia';

-- Show all city names in lowercase where CountryCode is IND.
select lower(name) from city where countrycode = 'ind';

-- Display country name and capital together (joined using -) where continent is Europe.
select name, capital, concat(name, '-', capital) as namecapital from country where continent = 'europe';

-- Display city name and country code together separated by : where population is greater than 1 million.
select name, countrycode , concat_ws(':', name, countrycode) as Ncc from city where population > 1000000;

-- Show first 3 letters of all country names where continent is Africa.
select left(name, 3) from country where continent = 'africa';

-- Display middle part (substring) of city names where country code is USA.
select substr(name, 2, 5) from city where countrycode = 'usa';

-- Display cities where the letter ‘a’ exists in the city name.
SELECT Name FROM city WHERE INSTR(Name, 'a') > 0;

-- Display countries where letter ‘n’ exists in the country name.
SELECT Name FROM city WHERE INSTR(Name, 'n') > 0;

-- Display city names whose length is greater than 8 characters.
SELECT Name FROM city WHERE CHAR_LENGTH(Name) > 8;
 
-- Display country names whose length is less than 6 characters.
SELECT Name FROM city WHERE CHAR_LENGTH(Name) <6;

-- Display country names after trimming spaces where continent is Asia.
select name, trim(name) from country where continent = 'asia';

-- Display city names padded with * to length 15 where country code is IND.
select name, lpad(name, 15, '*') from city where countrycode = 'ind';

-- Display country names padded on right with - where continent is Europe.
select name, rpad(name, 15, '-') from country where continent = 'europe';

-- Display country name and rounded population where continent is Asia.
select name, population, round(population) from country where continent = 'asia';

-- Display country name and truncated GNP where GNP is greater than 1000.
select name , gnp, truncate(GNP, 2) from country where GNP > 1000;

-- Display cities where population is even number.
SELECT Name, Population from city WHERE MOD(Population, 2) = 0;

-- Display country name and CEIL of life expectancy where continent is Europe.
select name, lifeexpectancy, ceil(lifeexpectancy) from country where continent = 'europe';

-- Display country name and FLOOR of life expectancy where continent is Asia.
select name, lifeexpectancy, floor(lifeexpectancy) from country where continent = 'asia';

-- Display city name and square of population where country code is IND.
select name, population, pow(population, 2) from city where countrycode = 'ind';

-- Display countries whose independence year + 10 years is greater than 2000.
SELECT Name, IndepYear FROM country WHERE IndepYear + 10 > 2000;

-- Display the number of cities in each country.
SELECT CountryCode, COUNT(*) AS TotalCities FROM city GROUP BY CountryCode;

-- Show the total population of countries per continent.
select continent , sum(population) from country group by continent;

-- Find the average population of cities per country.
select countrycode, avg(population) from city group by countrycode;

-- Display the maximum GNP of countries per continent.
select continent,  max(gnp) from country group by continent;
 
-- Count the number of languages spoken in each country.
select countrycode, count(language) from countrylanguage group by countrycode;

-- Find the minimum life expectancy per continent.
select continent, min(lifeexpectancy)  from country group by continent; 

-- Show the total population of cities per country where population > 1 million.
select countrycode, sum(population) from city where population > 1000000 group by countrycode; 

-- Display the average GNP per government form.
select governmentform, avg(gnp) from country group by governmentform;

-- Count the number of countries per region.
select region, count(name) from country group by region;
 
-- Show the total number of cities per district.
select district, count(name) from city group by district;

-- Find countries with more than 5 official languages.
select countrycode, count(language) from countrylanguage group by countrycode having count(language) >5;
 
-- Display continents where the average life expectancy > 70 years.
select continent, avg(lifeexpectancy) from country group by continent having avg(lifeexpectancy) > 70;

-- Find countries where the sum of GNP > 10000 per region.
select region, sum(gnp) from country group by region having sum(gnp) >10000 ;
 
-- Count the number of cities starting with 'S' per country.
select countrycode, count(*) from city where name like 'S%' group by countrycode ;

-- Count countries per continent having population > 50 million
SELECT Continent, COUNT(*) AS CountryCount FROM country WHERE Population > 50000000 GROUP BY Continent;

-- Countries per region where average GNP > 500
SELECT Region, AVG(GNP) AS AvgGNP FROM country GROUP BY Region HAVING AVG(GNP) > 500;

-- Count cities per district having more than 3 cities
SELECT District, COUNT(*) AS CityCount FROM city GROUP BY District HAVING COUNT(*) > 3;

-- Count cities per country where cities starting with ‘S’ > 2
SELECT CountryCode, COUNT(*) AS CityCount FROM city WHERE Name LIKE 'S%' GROUP BY CountryCode HAVING COUNT(*) > 2;

-- Countries by population ascending
SELECT Name, Population FROM country ORDER BY Population ASC;

-- Cities by population descending
SELECT Name, Population FROM city ORDER BY Population DESC;

-- Number of cities per country sorted by total cities descending
SELECT CountryCode, COUNT(*) AS TotalCities FROM city GROUP BY CountryCode ORDER BY TotalCities DESC;

-- Cities sorted by country, then by population descending
SELECT CountryCode, Name, Population FROM city ORDER BY CountryCode ASC, Population DESC;
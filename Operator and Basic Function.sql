-- like operator:- match a pattern
-- name = letter start , letter include, letter end
-- % : special character/ wildcard 	character
-- % : zero or more character
-- _(underscore) : only 1 character

-- Ques1.--> Display country names that start with ‘A’.
SELECT Name FROM country WHERE Name LIKE 'A%';

-- Ques2.--> Display country names that end with ‘land’.
SELECT Name FROM country WHERE Name LIKE '%land';

-- Ques3.--> Display city names that contain ‘New’.
SELECT Name FROM city WHERE Name LIKE '%New%';

-- Ques4.--> Display cities whose name starts with ‘B’ and ends with ‘i’.
SELECT Name FROM city WHERE Name LIKE 'B%i';

-- Ques5.--> Display country names whose second letter is ‘n’.
SELECT Name FROM country WHERE Name LIKE '_n%';

-- Ques6.--> Display city names that do not start with ‘A’.
SELECT Name FROM city WHERE Name NOT LIKE 'A%';

select name from country where name like '%_a';
select name from country where name like '_a%_';
select name from country where name like '_a_';
select name from country where name like '____';

-- basic functions: 
-- upper, lower, concat, concat_ws, left
-- case conversion: upper(), lower()
select name , upper(name), lower(name) from country;

-- concat: CONCAT is used to join two or more strings or columns.
-- If any value is NULL, the result becomes NULL.
select name, code, concat(name,'$', code,'avani') from country;

-- Ques7.--> Display country name and continent together.
SELECT CONCAT(Name, ' - ', Continent) AS country_continent FROM country;

-- concat_ws : WS = With Separator --> CONCAT_WS is used to join multiple strings using a separator.
-- CONCAT_WS ignores NULL values.
select name, code, concat_ws('$', name ,code ,'avani') from country;

-- Ques8.--> Display country name, region, and continent using a separator.
SELECT CONCAT_WS(' | ', Name, Region, Continent) AS country_details FROM country;

-- left(): returns the specified no. of characters from the left(start) side of string
select name from country where left(name, 1) = 'A';

-- Ques9.--> Display cities whose first 2 letters are ‘Ne’.
SELECT Name FROM city WHERE LEFT(Name, 2) = 'Ne';

-- Ques10.--> Display countries where the first letter is NOT ‘I’.
-- <>: it means not equal to 
SELECT Name FROM country WHERE LEFT(Name, 1) <> 'I';
Select Left('Avani', 4);
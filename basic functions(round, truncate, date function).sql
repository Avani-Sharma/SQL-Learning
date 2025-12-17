use world;
-- round: is used to round a no. to a specified no. of decimal places
select lifeexpectancy , round(lifeexpectancy) from country;

-- When we use the ROUND() function, the value after the decimal point is checked.
-- If the decimal value is greater than or equal to 0.5, the number is rounded up (the integer part increases by 1).
-- If the decimal value is less than 0.5, the number is rounded down (the integer part remains the same).
select round(30.62), round(30.50), round(30.49);

-- When decimal is positive (e.g. 2): A positive decimal value rounds the number after the decimal point.
-- 2 means keep 2 digits after the decimal point. Look at the 3rd digit (6) → round up
SELECT ROUND(123.4567, 2) , ROUND(123.4567, 1), ROUND(123.4567, 3), ROUND(123.4567, 4), round(234.0);

-- When decimal is zero (0): Rounds the number to the nearest integer.
SELECT ROUND(45.6, 0), ROUND(45.4, 0);  

-- When decimal is negative (e.g. -2): A negative decimal value rounds the number before the decimal point.
-- -2 means round to the nearest hundred: Check the tens digit (4) → round down
SELECT ROUND(12345, -2), ROUND(5678, -1) , ROUND(5678, -2),  ROUND(4678, -3);
select round(1234.34, -1), round(1234.2443, -2), round(553.435, -3), round(3241.344, -4);

-- truncate: extract the values
-- donot round the values
select truncate(345.345, -2), truncate(234.567, -1), truncate(123.456, -3);
select truncate(345.345, 2), truncate(234.567, 1), truncate(123.456, 3);
select truncate(12.89, 0);

-- mod: returns the remainder after division of one no. by another
select mod(10, 4);

-- ceil: returns the smallest integer greater than or equal to the given no. 
select ceil(23.34);

-- floor: returns the largest integer less than or equal to given no.
select floor(4.99);

-- pow: returns a raised to power of b
select pow(2,3);

-- date function 
select  now(), current_date(), current_timestamp(), current_time();

-- add date function=> by default date add, (month , year ,time)
select now(), adddate(now(),-2);
select adddate(now(),2);
select adddate(now(),interval 2 year);
select adddate(now(),interval 2 month);
select subdate(now(),2);
select year(now());

-- extract (year / month / hour / minute / week)
select now(), extract(week from now());

-- date format => extract date but with a string (message)
select now(), extract(year from now()),date_format(now(),'year is %h'); 
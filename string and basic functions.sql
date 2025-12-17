-- string functions:
-- substr function: is used to extract a part of string starting from a specific position for given length
-- indexing starts from 1 
select name , substr(name, 2), substring(name, -4,2)from country;
select substr('avani', 2, 3);

-- Ques1.--> get the country name first char is same as continent 1st char
select name, left(name,1) from country where left(continent,1)=left(name,1);

-- Ques2.--> get the country name and population where the staring three character of the country is alg
select name, population from country where substr(name,1,3) = 'alg';

-- instr function: inside the function
-- returns the position of the first occurence of substring within a string
select name , instr(name, 'a') from country;
select instr('avani', 'a');

-- char_length function: returns the no. of characters in a string
select name, char_length(name) from country;

-- trim () functions: remove before and after whitespace
select ('       avani     ');
select char_length('        avani         ');
select char_length(trim('        avani        ' ));

-- rtrim () function : remove whitespace from right side
select char_length(rtrim('       avani        '));
select trim(both 'a' from 'avania');

-- for remove right side character
select name ,trim(trailing 'a' from name) from country;
-- for remove left side character leading() function:
select name , trim(leading 'A' from name) from country;

-- nested trim for both letters 
select name, trim(both 'a' from trim(both 'A' from name)) from country;

-- lpad function(): when we want to define a column with fixed size
select name , population ,lpad(population ,9,"*") from country;

-- rpad function():
select name , population ,rpad(population ,9,"#") from country;
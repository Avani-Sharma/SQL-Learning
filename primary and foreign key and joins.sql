use world;
-- primary code - it is a column in table which contain unique and not null value 
-- foreign key - it is a child column in a table which contain duplicate and null values 

select * from city;
describe city;
-- city (id - primary key)
-- city table (id - primary key ) (country - foreign code )
select * from country;
describe country;
select count(code) ,count(distinct code) from country;
	
select cy.id , cy.name , cy.countrycode from city as cy join country as cnt where cy.CountryCode = cnt.code;
select cnt.code ,cnt.name,cnt.continent from country as cnt;

-- JOIN is an SQL operation used to combine data from two or more tables based on a related column between them.
-- ques1.--> find the city name population the country name along with the government form for each city 
select ct.name,ct.population ,cnt.name,cnt.population from city as ct 
join country as cnt where ct.countrycode = cnt.code;

select * from countrylanguage;

-- ques2.--> get the country name population and the language spoken with the percentage of each language
SELECT  c.Name, c.Population, cl.Language, cl.Percentage FROM country AS c
JOIN countrylanguage AS cl ON c.Code = cl.CountryCode;
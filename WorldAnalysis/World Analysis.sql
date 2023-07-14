use world;

select * from city;
select * from country;
select * from countrylanguage;

-- 1. How many countries are in the world database?
Select count(Name) as count_countries from country;

-- 2. Which continent has the most number of countries?
select count(Name) as count_countries , continent 
from country 
group by continent
ORDER BY count_countries desc
LIMIT 1;

-- 3.Which country has the highest population?
select Name, Population 
from country 
ORDER BY Population desc
LIMIT 1;

-- 4. What is the total population of Europe?
select SUM(Population) AS Total_Population
from country
Where continent = 'Europe';

-- 5.What is the GNP of the United States?
select GNP from country where Name = 'United states';

-- 6.Which country has the lowest life expectancy?
select Name, LifeExpectancy from country 
where LifeExpectancy is not NULL
order by LifeExpectancy
LIMIT 1;

-- 7.What is the average life expectancy for each continent?
select Continent, AVG(LifeExpectancy) AS  Avg_Lifexpectancy
FROM country
GROUP BY Continent;

--  8.Which countries have the highest total land area?
select Name, SurfaceArea
from country 
ORDER BY SurfaceArea DESC;

-- 9.What is the average life expectancy of countries in the world with a population greater than 50 million?
SELECT AVG(LifeExpectancy) AS avg_life_expectancy
FROM country
WHERE Population > 50000000;

-- 10.For Individual country Avg Life Expectancy with a population greater than 50 million?
select Name as new_name, AVG(LifeExpectancy) AS Avg_LifeExp, Population  
from country
GROUP BY new_name,Population 
HAVING Population > 50000000
ORDER BY Avg_LifeExp DESC;

-- 11.Which countries in Europe have a population density higher than the world average? 
select Name from country
where Continent = 'Europe' AND Population/SurfaceArea >
(select  AVG(Population/SurfaceArea) AS worldAvg from country);
-- Here The expression population/surfacearea is called population density, which is a measure of the number of people living per unit of land area.

-- 12.Which country has the highest GNP per capita in Asia?
select Name from Country where Continent = 'Asia'
order by GNP/Population desc
limit 1;

-- 13.Retrieve the name of each country along with the name and population of its most populous city.
select country.Name as Country_Name,city.Name as City_Name,city.Population from 
city inner join country on city.CountryCode = country.Code
where city.Population = (select MAX(city.Population) from city where CountryCode = country.Code);

-- 14.Retrieve the name of each country along with the number of languages spoken in it. And show the total count
select country.Name as Country_Name,count(distinct countrylanguage.Language) as Count_Languages from 
country inner join countrylanguage on country.Code = countrylanguage.CountryCode
group by Country_Name with ROLLUP;

-- 15.Retrieve the name of each country along with the percentage of its population that lives in cities.
select country.Name as Country_Name, SUM(city.Population/country.Population)*100 as  Population_Percent_Cities from 
country inner join city on city.CountryCode = country.Code
group by Country_Name;

-- 16.Retrieve the name and population of all cities that are not the capital of their country, along with the name of the country they are in.
select country.Name as Country_Name, city.Name as City_Name, city.Population as City_Population from 
city inner join country on city.CountryCode = country.Code
where city.ID not in (select capital from city)
order by city.Population DESC;

-- 17.Retrieve the name and population of all cities that are located in a country whose name starts with the letter 'U', and that have a population greater than the average population of all cities in that country.
select country.Name as Country_Name, city.Name as City_Name, city.Population as City_Population from 
city inner join country on city.CountryCode = country.Code
where country.Name like 'U%'
AND city.Population > (select avg(Population) from city where CountryCode = country.Code);

-- 18.List all the countries whose population is larger than the average population of all the countries in the world.
select Name from country where Population  > (select AVG(Population) from country);

-- 19.List the top 5 countries with the highest life expectancy.
select Name, LifeExpectancy from country 
order by LifeExpectancy DESC
LIMIT 5;

-- 20.List all the cities in countries where the official language is English and the percentage of people who speak English is less than 10%.
select city.Name AS City_Name from city 
INNER JOIN countrylanguage
ON  city.CountryCode = countrylanguage.CountryCode
where countrylanguage.Language = 'English' and  countrylanguage.Percentage < 10;

-- Using Subquery
select Name AS City_Name from city 
where CountryCode in ( 
select CountryCode from countrylanguage 
where Language = 'English' and Percentage < 10);

-- 21.List all the continents along with the number of countries and their total population.
select Continent, count(distinct Name) as Country_Count, SUM(Population) as Total_Population from country
group by Continent
ORDER by Country_Count DESC;

create index 

-- 22.List all the countries whose surface area is larger than the surface area of the United States and whose government form is a republic.
  select Name as Country_Name from country where SurfaceArea > (
  select SurfaceArea from country where Name = 'United States') and  GovernmentForm = 'Republic';
  
  -- JOINS
  -- 23. List all the cities in each country, along with their corresponding country name and continent.
  select  country.Continent as Continent_Name, country.Name as country_name, city.Name as city_name from city
  INNER JOIN country on city.CountryCode = country.Code
  order by 1,2,3;
  
  -- 24. List all the languages spoken in each country, along with their corresponding country name and population. If a language is not spoken in a country, return NULL values for the country columns.
select cl.Language as Language_Name,co.Name as Country_Name,co.Population from countrylanguage cl 
LEFT JOIN country co ON  co.Code = cl.CountryCode;

-- 25. List all the countries and their corresponding official language, even if the language is not spoken in any country. If a country has no official language, return NULL values for the language columns
 select co.Name as Country_Name, cl.Language as Official_Language from countrylanguage cl 
 RIGHT JOIN country co ON cl.CountryCode = co.Code
 order by  Country_Name,Official_Language ASC;
 
 -- 26. List all the countries and their corresponding number of cities. If a country has no cities, return 0 for the city count, and if a city has no corresponding country, return NULL values for the country columns.
 select country.Name as Country_Name, count(distinct  city.Name) as Count_Cities from City 
 FULL JOIN country on city.CountryCode = country.Code
 GROUP BY Country_Name
 ORDER BY Count_Cities DESC;
 
 -- CTE (Common Table Expression)
 -- 27. Write a CTE to find the total population of each continent.
WITH pop as (select Continent, SUM(Population) as total_population from country
			group by Continent)
select Continent, total_population from pop;

 -- 28. Write a CTE to find the average life expectancy of countries in each continent.
 
WITH LIFE as (select Continent, AVG(LifeExpectancy) as Life_Exp from country
			group by Continent)
select Continent, Life_Exp from LIFE;

-- 29. Write a CTE to find the top 5 countries with the highest population density.
   
WITH country_pop_density AS (
    SELECT name, Population/SurfaceArea AS pop_density
    FROM country
)
SELECT name, pop_density
FROM country_pop_density
ORDER BY pop_density DESC
LIMIT 5;

-- 30. Write a CTE to find the countries that have a higher population than the average population of their respective continent

WITH Continent_avg_pop AS (
    SELECT Continent, AVG(population) AS avg_pop
    FROM country
    GROUP BY Continent
)
SELECT Name as Countries
FROM country
JOIN Continent_avg_pop ON country.Continent = continent_avg_pop.Continent
WHERE population > avg_pop;

-- 31. Write a CTE to find the top 10 most spoken languages in the world and their total number of speakers.

WITH tot_speakers as (
     SELECT cl.Language as spoken_languages, SUM(c.Population) as Total_no_of_speakers from 
     country c JOIN
     countrylanguage cl
     ON c.Code = cl.CountryCode
	 group by spoken_languages)
     
select spoken_languages, Total_no_of_speakers 
from tot_speakers
order by  Total_no_of_speakers desc
limit 10;

-- 32. Write a CTE to find the countries that have more than one official language and the number of official languages they have.

WITH off_lan  AS ( select c.Name as countries, COUNT(cl.Language) AS No_of_official_languages from 
				  country c JOIN
                  countrylanguage cl 
                  ON c.Code = cl.CountryCode
                  Where IsOfficial = 'T'
                  group by countries
                  having No_of_official_languages > 1 )
select countries, No_of_official_languages from off_lan;

-- Window functions:-
-- 33.Find the total population for each country, along with the running total of population for each country.
SELECT
Code, Name,
  SUM(Population) AS total_population,
  SUM(Population) OVER (ORDER BY Code) AS running_total_population
FROM country 
GROUP BY Code,Name;


-- 34. Rank the cities within each country based on their population, and display the rank for each city.
SELECT c.*, 
RANK() OVER (partition by CountryCode order by Population DESC) AS city_rank_number
from city c;

-- 35. Determine the average life expectancy for each country, considering the previous life expectancies as well (using the window frame).
select Name,
AVG(LifeExpectancy) OVER(partition by Name order by Name
           rows between unbounded preceding and unbounded following) as Avg_lifeExpectancy
from 
country
group by Name,LifeExpectancy;

-- 36. Calculate the difference in population growth for each country compared to the average population growth for all countries.
select Name,
Population - AVG(Population) OVER () as population_growth_difference
from 
country;

-- 37. Find the most populous city in each country based on population.
SELECT c.*,
FIRST_VALUE(Name) OVER (partition by CountryCode order by Population DESC) AS Most_Populous_City
from city c;

-- 38. Calculate the cumulative sum of urban population for each country.

SELECT Code as country_code,
Name as Country_Name,
Population,
SUM(Population) OVER (order by Code) AS Cummulative_Sum
from country
Group by 1,2;

-- 39. Determine the maximum population for each continent.

SELECT Continent,
MAX(Population)  AS Max_Population
from country
group by Continent
order by Max_Population;

-- 40. Find the top 3 countries with the highest population density.

SELECT 
Name as Country,
Population/SurfaceArea as Population_density
from 
country
order by Population_density  DESC
LIMIT 3;


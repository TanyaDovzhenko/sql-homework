/* 1. How many entries in the 
countries table are from Africa? */
SELECT COUNT(name)
FROM countries
WHERE continent = 'Africa';


/* 2. What was the total population 
 of the continent of Oceania in 2005?*/
SELECT SUM(population_years.population)
FROM countries JOIN population_years 
ON countries.id = population_years.country_id
WHERE countries.continent = 'Oceania'
AND population_years.year = 2005;


/* 3. What is the average population of 
 countries in South America in 2003? */
SELECT AVG(population_years.population)
FROM countries JOIN population_years 
ON population_years.country_id = countries.id
WHERE countries.continent = 'South America'
AND population_years.year = 2003;


/* 4. What country had the smallest 
population in 2007? */
SELECT countries.name, population_years.population
FROM countries JOIN population_years 
ON population_years.country_id = countries.id
WHERE population_years.year = 2007
ORDER BY population_years.population ASC
LIMIT 1;


/* 5. What is the average population of Ukraine 
during the time period covered by this dataset? */
SELECT AVG(population_years.population)
FROM countries JOIN population_years 
ON countries.id = population_years.country_id
WHERE countries.name = 'Ukraine';


/*6. How many countries have the 
 word “The” in their name?*/
SELECT COUNT(*)
FROM countries
WHERE name LIKE '%The%';


/* 7. What was the total population of each 
continent in 2010? */
SELECT countries.continent, SUM(population_years.population)
FROM countries JOIN population_years 
ON countries.id = population_years.country_id
WHERE population_years.year = 2010
GROUP BY countries.continent;
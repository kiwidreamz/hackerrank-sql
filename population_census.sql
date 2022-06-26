-- Given the CITY and COUNTRY tables, query the sum of the populations of all cities where the CONTINENT is 'Asia'.

select sum(population) from city where countrycode = ANY (select code from country where continent = "Asia");
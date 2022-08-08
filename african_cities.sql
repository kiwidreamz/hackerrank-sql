-- Given the CITY and COUNTRY tables, query the names of all cities where the CONTINENT is 'Africa'.

select name from city where countrycode = any (select code from country where continent = "Africa");
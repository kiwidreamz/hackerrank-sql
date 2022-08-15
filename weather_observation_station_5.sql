-- Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths (i.e.: number of characters in the name). If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically.


SELECT city, len(city) FROM station
    WHERE
        len(city) = (SELECT max(len(city)) FROM station);

SELECT top 1 city, len(city) FROM station
    WHERE
        len(city) = (SELECT min(len(city)) FROM station)
    ORDER BY city;
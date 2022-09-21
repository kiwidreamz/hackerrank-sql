-- Query the Euclidean Distance between points P1 and P2 and format your answer to display 4 decimal digits.

select cast(sqrt(SQUARE(min(lat_n)-max(lat_n)) + SQUARE(min(long_w)-max(long_w))) as decimal (10,4)) from station;

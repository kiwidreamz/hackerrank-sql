-- Query the Western Longitude (LONG_W)where the smallest Northern Latitude (LAT_N) in STATION is greater than 37.7780. Round your answer to 4 decimal places.

SELECT round(long_w, 4) FROM station where lat_n = (select min(lat_n) from station where lat_n > 38.7780);
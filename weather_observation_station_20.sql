SELECT ROUND(AVG(LAT_N), 4) AS median_lat
FROM (
  SELECT
    LAT_N,
    ROW_NUMBER() OVER (ORDER BY LAT_N) AS row_num,
    COUNT(*) OVER () AS total_rows
  FROM station
) subquery
WHERE row_num IN (
  (total_rows + 1) / 2,
  CEIL((total_rows + 1) / 2.0)
);
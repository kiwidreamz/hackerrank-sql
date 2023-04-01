SELECT MIN(k.start_date), DATE_ADD(MAX(k.start_date), INTERVAL 1 DAY)
FROM (
    SELECT 
        p.start_date, 
        p.start_date - ROW_NUMBER() OVER (ORDER BY p.start_date) AS priority
    FROM projects AS p
) AS k
GROUP BY priority
ORDER BY MAX(k.start_date) - MIN(k.start_date), MIN(k.start_date);

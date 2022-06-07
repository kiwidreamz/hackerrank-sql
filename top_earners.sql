-- Write a query to find the maximum total earnings for all employees as well as the total number of employees who have maximum total earnings. 

SELECT MAX(salary * months), COUNT(salary * months) FROM employee GROUP BY salary * months ORDER BY salary * months DESC LIMIT 1;
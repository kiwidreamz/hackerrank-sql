SELECT hackers.hacker_id, name, SUM(max_score) AS total
FROM hackers
JOIN (
  SELECT hacker_id, challenge_id, MAX(score) AS max_score
  FROM submissions
  GROUP BY hacker_id, challenge_id
) AS subquery
ON hackers.hacker_id = subquery.hacker_id
GROUP BY hackers.hacker_id, name
HAVING SUM(max_score) > 0
ORDER BY total DESC, hackers.hacker_id ASC;
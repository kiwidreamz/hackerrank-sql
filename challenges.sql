WITH a AS (
    SELECT b.hacker_id, b.chall_total,
      RANK() OVER (ORDER BY b.chall_total DESC) rnk
      FROM (SELECT hacker_id, COUNT(challenge_id) chall_total
            FROM challenges
            GROUP BY hacker_id) b)
SELECT a.hacker_id, Hackers.name, a.chall_total
FROM a
JOIN Hackers
ON a.hacker_id = Hackers.hacker_id
WHERE a.rnk IN (SELECT rnk FROM a
               GROUP BY rnk
               HAVING COUNT(hacker_id) = 1) OR a.rnk = 1
ORDER BY a.chall_total DESC, a.hacker_id;

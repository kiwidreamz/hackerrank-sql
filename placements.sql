/*
SELECT
students.name

FROM students
JOIN friends 
ON friends.friend_id = students.id
JOIN packages 
ON packages.id = students.id

WHERE packages.salary < (
  SELECT salary
  FROM packages
  WHERE id = friends.id
)

ORDER BY (
  SELECT salary
  FROM packages
  WHERE id = friends.id
);
*/

SELECT
    S.NAME
FROM 
    STUDENTS S
    JOIN (SELECT
                F.ID,
                F.FRIEND_ID,
                P1.SALARY AS SAL,
                P2.SALARY AS FRIENDSAL
            FROM
                FRIENDS F
                JOIN PACKAGES P1 USING (ID)
                JOIN PACKAGES P2 ON P2.ID=F.FRIEND_ID) AS PACK USING (ID)
WHERE PACK.FRIENDSAL > PACK.SAL
ORDER BY PACK.FRIENDSAL
SELECT N,
  CASE 
    WHEN P IS null THEN 'Root'
    WHEN N IN (SELECT DISTINCT P FROM BST) THEN 'Inner'
    ELSE 'Leaf'
  END
FROM BST
ORDER BY 1;
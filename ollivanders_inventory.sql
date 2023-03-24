SELECT wands.id, wands_property.age, wands.coins_needed, wands.power
FROM wands
JOIN wands_property ON wands.code = wands_property.code
WHERE wands_property.is_evil = 0
  AND wands.coins_needed = (
    SELECT MIN(coins_needed) 
    FROM wands AS X
    JOIN wands_property AS Y ON (X.CODE = Y.CODE) 
    WHERE X.POWER = wands.POWER AND Y.AGE = wands_property.AGE
  ) 
ORDER BY wands.power DESC, wands_property.age DESC;
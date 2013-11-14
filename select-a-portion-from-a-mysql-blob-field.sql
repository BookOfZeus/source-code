SELECT 
  CONCAT(
    '...', 
    SUBSTR(`description`, 
      LOCATE('Nam rhoncus', `description`) - 10, 
      (LENGTH('Nam rhoncus') + 20)), 
    '...') AS `description`
FROM table 
WHERE `description` LIKE '%Nam rhoncus%';



SELECT N, CASE 
WHEN P IS NULL THEN 'Root' 

WHEN N NOT IN (SELECT P FROM BST WHERE P IS NOT NULL) THEN 'Leaf'
# super important!!
# when do NOT IN must make the set exclude all null. Otherwise it will always return FALSE

ELSE 'Inner' END AS type
FROM BST
ORDER BY N


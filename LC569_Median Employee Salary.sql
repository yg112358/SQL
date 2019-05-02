# Write your MySQL query statement below


SELECT numid AS id, cat AS company, money AS salary
FROM(
SELECT id AS numid, company AS cat, salary AS money
FROM(
SELECT id, company, salary
FROM employee
ORDER BY company, salary, id) sorted_tb)tb

WHERE (
ABS(
(    
SELECT COUNT(*)
FROM(
SELECT id, company, salary
FROM employee
ORDER BY company, salary, id) sorted_tb
WHERE company = cat AND (salary < money OR (salary = money AND id < numid))) - 
(    
SELECT COUNT(*)
FROM(
SELECT id, company, salary
FROM employee
ORDER BY company, salary, id) sorted_tb
WHERE company = cat AND (salary > money OR (salary = money AND id > numid))))  <= 1  
#(salary > money OR (salary = money AND id > numid)) this condition is very important, otherwise there will be problematic when there are duplicate numbers

)

SELECT *
FROM developers
ORDER BY salary DESC;

--Find the developers name who has a second highest salary
SELECT name
FROM developers
WHERE salary= (SELECT MAX(salary)
FROM developers
WHERE salary< (SELECT MAX(salary) FROM developers))
SELECT *
FROM testers
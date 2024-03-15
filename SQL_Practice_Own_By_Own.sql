SELECT *
FROM developers
ORDER BY salary DESC;

--Find the developers name and city who has a second highest salary
SELECT name, city
FROM developers
WHERE salary= (SELECT MAX(salary)
FROM developers
WHERE salary< (SELECT MAX(salary) FROM developers))


SELECT *
FROM testers
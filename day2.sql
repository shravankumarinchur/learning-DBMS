
SELECT *
FROM employee;

SELECT *
FROM branch;

SELECT *
FROM works_with;

SELECT *
FROM branch_supplier;

SELECT *
FROM client;

SELECT *
FROM employee
ORDER BY salary DESC;

SELECT *
FROM employee
ORDER BY sex,first_name,last_name;

SELECT *
FROM employee
LIMIT 5;

SELECT first_name,last_name
FROM employee;

SELECT DISTINCT branch_id
FROM employee;

SELECT COUNT(emp_id)
FROM employee;

SELECT COUNT(super_id)
FROM employee;

SELECT COUNT(emp_id)
FROM employee
WHERE sex='M'AND birth_day >'1970-01-01';

SELECT *
FROM employee
WHERE sex='M'AND birth_day >'1970-01-01';

SELECT AVG(salary)
FROM employee;

SELECT *
FROM employee
WHERE salary > (SELECT  AVG(salary) FROM employee);

SELECT SUM(salary)
FROM employee;

SELECT COUNT(sex),sex
FROM employee
GROUP BY SEX;

SELECT SUM(total_sales),emp_id
FROM works_with
GROUP BY emp_id;
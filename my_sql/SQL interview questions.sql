-- 1. Find the second-highest salary in a table without using LIMIT or TOP.
SELECT MAX(Salary) 
FROM table_name 
WHERE Salary NOT IN (SELECT MAX(Salary) FROM table_name);

-- 2. Write a SQL query to find all employees who earn more than their managers.
SELECT t1.e_name 
FROM employees AS t1 
JOIN employees AS t2 
ON t1.e_id = t2.e_id
WHERE t2.e_type = 'Manager' and t1.salary > t2.salary;
				
				OR

SELECT e1.* FROM employees e1 JOIN employees e2 ON e1.manager_id = (link unavailable) WHERE e1.salary > e2.salary

-- 3. Find the duplicate rows in a table without using GROUP BY.
SELECT * FROM table_name
WHERE COUNT(column_name) != 1;

-- 4. Write a SQL query to find the top 10% of earners in a table.
SELECT f_name FROM table_name
WHERE Salary > (SUM(Salary) * 0.1);

-- 5. Find the cumulative sum of a column in a table.
SELECT column_name, SUM(column_name) 
OVER (ORDER BY rowid) 
FROM table_name;

-- 6. Write a SQL query to find all employees who have never taken a leave.
SELECT e_name 
FROM employees
WHERE COUNT(leaves) = 0
GROUP BY e_name;

-- 7. Find the difference between the current row and the next row in a table.
 SELECT *, column_name - LEAD(column_name) OVER (ORDER BY row_id) FROM table_name;

-- 8. Write a SQL query to find all departments with more than one employee.
SELECT d_name FROM table_name
WHERE COUNT(e_id) > 1
GROUP BY d_name;

-- 9. Find the maximum value of a column for each group without using GROUP BY.
SELECT MAX(column_name) 
FROM table_name
WHERE column_name NOT IN (SELECT MAX(column_name) FROM table_name);

-- 10. Write a SQL query to find all employees who have taken more than 3 leaves in a month
SELECT e_name 
FROM table_name 
WHERE COUNT(leaves) > 3
GROUP BY month_name; 
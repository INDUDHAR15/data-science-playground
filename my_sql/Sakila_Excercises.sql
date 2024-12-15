show databases;
use sakila;
show tables;
select * from film;

-- 1] Retrive the actor ID, first name, last name for all the actor. Sort them by last name and then by first name.
SELECT * FROM actor;
SELECT 
    actor_id, first_name, last_name
FROM
    actor
ORDER BY 3 , 2;

-- 2] Retrive the actor ID, first name, last name for all the actor whose last name equals "WILLIAMS" or "DAVIS"
SELECT 
    actor_id, first_name, last_name
FROM
    actor
WHERE
    last_name = 'WILLIAMS'
        OR last_name = 'DAVIS';
        
-- 3] Write a query against the rental table that returns the IDs of the customers who rented a film on July 5, 2005 
-- 		(use the rental.rental_date column, and you can use the date() function to ignore the time component).
-- 		Include a single row for each distinct customer ID.
SELECT 
    *
FROM
    rental;
    
SELECT DISTINCT
    customer_id
FROM
    rental
WHERE
    DATE(rental_date) = '2005-07-05';

-- 4] Exercise 4-3
SELECT 
    *
FROM
    payment;
SELECT 
    amount
FROM
    payment
WHERE
    amount IN ('1.98' , '7.98', '9.98');

-- 5] Exercise 4-4
select * from customer where last_name like '_A%W%';

-- 6] Exercise 10-1
SELECT 
    CONCAT(c.first_Name, ' ', c.last_name) AS Customer_Name,
    sum(p.Amount) AS Total_Payment
FROM
    customer AS c
        JOIN
    Payment AS p ON c.Customer_id = p.Customer_id
GROUP BY c.first_Name, c.last_Name;

-- 7] Exercise 10-2
SELECT 
    CONCAT(c.first_Name, ' ', c.last_name) AS Customer_Name,
    sum(p.Amount) AS Total_Payment
FROM
    customer AS c
        RIGHT JOIN
    Payment AS p ON c.Customer_id = p.Customer_id
GROUP BY c.first_Name, c.last_Name;

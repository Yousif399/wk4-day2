-- 1. List all customers who live in Texas (use
-- JOINs)
SELECT first_name, last_name, address, district
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
WHERE district Like 'Texas'

-- 2. Get all payments above $6.99 with the Customer's Full name
SELECT first_name, last_name, amount
FROM customer
INNER JOIN payment
ON customer.Customer_id = payment.Customer_id
WHERE amount > 6.99

-- 3. Show all customers names who have made payments over $175(use
-- subqueries)
SELECT first_name, last_name
FROM customer
WHERE Customer_id IN (SELECT Customer_id FROM payment WHERE amount > 175);


-- 4. List all customers that live in Nepal (use the city
-- table)
SELECT country_id FROM country WHERE country like 'Nepal'

SELECT city_id, city FROM city
WHERE country_id = 66 

SELECT address_id FROM address WHERE city_id = 81

SELECT first_name, last_name, address, district
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
WHERE customer.address_id = 326

-- 5. Which staff member had the most
-- transactions?
SELECT * FROM payment

SELECT MAX(first_name), MAX(last_name), MAX(staff.staff_id)
FROM staff
INNER JOIN payment
on staff.staff_id = payment.staff_id

-- 6. How many movies of each rating are
-- there?
-- rates are[NC-17 ,G ,PG-13 ,PG ,R]
SELECT  COUNT(rating) 
FROM film
WHERE rating = 'NC-17'

SELECT  COUNT(rating) 
FROM film
WHERE rating = 'G'

SELECT  COUNT(rating)
FROM film
WHERE rating = 'PG-13'

SELECT  COUNT(rating) 
FROM film
WHERE rating = 'PG'

SELECT  COUNT(rating) 
FROM film
WHERE rating = 'R'
-- 7.Show all customers who have made a single payment
-- above $6.99 (Use Subqueries)
SELECT first_name,last_name
FROM customer
WHERE Customer_id IN (SELECT payment.Customer_id FROM payment WHERE amount > 6.99)


-- 8. How many free rentals did our stores give away?
SELECT * 
FROM rental
INNER JOIN payment
ON rental.rental_id = payment.rental_id
WHERE amount = 0
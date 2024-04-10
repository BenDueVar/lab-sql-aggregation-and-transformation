Use sakila;

SELECT MIN(length) AS min_duration, MAX(length) AS max_duration
FROM film;

SELECT FLOOR(AVG(length) / 60) AS avg_hours, ROUND(AVG(length) % 60,0) AS avg_minutes
FROM film;

SELECT DATEDIFF(MAX(rental_date), MIN(rental_date)) AS days_operating
FROM rental;

SELECT rental_id, DATE_FORMAT(rental_date, '%M') as 'month', DATE_FORMAT(rental_date, '%W') as 'weekday', 
CASE
WHEN DATE_FORMAT(rental_date, '%w') <= 5 then 'Weekday'
WHEN DATE_FORMAT(rental_date, '%w') > 5 then 'Weekend' 
ELSE 'N/A'
END AS 'day_type'
FROM sakila.rental
LIMIT 20;

SELECT title, COALESCE(rental_duration, 'Not Available') AS "days_of_rental"
FROM film
ORDER BY title ASC;

SELECT
CONCAT(first_name, ' ', last_name) AS full_name,
SUBSTRING(email, 1, 3) AS email_prefix
FROM customer
ORDER BY last_name;

SELECT COUNT(DISTINCT title) AS total_films
FROM film;

SELECT rating,  COUNT(*) AS film_count
FROM film
GROUP BY rating;

SELECT rating,
COUNT(*) AS film_count
FROM film
GROUP BY rating
ORDER BY film_count DESC;

SELECT rating, ROUND(AVG(length), 2) AS avg_duration
FROM film
GROUP BY rating
ORDER BY avg_duration DESC;

SELECT rating, ROUND(AVG(length), 2) AS avg_duration
FROM film
GROUP BY rating
HAVING AVG(length) > 120
ORDER BY avg_duration DESC;

SELECT last_name
FROM actor
GROUP BY last_name
HAVING COUNT(*) = 1;



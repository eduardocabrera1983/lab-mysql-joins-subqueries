-- Add you solution queries below:


-- 1. How many copies of the film _Hunchback Impossible_ exist in the inventory system?
SELECT
	film.title,
	COUNT(inventory.film_id) AS film_quantity
FROM sakila.inventory
LEFT JOIN sakila.film
ON inventory.film_id = film.film_id
WHERE title = 'HUNCHBACK IMPOSSIBLE'
;

-- 2. List all films whose length is longer than the average of all the films.
WITH avg_length_cte AS (
    SELECT AVG(length) AS avg_length
    FROM sakila.film
)
SELECT 
    title,
    length
FROM 
    sakila.film, avg_length_cte
WHERE length > avg_length_cte.avg_length
ORDER BY length ASC;


-- 3. Use subqueries to display all actors who appear in the film _Alone Trip_.
SELECT
	actor_cte.actor_id,
	sakila.actor.first_name,
    sakila.actor.last_name
FROM 
    (SELECT
        film_actor.actor_id
    FROM sakila.film
    JOIN sakila.film_actor
    ON sakila.film.film_id = sakila.film_actor.film_id
    WHERE title = 'ALONE TRIP'
    ) AS actor_cte
LEFT JOIN sakila.actor
ON actor_cte.actor_id = sakila.actor.actor_id;


-- 4. 4. Sales have been lagging among young families, and you wish to target all family movies for a promotion. Identify all movies categorized as family films.
SELECT
	film_category.film_id,
    category.name,
    film.title
FROM sakila.film_category
LEFT JOIN sakila.category
ON film_category.category_id = category.category_id
LEFT JOIN sakila.film
ON film_category.film_id = film.film_id
WHERE name = 'Family';


-- 5. Get name and email from customers from Canada using subqueries. Do the same with joins. Note that to create a join, you will have to identify the correct tables with their primary keys and foreign keys, that will help you get the relevant information.
SELECT
first_name,
last_name,
email
FROM sakila.customer
WHERE address_id IN (
SELECT
	address.address_id    
FROM sakila.country
LEFT JOIN sakila.city
	ON country.country_id = city.country_id
LEFT JOIN sakila.address
	ON city.city_id = address.city_id
WHERE country = 'Canada'
)
;


-- 6. Which are films starred by the most prolific actor? Most prolific actor is defined as the actor that has acted in the most number of films. First you will have to find the most prolific actor and then use that actor_id to find the different films that he/she starred.





-- 7. Films rented by most profitable customer. You can use the customer table and payment table to find the most profitable customer ie the customer that has made the largest sum of payments





-- 8. Get the `client_id` and the `total_amount_spent` of those clients who spent more than the average of the `total_amount` spent by each client.





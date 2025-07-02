-- 1. Display all available tables in the Sakila database.
use sakila;
show tables;
-- 2. Retrieve all the data from the tables actor, film and customer.
SELECT *
FROM sakila.actor;

SELECT *
FROM sakila.film;

SELECT *
FROM sakila.customer;

-- 3.Retrieve the following columns from their respective tables:

-- 3.1 Titles of all films from the film table
-- 3.2 List of languages used in films, with the column aliased as language from the language table
-- 3.3 List of first names of all employees from the staff table

SELECT title
FROM sakila.film;

SELECT name AS language
FROM sakila.language;

SELECT first_name
FROM sakila.staff;


-- 4.Retrieve unique release years.

SELECT  DISTINCT release_year
FROM sakila.film;

-- 5. Counting records for database insights:

-- 5.1 Determine the number of stores that the company has.

  SELECT COUNT(store_id) AS Number_of_stores
  FROM sakila.store;
  
-- 5.2 Determine the number of employees that the company has.

SELECT COUNT(staff_id) AS Number_of_employees
FROM sakila.staff;

-- 5.3 Determine how many films are available for rent and how many have been rented.
  SELECT
       (SELECT COUNT(*) FROM SAKILA.INVENTORY
       WHERE INVENTORY_ID NOT IN (
       SELECT INVENTORY_ID FROM SAKILA.RENTAL WHERE RETURN_DATE IS NULL)) AS AVAILABLE_FOR_RENT;
       
       SELECT COUNT(distinct inventory_id) AS RENTED 
       FROM SAKILA.RENTAL  ;
       
-- 5.4 Determine the number of distinct last names of the actors in the database.
       SELECT COUNT(DISTINCT LAST_NAME) AS NUMBER_OF_DISTINCT_LAST_NAMES
       FROM SAKILA.ACTOR;
       
-- 6 Retrieve the 10 longest films.

    SELECT * 
    FROM SAKILA.FILM
    ORDER BY LENGTH DESC
    LIMIT 10;

-- 7 Use filtering techniques in order to:

-- 7.1 Retrieve all actors with the first name "SCARLETT".

    SELECT *
    FROM SAKILA.ACTOR
    WHERE FIRST_NAME ="SCARLETT";
    
-- BONUS:

-- 7.2 Retrieve all movies that have ARMAGEDDON in their title and have a duration longer than 100 minutes.
       
	SELECT *
    FROM SAKILA.FILM
    WHERE TITLE LIKE '%ARMAGEDDON%' AND LENGTH > 100;
    
-- Hint: use LIKE operator. More information here.
-- 7.3 Determine the number of films that include Behind the Scenes content

      SELECT*
      FROM SAKILA.FILM
      WHERE SPECIAL_FEATURES LIKE '%BEHIND THE SCENES%';










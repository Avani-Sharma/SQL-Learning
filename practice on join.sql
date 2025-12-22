use sakila;

select * from actor; -- actor_id(pk)
select * from film_actor; -- actor_id(fk)

select a.first_name, a.actor_id from actor as a
join film_actor as fa where a.actor_id = fa.actor_id;

select fa.actor_id, fa.film_id from film_actor as fa;

select * from film;
select fa.film_id, fa.actor_id, f.film_id, f.title from film_actor as fa
join film as f where fa.film_id = f.film_id;

select * from actor;
select * from film_actor;
select * from film;

select ac.actor_id,first_name, fa.film_id,title from actor as ac 
join film_actor as fa  join film as a where ac.actor_id = fa.actor_id and fa.film_id = a.film_id;

-- Customers who made at least one payment
SELECT DISTINCT c.customer_id, c.first_name
FROM customer c JOIN payment p
ON c.customer_id = p.customer_id;

-- Actor name and film title
SELECT a.first_name, f.title FROM actor a JOIN film_actor fa
ON a.actor_id = fa.actor_id JOIN film f ON fa.film_id = f.film_id;

-- Films that have actors
SELECT DISTINCT f.film_id, f.title
FROM film f JOIN film_actor fa ON f.film_id = fa.film_id;

-- Actors who acted in at least one film
SELECT DISTINCT a.actor_id, a.first_name
FROM actor a JOIN film_actor fa
ON a.actor_id = fa.actor_id;
-- CREATE TABLE reviewer (
-- 	id serial PRIMARY KEY,
-- 	name varchar,
-- 	email varchar,
-- 	karma integer CHECK (karma <= 7 and karma >= 0)
-- );
--
-- CREATE TABLE restaurant (
-- 	id serial PRIMARY KEY,
--   name varchar,
--   address varchar,
--   category varchar
-- );
--
-- CREATE TABLE reviews (
--   id serial PRIMARY KEY,
--   reviewer_id integer REFERENCES reviewer (id),
--   stars integer CHECK (stars <= 5 and stars >= 1),
--   title varchar,
--   review varchar,
--   restaurant_id integer REFERENCES restaurant (id)
-- );

-- INSERT into restaurant values
-- 	(default, 'Anis', '1201 Grandview Ave', 'French'),
-- 	(default, 'La Fonda', '101 Main St', 'Latin'),
-- 	(default, 'Fellinis', '121 Peachtree St.', 'Pizza'),
-- 	(default, 'Argosy', '535 Flat Shoals Ave', 'American');
--
-- INSERT into reviewer values
-- 	(default, 'John', 'j@j.com', 3),
-- 	(default, 'Isaac', 'isaac@yahoo.com', 2),
-- 	(default, 'Hope', 'hope@jh.com', 7),
-- 	(default, 'Ben', 'ben@gmail.com', 5),
-- 	(default, 'Alana', 'a@alana.com', 5);

-- INSERT into reviews values
-- 	(default, 1, 4, 'Gettin'' my joie de vivre on', 'Delicious croissants in the A', 1),
-- 	(default, 2, 5, 'Delicious', 'Super authentic', 1),
-- 	(default, 2, 3, 'Good cubans', 'Awesome paella too', 2),
-- 	(default, 4, 1, 'Made me throw up', 'Don''t get the white pizza', 3),
-- 	(default, 5, 5, 'Amazing', 'Best burger in Atlanta', 4),
-- 	(default, 3, 3, 'Pretty good, pretty cheap', 'large slices', 3);

-- Answer These Questions With a Query

-- List all the reviews for a given restaurant given a specific restaurant ID.
select
	*
from
	reviews
where
	restaurant_id = 1;

OR

select
	review
from
	reviews
where
	restaurant_id = 1;

-- List all the reviews for a given restaurant, given a specific restaurant name.
select
	*
from
	reviews, restaurant
where
	restaurant.id = reviews.restaurant_id and restaurant.name = 'Anis';

-- List all the reviews for a given reviewer, given a specific author name.

select
	*
from
	reviewer, reviews
where
	reviewer.id = reviews.reviewer_id and reviewer.name = 'John';
-- List all the reviews along with the restaurant they were written for. In the query result, select the restaurant name and the review text.
select
	restaurant.name, reviews.review
from
	restaurant, reviews
where
	restaurant.id = reviews.restaurant_id

-- Get the average stars by restaurant. The result should have the restaurant name and its average star rating.

select
	avg(reviews.stars), restaurant.name
from
	restaurant, reviews
where
	restaurant.id = reviews.restaurant_id
group by
	restaurant.id;
-- Get the number of reviews written for each restaurant. The result should have the restaurant name and its review count.

select
	count(reviews), restaurant.name
from
	reviews, restaurant
where
	reviews.restaurant_id = restaurant.id
group by
	restaurant.id;
-- List all the reviews along with the restaurant, and the reviewer's name. The result should have the restaurant name, the review text, and the reviewer name. Hint: you will need to do a three-way join - i.e. joining all three tables together.

select
	restaurant.name, reviewer.name, reviews.review
from
	restaurant
inner join
	reviews on reviews.restaurant_id = restaurant.id
inner join
	reviewer on reviewer.id = reviews.reviewer_id;

-- Get the average stars given by each reviewer. (reviewer name, average star rating)

select
	avg(reviews.stars), reviewer.name
from
	reviews
inner join
	reviewer on reviews.reviewer_id = reviewer.id
group by
	reviewer.id
-- Get the lowest star rating given by each reviewer. (reviewer name, lowest star rating)

select
	min(reviews.stars), reviewer.name
from
	reviews
inner join
	reviewer on reviews.reviewer_id = reviewer.id
group by
	reviewer.id
-- Get the number of restaurants in each category. (category name, restaurant count)

select
	count(restaurant), restaurant.category
from
	restaurant
group by
	restaurant.category
-- Get number of 5 star reviews given by restaurant. (restaurant name, 5-star count)

select
	count(reviews.stars), restaurant.name
from
	reviews, restaurant
where
	reviews.restaurant_id = restaurant.id and reviews.stars = 5
group by
	restaurant.name
-- Get the average star rating for a food category. (category name, average star rating)

select
	avg(reviews.stars), restaurant.category
from
	reviews, restaurant
where
	reviews.restaurant_id = restaurant.id
group by
	restaurant.category

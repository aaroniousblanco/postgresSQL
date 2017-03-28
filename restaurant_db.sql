CREATE TABLE restaurant (
  id serial primary key,
  name varchar,
  distance real,
  stars integer,
  category varchar,
  favorite_dish varchar,
  does_takeout boolean,
  last_time_I_ate_here date
);

-- Insert Data
--
-- Write INSERT statements to enter data into the restaurant table. You can paste the statements into the psql shell.

insert into restaurant values
  (default, 'Aaron', 1.3, 5, 'Mexican', 'burrito', TRUE, '2016-10-11');
insert into restaurant values
  (default, 'John', 2.3, 3, 'Sushi', 'edamame', FALSE, '2016-1-11');
insert into restaurant values
  (default, 'James', 5.6, 2, 'Chinese', 'rice', TRUE, '2015-10-11');
insert into restaurant values
  (default, 'Hope', 4.3, 5, 'Indian', 'saag paneer', TRUE, '2017-1-11');

update restaurant set name = 'Jalisco''s' where id = 1;

  Writing Queries

  Write queries to get

  -- The names of the restaurants that you gave a 5 stars to
  select name from restaurant where stars = 5;

  -- The favorite dishes of all 5-star restaurants
  select favorite_dish from restaurant where stars = 5;

  -- The the id of a restaurant by a specific restaurant name, say 'NaanStop'
  select id from restaurant where name = 'Hope';

  -- restaurants in the category of 'BBQ'
  select name from restaurant where category = 'Mexican';

  -- restaurants that do take out
  select name from restaurant where does_takeout = TRUE;

  -- restaurants that do take out and is in the category of 'BBQ'
  select name from restaurant where does_takeout = TRUE and category = 'Mexican';

  -- restaurants within 2 miles
  select name from restaurant where distance <= 2;

  -- restaurants you haven't ate at in the last week
  select name from restaurant where last_time_I_ate_here < '2017-03-20';

  -- restaurants you haven't ate at in the last week and has 5 stars
  select name from restaurant where last_time_I_ate_here < '2017-03-20' and stars = 5;


  ---

--   Aggregation and Sorting Queries
--
-- list restaurants by the closest distance.
select * from restaurant order by distance desc;
-- list the top 2 restaurants by distance.
 select * from restaurant order by distance desc limit 2;
-- list the top 2 restaurants by stars.
 select * from restaurant order by stars desc limit 2;
-- list the top 2 restaurants by stars where the distance is less than 2 miles.
select * from
 restaurant
where
 distance < 2
order by
 stars desc limit 2;
-- count the number of restaurants in the db.
select count(*) from restaurant;
-- count the number of restaurants by category.
select
	category,
	count(category)
from
	restaurant
group by
	category;
-- get the average stars per restaurant by category.
select
	category,
	round(avg(stars), 2)
from
	restaurant
group by
	category;
-- get the max stars of a restaurant by category.

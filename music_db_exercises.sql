-- CREATE TABLE artist (
--   id serial primary key,
--   name varchar
-- );
--
-- CREATE TABLE album (
--   id serial primary key,
--   name varchar,
--   release_date date,
--   artist_id int REFERENCES artist (id)
-- );
--
--
-- CREATE TABLE writer (
--   id serial primary key,
--   name varchar
-- );
--
-- CREATE TABLE song (
--   id serial primary key,
--   name varchar,
--   writer_id int REFERENCES writer (id)
-- );
--
-- CREATE TABLE track (
--   id serial primary key,
--   name varchar,
--   duration time,
--   artist_id int REFERENCES artist (id),
--   album_id int REFERENCES album (id),
--   song_id int REFERENCES song (id)
-- );

--What are tracks for a given album?

select  song.name as song_name, album.name as album_name
from album

left outer join
track on track.album_id = album.id
left outer join
song on track.song_id = song.id
where album.name = 'Popstar'

-- What are the albums produced by a given artist?

select
	album.name, artist.name
from
	album
inner join
	artist on album.artist_id = artist.id
where artist.name = 'Toe-Be';

--What is the track with the longest duration?
select song.name, track.duration
from
track, song
where track.song_id = song.id
order by track.duration desc limit 1

-- What are the albums released in the 60s? 70s? 80s? 90s?

select
	album.name, album.release_date
from
	album
where album.release_date between '1989-12-31' and '1999-12-31';

-- How many albums did a given artist produce in the 90s?

select
	count(album.name), artist.name
from
	album
inner join
	artist on album.artist_id = artist.id
where
	album.release_date <= '1999-12-31' AND album.release_date > '1989-12-31'
group by artist.name

-- What is each artist's latest album?

select
	joined.name, album.name, album.release_date
from
	album
inner join
	(
	select artist.name, max(album.release_date) as Latest

	from album

	inner join

	artist on artist.id = album.artist_id
 	group by artist.name
	) as joined
 on joined.latest = album.release_date;

-- List all albums along with its total duration based on summing the duration of its tracks.

select
	album.name, sum(track.duration)
from
	album
inner join
	track on track.album_id = album.id

group by album.id;

-- What is the album with the longest duration?

select
	album.name, sum(track.duration)
from
	album
inner join
	track on track.album_id = album.id

group by album.name
order by sum(track.duration) DESC limit 1;

-- Who are the 5 most prolific artists based on the number of albums they have recorded?
select
	artist.name, count(album.name)
from
	album
inner join
	artist on album.artist_id = artist.id

group by artist.name
order by count(album.name) DESC limit 5;

-- What are all the tracks a given artist has recorded?

select
	artist.name as artist_name, song.name as song_name
from
	artist
inner join
	album on album.artist_id = artist.id
inner join
	track on track.album_id = album.id
inner join
	song on song.id = track.song_id

where artist.name = 'Toe-Be';

-- What are the top 5 most often recorded songs?

select
	count(song.name), song.name
from
	song
inner join
	track on track.song_id = song.id
group by
	song.id
order by
	count(song.name) desc limit 5;

-- Who are the top 5 song writers whose songs have been most often recorded?

select writer.name, song_name

from writer

inner join
(select
	count(song.name), song.name as song_name, song.writer_id
from
	song
inner join
	track on track.song_id = song.id
group by
	song.id
order by
	count(song.name) desc limit 5
	) as filtered
	on writer.id = filtered.writer_id;

-- Who is the most prolific song writer based on the number of songs he has written?

select
	count(song.id), writer.name
from
	song
inner join
	writer on writer.id = song.writer_id
group by
	writer.name
order by
	count(song.id) desc limit 1;

-- What songs has a given artist recorded?

select DISTINCT artist.name, song.name
from artist

inner join
album on artist.id = album.artist_id
inner join
track on track.album_id = album.id
inner join
song on song.id = track.song_id

-- Who are the song writers whose songs a given artist has recorded?

select
	distinct artist.name, writer.name
from
	artist
inner join
	album on artist.id = album.artist_id
inner join
	track on album.id = track.album_id
inner join
	song on song.id = track.song_id
inner join
	writer on writer.id = song.writer_id

-- Who are the artists who have recorded a given song writer's songs?
select
	distinct artist.name as artist, song.name as song, writer.name as writer
from
	artist
inner join
	album on artist.id = album.artist_id
inner join
	track on album.id = track.album_id
inner join
	song on song.id = track.song_id
inner join
	writer on writer.id = song.writer_id

where song.name = 'A Wall So Low'

-- Bonus Challenge 1

-- Allow that an album may have multiple artists:

-- a lead artist
-- any number of collaborators
-- SQL queries to answer the following:

-- Given a lead artist, what collaborators has he worked with? Hint: you can give the same table 2 different aliases. For example, a query to find all people you follow would look like `select from "user" as follower, "user" as followee where ...`*

-- Aaron's solution
select
	artist.name as lead_artist, collabs.name as collab_artist
from
(select
	*, collaborators.artist_id as collab_id
from
	collaborators
inner join
	artist on artist.id = collaborators.artist_id) as collabs
inner join
	album on collabs.album_id = album.id
inner join
	artist on artist.id = album.artist_id;

-- Aaron's solution without a *

select
	artist.name as lead_artist, collabs.collab_artist
from
(select
	collaborators.artist_id as collab_id, collaborators.album_id as album_id, artist.name as collab_artist
from
	collaborators
inner join
	artist on artist.id = collaborators.artist_id) as collabs
inner join
	album on collabs.album_id = album.id
inner join
	artist on artist.id = album.artist_id;

-- Jonathan's solution
	select
	artist.name, collab.name
from
	album
inner join
	(
	select
	artist.name, collaborators.album_id as album_id, collaborators.artist_id as artist_id
	from
	artist
inner join
	collaborators on collaborators.artist_id = artist.id
inner join
	album on album.id = collaborators.album_id) as collab
	on collab.album_id = album.id
	inner join
	artist on artist.id = album.artist_id

-- Super challenge: given an artist who has worked as a collaborator, who are the other collaborators he has worked with?

select
	*, collab.artist_name as collab_artist
from
	(select
	distinct artist.name as artist_name, artist.id as artist_id
	from
		collaborators
	inner join
		artist on collaborators.artist_id = artist.id) as collab
	inner join
		album on collab.artist_id = album.artist_id
	inner join
		collaborators on album.id = collaborators.album_id
	inner join
		artist on collaborators.artist_id = artist.id
where artist_name = 'Aerosmuff'

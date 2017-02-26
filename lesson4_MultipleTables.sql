-- Most of the time, data is distributed across multiple tables in the database.
-- Imagine a database with two tables, artists and albums. An artist can produce
-- many different albums, and an album is produced by an artist.
--
-- The data in these tables are related to each other. Through SQL, we can write
-- queries that combine data from multiple tables that are related to one
-- another. This is one of the most powerful features of relational databases.

-- We have created a table named albums for you. Create a second table named
-- artists.
CREATE TABLE artists(id INTEGER PRIMARY KEY, name TEXT);

-- A primary key serves as a unique identifier for each row or record in a given
-- table. The primary key is literally an id value for a record. We're going to
-- use this value to connect artists to the albums they have produced.
--
-- By specifying that the id column is the PRIMARY KEY, SQL makes sure that:
--
--    None of the values in this column are NULL
--    Each value in this column is unique
--
-- A table can not have more than one PRIMARY KEY column

-- Here, artist_id is a foreign key in the albums table. We can see that Michael
-- Jackson has an id of 3 in the artists table. All of the albums by Michael
-- Jackson also have a 3 in the artist_id column in the albums table.
--
-- This is how SQL is linking data between the two tables. The relationship
-- between the artists table and the albums table is the id value of the artists.

-- One way to query multiple tables is to write a SELECT statement with multiple
-- table names separated by a comma. This is also known as a cross join. Here,
-- albums and artists are the different tables we are querying.
SELECT albums.name, albums.year, artists.name FROM albums, artists;

-- When querying more than one table, column names need to be specified by
-- table_name.column_name. Here, the result set includes the name and year
-- columns from the albums table and the name column from the artists table.

-- Unfortunately the result of this cross join is not very useful. It combines
-- every row of the artists table with every row of the albums table. It would
-- be more useful to only combine the rows where the album was created by the
-- artist.

-- In SQL, joins are used to combine rows from two or more tables. The most
-- common type of join in SQL is an inner join.
--
-- An inner join will combine rows from different tables if the join condition
-- is true. Let's look at the syntax to see how it works.
--
--    1. SELECT * specifies the columns our result set will have. Here, we want
--       to include every column in both tables.
--    2. FROM albums specifies the first table we are querying.
--    3. JOIN artists ON specifies the type of join we are going to use as well
--       as the name of the second table. Here, we want to do an inner join and
--       the second table we want to query is artists.
--    4. albums.artist_id = artists.id is the join condition that describes how
--       the two tables are related to each other. Here, SQL uses the foreign
--       key column artist_id in the albums table to match it with exactly one
--       row in the artists table with the same value in the id column. We know
--       it will only match one row in the artists table because id is the
--       PRIMARY KEY of artists.
SELECT
  *
FROM
  albums
JOIN artists ON
  albums.artist_id = artists.id;

-- Outer joins also combine rows from two or more tables, but unlike inner
-- joins, they do not require the join condition to be met. Instead, every row
-- in the left table is returned in the result set, and if the join condition
-- is not met, then NULL values are used to fill in the columns from the right
-- table.
--
-- The left table is simply the first table that appears in the statement.
-- Here, the left table is albums. Likewise, the right table is the second table
-- that appears. Here, artists is the right table.

SELECT
  *
FROM
  albums
LEFT JOIN artists ON
  albums.artist_id = artists.id;

-- AS is a keyword in SQL that allows you to rename a column or table using an
-- alias. The new name can be anything you want as long as you put it inside of
-- single quotes. Here we want to rename the albums.name column as 'Album', and
-- the artists.name column as 'Artist'.
--
-- It is important to note that the columns have not been renamed in either
-- table. The aliases only appear in the result set.
SELECT
  albums.name AS 'Album',
  albums.year,
  artists.name AS 'Artist'
FROM
  albums
JOIN artists ON
  albums.artist_id = artists.id
WHERE
  albums.year > 1980;

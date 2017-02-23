-- Create a table named "celebs" which contains
-- three columns (id, name, age) which are of
-- type (INTEGER, TEXT, INTEGER)
CREATE TABLE celebs(
  	id INTEGER,
  	name TEXT,
  	age INTEGER
);

SELECT * FROM celebs;

-- Add rows to the celebs table
INSERT INTO celebs (id, name, age)
VALUES (1, 'Justin Bieber', 21);

INSERT INTO celebs (id, name, age)
VALUES (2, 'Beyonce Knowles', 33);

INSERT INTO celebs (id, name, age)
VALUES (3, 'Jeremy Lin', 26);

INSERT INTO celebs (id, name, age)
VALUES (4, 'Taylor Swift', 26);

SELECT * FROM celebs;

-- Edit pre-existing rows in the table
UPDATE celebs
SET age = 22
WHERE id = 1;

SELECT * FROM celebs;

-- Add a new column to the table.
ALTER TABLE celebs ADD COLUMN twitter_handle TEXT;

SELECT * FROM celebs;

-- Update the new row
UPDATE celebs
SET twitter_handle = '@taylorswift13'
WHERE id = 4;

SELECT * FROM celebs;

-- Delete all the rows that have a NULL
-- value in the twitter_handle column
DELETE FROM celebs WHERE twitter_handle IS NULL;

SELECT * FROM celebs;

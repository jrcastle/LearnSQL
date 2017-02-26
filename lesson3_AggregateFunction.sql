-- This lesson has a table with a list of apps
SELECT * FROM fake_apps;

-- COUNT() is a function that takes the name of
-- a column as an argument and counts the number
-- of rows where the column is not NULL.
SELECT COUNT(*) FROM fake_apps;

-- Return the number of free apps in the table
SELECT COUNT(*) FROM fake_apps
WHERE price = 0;

-- Count the number of apps at each price.
SELECT price, COUNT(*) FROM fake_apps
GROUP BY price;

-- Count the total number of apps at each
-- price that have been downloaded more
-- than 20,000 times.
SELECT price, COUNT(*) FROM fake_apps
WHERE downloads > 20000
GROUP BY price;

-- SUM() is a function that takes the name
-- of a column as an argument and returns
-- the sum of all the values in that column.
-- Here, it adds all the values in the downloads
-- column.
SELECT SUM(downloads) FROM fake_apps;

-- Calculate the total number of downloads for
-- each category.
SELECT category, SUM(downloads) FROM fake_apps
GROUP BY category;

-- MAX() is a function that takes the name of
-- a column as an argument and returns the largest
-- value in that column.
SELECT MAX(downloads) FROM fake_apps;

-- Return the names of the most downloaded apps
-- in each category.
SELECT name, category, MAX(downloads) FROM fake_apps
GROUP BY category;

-- MIN() is a function that takes the name of a column
-- as an argument and returns the smallest value in
-- that column.
SELECT MIN(downloads) FROM fake_apps;

-- Return the names of the apps that have been
-- downloaded the least number of times in each category.
SELECT name, category, MIN(downloads)
FROM fake_apps GROUP BY category;

-- The AVG() function works by taking a column name
-- as an argument and returns the average value for
-- that column.
SELECT AVG(downloads) FROM fake_apps;

-- Calculate the average number of downloads at each price.
SELECT price, AVG(downloads) FROM fake_apps
GROUP BY price;

-- Make the result set more readable by rounding the
-- average number of downloads to two decimal places
-- for each price.
SELECT price, ROUND(AVG(downloads), 2) FROM fake_apps
GROUP BY price;

-- ROUND() is a function that takes a column name and an
-- integer as an argument. It rounds the values in the column
-- to the number of decimal places specified by the integer.
-- Round the average number of downloads to the nearest integer
-- for each price.
SELECT price, ROUND(AVG(downloads)) FROM fake_apps
GROUP BY price;

-- ----------------------------------------------------------------------
-- Congratulations! You just learned how to use aggregate functions to
-- perform calculations on your data. What can we generalize so far?
--
--    Aggregate functions combine multiple rows together to form a single value of more meaningful information.
--    COUNT takes the name of a column(s) as an argument and counts the number of rows where the value(s) is not NULL.
--    GROUP BY is a clause used with aggregate functions to combine data from one or more columns.
--    SUM() takes the column name as an argument and returns the sum of all the values in that column.
--    MAX() takes the column name as an argument and returns the largest value in that column.
--    MIN() takes the column name as an argument and returns the smallest value in that column.
--    AVG() takes a column name as an argument and returns the average value for that column.
--    ROUND() takes two arguments, a column name and the number of decimal places to round the values in that column.

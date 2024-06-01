
-- VIEW (Virtual Table) --
SELECT title, released_year, genre, rating, first_name, last_name FROM reviews
JOIN series ON series.id= reviews.reviewer_id
JOIN reviewers ON reviews.id = reviews.reviewer_id;

CREATE VIEW full_reviews AS
SELECT title, released_year, genre, rating, first_name, last_name FROM reviews
JOIN series ON series.id= reviews.reviewer_id
JOIN reviewers ON reviews.id = reviews.reviewer_id;

SHOW TABLES; -- VIRTUAL TABLE (to make the query short/understandable)

SELECT * FROM full_reviews;
SELECT * FROM full_reviews WHERE genre = 'Animation';
SELECT genre, AVG(rating) FROM full_reviews GROUP BY genre;

DELETE FROM full_reviews WHERE released_year = 2010; 
-- ERROR: beacsue it's only a VIRTUAL table NOT actual one -- 
-- Only some portion (limited) are Updateable/Insertable --

CREATE VIEW ordered_series AS 
SELECT * FROM series ORDER BY released_year;

SELECT * FROM ordered_series;

CREATE VIEW ordered_series AS 
SELECT * FROM series ORDER BY released_year DESC; -- ERROR: though its not an actual table but it doesn't allow to create table in SAME NAME --

CREATE OR REPLACE VIEW ordered_series AS 
SELECT * FROM series ORDER BY released_year; -- USE: 'create or replace/ALTER VIEW' option to get rid of this situation--

DROP VIEW ordered_series; -- Droped the VIRTUAL TABlE --


-- GROUP BY HAVING (filter down) --
SELECT title, AVG(rating) FROM full_reviews 
GROUP BY title HAVING COUNT(rating) > 1 ;

-- WITH ROLLUP (higher level summary stats of the column) -- 
SELECT title, AVG(rating) FROM full_reviews 
GROUP BY title WITH ROLLUP;

SELECT title, COUNT(rating) FROM full_reviews 
GROUP BY title WITH ROLLUP;



-- ====== Basic SQL Modes ======= --
SELECT @@GLOBAL.sql_mode;
SELECT @@SESSION.sql_mode;

-- STRICT_TRANS_TABLE (ON) is very important --
-- Read DOCMENTATION to learn more --


















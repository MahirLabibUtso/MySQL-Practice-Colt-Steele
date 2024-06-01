-- VARCHAR (Variable in length) --
-- Varies Length input data = CHAR is OPTIMIZED Space --
CREATE TABLE friends (name VARCHAR(10));
INSERT INTO friends (name) VALUES ('Jemmy'),('Jon Hender'),('Tim');
SELECT * from friends;
INSERT INTO friends (name) VALUES ('asdsd asdsd asdsads'); -- ERROR for LIMIT--
DESC friends;


-- CHAR (Fixed in length) --
-- CHAR(3)-> only 3 character are "Allowed" --
-- Less than that will be filled & stored with Right-Padding & during retrival it remove the padding & displays the Original --

-- Similar/Fixed Length input data = CHAR is OPTIMIZED Space --
-- ex. ZIP, STATE, Y/N flag -- 

CREATE TABLE address (location_abb CHAR(2));
INSERT INTO address (location_abb) VALUES ('CA'),('NY'),('TX');
INSERT INTO address (location_abb) VALUES ('Y');
SELECT * from address;
SELECT CHAR_LENGTH(location_abb) FROM address;
INSERT INTO address (location_abb) VALUES ('Ohio'); -- ERROR LIMIT --
DESC address;

-- NUMBERS --
-- For "Memory-Optimazitation" read documentation about (TINYINT, SMALLINT, MEDIUMINT, INT, BIGINT - SIGHNED, UNSIGNED) --

-- Decimal --
CREATE TABLE products (price DECIMAL(5,2)); -- 5=total digits, 2=Digits after decimal - TOTAL 3 BEFROE DECIMAL --
INSERT INTO products (price) VALUES (4.59);
SELECT * FROM products;

INSERT INTO products (price) VALUES (999.59);
SELECT * FROM products;

INSERT INTO products (price) VALUES (8345.5); -- ERROR --

INSERT INTO products (price) VALUES (7.023); -- WARNINGS but Inserted with TRUNCATED --
INSERT INTO products (price) VALUES (7.026); -- WARNINGS but Inserted with TRUNCATED + ROUNDED UP --
SHOW WARNINGS;
SELECT * FROM products;

INSERT INTO products (price) VALUES (7.124543);
SELECT * FROM products;

-- FLOAT & DOUBLE (Sotre Large-Number with "Less-Space" BUTTTTTT with Less-Precision) --
-- FLOAT "losses precision" after 7 digits & Double losses precision after 15 --
CREATE TABLE num (x FLOAT, y DOUBLE);
INSERT INTO num (x,y) VALUES (9.123456789, 7.1234567892345678907);
INSERT INTO num (x,y) VALUES (9.12345678, 7.1234567892);
SELECT * FROM num;                         -- READ: Documentation of choosing the write DECIMAL-TYPES --


-- DATE / TIME / DATETIME --
SHOW TABLES;
CREATE TABLE people (
	name VARCHAR(100),
	birthdate DATE,
	birthtime TIME,
	birthdt DATETIME
); 
DESC people;

INSERT INTO people(name, birthdate, birthtime, birthdt)
VALUES ('Robin', '2002-12-25','9:00:05','2002-12-25 9:00:05');

INSERT INTO people(name, birthdate, birthtime, birthdt)
VALUES ('Lulu', '1996-03-21','11:56:00','1996-03-21 11:56:00');

INSERT INTO people(name, birthdate, birthtime, birthdt)
VALUES ('Zee', '2009-06-14','01:23:13','2009-06-14 01:23:13');

SELECT * FROM people;

-- CURRENT_TIME / CURRENT_DATE / CURRENT_TIMESTAMP --

SELECT CURTIME();
SELECT CURDATE();
SELECT NOW(); -- TIME_STAMP(Date & Time) --

INSERT INTO people(name, birthdate, birthtime, birthdt)
VALUES ('Jahid', CURDATE(), CURTIME(), NOW());

SELECT * FROM people;

SELECT birthdate FROM people;

SELECT birthdate, DAY(birthdate) FROM people;
SELECT birthdate, DAY(birthdate), DAYOFWEEK(birthdate) FROM people;
SELECT birthdate, DAY(birthdate), DAYOFWEEK(birthdate), DAYOFYEAR(birthdate) FROM people;

SELECT birthdate, MONTHNAME(birthdate) FROM people;
SELECT birthdate, WEEK(birthdate) FROM people;

-- will not present Exact-Time cz taking current time --
SELECT birthtime, MONTHNAME(birthtime) FROM people; 
SELECT birthtime, YEAR(birthtime) FROM people; 

SELECT name, birthdt, MONTHNAME(birthdt) FROM people; 
SELECT name, birthdt, MONTHNAME(birthdt), YEAR(birthdt) FROM people; 

SELECT name, birthtime, HOUR(birthtime), MINUTE(birthtime), SECOND(birthtime) FROM people; 
SELECT name, birthdt, HOUR(birthdt) FROM people;
-- can also extract by DAY & TIME --
SELECT name, birthdt, TIME(birthdt), DAY(birthdt)  FROM people; 

-- DATE FORMATING --
-- 'April 23 1995'--

SELECT birthdate, CONCAT(MONTHNAME(birthdate), ' ', DAY(birthdate), ' ', YEAR(birthdate)) FROM people; -- (Previously learnt) --
SELECT birthdate, DATE_FORMAT(birthdate, '%M %d %Y') FROM people;
SELECT birthdate, DATE_FORMAT(birthdate, '%M-%d-%Y') FROM people; -- Read Documentation to learn more options --
SELECT birthdate, DATE_FORMAT(birthdate, '%M/%D/%Y') FROM people;

SELECT birthdt, DATE_FORMAT(birthdt, '%H:%i') FROM people;
SELECT birthdt, DATE_FORMAT(birthdt, '%r') FROM people; 
SELECT birthdt, DATE_FORMAT(birthdt, 'Born on: %r') FROM people; 

-- DATE MATH --
SELECT birthdate FROM people;
SELECT CURDATE();

SELECT DATEDIFF(CURDATE(), birthdate) FROM people;
SELECT birthdate, DATEDIFF(CURDATE(), birthdate) FROM people;
SELECT birthdate, DATEDIFF(CURDATE(), birthdate) AS 'Days ago' FROM people;

SELECT birthdate, DATEDIFF(CURDATE(), birthtime) FROM people; -- Results 0 which is "Not Correct" - it's has differnet func below --

-- DATE_ADD / DATE_SUB  --
SELECT DATE_ADD(CURDATE(), INTERVAL 1 YEAR);
SELECT DATE_ADD(CURDATE(), INTERVAL 1 MONTH);
SELECT DATE_ADD('13-05-24 23:59:00', INTERVAL 1 MINUTE);
SELECT DATE_ADD('23:59:00', INTERVAL 1 MINUTE);

SELECT DATE_SUB(CURDATE(), INTERVAL 1 YEAR);
SELECT birthdate, DATE_ADD(birthdate, INTERVAL 18 YEAR) AS '18th Birthday' FROM people;

-- TIMEDIFF / ADDTIME / SUBTIME 
SELECT TIMEDIFF(CURTIME(), '07:00:00');
SELECT NOW() - INTERVAL 18 YEAR;
SELECT name, birthtime, birthtime + INTERVAL 18 YEAR AS 'Will Eligible for Drink (18 years)' FROM people;


-- TIMESTAMP --
-- (Saves-Memory comparing to DATETIME)(Downside: Year-Range) --

CREATE TABLE captions(
text VARCHAR(100),
created_at TIMESTAMP default CURRENT_TIMESTAMP
);

INSERT INTO captions (text) VALUES ('Just me & the girls chilling');
INSERT INTO captions (text) VALUES ('Beautiful Sunset');
SELECT * FROM captions;

CREATE TABLE captions2(
text VARCHAR(100),
created_at TIMESTAMP default CURRENT_TIMESTAMP,
updated_at TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);


INSERT INTO captions2 (text) VALUES ('I love life!');
INSERT INTO captions2 (text) VALUES ('Beautiful Sunset everywhere');
SELECT * FROM captions2;

UPDATE captions2 SET text='I love life!!!!!!!!' WHERE text='I love life!';
SELECT * FROM captions2;


-- PRACTICE EXERCISE --
SELECT CURTIME();
SELECT CURDATE();
SELECT DAYOFWEEK(CURDATE());
SELECT DATE_FORMAT(CURDATE(),'%W');
SELECT DATE_FORMAT(CURDATE(), '%m/%d/%y');
SELECT DATE_FORMAT(CURTIME(), '%M %D at %H:%i');

CREATE TABLE tweets(
content VARCHAR(180),
username VARCHAR(100),
time_created  TIMESTAMP default CURRENT_TIMESTAMP
);

INSERT INTO tweets(content, username) VALUES ('this is my frist tweet', 'Alex');
SELECT * FROM tweets;
-- DROP TABLE tweets;






































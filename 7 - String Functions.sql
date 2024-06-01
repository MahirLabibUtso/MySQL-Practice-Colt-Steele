CREATE DATABASE book_shop;
USE book_shop;

CREATE TABLE books(
		book_id INT AUTO_INCREMENT,
		title VARCHAR(100),
		author_fname VARCHAR(100),
		author_lname VARCHAR(100),
		released_year INT,
		stock_quantity INT,
		pages INT,
		PRIMARY KEY(book_id)
	);

DESC books;

INSERT INTO books (title, author_fname, author_lname, released_year, stock_quantity, pages) VALUES
('The Namesake', 'Jhumpa', 'Lahiri', 2003, 32, 291),
('Norse Mythology', 'Neil', 'Gaiman',2016, 43, 304),
('American Gods', 'Neil', 'Gaiman', 2001, 12, 465),
('Interpreter of Maladies', 'Jhumpa', 'Lahiri', 1996, 97, 198),
('A Hologram for the King: A Novel', 'Dave', 'Eggers', 2012, 154, 352),
('The Circle', 'Dave', 'Eggers', 2013, 26, 504),
('The Amazing Adventures of Kavalier & Clay', 'Michael', 'Chabon', 2000, 68, 634),
('Just Kids', 'Patti', 'Smith', 2010, 55, 304),
('A Heartbreaking Work of Staggering Genius', 'Dave', 'Eggers', 2001, 104, 437),
('Coraline', 'Neil', 'Gaiman', 2003, 100, 208),
('What We Talk About When We Talk About Love: Stories', 'Raymond', 'Carver', 1981, 23, 176),
("Where I'm Calling From: Selected Stories", 'Raymond', 'Carver', 1989, 12, 526),
('White Noise', 'Don', 'DeLillo', 1985, 49, 320),
('Cannery Row', 'John', 'Steinbeck', 1945, 95, 181),
('Oblivion: Stories', 'David', 'Foster Wallace', 2004, 172, 329),
('Consider the Lobster', 'David', 'Foster Wallace', 2005, 92, 343);

SELECT * FROM books;

-- CONCAT --
SELECT CONCAT(author_fname, ' ', author_lname) FROM books;
SELECT CONCAT(author_fname, ' ', author_lname) AS author_name FROM books; -- with Rename column option --
SELECT CONCAT_WS('-', title, author_fname, author_lname) FROM books; -- with WithSeparator option --

-- SUBSTRING/SUBSTR --
SELECT SUBSTRING('Hello World', 4,7); -- setting selection limit --
SELECT SUBSTRING('Hello World', 7); -- selection starting & will keep rest of that point --
SELECT SUBSTRING('Hello World', -2); -- selection from EMD point --
SELECT SUBSTRING('Hello World', -3, 1); -- selection from EMD point & go neg 3 and count 1(give that, dont move) --

SELECT title FROM books;
SELECT SUBSTRING(title, 1,15) FROM books;
SELECT SUBSTR(title, 1,15) FROM books; -- Synonum --

SELECT SUBSTR(author_lname, 1,1) FROM books;
SELECT SUBSTR(author_lname, 1,1), author_lname FROM books;
SELECT SUBSTR(author_lname, 1,1) AS Initial, author_lname FROM books;

-- SUBSTRING/SUBSTR + CONCAT --
SELECT SUBSTR(title, 1, 10) FROM books; -- before CONCAT --
SELECT CONCAT(SUBSTR(title, 1, 10), '...') FROM books; -- after CONCAT --
SELECT CONCAT(SUBSTR(title, 1, 10), '...') AS short_title FROM books; -- after CONCAT & rename column --

SELECT CONCAT(SUBSTR(author_fname, 1, 1), '..', SUBSTR(author_lname, 1, 1), '..') FROM books;
SELECT CONCAT(SUBSTR(author_fname, 1, 1), '..', SUBSTR(author_lname, 1, 1), '..') AS first_letter_of_AuthorName FROM books;

-- Replace (Case Sensitive) --
SELECT REPLACE('Hell World', 'Hello', '#@$%*#');
SELECT REPLACE('Hello World', 'Hello', '#@$%*#') AS Replacing_Hello;

SELECT REPLACE('Zayn Colt', 'zayn', 'Mr. Za'); -- Case-Sensitive / Will not work --
SELECT REPLACE('Zayn Colt', 'Zayn', 'Mr. Za'); -- Works --

SELECT * FROM books;
SELECT REPLACE(title, ' ', '-') FROM books; -- changed BUT not altered/updated anything PERMANETLY from table --
-- Not changed/altered anything Permanently --
SELECT * FROM books; 

-- REVERSE --
SELECT REVERSE('abc');
SELECT Reverse('abc');
SELECT REVERSE(NULL); -- For Fun: does't change to "LLUN" cz NULL is NULL, right? ;) --

SELECT REVERSE(author_fname) FROM books;
SELECT CONCAT(author_fname, REVERSE(author_fname)) FROM books;
SELECT * FROM books; 

-- CHAR_LENGTH --
SELECT CHAR_LENGTH('Hey!');
SELECT LENGTH('Hey!'); -- NOT SAME: result may be same sometimes BUT will return length in BYTE --

SELECT CHAR_LENGTH(title), title FROM books;
SELECT CHAR_LENGTH(title) AS len, title FROM books;

-- UPPER & LOWER case --
SELECT UPPER('Hello World');
SELECT UCASE('Hello World');

SELECT LOWER('Hello World');
SELECT LCASE('Hello World');
-- Practice --
SELECT CONCAT('I LOVE ', title, '.......!') FROM books; 

-- INSERT --
SELECT INSERT('Hello Bobby', 6,0, 'There');
SELECT INSERT('Hello Bobby', 6,0, ' There'); -- with SPACE in front --
SELECT INSERT('Hello Bobby', 6,4, 'There');
SELECT INSERT('Hello Bobby', 6,6, 'There'); 
SELECT INSERT('Hello Bobby', 1,7, 'There'); 

-- LEFT/RIGHT/REPEAT/TRIM --
SELECT LEFT('HaHaLoL', 4);
SELECT RIGHT('HaHaLoL', 3);
SELECT LEFT(author_lname, 4) FROM books;
-- SELECT REPEAT('Ha', 4);

SELECT TRIM('   CANADA ');
SELECT TRIM('   San Antanio '); -- doesn't TRIM space in the MIDDLE --

SELECT TRIM(LEADING '.' FROM '......San Antanio...');
SELECT TRIM(TRAILING '.' FROM '......San Antanio...');
SELECT TRIM(BOTH '.' FROM '......San Antanio...');

-- PRACTICE EXERCISE --
SELECT REVERSE(UCASE('Why does my cate look at me with such hatred?'));
SELECT REPLACE(CONCAT('I', ' ', 'like', ' ', 'cats'), ' ','-');
SELECT REPLACE(title, ' ', '->') AS title FROM books;
SELECT author_fname AS forwards, REVERSE(author_fname) AS backwards FROM books;
SELECT UCASE(CONCAT(author_fname, ' ', author_lname)) AS 'full namein CAPS' FROM books;
SELECT * FROM books;

SELECT CONCAT(title, ' was released in ', released_year) AS blurb FROM books;
SELECT title, CHAR_LENGTH(title) AS 'character count' FROM books;

SELECT 
      CONCAT(LEFT(title, 10), '...') AS short_title, 
	  CONCAT(author_fname, ',', author_lname) AS author, 
      CONCAT(stock_quantity, ' in stock') AS quantiy
FROM books;






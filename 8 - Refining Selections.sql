-- Inserting more information on the existing table for further Query --

INSERT INTO books (title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES ('10% Happier', 'Dan', 'Harris', 2014, 29, 256), 
	   ('fake_book', 'Freida', 'Harris', 2001, 287, 428),
	   ('Lincoln In The Bardo', 'George', 'Saunders', 2017, 1000, 367);

SELECT author_fname, author_lname FROM books WHERE pages=367; 
SELECT * FROM books;

-- DISTINCT --
SELECT DISTINCT author_lname FROM books; -- Removeing Same Last Name ONLY from the list --

SELECT author_fname, author_lname FROM books;
SELECT DISTINCT(CONCAT(author_fname, ' ', author_lname)) FROM books; -- Removing both "Same - First Name & Last Name" --
-- OR simpliar version --
SELECT DISTINCT author_fname, author_lname, released_year from books;

-- ORDER BY --
SELECT author_fname FROM books ORDER BY author_fname DESC; 
SELECT author_fname FROM books ORDER BY author_fname ASC;
SELECT title, pages FROM books ORDER BY pages; -- Default is ASC --
SELECT title, pages FROM books ORDER BY pages DESC;

-- 2/4 is referencing "columon name numbers" which is dicleared staring of the Query--
SELECT title, author_fname, author_lname, pages FROM books ORDER BY 2 DESC; 
SELECT title, author_fname, author_lname, pages FROM books ORDER BY 4 DESC; 
SELECT title, author_fname, author_lname, pages FROM books ORDER BY 4;

-- Sorting 2 columns at a single time --
SELECT author_lname, released_year, title FROM books ORDER BY author_lname;
SELECT author_lname, released_year, title FROM books ORDER BY author_lname, released_year; 
-- ONLY the YEAR will sort by DESC BUT NAME is maintain Default ASC --
SELECT author_lname, released_year, title FROM books ORDER BY author_lname, released_year DESC; 

SELECT CONCAT(author_fname, ' ', author_lname) AS author FROM books;
SELECT CONCAT(author_fname, ' ', author_lname) AS author FROM books ORDER BY author; -- ORDER by alice/rename column (author) --

-- LIMIT --
SELECT book_id, title, released_year FROM books; 
SELECT book_id, title, released_year FROM books ORDER BY released_year;
SELECT book_id, title, released_year FROM books ORDER BY released_year LIMIT 5;
SELECT book_id, title, released_year FROM books ORDER BY released_year DESC LIMIT 5; -- 5 most Recent released books --  
-- Same is previous one --
SELECT book_id, title, released_year FROM books ORDER BY released_year DESC LIMIT 0, 5;
-- Selecting Subset Rows (starting row, how from from start) -- 
SELECT book_id, title, released_year FROM books ORDER BY released_year DESC LIMIT 3, 2;
SELECT book_id, title, released_year FROM books ORDER BY book_id LIMIT 3, 25656454; -- only hvae 20 BUT will give until the last without any error --

-- LIKE --
SELECT author_fname FROM books WHERE author_fname='David';
SELECT author_fname FROM books WHERE author_fname='david'; -- Same Result as previous Query --
SELECT author_fname FROM books WHERE author_fname='Dav'; -- No results SIMILAR to David, that's where LIKE comes --

-- % called WILDCARDS (represents 0 or More Characters) --
SELECT author_fname FROM books WHERE author_fname LIKE '%da%'; 
SELECT author_fname FROM books WHERE author_fname LIKE 'da%';
SELECT title FROM books WHERE title LIKE '%:%';

-- Per "_" represents ONE-CHARACTER only (here we've 4 "_") --
SELECT author_fname FROM books WHERE author_fname LIKE '____'; 
SELECT author_fname FROM books WHERE author_fname LIKE '_a_'; 

-- (%) wherer author_fname has 0 or 1000 characters --
SELECT * FROM books WHERE author_fname LIKE '%'; 
SELECT * FROM books WHERE author_fname LIKE '%n'; -- anything before "N", ends with "N" --

SELECT title FROM books WHERE title LIKE '%\%%'; -- "\%" (if you are searching for "%" in your Query) --
SELECT title FROM books WHERE title LIKE '%\_%'; -- "\_" (same for "_") --

-- PRACTICE EXERCISE --
SELECT TITLE FROM books WHERE title LIKE '%stories%';
SELECT title, pages FROM books ORDER BY pages DESC LIMIT 0,1;
SELECT * FROM books;
SELECT CONCAT(title, ' - ', released_year) AS summary FROM books ORDER BY released_year DESC LIMIT 3; 
SELECT title, author_lname FROM books WHERE author_lname LIKE '% %';
SELECT title, released_year, stock_quantity FROM books ORDER BY 3 LIMIT 3;
-- OR --
SELECT title, released_year, stock_quantity FROM books ORDER BY stock_quantity LIMIT 3;
SELECt title, author_lname FROM books ORDER BY author_lname, title; 

SELECT UCASE(CONCAT('my favourite author is ', author_fname,' ', author_lname, '!')) as yell FROM books ORDER By author_lname;












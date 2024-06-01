
-- COUNT --
SELECT COUNT(*) FROM books;  -- "(*)" means TOTAL number of ROWS 
SELECT COUNT(author_fname) FROM books; -- How many Rows have author_fname value (19) --

-- inserting some NULL --
INSERT INTO books () VALUES ();
INSERT INTO books () VALUES (); 

SELECT COUNT(*) FROM books; -- 21 Rows--
SELECT COUNT(author_fname) FROM books; -- Still 19 Rows--
SELECT COUNT(DISTINCT author_fname) FROM books; -- Count Unique values --

SELECT title FROM books WHERE title LIKE '%the%';
SELECT COUNT(*) FROM books WHERE title LIKE '%the%';

-- GROUP BY --
SELECT author_lname FROM books GROUP BY author_lname;
-- behind the seen it's GROUPING + Saved in MEMORY (showing Distinct results) but not showing results which you can seen clearly in NEXT Query -- 
SELECT author_lname, COUNT(*) FROM books GROUP BY author_lname;

SELECT author_lname, COUNT(*) AS books_written FROM books GROUP BY author_lname ORDER BY books_written DESC;
SELECT released_year, COUNT(*) FROM books GROUP BY released_year;
SELECT released_year, COUNT(*) FROM books GROUP BY released_year ORDER BY 1 DESC;

-- title is not GROUPED in the memory, so asking which title? --
-- That's why always use some Aggregate Func.(MIN/MAX/SUM/COUNT) in groups --
SELECT released_year, title FROM books GROUP BY released_year;  -- ERROR MESSAGE --

-- MIN/MAX --
SELECT MIN(released_year) FROM books; -- without using GROUP --
SELECT MAX(released_year) FROM books;
SELECT MIN(pages) FROM books;
SELECT MAX(pages) FROM books;
SELECT MIN(author_lname), MAX(author_lname) FROM books;

SELECT MAX(pages), title FROM books; -- ERROR Message as discussed previously, solution in Next Query --
SELECT title, pages FROM books ORDER BY pages DESC LIMIT 1; -- One solution --

-- but we'll use AGGRIGATE Func --
SELECT title, pages FROM books 
WHERE pages=(SELECT MAX(pages) FROM books); -- will run this section 1st then the first part --

-- what if we have 2 books with MAX pages --
INSERT INTO books(title, pages) VALUES('Max Value Testing', 634);
SELECT title, pages FROM books 
WHERE pages=(SELECT MAX(pages) FROM books); -- Correct --
SELECT title, pages FROM books ORDER BY pages DESC LIMIT 1; -- will NOT show the 2nd one -- 

SELECT title, released_year FROM books 
WHERE released_year=(SELECT MIN(released_year) FROM books); 

-- author_lname is similar for 2 diff. people --
SELECT author_lname, COUNT(*) FROM books GROUP BY author_lname; -- 1 Harris --
SELECT author_fname, author_lname, COUNT(*) FROM books GROUP BY author_fname, author_lname; -- 2 diff Harris --
SELECT CONCAT(author_fname, ' ', author_lname) AS author, COUNT(*) FROM books GROUP BY author; -- Solution --


-- -- MIN/MAX with Group By -- -- 

-- Find the year each author publish their first book / Group all the bokks by same author and find MIN year --
SELECT 
	author_fname, 
	author_lname, 
	MIN(released_year)
FROM books 
	GROUP BY author_fname, author_lname;

SELECT 
	author_fname, 
    author_lname, 
    Count(*) AS books_written,
	MIN(released_year) AS oldest_release,
	MAX(released_year) AS latest_release,
    MAX(pages) AS most_pages
FROM books 
	GROUP BY author_fname, author_lname;

-- SUM --
SELECT SUM(pages) FROM books;
SELECT author_fname, SUM(pages) FROM books GROUP BY author_fname;
SELECT author_fname, SUM(pages) FROM books GROUP BY author_fname;
SELECT author_fname, AVG(pages) FROM books GROUP BY author_fname;

-- Sum the pages each author has written --
SELECT 
	author_fname,
	author_lname,
	SUM(pages)
FROM books
GROUP BY author_fname, author_lname; 

SELECT 
	author_fname,
	author_lname,
    COUNT(*) AS books_written,
	SUM(pages)
FROM books
GROUP BY author_fname, author_lname; 

-- AVG --
SELECT AVG(stock_quantity) FROM books; 
SELECT released_year, AVG(stock_quantity) FROM books GROUP BY released_year; 
SELECT released_year, AVG(stock_quantity), COUNT(*) FROM books GROUP BY released_year; 

SELECT author_fname, Count(*) FROM books GROUP BY author_fname; 
SELECT author_fname, AVG(pages) FROM books GROUP BY author_fname;
SELECT 
	author_fname,
    COUNT(*) AS books_written,
	AVG(pages)
FROM books
GROUP BY author_fname; 


-- PRACTICE EXERCISE --
SELECT COUNT(author_fname) FROM books;
SELECT released_year, COUNT(*) FROM books GROUP BY released_year;
SELECT SUM(stock_quantity) FROM books;
SELECT 
	author_fname,
    author_lname,
    COUNT(*) AS books_written,
	AVG(released_year)
FROM books
GROUP BY author_fname, author_lname; 

SELECT CONCAT(author_fname, ' ', author_lname) AS full_name, 
	   pages AS max_pages
FROM books 
WHERE pages=(SELECT MAX(pages) FROM books);

SELECT * FROM books;
SELECT 
	released_year AS 'year',
    COUNT(*) AS '#books',
	AVG(pages) AS 'avg pages'
FROM books
GROUP BY released_year ORDER BY released_year; 




















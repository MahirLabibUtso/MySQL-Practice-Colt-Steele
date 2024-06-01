-- OPERATORs --

-- NOT --
SELECT * FROM books WHERE released_year = 2017;
SELECT * FROM books WHERE released_year != 2017;

SELECT title, author_lname FROM books;
SELECT title, author_lname FROM books WHERE author_lname = 'Gaiman';
SELECT title, author_lname FROM books WHERE author_lname != 'Gaiman';


-- LIKE / NOT LIKE --
SELECT title FROM books WHERE title LIKE '% %'; -- Wildcard characters + Spcae in between (Anything before or after space) -- 
SELECT title FROM books WHERE title NOT LIKE '% %';

SELECT author_fname, author_lname FROM books WHERE author_fname LIKE 'da%';
SELECT author_fname, author_lname FROM books WHERE author_fname NOT LIKE 'da%';

SELECT title FROM books WHERE title NOT LIKE '%a%';


-- Comparasion Operator --
-- GREATER ( > )" --
SELECT * FROM books WHERE released_year > 2000;
SELECT * FROM books WHERE pages > 500;

SELECT 80 > 100;
SELECT 80 > 40;
SELECT 1 > NULL;
SELECT NULL > 1;
SELECT title, pages, released_year FROM books WHERE pages > 500;

-- LESS THAN ( < )" --
SELECT title, pages FROM books WHERE pages < 200;
SELECT title, pages, released_year FROM books WHERE released_year < 2000;
SELECT title, pages, released_year FROM books WHERE released_year < 2000 ORDER BY released_year;

-- Grater Than & Equal To ( >= ) 'Including 2010' --
SELECT title, pages, released_year FROM books WHERE released_year > 2010;
SELECT title, pages, released_year FROM books WHERE released_year >= 2010;

-- Less Than & Equal To ( <= ) 'Including 1985' --
SELECT title, pages, released_year FROM books WHERE released_year < 1985;
SELECT title, pages, released_year FROM books WHERE released_year <= 1985;

-- LOGICAL AND ( AND ) --
SELECT * FROM books WHERE author_lname='Eggers';
SELECT * FROM books WHERE author_lname='Eggers' AND released_year >2010;

-- (3 comparasion at the same time, we can do as many as we wish) --
SELECT title, author_lname, released_year FROM books 
WHERE author_lname='Eggers' 
AND released_year >2010
AND title LIKE '%novel%';

SELECT title, pages FROM books 
WHERE CHAR_LENGTH(title) > 30
AND pages > 500;

-- LOGICAL OR ( OR ) --
SELECT title, author_lname, released_year FROM books WHERE author_lname='Eggers' AND released_year > 2010;
SELECT title, author_lname, released_year FROM books WHERE author_lname='Eggers' OR released_year > 2010;
SELECT title, pages FROM books 
WHERE pages < 200 
OR title LIKE '%stories%';

SELECT title, pages FROM books 
WHERE pages < 200 
AND title LIKE '%stories%';

-- BETWEEN / NOT BETWEEN --
SELECT title, released_year FROM books
WHERE released_year >= 2004
AND released_year <= 2015;  -- (books released between 2004 and 2015)

SELECT title, released_year FROM books
WHERE released_year BETWEEN 2004 AND 2015;

SELECT title, pages FROM books
WHERE pages BETWEEN 200 AND 300;

SELECT title, pages FROM books
WHERE pages NOT BETWEEN 200 AND 300;

-- Comparing Dates --
SELECT * FROM people;
SELECT * FROM people WHERE birthdate < '2005-01-01'; -- (MySQL will figureout BUT not alwasys accurate) 
SELECT * FROM people WHERE YEAR(birthdate) < 2005; -- MORE Accurate and less likely will fail

SELECT * FROM people WHERE birthtime > '09:00:00'; -- (NOT alwasys accurate) 
SELECT * FROM people WHERE HOUR(birthtime) > 9; -- MORE ACCURATE

SELECT CAST('9:00' AS TIME); -- (Correct way to do it because It to a DataType-juswt a piece of Text)
SELECT * FROM people WHERE birthtime BETWEEN '01:00:00' AND '16:00:00'; -- NOT CORRECT WAY

-- CORRECT WAY --
SELECT * FROM people WHERE birthtime 
BETWEEN CAST('01:00:00' AS TIME) 
AND  CAST('16:00:00' AS TIME); 

-- If working with only HOUR --
SELECT * FROM people WHERE HOUR(birthtime) 
BETWEEN 1 AND 16;


-- IN / NOT IN --
-- Not optimized in terms of meaning (if I want to filter 10 names then comes Headache) --
SELECT title, author_lname FROM books
WHERE author_lname='CARVER'
OR author_lname='LAHIRI'
OR author_lname='SMITH';

-- Best Way --
SELECT title, author_lname FROM books
WHERE author_lname IN ('CARVER', 'LAHIRI', 'SMITH');

SELECT title, author_lname FROM books
WHERE author_lname NOT IN ('CARVER', 'LAHIRI', 'SMITH');

SELECT title, released_year FROM books
WHERE released_year NOT IN (2002, 2004, 2006, 2008,2010, 2012, 2014, 2016, 2018);

SELECT title, released_year FROM books
WHERE released_year >= 2000 
AND released_year NOT IN (2002, 2004, 2006, 2008);

-- Better Way --
-- MODULO ( % ) Gives REMAINDER --
SELECT 17 % 6; -- (returns result 5) --

-- Gives EVEN years --
SELECT title, released_year FROM books
WHERE released_year >= 2000
AND released_year%2 != 1;

-- Gives ODD years --
SELECT title, released_year FROM books
WHERE released_year >= 2000
AND released_year%2 = 1;

-- CASE STATEMENTS --
SELECT title, released_year,
CASE
	WHEN released_year >= 2000 THEN 'modern lit'
    ELSE '20th century lit' 
END 
AS GENRE 
FROM books;

SELECT title, stock_quantity,
CASE
	WHEN stock_quantity BETWEEN 0 AND 50 THEN '*'
    WHEN stock_quantity BETWEEN 51 AND 100 THEN '**'
    WHEN stock_quantity BETWEEN 101 AND 150 THEN '***'
    ELSE '****'
END
AS STOCK                       
FROM books; 	

-- NULL / IS NOT NULL--
SELECT * FROM books WHERE author_lname = NUll; -- will NOT return anything --
SELECT * FROM books WHERE author_lname IS NULL;  -- Correct Way

SELECT * FROM books WHERE title IS NULL; -- Existed "1-ROW"
DELETE FROM books WHERE title IS NULL; 


-- PRACTISE EXERCISE --
SELECT 1 IN (5,3) OR 9 BETWEEN 8 AND 10; -- (First part is False but 2nd part is True ) --

SELECT * FROM books WHERE released_year < 1980; 
SELECT * FROM books WHERE author_lname IN ('Eggers','Chabon');
SELECT * FROM books WHERE author_lname = 'Lahiri' AND released_year > 2000;
SELECT title, pages FROM books WHERE pages BETWEEN 100 AND 200;
SELECT title, author_lname FROM books WHERE 
author_lname LIKE 'C%' 
OR 
author_lname LIKE 'S%';

SELECT title, author_lname,
CASE
	WHEN title LIKE '%stories%' THEN 'Short Stories'
    WHEN title LIKE '%heartbreaking Work%' THEN 'Memoir'
    ELSE 'Novel'
END
AS TYPE                       
FROM books; 	

SELECT author_fname, author_lname, 
CASE 
	WHEN COUNT(*) = 1 THEN '1 book'
    ELSE CONCAT(COUNT(*), ' books')
END
AS 'count books' 
FROM books
WHERE author_lname IS NOT NULL
GROUP BY author_fname, author_lname;


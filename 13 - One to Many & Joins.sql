-- RELATIONSHIPS and JOINS --

-- FOREIGN KEY --
CREATE DATABASE shop;
USE shop;

CREATE TABLE customers(
	id INT PRIMARY KEY AUTO_INCREMENT,  
    first_name VARCHAR(60),
    last_name VARCHAR(60),
    email VARCHAR(50)
);

CREATE TABLE orders(
	id INT PRIMARY KEY AUTO_INCREMENT,  
    order_date DATE,
    amount DECIMAL (8,2),
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers (id)
);

INSERT INTO customers (first_name, last_name, email) 
VALUES ('Boy', 'George', 'george@gmail.com'),
       ('George', 'Michael', 'gm@gmail.com'),
       ('David', 'Bowie', 'david@gmail.com'),
       ('Blue', 'Steele', 'blue@gmail.com'),
       ('Bette', 'Davis', 'bette@aol.com');
       
INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016-02-10', 99.99, 1),
       ('2017-11-11', 35.50, 1),
       ('2014-12-12', 800.67, 2),
       ('2015-01-03', 12.50, 2),
       ('1999-04-11', 450.25, 5);
       
SELECT * FROM customers;
SELECT * FROM orders;

INSERT INTO orders(order_date, amount, customer_id) VALUES ('1997-02-12', 40.25, 99); -- ERROR: Customer doesn't exists --
INSERT INTO orders(order_date, amount, customer_id) VALUES ('1997-02-12', 40.25, 3); -- SUCCEED --
SELECT * FROM orders;


-- Cross Joins --
SELECT id FROM customers WHERE last_name = 'George';
SELECT * FROM orders WHERE customer_id =1;
-- we can do this Two in One line (but not the "Ultimate-Solution") --
SELECT * FROM orders WHERE customer_id = (SELECT id FROM customers WHERE last_name = 'George');

-- X -- Cross joins gives all combination and MESSY -- X --
SELECT * FROM customers, orders; -- Had 5 customers * 6 orders = 30 combination --

-- SOLUTION: Inner Join --
SELECT * FROM customers
JOIN orders 
ON orders.customer_id = customers.id; -- id matches --

SELECT * FROM orders 
JOIN customers
ON customers.id = orders.customer_id; -- Opposite Query: also works BUT in sequence --

SELECT customer_id, first_name, last_name, order_date, amount FROM customers
JOIN orders 
ON orders.customer_id = customers.id; -- Actual presentation we wanted --

SELECT customer_id, first_name, last_name, order_date, amount FROM orders
JOIN customers 
ON orders.customer_id = customers.id; -- Opposite Query: Same Result BUT not looks nice in terms of QUERY-SEQUENCE --

-- Let's Group + Sum the total spent of each customer --
SELECT first_name, last_name, SUM(amount) AS Total FROM customers
JOIN orders 
ON orders.customer_id = customers.id
GROUP BY first_name, last_name
ORDER BY Total;

SELECT * FROM orders;

-- LEFT JOIN --
SELECT first_name, last_name, order_date, amount FROM customers
LEFT JOIN orders
ON orders.customer_id = customers.id; -- Returned 8 rows CZ one person didn't placed order --

SELECT customer_id, first_name, last_name, order_date, amount FROM customers
JOIN orders 
ON orders.customer_id = customers.id; -- INNER JOIN: Returned 7 rows CZ 7 orders --

-- Returned 6 rows CZ took all from ORDERS + Only took MATCH's from CUSTOMERS (imagine Circle) --
SELECT first_name, last_name, order_date, amount FROM orders
LEFT JOIN customers
ON orders.customer_id = customers.id; 

-- Let's do useful query + replace NULL with 0 -- 

SELECT first_name, last_name, IFNULL(SUM(amount), 0) AS money_spent FROM customers
LEFT JOIN orders
ON orders.customer_id = customers.id
GROUP BY first_name, last_name; 

-- RIGHT JOIN
-- ==========



-- ON DELETE CASCADE
-- ==================
DELETE FROM customers WHERE last_name = 'George'; -- ERROR: foreign key constraint (CAN'T DELETE george's history) --

CREATE DATABASE shop2;
USE shop2;
 
CREATE TABLE customers(
	id INT PRIMARY KEY AUTO_INCREMENT,  
    first_name VARCHAR(60),
    last_name VARCHAR(60),
    email VARCHAR(50)
);

CREATE TABLE orders(
	id INT PRIMARY KEY AUTO_INCREMENT,  
    order_date DATE,
    amount DECIMAL (8,2),
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers (id) ON DELETE CASCADE
);

INSERT INTO customers (first_name, last_name, email) 
VALUES ('Boy', 'George', 'george@gmail.com'),
       ('George', 'Michael', 'gm@gmail.com'),
       ('David', 'Bowie', 'david@gmail.com'),
       ('Blue', 'Steele', 'blue@gmail.com'),
       ('Bette', 'Davis', 'bette@aol.com');
       
INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016-02-10', 99.99, 1),
       ('2017-11-11', 35.50, 1),
       ('2014-12-12', 800.67, 2),
       ('2015-01-03', 12.50, 2),
       ('1999-04-11', 450.25, 5);

SELECT first_name, last_name, order_date, amount FROM customers 
JOIN orders ON orders.customer_id = customers.id;

DELETE FROM customers WHERE last_name = 'George'; -- NOW: George's history can be DELETED --


-- PRACTICE EXERCISE --
-- ====================

CREATE TABLE students (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50)
);


CREATE TABLE papers(
    title VARCHAR(50),
    grade INT,
    student_id INT,
    FOREIGN KEY (student_id) REFERENCES students (id)
);

INSERT INTO students (first_name) VALUES 
('Caleb'), ('Samantha'), ('Raj'), ('Carlos'), ('Lisa');

INSERT INTO papers (student_id, title, grade ) VALUES
(1, 'My First Book Report', 60),
(1, 'My Second Book Report', 75),
(2, 'Russian Lit Through The Ages', 94),
(2, 'De Montaigne and The Art of The Essay', 98),
(4, 'Borges and Magical Realism', 89);

SELECT first_name, title, grade FROM students
JOIN papers 
ON papers.student_id = students.id
ORDER BY grade DESC;


SELECT first_name, title, grade FROM students
LEFT JOIN papers 
ON papers.student_id = students.id;


SELECT first_name, IFNULL(title, 'MISSING'), IFNULL(grade, 0) FROM students
LEFT JOIN papers 
ON papers.student_id = students.id;


SELECT first_name, IFNULL(AVG(grade), 0) AS average
FROM students
LEFT JOIN papers 
ON students.id = papers.student_id
GROUP BY first_name
ORDER BY average DESC;


SELECT first_name, IFNULL(AVG(grade), 0) AS average,
    CASE
        WHEN IFNULL(AVG(grade), 0) >= 75 THEN 'passing'
        ELSE 'failing'
    END AS passing_status
FROM students
LEFT JOIN papers 
ON students.id = papers.student_id
GROUP BY first_name
ORDER BY average DESC;


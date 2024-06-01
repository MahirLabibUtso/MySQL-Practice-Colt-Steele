SELECT DATABASE();
SHOW TABLES;


CREATE TABLE cats(
name VARCHAR(20),
age INT);

DESC cats;

INSERT INTO cats (name, age) VALUES ("Hambu", 5);
INSERT INTO cats (name, age) VALUES ("Oreo", 7);
-- SEQUENCE MAINTAIN
INSERT INTO cats (age, name) VALUES (4, "Beth");
-- OR INSERT MULTIPLE VALUES
INSERT INTO cats (name, age) VALUES ("Terk", 2), ("Lari", 3), ("Jim", 4);

SELECT * FROM cats;


-- Practice

SHOW DATABASES;
CREATE DATABASE people;
USE people;
SHOW TABLES;

CREATE TABLE info(
firstname VARCHAR(20),
lastname VARCHAR(20),
age INT
);

DESC info;
INSERT INTO info(firstname, lastname, age) VALUES ("John","Herly", 23), ("BOB","ROK", 26), ("Shaw", "DOP", 24);
SELECT * FROM info;
SELECT firstname, lastname, age FROM info ORDER BY age DESC;

-- NULL
DESC info;
INSERT INTO info(firstname) VALUES("Ridd");
SELECT * FROM info;

-- NOT NULL
CREATE TABLE info22(name VARCHAR(50) NOT NULL, age INT NOT NULL);
DESC info22;
SELECT * from info22;

INSERT into info22(name) VALUES ("Rocy");
INSERT into info22(name, age) VALUES ("Rocy", 9);
SELECT * FROM info22;

-- ALWAYS USE SINGLE QUOTE (To Avoid Other SQL Environments Errors)
CREATE TABLE text(line VARCHAR (100));
INSERT INTO text(line) VALUES ('Shop JET');

-- ERROR: INSERT INTO text(line) VALUES ('Labib's bag');
INSERT INTO text(line) VALUES ('Labib\'s bag');
INSERT INTO text(line) VALUES ('She said; "haha"'); 
SELECT * FROM text;

-- Default Value Setting
USE pet_shop;
CREATE TABLE cat2(name VARCHAR(50) DEFAULT 'unnamed', age INT DEFAULT 99);
INSERT INTO cat2() VALUES ();
-- Default Value ONLY can't save us from Inserting NULL value 
INSERT INTO cat2(name, age) VALUES (NULL, NULL);
SELECT * FROM cat2;

-- (Default Value + Not Null) Setting
CREATE TABLE cat3(name VARCHAR(50) NOT NULL DEFAULT 'unnamed', age INT NOT NULL DEFAULT 99);
INSERT INTO cat3(name, age) VALUES (NULL, NULL);
DESC cat3;
INSERT INTO cat3() VALUES ();
SELECT * FROM cat3;

-- Unique Serial Number in VALUES
CREATE TABLE unique_cat( catID INT NOT NULL PRIMARY KEY, name VARCHAR(50) DEFAULT 'unnamed', age INT DEFAULT 99);

-- Skip "NOT NULL" when describe PRIMARY cz by Default it's -> NOT NULL
-- CREATE TABLE unique_cat( catID INT PRIMARY KEY, name VARCHAR(50) DEFAULT 'unnamed', age INT DEFAULT 99);
-- OR
-- CREATE TABLE unique_cat( catID INT, name VARCHAR(50) DEFAULT 'unnamed', age INT DEFAULT 99, PRIMARY KEY(catID));

DESC unique_cat;
INSERT INTO unique_cat(catID) VALUES (987);
SELECT * FROM unique_cat;

-- AUTO INCREMENT Primary Key
-- DROP Table unique_cat;
CREATE TABLE unique_cat2( catID INT AUTO_INCREMENT, name VARCHAR(50) DEFAULT 'unnamed', age INT DEFAULT 99, PRIMARY KEY(catID));
DESC unique_cat2;
INSERT INTO unique_cat2(catId) VALUES (101);
INSERT INTO unique_cat2() VALUES ();
SELECT * FROM unique_cat2;


-- PRACTICE EXERCISE
CREATE DATABASE PEOPLE;
USE PEOPLE;
CREATE TABLE employees(id INT AUTO_INCREMENT PRIMARY KEY,
last_name VARCHAR(50) NOT NULL,
first_name VARCHAR(50) NOT NULL,
middle_name VARCHAR(50),
age INT NOT NULL,
current_status VARCHAR(50) NOT NULL DEFAULT 'employeed'
);

DESC employees;

INSERT INTO employees(first_name, last_name, age) VALUES ('Bob', 'Merly', 34); 
SELECT * FROM employees;

 
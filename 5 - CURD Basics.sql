-- DROP DATABASE pet_shop;
CREATE DATABASE pet_shop;
USE pet_shop;
SHOW TABLES;
DROP TABLE cats;

SHOW databases;
CREATE TABLE cats(
cat_ID INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(50),
breed VARCHAR(50),
age INT
);

DESC cats;

INSERT INTO cats(name, breed, age) 
VALUES ('Ringo', 'Tabby', 4),
       ('Cindy', 'Maine Coon', 10),
       ('Dumbledore', 'Maine Coon', 11),
       ('Egg', 'Persian', 4),
       ('Misty', 'Tabby', 13),
       ('George Michael', 'Ragdoll', 9),
       ('Jackson', 'Sphynx', 7);

-- Everything of all Columns info
SELECT * FROM cats;

-- Only-One Column info
SELECT name FROM cats;
SELECT name, age FROM cats;
SELECT name, breed FROM cats;

-- Filter by WHERE
SELECT * FROM cats WHERE age=4;
SELECT name, age FROM cats WHERE age=4;
SELECT name, age FROM cats WHERE name='Egg';

-- Practice Exercise --

SELECT cat_ID FROM cats;
SELECT name, breed FROM cats;
SELECT name, breed FROM cats WHERE breed='Tabby';
SELECT cat_ID, age FROM cats WHERE cat_ID=age;


-- UPDATE Basics --
SELECT * FROM cats WHERE name='Misty'; -- To ensure that we don't update in bulk (Many cats may have Same Names) --
UPDATE cats SET age=14 WHERE name='Misty';

-- Practice --
SELECT * FROM cats WHERE name='jackson';
UPDATE cats SET name='jack' WHERE name='Jackson';

SELECT * FROM cats;
SELECT * FROM cats WHERE name='Ringo';
UPDATE cats SET breed='BritishShotHair' WHERE name='Ringo';

-- DELETE Tables Data : NOT the TABLE --
DELETE FROM cats; -- Delete/Clear all table data --
DELETE FROM cats WHERE name='Egg';

-- Practice --
SELECT * FROM cats WHERE age=4;
DELETE FROM cats WHERE age=4;

SELECT * FROM cats WHERE age=cat_Id;
DELETE FROM cats WHERE age=cat_Id;

DELETE FROM cats;
DESC cats;

-- MORE PRACTICE: CURD CHALLANGE --

CREATE DATABASE shirts_db;
USE shirts_db;

CREATE TABLE shirts(
shirt_id INT AUTO_INCREMENT PRIMARY KEY,
article VARCHAR(50),
color VARCHAR(50),
shirt_size VARCHAR(2),
last_worn INT
);
DESC shirts;

INSERT INTO shirts(article, color, shirt_size, last_worn) VALUES('t-shirt', 'white', 'S', 10),
	('t-shirt', 'green', 'S', 200),
	('polo shirt', 'black', 'M', 10),
	('tank top', 'blue', 'S', 50),
	('t-shirt', 'pink', 'S', 0),
	('polo shirt', 'red', 'M', 5),
	('tank top', 'white', 'S', 200),
	('tank top', 'blue', 'M', 15);
    
    SELECT * FROM shirts;
    INSERT INTO shirts(article, color, shirt_size, last_worn) VALUES('polo shirt', 'purple', 'M', 50);
	SELECT article, color FROM shirts;
    SELECT article, color, shirt_size, last_worn FROM shirts WHERE shirt_size='M';
    
    SELECT * FROM shirts WHERE article='polo shirt';
    UPDATE shirts SET shirt_size='L' WHERE shirt_size='M';
	
    SELECT * FROM shirts WHERE last_worn=15;
    UPDATE shirts SET last_worn=0 WHERE last_worn=15;
    
     SELECT * FROM shirts WHERE color='white';
     UPDATE shirts SET color='off white', shirt_size='XS' WHERE color='white';
     
      SELECT * FROM shirts WHERE last_worn=200;
      DELETE FROM shirts WHERE last_worn=200;
      
      SELECT * FROM shirts WHERE article='tank top';
      DELETE FROM shirts WHERE article='tank top';
      
      DELETE from shirts;
      DESC shirts;
      DROP DATABASE shirts_db;
      
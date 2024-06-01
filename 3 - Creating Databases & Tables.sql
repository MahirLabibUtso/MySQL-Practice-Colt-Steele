
CREATE DATABASE pet_shop;
-- Which database I want to Use
USE pet_shop;
-- Which database I am In
SELECT DATABASE();
SHOW TABLES;

CREATE TABLE dogs(
name VARCHAR(50),
breed VARCHAR(50),
age INT
);

SHOW TABLES;

DESC dogs;
-- OR
SHOW COLUMNS FROM dogs;

-- DROP TABLE dogs;
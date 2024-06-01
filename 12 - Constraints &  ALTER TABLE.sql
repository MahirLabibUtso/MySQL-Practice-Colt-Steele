-- More Constraints --

-- UNIQUE --
CREATE TABLE contacts(
	name VARCHAR(100) NOT NULL,
    phone VARCHAR(15) NOT NULL UNIQUE
);
INSERT INTO contacts(name, phone) VALUES ('Brown', '578964321');
SELECT * FROM contacts;
INSERT INTO contacts(name, phone) VALUES ('Tim', '578964321'); -- ERROR: Duplicate entry 
INSERT INTO contacts(name, phone) VALUES ('Tim', '678964321'); -- Takes same name BUT phone number must have to UNIQUE

-- CHECK --
CREATE TABLE users(
	username VARCHAR(30),
    age INT CHECK(AGE > 0)
);
INSERT INTO users(username, age) VALUES ('bluethecat', 12);
SELECT * FROM users;
INSERT INTO users(username, age) VALUES ('Dragon', -3); -- ERROR: user chacek 1 vliolated --

CREATE TABLE revcheck(
word VARCHAR(20) CHECK(REVERSE(word) = word)
); 
INSERT INTO revcheck(word) VALUES ('racecar');
INSERT INTO revcheck(word) VALUES ('mommy'); -- Check 1 violated --

-- "Check 1 violated" RENAME to understand and useful to Alter Table in future --
CREATE TABLE users2(
	username VARCHAR(30),
    age INT,
    CONSTRAINT age_cannot_be_negative CHECK(age > 0)
);
INSERT INTO users2(username, age) VALUES ('thecat', 12);
SELECT * FROM users2;
INSERT INTO users2(username, age) VALUES ('Bleee', -3); -- ERROR: age cannot be negative --

CREATE TABLE companies(
	name VARCHAR(20),
    address VARCHAR(80),
    CONSTRAINT unique_combination UNIQUE(name, address) 
);
INSERT INTO companies(name, address) VALUES ('ZH cor', '12 cs tower');
INSERT INTO companies(name, address) VALUES ('ZH cor', '12 cs tower'); -- Check violated --
INSERT INTO companies(name, address) VALUES ('ZH', '12 cs tower'); -- Passed --

CREATE TABLE houses(
	buying_price INT,
    selling_price INT,
    CONSTRAINT selling_price_must_greater_than_buying CHECK(selling_price >= buying_price)
);
INSERT INTO houses(buying_price, selling_price) VALUES (300, 200); -- Check violated --
INSERT INTO houses(buying_price, selling_price) VALUES (300, 500); -- Passed --
SELECT * FROM houses;


-- ALTER (so many capabilities READ DOC) --

-- ADD COLUMN (using existing table companies) --
ALTER TABLE companies 
ADD COLUMN phone VARCHAR(15);

SELECT * FROM companies; -- prvious inserted value will be NULL automatically but we can set DEFAULT

-- DELETE COLUMN --
ALTER TABLE companies 
DROP COLUMN phone; 

SELECT * FROM companies;

-- RENAME TABLE (either way is correct) -- 
RENAME TABLE companies TO suppliers;

ALTER TABLE suppliers RENAME TO companies;

-- RENAME COLUMN --
ALTER TABLE companies 
RENAME COLUMN name TO business_name;

SELECT * FROM companies;

-- MODIFY column Data-Type (careful when actually working) --
ALTER TABLE companies
MODIFY business_name VARCHAR(500);

DESC companies;

-- CHANGE --
ALTER TABLE companies
CHANGE business_name name VARCHAR(100); -- Renaming (column+Data-type) at the same time --

-- ADD CONSTRAINT TO ALTER --
ALTER TABLE houses
ADD CONSTRAINT purchase_price_cant_negtive CHECK(buying_price >= 0); 

INSERT INTO houses (buying_price, selling_price) VALUES (-3, 100);
INSERT INTO houses (buying_price, selling_price) VALUES (0, 100);

SELECT * FROM houses;

--  DROP CONSTRAINT --
ALTER TABLE houses
DROP CONSTRAINT purchase_price_cant_negtive; 
INSERT INTO houses (buying_price, selling_price) VALUES (-3, 100); -- SUCCEED --


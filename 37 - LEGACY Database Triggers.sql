CREATE DATABASE trigger_demo;
USE trigger_demo;

CREATE TABLE users(
	username VARCHAR(100),
    age INT
);

DESC users;

INSERT INTO users(username, age) VALUES("bobby", 23);
INSERT INTO users(username, age) VALUES("sally", 14);
SELECT * FROM users;

-- After adding TRIGGGER into other SQL file
INSERT INTO users(username, age) VALUES("han", 16); -- ERROR Message:: Must be an adult!
INSERT INTO users(username, age) VALUES("charley", 18); -- Worked

-- DROP DATABASE ig_clone;
CREATE DATABASE ig_clone;
USE ig_clone;

CREATE TABLE users(
	id INT AUTO_INCREMENT PRIMARY KEY,
	username VARCHAR(255) UNIQUE NOT NULL,
	created_at TIMESTAMP DEFAULT NOW()
);

INSERT INTO users(username) VALUES
('Labib'),
('Brown'),
('Clot');
SELECT * FROM users;


CREATE TABLE photos(
	id INT AUTO_INCREMENT PRIMARY KEY,
    image_url VARCHAR(255) NOT NULL,
    user_id INT NOT NULL,
    crated_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(id)
);
 
 INSERT INTO photos(image_url, user_id) VALUES
('/ereqwedlfg', 1),
('/567dfedree', 2),
('/980asuierd', 2);
SELECT * FROM photos;


 CREATE TABLE comments(
	id INT AUTO_INCREMENT PRIMARY KEY,
    comment_text VARCHAR(255) NOT NULL,
    user_id INT NOT NULL,
    photo_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(photo_id) REFERENCES photos(id)
);
 
INSERT INTO comments(comment_text, user_id, photo_id) VALUES
('WooW', 1, 3),
('Amazing', 3, 2),
('Mind Blowing', 2, 1);
-- DELETE FROM comments;
SELECT * FROM comments;

CREATE TABlE likes (
	user_id  INT NOT NULL,
    photo_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(photo_id) REFERENCES photos(id),
    
    PRIMARY KEY(user_id, photo_id) -- One Like per user (Unique Combination :: One user can ONLY give One-Single-Like to Each photo)
);

INSERT INTO likes(user_id, photo_id) VALUES
(1,1),
(2,1),
(1,2),
(1,3),
(3,3);
-- INSERT INTO likes(user_id, photo_id) VALUES (1,1); -- ERROR: Duplicate Like (Discribed inside "Likes Table-last line")

-- GOOD EXAMPLE INSIDE VIDEO --

CREATE TABLE follows(
	follower_id INT NOT NULL,
    followee_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(follower_id) REFERENCES users(id),
    FOREIGN KEY(followee_id) REFERENCES users(id),
    
    PRIMARY KEY(follower_id, followee_id)
);

INSERT INTO follows(follower_id, followee_id) VALUES
(1,2),
(1,3),
(3,1),
(2,3);

-- INSERT INTO follows(follower_id, followee_id) VALUES (2,3); -- ERROR:: Duplicate Entry
-- INSERT INTO follows(follower_id, followee_id) VALUES (3,2); -- WORKS:: PREVIOUSLY - NOT FOLLOWED YET

SELECT * FROM follows;


-- ** GOOD 'EXPLANATION+DIFFERENT SOLUTIONS' INSIDE VIDEO ** --

CREATE TABLE tags(
	id INT AUTO_INCREMENT PRIMARY KEY,
    tag_name VARCHAR(255) UNIQUE,
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE photo_tags(
	photo_id INT NOT NULL,
    tag_id INT NOT NULL,
	FOREIGN KEY(photo_id) REFERENCES photos(id),
    FOREIGN KEY(tag_id) REFERENCES tags(id),
    PRIMARY KEY(photo_id, tag_id)
);
 
SHOW TABLES;

INSERT INTO tags(tag_name) VALUES
('adorable'),
('cute'),
('sunshine'); 

-- INSERT INTO photo_tags(photo_id, tag_id) VALUES (1,1),(1,2),(2,3),(3,2); 
-- INSERT INTO photo_tags(photo_id, tag_id) VALUES (1,1); -- ERROR:: Duplicate value 

SELECT * FROM photo_tags;


-- ======================== --

SELECT *
FROM photos
JOIN users
	ON photos.user_id = users.id;
    
SELECT photos.image_url, users.username
FROM photos
JOIN users
	ON photos.user_id = users.id;
    

    
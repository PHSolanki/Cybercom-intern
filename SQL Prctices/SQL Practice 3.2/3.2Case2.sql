-- Exercise 3.2 Case-2

CREATE TABLE users
(
	id INT PRIMARY KEY,
	name VARCHAR(255),
	created_at TIMESTAMP
);

CREATE TABLE posts 
(
	id INT PRIMARY KEY,
	user_id INT,
	body TEXT,
	created_at TIMESTAMP
);

CREATE TABLE likes 
(
	id INT PRIMARY KEY,
	user_id INT,
	post_id INT,
	created_at TIMESTAMP
);

-- Write a query to retrieve the name and number of posts for each user who joined the platform in the year 2022, along with the total number of likes received for each user's posts.

SELECT 
    users.name,
    COUNT(posts.id) AS num_posts,
    SUM(likes.likes) AS total_likes
FROM
    users
        JOIN
    posts ON users.id = posts.user_id
        JOIN
    likes ON posts.id = likes.post_id
WHERE
    YEAR(users.created_at) = 2022
GROUP BY users.id


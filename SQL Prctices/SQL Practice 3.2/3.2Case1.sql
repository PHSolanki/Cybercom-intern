-- Exercise 3.2 Case 1

CREATE TABLE blog_posts (
id INT PRIMARY KEY,
title VARCHAR(255),
body TEXT,
author_id INT,
created_at TIMESTAMP
);

CREATE TABLE blog_comments (
id INT PRIMARY KEY,
post_id INT,
body TEXT,
author_id INT,
created_at TIMESTAMP
);

-- Write a query to retrieve the title and body of the five most recent blog posts, along with the number of comments each post has.

SELECT 
    blog_posts.id,
    blog_posts.author_id,
    blog_posts.title,
    blog_posts.body,
    blog_posts.created_at,
    blog_comments.created_at AS commented_at,
    blog_comments.body AS comment
FROM
    blog_posts
        INNER JOIN
    blog_comments ON blog_posts.author_id = blog_comments.author_id
    ORDER BY author_id;


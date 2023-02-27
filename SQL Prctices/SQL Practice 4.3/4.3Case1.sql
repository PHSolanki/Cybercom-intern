-- Exercise 4.3

CREATE TABLE users 
(
    id INTEGER PRIMARY KEY,
    name TEXT,
    email TEXT,
    password TEXT,
    created_at TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO users 
VALUES
  (1, 'John Doe', 'johndoe@example.com', 'password1', '2022-01-01 10:00:00', '2022-01-01 10:00:00'),
  (2, 'Jane Doe', 'janedoe@example.com', 'password2', '2022-01-02 11:00:00', '2022-01-02 11:00:00'),
  (3, 'Bob Smith', 'bobsmith@example.com', 'password3', '2022-01-03 12:00:00', '2022-01-03 12:00:00'),
  (5, 'Jack Smith', 'jacksmith@example.com', 'password4', '2022-01-04 15:00:00', '2022-01-04 15:00:00');
  
select * from users;
  
CREATE TABLE orders 
(
    id INTEGER PRIMARY KEY,
    user_id INTEGER,
    amount FLOAT,
    created_at TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users (id)
);

INSERT INTO orders (id, user_id, amount, created_at, updated_at)
VALUES (3, 2, 25.99, '2022-01-03 12:00:00', '2022-01-03 12:00:00'),
 (6, 2, 65.99, '2022-01-05 14:00:00', '2022-01-05 14:00:00'),
  (7, 1, 9.99, '2022-01-06 15:00:00', '2022-01-06 15:00:00'),
  (1, 1, 30.99, '2022-01-01 10:00:00', '2022-01-01 10:00:00'),
  (2, 1, 49.99, '2022-01-02 11:00:00', '2022-01-02 11:00:00'),
  
  (4, 3, 39.99, '2022-01-04 13:00:00', '2022-01-04 13:00:00'),
  (5, 3, 59.99, '2022-01-04 13:00:00', '2022-01-04 13:00:00'),
 
  (8, 3, 39.99, '2022-01-06 15:00:00', '2022-01-06 15:00:00');
  
  select * from orders;

  
-- 1. Create a new user with the following information:
-- name: John Doe
-- email: john.doe@example.com
-- password: 123456
-- created_at: current timestamp
-- updated_at: current timestamp
INSERT INTO users 
VALUES ('4','John Doe', 'john.doe@example.com', '123456', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);


-- 2. Retrieve the names and email addresses of all users who have placed at least one order.
SELECT 
    users.name, users.email
FROM
    users
        INNER JOIN
    orders ON users.id = orders.user_id
WHERE
    orders.user_id >= 1;
    
    
-- 3. Retrieve the total amount of orders placed by each user, sorted in descending order of total amount.
SELECT 
    sum(orders.amount), users.name
FROM
    users
        INNER JOIN
    orders ON users.id = orders.user_id
group by users.id
order by sum(orders.amount) desc;


-- 4. Retrieve the email address of the user who has placed the most orders.
SELECT 
    users.email , count(orders.user_id) as num_of_orders
FROM
    users
        INNER JOIN
    orders ON users.id = orders.user_id
group by users.email
order by num_of_orders desc
limit 1;


-- 5. Retrieve the user IDs and the total amount of orders placed by users who have placed at least one order and whose total amount of orders exceeds $100.
SELECT 
    orders.user_id, SUM(orders.amount)
FROM
    users
        INNER JOIN
    orders ON users.id = orders.user_id
group by users.name
having sum(orders.amount)>100;


-- 6. Retrieve the number of users who have not placed any orders.
SELECT 
    COUNT(users.id)
FROM
    users
        LEFT JOIN
    orders ON users.id = orders.user_id
where orders.user_id is null;


-- 7. Update the user with ID 1 to change their email address to "jane.doe@example.com".
update users
set email = "jane.doe@example.com"
where id = 1;


-- 8. Delete all orders placed by users whose email address contains the string "test".
DELETE FROM orders 
WHERE
    user_id IN (SELECT 
        id
    FROM
        users
    WHERE
        email LIKE '%test%');
        
        
-- 9. Retrieve the total amount of orders placed on each day of the current week, grouped by day.
SELECT 
	count(orders.amount),
    MONTH(orders.updated_at) AS month,
    YEAR(orders.updated_at) AS year,
    DAY(orders.updated_at) AS day
FROM
    users
        INNER JOIN
    orders ON orders.user_id = users.id
GROUP BY DAY(orders.updated_at);


-- 10. Retrieve the IDs and email addresses of users who have placed an order in the current year and whose email address is in the format "example.com".
SELECT 
    users.id,
    users.email
FROM
    users
        INNER JOIN
    orders ON orders.user_id = users.id
GROUP BY DAY(orders.updated_at)
HAVING year = '2022'
    AND email LIKE '%example.com';

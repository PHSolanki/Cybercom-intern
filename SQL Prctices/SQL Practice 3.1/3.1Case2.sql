-- Exercise 3.1 Case-2

CREATE TABLE inventory (
id INT PRIMARY KEY,
name VARCHAR(255),
quantity INT,
price DECIMAL(10,2),
category VARCHAR(50)
);

-- Write a query to retrieve the name and price of all items in the inventory where the quantity is greater than 0 and the category is 'electronics', sorted in descending order by price.
select name , price from inventory where quantity > 0 and category = 'electronics' order by price desc

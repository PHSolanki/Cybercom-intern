-- Exercise 3.2 Case 4

CREATE TABLE orders 
(
    id INT NOT NULL,
    customer_id INT NULL,
    order_date DATE NULL,
    total_amount INT NULL,
    PRIMARY KEY (id)
);

INSERT INTO orders VALUES ('1', '1', '2023-01-01', '2000')
,('2', '1', '2023-02-01', '1500')
,('3', '2', '2023-01-05', '1200')
,('4', '2', '2023-02-05', '1230')
,('5', '2', '2023-02-15', '2000')
,('6', '3', '2023-02-21', '5000');


-- Consider a table called "orders" with the following columns: "id", "customer_id", "order_date", "total_amount". Write a SQL query to calculate the total amount of orders for each customer, sorted in descending order by total amount
select sum(total_amount) from orders group by customer_id order by total_amount;
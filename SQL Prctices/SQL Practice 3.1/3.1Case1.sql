-- Exercise3.1 Case-1

create table customers
(
	id int primary key ,
    name text,
    email text,
    create_at timestamp
);

insert into customers values (1 , 'John Smith' , 'johnsmith@gmail.com' , '2022-01-01 10:00:00'),
							 (2 , 'Jane Doe' , 'janedoe@yahoo.com' , '2022-01-02 11:00:00'),
                             (3, 'Bob Johnson' , 'bobjohnson@hotmail.com' , '2022-01-03 12:00:00'),
                             (4 , 'Sarah Lee' , 'sarahlee@gmail.com' , '2022-01-04 13:00:00'),
                             (5 , 'David Kim' , 'davidkim@yahoo.com' , '2022-01-05 14:00:00');

select * from customers;

-- 1. Write a query that selects all customers whose email address ends with "@gmail.com".
select * from customers where email like ('%@gmail.com');

-- 2. Write a query that selects the customer with the earliest created_at date.
select * from customers having min(create_at);

-- 3. Write a query that selects the name and email of customers who were created on or after January 3, 2022.
select name , email from customers where create_at >= '2022-01-03';

-- 4. Write a query that updates the email address of the customer with id=5 to "davidkim@gmail.com".
update customers
set email = 'davidkim@gmail.com'
where id = 5;

-- 5. Write a query that deletes the customer with id=2.
delete from customers where id=2;

-- 6. Write a query that calculates the total number of customers in the "customers" table.
select count(id) from customers



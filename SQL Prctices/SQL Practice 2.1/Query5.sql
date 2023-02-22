-- Write an SQL query to report all customers who never order anything. Return the result table in any order.

create table Customers
(
	id int primary key,
    name varchar(32)
);

create table Orders
(
	id int primary key,
    customer_id int,
    foreign key (customer_id) references Customers(id)
);

insert into Customers values (1 , 'Joe'),
							 (2 , 'Henry'),
                             (3 , 'Sam'),
                             (4 , 'Max');

insert into Orders values (1 , 3),
						  (2 , 1);

select name from Customers 
where id not in(select customer_id from Orders);
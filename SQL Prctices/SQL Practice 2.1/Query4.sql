-- Write an SQL query to delete all the duplicate emails, keeping only one unique email with the smallest id. Return the result table in any order.

CREATE TABLE Person (
    id INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(32)
);

INSERT INTO Person VALUES ( 1 , 'john@example.com'),
						  ( 2 , 'bob@example.com'),
                          ( 3 , 'john@example.com'),
                          ( 4 , 'priyanshu@gmail.com');
                          
	
delete from Person 
where id not in (select min(id) from Person group by email)

 


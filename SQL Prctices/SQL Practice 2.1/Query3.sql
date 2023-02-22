-- Write an SQL query to swap all 'f' and 'm' values (i.e., change all 'f' values to 'm' and vice versa) with a single update statement and no intermediate temporary tables.Note that you must write a single update statement, do not write any select statement for this problem.

create table salary
(
	id int primary key auto_increment,
    name varchar(32),
    sex enum('m' , 'f'),
    salary int
);

insert into salary values ('1', 'A' , 'm' , '2500'),
						  ('2', 'B' , 'f' , '1500'),
                          ('3', 'C' , 'm' , '5500'),
                          ('4', 'D' , 'f' , '500');
						
UPDATE salary 
SET 
    sex = CASE
        WHEN sex = 'm' THEN 'f'
        ELSE 'm'
    END;

select * from salary;
		
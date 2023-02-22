-- Case-2 

create table courses
(
	student varchar(32),
    class varchar(32),
	primary key (student,class)
);

insert into courses values ('A' , 'Math'),
					('B' , 'English'),
                    ('C' , 'Math'),
                    ('D' , 'Biology'),
                    ('E' , 'Math'),
                    ('F' , 'Computer'),
                    ('G' , 'Math'),
                    ('H' , 'Math'),
                    ('I' , 'Math');
				
select * from courses;

-- Write an SQL query to report all the classes that have at least five students. Return the result table in any order.

select class from (SELECT class, COUNT(student) as numofstudent FROM courses GROUP BY class)as sub_table where numofstudent > 5; 

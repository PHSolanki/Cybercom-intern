-- Create a database structure for employee leave application. It should include all the employee's information as well as their leave information.

create table emp_details
(
	id int primary key auto_increment,
    name varchar(32),
    role varchar(32),
    date_of_birth date
);

create table emp_leave_details
(
	leave_id int primary key auto_increment ,
    emp_id int ,
    application_date date ,
    leave_start_date date ,
    leave_end_date date ,
    leave_type varchar(32) , 
    reason text(255),
    foreign key(emp_id) references emp_details(id) on delete cascade
);
 
insert into emp_details
values('1', 'Priyanshu' , 'Jr. developer' , '2002-05-23'),
	  ('2', 'Dutt' , 'Jr. developer' , '2012-05-22'),
      ('3', 'Priyanshu' , 'Jr. developer' , '2000-5-3'),
      ('4', 'Kirtan' , 'Sr. developer' , '2001-2-3');

insert into emp_leave_details
values('1' , '1' , '2023-02-18' , '2023-02-24' , '2023-02-26' , 'casual' , 'wedding'),
	  ('2' , '2' , '2023-01-12' , '2023-01-14' , '2023-01-16' , 'Sick Leave ' , 'fever'),
      ('3' , '3' , '2023-03-13' , '2023-03-14' , '2023-03-16' , 'Annual Leave ' , 'Trip'),
      ('4' , '4' , '2023-02-19' , '2023-02-20' , '2023-02-26' , 'casual' , 'wedding');
      



    
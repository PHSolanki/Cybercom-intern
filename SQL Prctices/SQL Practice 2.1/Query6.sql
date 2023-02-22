create table details
(
	id int primary key,
    email varchar(32)
);

insert into details values ( 1 , 'abc@gmail.com'),
						   ( 2 , 'def@gmail.com'),
                           ( 3 , 'ghi@gmail.com'),
                           ( 4 , 'jkl@gmail.com');

create index email_index on details(email); 
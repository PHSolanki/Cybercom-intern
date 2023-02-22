create table Colleges (
id int auto_increment,
name varchar(64),
location varchar(64),
primary key (id)
);

create table Students (
id int auto_increment,
name varchar(64),
email_id varchar(64),
college_id int,
primary key (id),
foreign key (college_id) references Colleges(id) on delete cascade
);
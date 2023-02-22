CREATE TABLE cinema (
    id INT PRIMARY KEY AUTO_INCREMENT,
    movie VARCHAR(48),
    description VARCHAR(256),
    rating FLOAT
);

insert into cinema values('1' , 'War' , 'great 3D' , '8.9'),
						 ('2' , 'Science' , 'fiction ' , '8.5'),
                         ('3' , 'irish' , 'boring' , '6.2'),
                         ('4' , 'Ice song' , 'fantacy' , '8.6'),
                         ('5' , 'House card' , 'interesting' , '9.1');
                         
select * from cinema where id % 2 != 0 and description!='boring' order by id desc;


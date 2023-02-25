-- Exercise 3.3 Case-2

create table employees
(
	id int primary key ,
    name text,
    age int ,
    salary int
);

insert into employees values (1 , 'John' , 35 , 60000),
							 (2 , 'Mary' , 27 , 50000),
                             (3 , 'Peter' , 42 , 75000),
                             (4 , 'Olivia' , 29 , 55000),
                             (5 , 'Michael' , 38 , 80000);
                             
-- 1. Write a SQL query to select all employees from the "employees" table.
select * from employees;


-- 2. Write a SQL query to select the name and salary of all employees with a salary greater than 60000.
select name , salary from employees where salary > 60000;


-- 3. Write a SQL query to update Peter's age to 43.
update employees
set age = 43
where name = 'Peter';


-- 4. Write a SQL query to delete the employee with the id of 4.
delete from employees where id = 4;


-- 5. Write a SQL query to calculate the average salary of all employees.
select avg(salary) from employees;


-- 6. Write a SQL query to select the name and age of the oldest employee.
select name , age from employees having max(age) ;


-- 7. Write a SQL query to select the name and age of the youngest employee.
select name , age from employees having min(age);


-- 8. Write a SQL query to select the name of the employee with the highest salary.
select name from employees having max(salary);

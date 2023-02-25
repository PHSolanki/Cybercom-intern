-- Exercise 3.3 Case 1

-- Consider a table called "books" with the following columns: "id", "title", "author", "publication_year". Write a SQL query to retrieve the title and author of the oldest book in the table.

create table books
(
	id int primary key ,
    title varchar(32),
    author varchar(32),
    publication_year int
)

select title , author from books order by publication_year limit 1;
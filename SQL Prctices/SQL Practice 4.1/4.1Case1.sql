--  Exercise 4.1 :Case 1

CREATE TABLE books 
(
    id INT PRIMARY KEY,
    title VARCHAR(255),
    author_id INT,
    publication_date DATE,
    FOREIGN KEY (author_id) REFERENCES authors (id)
);

INSERT INTO books VALUES
(1, 'Harry Potter and the Philosopher\'s Stone', 1, '1997-06-26'),
(2, 'The Shining', 2, '1977-01-28'),
(3, 'To Kill a Mockingbird', 3, '1960-07-11'),
(4, 'The Hobbit', 4, '1937-09-21'),
(5, 'Murder on the Orient Express', 5, '1934-01-01'),
(6, 'Harry Potter and the Chamber of Secrets', 1, '1998-07-02'),
(7, 'The Stand', 2, '1978-10-03'),
(8, 'The Lord of the Rings', 4, '1954-07-29'),
(9, 'And Then There Were None', 5, '1939-11-06'),
(10, 'Harry Potter and the Prisoner of Azkaban', 1, '1999-07-08'),
(11, 'The Da Vinci Code', 1, '2003-03-18'),
(12, 'A Thousand Splendid Suns', 2, '2007-05-22'),
(13, 'The Kite Runner', 2, '2003-05-29'),
(14, 'The Girl with the Dragon Tattoo', 3, '2005-08-01'),
(15, 'The Hunger Games', 4, '2008-09-14');

select * from books;

CREATE TABLE authors 
(
    id INT PRIMARY KEY,
    name VARCHAR(255)
);

INSERT INTO authors VALUES
(1, 'J.K. Rowling'),
(2, 'Stephen King'),
(3, 'Harper Lee'),
(4, 'J.R.R. Tolkien'),
(5, 'Agatha Christie');

select * from authors;

CREATE TABLE book_categories 
(
    id INT PRIMARY KEY,
    name VARCHAR(255)
);

INSERT INTO book_categories VALUES
(1, 'Fantasy'),
(2, 'Horror'),
(3, 'Mystery'),
(4, 'Classic'),
(5, 'fiction');

select * from book_categories;

CREATE TABLE book_category_mappings 
(
    id INT PRIMARY KEY,
    book_id INT,
    category_id INT,
    FOREIGN KEY (book_id) REFERENCES books (id),
    FOREIGN KEY (category_id) REFERENCES book_categories (id)
);

INSERT INTO book_category_mappings VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 4),
(4, 4, 1),
(5, 5, 3),
(6, 6, 1),
(7, 7, 2),
(8, 8, 5),
(9, 9, 3),
(10, 10, 5);

select * from book_category_mappings;

-- 1. Write a query to find all books published in the year 2020.
select * from books where year(publication_date)="2020";


-- 2. Write a query to find the name of the author who has written the most number of books.
SELECT 
    authors.name, COUNT(books.author_id)
FROM
    authors
        INNER JOIN
    books ON books.author_id = authors.id
GROUP BY authors.name
ORDER BY books.author_id
LIMIT 1;


-- 3. Write a query to find the name of the category with the most number of books.
SELECT 
    book_categories.name,
    COUNT(book_category_mappings.category_id) AS count
FROM
    book_categories
        INNER JOIN
    book_category_mappings ON book_categories.id = book_category_mappings.category_id
GROUP BY book_categories.name
ORDER BY count DESC
LIMIT 1;


-- 4. Write a query to find the name of the author who has written the most number of books in the category "fiction".
SELECT 
     authors.name, COUNT(books.author_id)
FROM
    books
        INNER JOIN
    authors ON books.author_id = authors.id
        INNER JOIN
    book_category_mappings ON books.id = book_category_mappings.book_id
        INNER JOIN
    book_categories ON book_categories.id = book_category_mappings.category_id
WHERE
    book_categories.name = 'fiction'
GROUP BY authors.name
ORDER BY COUNT(books.author_id) DESC
LIMIT 1;


-- 5. Write a query to find the titles of the top 5 most popular books. The popularity of a book is defined as the number of times it has been borrowed by customers.
CREATE TABLE customers 
(
	id INT NOT NULL AUTO_INCREMENT,
	name VARCHAR(50) NOT NULL,
	email VARCHAR(50) NOT NULL,
	phone VARCHAR(20),
	PRIMARY KEY (id)
);

INSERT INTO customers (id,name, email, phone)
VALUES ('1','Jane Smith', 'janesmith@example.com', '555-123-4567')
,('2','John Doe', 'johndoe@example.com', '555-555-5555')
,('3','Bob Johnson', 'bjohnson@example.com', '555-987-6543');

select * from customers;

CREATE TABLE book_borrowings 
(
    id INT NOT NULL AUTO_INCREMENT,
    book_id INT NOT NULL,
    customer_id INT NOT NULL,
    borrow_date DATE NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (book_id) REFERENCES books (id),
    FOREIGN KEY (customer_id) REFERENCES customers (id)
);


INSERT INTO book_borrowings
VALUES
(1, 1, 1, '2022-01-01'),
(2, 2, 1, '2022-02-05'),
(3, 3, 1, '2022-02-14'),
(4, 4, 1, '2022-03-01'),
(5, 5, 2, '2022-03-15'),
(6, 6, 2, '2022-04-02'),
(7, 7, 2, '2022-05-01'),
(8, 8, 3, '2022-05-05'),
(9, 9, 1, '2022-06-01'),
(10, 10, 3, '2022-06-25'),
(11, 1, 2, '2022-01-11'),
(12, 2, 3, '2022-02-08'),
(13, 4, 1, '2022-02-18'),
(14, 7, 2, '2022-03-11'),
(15, 8, 3, '2022-03-20');

select * from book_borrowings;

SELECT 
	books.title,
    COUNT(book_borrowings.book_id) AS book_buy
FROM
    books
        INNER JOIN
    book_borrowings ON book_borrowings.book_id = books.id
        INNER JOIN
    customers ON customers.id = book_borrowings.customer_id
GROUP BY books.title
ORDER BY COUNT(book_borrowings.book_id) DESC
LIMIT 5;
    
-- Exercise 3.4 Case-1

CREATE TABLE cars 
(
    carID INT NOT NULL ,
    brand VARCHAR(50) ,
    model VARCHAR(50) ,
    year INT NULL,
    mileage INT NULL,
    price DECIMAL(10 , 2 ),
    available BIT NULL,
    PRIMARY KEY (carID)
);

INSERT INTO Cars 
VALUES (1, 'Toyota', 'Corolla', 2019, 25000, 15000.00, 1),(2, 'Honda', 'Civic', 2018, 28000, 17000.00, 1)
,(3, 'Ford', 'Mustang', 2020, 15000, 28000.00, 0)
,(4, 'Chevrolet', 'Camaro', 2017, 32000, 20000.00, 1)
,(5, 'BMW', '3 Series', 2021, 5000, 35000.00, 1);

select * from cars;

CREATE TABLE customers
(
    customerID INT NOT NULL,
    firstname VARCHAR(50) NULL,
    lastname VARCHAR(50) NULL,
    email VARCHAR(100) NULL,
    phonenumber VARCHAR(20) NULL,
    PRIMARY KEY (customerID)
);

INSERT INTO Customers 
VALUES (1, 'John', 'Doe', 'johndoe@gmail.com', '9925104244')
,(2, 'Jane', 'Smith', 'janesmith@gmail.com', '9898414552')
,(3, 'Bob', 'Johnson', 'bjohnson@gmail.com', '9797845621')
,('4', 'Jack', 'Jason', 'jackjaon@gmail.com','9955887722');

select * from Customers;

CREATE TABLE sales 
(
    salesID INT NOT NULL,
    carID INT NULL,
    customerID INT NULL,
    saledate DATE NULL,
    SalePrice DECIMAL(10 , 2 ) NULL,
    PRIMARY KEY (salesID),
    FOREIGN KEY (carID)
        REFERENCES cars (carID)
        ON DELETE CASCADE,
    FOREIGN KEY (customerID)
        REFERENCES customers (customerID)
        ON DELETE CASCADE
);

INSERT INTO Sales 
VALUES (1, 1, 1, '2022-02-01', 14500.00)
,(2, 2, 2, '2022-02-15', 16500.00)
,(3, 5, 3, '2022-02-20', 32000.00);

select * from Sales;

-- 1. Retrieve the top 10 most expensive cars from the Cars table.
select * from cars order by price desc limit 10;


-- 2. Retrieve the average price of all available cars from the Cars table.
select avg(price) as Average_price from cars where available != 0;


-- 3. Retrieve the list of customers who have purchased a car, along with the total number of cars each customer has purchased. 
SELECT Customers.FirstName, Customers.LastName, COUNT(*) as TotalCarsPurchased
FROM Customers
inner JOIN Sales ON Customers.CustomerID = Sales.CustomerID
GROUP BY Customers.FirstName, Customers.LastName;

-- 4. Retrieve the list of customers who have not yet made a purchase.
SELECT 
    Customers.CustomerID,
    FirstName,
    LastName,
    Email,
    PhoneNumber
FROM
    Customers
        LEFT JOIN
    Sales ON Customers.CustomerID = Sales.CustomerID
WHERE
    Sales.CustomerID is null;
    
-- 5. Insert a new car into the Cars table with the following information: Brand='Toyota', Model='Corolla', Year=2022, Mileage=0, Price=20000, Available=1.
insert into cars values ( 6 , 'Toyota' , 'Corolla' , 2022 , 0 , 20000 , 1);

-- 6. Update the price of all cars in the Cars table by adding 10% to their current price.
update cars
set price = price + price * 0.1;

-- 7. Delete all sales from the Sales table that occurred before February 15, 2022.
delete from sales where saledate < '2022-02-15';



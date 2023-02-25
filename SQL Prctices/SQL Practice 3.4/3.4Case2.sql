-- Exercise 3.4 Case-2

CREATE TABLE Employees 
(
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Gender CHAR(1),
    DateOfBirth DATE,
    Department VARCHAR(50),
    Position VARCHAR(50),
    Salary DECIMAL(10 , 2 ),
    hiredate DATE
);

INSERT INTO Employees 
VALUES 
(1, 'John', 'Doe', 'M', '1980-01-01', 'Sales', 'Manager', 75000.00, '2010-05-01'),
(2, 'Jane', 'Smith', 'F', '1985-05-12', 'Marketing', 'Associate', 45000.00, '2012-03-15'),
(3, 'Bob', 'Johnson', 'M', '1990-08-23', 'Finance', 'Analyst', 55000.00, '2014-01-10'),
(4, 'Emily', 'Davis', 'F', '1995-11-04', 'Engineering', 'Developer', 65000.00, '2018-09-01'),
(5, 'Mike', 'Williams', 'M', '1988-03-15', 'Sales', 'Associate', 40000.00, '2020-06-30');

select * from Employees;

-- 1. Write a query that returns the first and last name of all employees who have a title that contains the word "Manager".
SELECT 
    FirstName, LastName
FROM
    Employees
WHERE
    position = 'Manager';


-- 2. Write a query that returns the department name and the average salary of all employees in each department.
SELECT 
    Department, AVG(Salary)
FROM
    Employees
GROUP BY department;


-- 3. Write a query that returns the number of employees who were hired in each year, sorted by year.
SELECT 
    YEAR(hiredate) AS hire_year, COUNT(*)
FROM
    Employees
GROUP BY hire_year
ORDER BY hire_year;


-- 4. Write a query that returns the first name, last name, and salary of the top 10 highest-paid employees.
SELECT 
    FirstName, LastName, salary
FROM
    employees
ORDER BY salary DESC
LIMIT 10; 


-- 5. Write a query that updates the salary of all employees in the "Sales" department to be 10% higher than their current salary.
UPDATE employees 
SET 
    salary = salary + salary * 0.1
WHERE
    department = 'Sales';
    
    
-- 6. Write a query that deletes all employees who were hired before the year 2000.
delete from employees where year(hiredate) < 2000;


-- 7. Write a query that creates a new table called "employee_stats" that contains the following columns: "department_name", "total_employees", and "average_salary". The table should include one row for each department.
CREATE TABLE employee_stats 
(
    department_name VARCHAR(255),
    total_employees INT,
    average_salary DECIMAL(10 , 2 )
);


-- 8. Write a query that returns the first and last name of all employees who have the same last name as their manager.


-- 9. Write a query that returns the top 5 departments with the highest average salary.
SELECT 
    department, AVG(salary) AS Avg_salary
FROM
    employees
GROUP BY Department
ORDER BY Avg_salary
LIMIT 5; 

-- 10. Write a query that returns the first and last name of all employees who have at least one dependent. Sort the results by last name. 
CREATE TABLE Dependents
(
  id INT PRIMARY KEY,
  emp_id INT,
  First_name VARCHAR(256),
  last_name VARCHAR(256),
  relation VARCHAR(256),
  FOREIGN KEY (emp_id) REFERENCES Employees(EmployeeID) ON DELETE CASCADE
);

INSERT INTO Dependents 
VALUES
  (1, 1, 'Jane', 'Doe', 'Spouse'),
  (2, 1, 'John', 'Doe Jr.', 'Child'),
  (3, 3, 'Emily', 'Smith', 'Spouse'),
  (4, 4, 'James', 'Lee', 'Child'),
  (5, 5, 'Olivia', 'Johnson', 'Child'),
  (6, 5, 'Liam', 'Johnson', 'Child'),
  (7, 6, 'Sophia', 'Wilson', 'Child'),
  (8, 7, 'Ava', 'Davis', 'Child');
   
SELECT e.FirstName, e.LastName
FROM Employees e
JOIN Dependents d ON e.EmployeeID = d.emp_id
GROUP BY e.EmployeeID, e.FirstName, e.LastName
HAVING COUNT(d.id) >= 1
ORDER BY e.LastName;







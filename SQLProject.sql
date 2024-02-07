CREATE DATABASE LIBRARY;
USE LIBRARY;

-- Create Branch table
CREATE TABLE Branch (
    Branch_no INT PRIMARY KEY,
    Manager_Id INT,
    Branch_address VARCHAR(255),
    Contact_no VARCHAR(15)
);

-- Create Employee table
CREATE TABLE Employee (
    Emp_Id INT PRIMARY KEY,
    Emp_name VARCHAR(255),
    Position VARCHAR(50),
    Salary DECIMAL(10, 2),
    Branch_no INT,
    FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no)
);

-- Create Customer table
CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    Customer_name VARCHAR(255),
    Customer_address VARCHAR(255),
    Reg_date DATE
);

-- Create IssueStatus table
CREATE TABLE IssueStatus (
    Issue_Id INT PRIMARY KEY,
    Issued_cust INT,
    Issued_book_name VARCHAR(255),
    Issue_date DATE,
    Isbn_book INT,
    FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN)
);

-- Create ReturnStatus table
CREATE TABLE ReturnStatus (
    Return_Id INT PRIMARY KEY,
    Return_cust INT,
    Return_book_name VARCHAR(255),
    Return_date DATE,
    Isbn_book2 INT,
    FOREIGN KEY (Return_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN)
);

-- Create Books table
CREATE TABLE Books (
    ISBN INT PRIMARY KEY,
    Book_title VARCHAR(255),
    Category VARCHAR(50),
    Rental_Price DECIMAL(10, 2),
    Status ENUM('yes', 'no'),
    Author VARCHAR(255),
    Publisher VARCHAR(255)
);

-- Insert data into Branch table
INSERT INTO Branch (Branch_no, Manager_Id, Branch_address, Contact_no) VALUES
(1, 101, '123 Main St', '555-1234'),
(2, 102, '456 Oak St', '555-5678');

select * from Branch;
-- Insert data into Employee table
INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary, Branch_no)
VALUES (101, 'John Doe', 'Manager', 50000.00, 1),
       (102, 'Jane Smith', 'Clerk', 35000.00, 2);
INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary, Branch_no)
VALUES (103, 'Michael Johnson', 'Librarian', 40000.00, 1),
       (104, 'Emily White', 'Assistant Manager', 45000.00, 2),
       (105, 'Robert Brown', 'Clerk', 35000.00, 1); 
       
INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary, Branch_no)
VALUES
    (6, 'Sophia Miller', 'Marketing Specialist', 49000, 1),
    (7, 'William Brown', 'Software Engineer', 60000, 1),
    (8, 'Ava Wilson', 'Finance Manager', 58000, 1),
    (9, 'James Davis', 'Customer Support Specialist', 45000, 2),
    (10, 'Isabella Moore', 'Sales Manager', 62000, 2),
    (11, 'Ethan Hall', 'Network Administrator', 53000, 1),
    (12, 'Mia Taylor', 'HR Coordinator', 47000, 2),
    (13, 'Liam Smith', 'Business Analyst', 56000, 2),
    (14, 'Amelia Carter', 'Quality Assurance', 51000, 1),
    (15, 'Logan Turner', 'Executive Assistant', 48000, 2);       
       
select * from Employee;
-- Insert data into Customer table
INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date) VALUES
(1, 'Bob Customer', '789 Elm St', '2024-01-27'),
(2, 'Eva Client', '101 Pine St', '2024-01-28');


select * from Customer;
-- Insert data into Books table
INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher) VALUES
(1001, 'Introduction to SQL', 'Programming', 10.99, 'yes', 'John Doe', 'Tech Books Inc.'),
(1002, 'Python Programming', 'Programming', 15.99, 'yes', 'Jane Smith', 'Coding Press');
-- Insert more data into 'Books' table
INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher)
VALUES (103, 'Data Structures and Algorithms', 'Computer Science', 15.99, 'yes', 'Mark Johnson', 'Publisher C'),
       (104, 'The Art of Fiction', 'Literature', 8.99, 'yes', 'Alice Miller', 'Publisher D'),
       (105, 'Chemistry Essentials', 'Science', 14.99, 'no', 'David Robinson', 'Publisher E'),
       (106, 'The History of Art', 'Art', 18.99, 'yes', 'Sophie Turner', 'Publisher F'),
       (107, 'Introduction to Machine Learning', 'Computer Science', 22.99, 'no', 'Alex Chen', 'Publisher G'),
       (108, 'Poetry Anthology', 'Literature', 10.99, 'yes', 'Elena Martinez', 'Publisher H');
INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher)
VALUES (109, 'The programming paradigms', 'Computer Science', 15.99, 'yes', 'Mark Johnson', 'Publisher C'),
       (110, 'Switching theory', 'Electronics', 15.99, 'yes', 'Mark Johnson', 'Publisher C'),
       (111, 'Electronic Machines', 'Electronics', 15.99, 'yes', 'Mark Johnson', 'Publisher C'),
       (112, 'Engineering Mathematics 1', 'Maths', 15.99, 'yes', 'Mark Johnson', 'Publisher C'),
       (113, 'Discrete computational structures', 'Maths', 15.99, 'yes', 'Mark Johnson', 'Publisher C'),
       (114, 'Mathematics 3', 'Maths', 15.99, 'yes', 'Mark Johnson', 'Publisher C'),
       (115, 'Fundamentals of Physics', 'Science', 15.99, 'yes', 'Mark Johnson', 'Publisher C'),
       (116, 'Informations about our Body', 'Science', 15.99, 'yes', 'Mark Johnson', 'Publisher C');

select * from Books;
-- Insert data into IssueStatus table
INSERT INTO IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book) VALUES
(1, 1, 'Introduction to SQL', '2024-01-28', 1001),
(2, 2, 'Python Programming', '2024-01-29', 1002);
select * from IssueStatus;
-- Insert data into ReturnStatus table
INSERT INTO ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, Isbn_book2) VALUES
(1, 1, 'Introduction to SQL', '2024-02-05', 1001),
(2, 2, 'Python Programming', '2024-02-08', 1002);
select * from ReturnStatus;



-- 1. Retrieve the book title, category, and rental price of all available books.
SELECT Book_title,Category,Rental_Price FROM Books WHERE Status = 'yes';

-- 2. List the employee names and their respective salaries in descending order of salary.
SELECT Emp_name,Salary FROM employee ORDER BY Salary desc;

-- 3. Retrieve the book titles and the corresponding customers who have issued those books.
SELECT Issued_Book_name,Issue_Id FROM IssueStatus;

-- 4. Display the total count of books in each category.
SELECT Category,count(*) as BookCount FROM Books GROUP BY Category;

-- 5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000.
SELECT Emp_name,Position FROM Employee WHERE Salary>50000.00;


-- 6. List the customer names who registered before 2022-01-01 and have not issued any books yet.
SELECT Customer_name FROM Customer WHERE Reg_date<2022-01-01 AND Customer_name NOT IN (SELECT Issued_cust FROM IssueStatus);


-- 7. Display the branch numbers and the total count of employees in each branch.
SELECT Branch_no,count(*) as tatalcount FROM Employee GROUP BY Branch_no;


-- 8. Display the names of customers who have issued books in the month of June 2023.
SELECT DISTINCT c.Customer_name
FROM Customer c
JOIN IssueStatus i ON c.Customer_Id = i.Issued_cust
WHERE MONTH(i.Issue_date) = 6 AND YEAR(i.Issue_date) = 2023;


-- 9. Retrieve book_title from book table containing history. 
SELECT Book_title
FROM Books
WHERE Category = 'History';

-- 10.Retrieve the branch numbers along with the count of employees for branches having more than 5 employees.
SELECT Branch_no,COUNT(*) AS EMP_COUNT FROM Employee GROUP BY Branch_no HAVING EMP_COUNT>5;

SELECT Branch_no, COUNT(*) AS Employee_Count
FROM Employee
GROUP BY Branch_no
HAVING Employee_Count > 5;


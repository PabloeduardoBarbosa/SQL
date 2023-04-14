CREATE TABLE employee (
  Salary DECIMAL(10,2),
  Birthday DATE,
  Name VARCHAR(50),
  Age INT,
  Sex CHAR(1)
);

-- creating table employee:
CREATE TABLE employee (
  Emp_Id INT,
  Emp_Name VARCHAR(50),
  Age INT,
  Gender CHAR(1),
  Doj DATE,
  Dept VARCHAR(50),
  City VARCHAR(50),
  Salary DECIMAL(10,2)
);


-- turning Emp_Id into primary key:
ALTER TABLE employee
ADD CONSTRAINT pk_employee_empid PRIMARY KEY (Emp_Id);


INSERT INTO employee (Emp_Id, Emp_Name, Age, Gender, Doj, Dept, City, Salary) 
VALUES 
  (1001, 'John Doe', 32, 'M', '2015-03-15', 'IT', 'New York', 5500.00),
  (1002, 'Jane Smith', 29, 'F', '2016-05-23', 'Marketing', 'Los Angeles', 4200.50),
  (1003, 'Mike Johnson', 36, 'M', '2014-09-12', 'Finance', 'Chicago', 2800.00),
  (1004, 'Amanda Brown', 34, 'F', '2013-07-05', 'Sales', 'Houston', 5000.00),
  (1005, 'David Lee', 28, 'M', '2017-11-30', 'IT', 'San Francisco', 3900.75),
  (1006, 'Sarah Green', 32, 'F', '2015-02-19', 'Marketing', 'Boston', 4700.00),
  (1007, 'Eric Wong', 27, 'M', '2019-07-14', 'Finance', 'Seattle', 3200.25),
  (1008, 'Rachel Kim', 37, 'F', '2012-03-26', 'Sales', 'Miami', 5500.00),
  (1009, 'Lisa Chen', 30, 'F', '2014-12-02', 'IT', 'Dallas', 4200.00),
  (1010, 'Jason Davis', 28, 'M', '2018-08-22', 'Marketing', 'Denver', 3600.00);


SELECT * FROM employee

-- selecting different ages: 
SELECT DISTINCT Age AS Difference FROM employee

-- count the number of salaries:
SELECT COUNT(Salary) AS SalaryCount FROM employee

-- summing the salary:
SELECT SUM(Salary) AS SalarySum FROM employee

-- avg of all the salaries:
SELECT AVG(Salary) AS SalaryAvg FROM employee

-- selecting where the age is greater than 30:
SELECT * FROM employee WHERE Age > 30

-- selecting the name and the salary, where the sex is the same as F 
SELECT NAME, Age FROM  employee WHERE Sex = 'F'

-- selecting only employees where the age is 32 or 29:
SELECT * FROM employee WHERE 
Age = 32 OR Age = 29

-- selecting employees between different birthdates:
SELECT * FROM employee WHERE 
Birthday BETWEEN 1990-01-15 AND 1995-07-14

-- selecting all from the emp where sex is M and the age is greater than 30:
SELECT * FROM employee 
WHERE Age > 30 AND Sex = 'M';

-- grouping by the sex, the salary:
SELECT Sex, SUM(Salary) AS total_salary FROM employee
GROUP BY Sex 

-- selecting the desc salary of all the emp:
SELECT * FROM employee ORDER BY Salary DESC

SELECT Sex, sum(Salary) AS SalaryTotal FROM employee
ORDER BY Sex   

-- upper and reverse
SELECT UPPER(REVERSE('Dracula'))

-- replacing 
SELECT REPLACE("Pablo is Ugly", "Ugly", "Beautiful")

-- finding the index of a certain word:
SELECT POSITION("Pretty" IN "Pablo is so Pretty")


-- selecting the distinct city from the employee:
SELECT DISTINCT City FROM employee

-- now selecting distinct dept from the employee:
SELECT DISTINCT Dept FROM employee

-- selecting the avg age from the employee:
SELECT AVG(age)  FROM employee

-- selecting avg age of which department:
SELECT dept, ROUND(AVG(age),1) AS AVG_Age FROM employee
GROUP BY dept

-- now almost the same thing, but here we are summing the salaries:
SELECT dept, SUM(salary) AS salary_sum FROM employee 
GROUP BY dept

-- count the id of the employee by the city:
SELECT COUNT(emp_id) AS id_counter, city FROM employee 
GROUP BY city 

-- selecting all of the emp id by the date of join
SELECT YEAR(doj) AS YEAR, COUNT(emp_id) AS ID 
FROM employee 
GROUP BY doj

CREATE TABLE sales (
  Product_Id INT PRIMARY KEY,
  Sell_Price DECIMAL(10, 2),
  Quantity INT,
  State VARCHAR(255)
);


INSERT INTO sales (Product_Id, Sell_Price, Quantity, State) VALUES
  (1, 10.99, 50, 'California'),
  (2, 25.50, 20, 'New York'),
  (3, 5.99, 100, 'Texas'),
  (4, 15.75, 75, 'Florida'),
  (5, 8.25, 60, 'Arizona'),
  (6, 12.99, 40, 'Illinois'),
  (7, 7.50, 80, 'Virginia'),
  (8, 18.99, 30, 'Georgia'),
  (9, 6.25, 90, 'Ohio'),
  (10, 11.50, 55, 'Pennsylvania');

-- here we take the product id and then we multiply the sell by the quantity and then we show it:
SELECT product_id, SUM(sell_price * quantity) AS revenue
FROM sales 
GROUP BY product_id



CREATE TABLE c_product (
  Product_Id INT PRIMARY KEY,
  Cost_Price DECIMAL(10, 2)
);

INSERT INTO c_product (Product_Id, Cost_Price) VALUES
  (1, 8.99),
  (2, 20.00),
  (3, 4.99),
  (4, 13.50),
  (5, 6.75),
  (6, 10.50),
  (7, 5.99),
  (8, 16.25),
  (9, 3.50),
  (10, 9.75);

-- here I select from the product id, and then I subtract from the sell price to the cost price then
-- inner join both of them and at the end I take by the id to know the profit of which product --
SELECT c.product_id, SUM((s.sell_price -  c.cost_price) * quantity) AS profit
FROM sales AS s INNER JOIN c_product AS c
WHERE s.product_id = c.product_id
GROUP BY product_id

-- here I select the depts that have salaries above 4000:
SELECT dept, AVG(salary) AS AVG_Salary 
FROM employee
GROUP BY dept
HAVING AVG(salary) > 4000

-- now the same thing, but for the cities:
SELECT city, AVG(salary) AS AVG_salary 
FROM employee
GROUP BY city 
HAVING AVG(salary) > 3000

-- counting the dept that has more than 2 emps:
SELECT dept, COUNT(*) AS emp_count
FROM employee
GROUP BY dept
HAVING COUNT(*) > 2

-- now doing the same thing above, but for the cities, unless for Houston: 
SELECT city, COUNT(*) AS emp_count 
FROM employee 
WHERE city != "Houston"
GROUP BY city 
HAVING COUNT(*) > 2;


-- now summing the salary of which department that has more than 3k:
SELECT dept, COUNT(*) AS emp_count
FROM employee 
GROUP BY dept 
HAVING AVG(salary) > 3000

-- creating table Orders:

CREATE TABLE Orders (
  Orderld INT,
  OrderDate DATE,
  ShippedDate DATE,
  ProductName VARCHAR(50),
  StatusOfDelivery VARCHAR(20),
  Quantity INT
);


INSERT INTO Orders (Orderld, OrderDate, ShippedDate, ProductName, StatusOfDelivery, Quantity) 
VALUES 
(1, '2022-01-01', '2022-01-05', 'Product A', 'Delivered', 10),
(2, '2022-01-02', '2022-01-06', 'Product B', 'Shipped', 5),
(3, '2022-01-03', '2022-01-07', 'Product C', 'Pending', 20),
(4, '2022-01-04', '2022-01-08', 'Product D', 'Delivered', 15),
(5, '2022-01-05', '2022-01-09', 'Product E', 'Shipped', 12),
(6, '2022-01-06', '2022-01-10', 'Product F', 'Pending', 8),
(7, '2022-01-07', '2022-01-11', 'Product G', 'Delivered', 25),
(8, '2022-01-08', '2022-01-12', 'Product H', 'Shipped', 3),
(9, '2022-01-09', '2022-01-13', 'Product I', 'Delivered', 7),
(10, '2022-01-10', '2022-01-14', 'Product J', 'Pending', 18);


CREATE TABLE Customers (
  OrderId INT,
  CustomerId INT,
  PhoneNumber VARCHAR(20),
  CustomerName VARCHAR(50),
  Address VARCHAR(100)
);

INSERT INTO Customers (OrderId, CustomerId, PhoneNumber, CustomerName, Address) 
VALUES 
(1, 1001, '123-456-7890', 'John Smith', '123 Main St, Anytown USA'),
(2, 1002, '987-654-3210', 'Jane Doe', '456 Elm St, Anytown USA'),
(3, 1003, '555-555-5555', 'Bob Johnson', '789 Oak St, Anytown USA'),
(4, 1004, '111-222-3333', 'Samantha Lee', '321 Maple Ave, Anytown USA'),
(5, 1005, '444-555-6666', 'David Kim', '654 Pine St, Anytown USA'),
(6, 1006, '777-888-9999', 'Rachel Chen', '987 Cedar Rd, Anytown USA'),
(7, 1007, '333-444-5555', 'Mike Thompson', '246 Birch Ln, Anytown USA'),
(8, 1008, '666-777-8888', 'Sarah Brown', '135 Oak Dr, Anytown USA'),
(9, 1009, '222-333-4444', 'Emily Davis', '864 Pine Rd, Anytown USA'),
(10, 1010, '999-888-7777', 'Tom Wilson', '753 Maple St, Anytown USA');













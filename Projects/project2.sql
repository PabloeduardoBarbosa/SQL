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



CREATE TABLE Cricket (
  Cricket_id INT PRIMARY KEY,
  Name VARCHAR(50)
);

INSERT INTO Cricket (Cricket_id, Name) 
VALUES 
(1, 'Sachin Tendulkar'),
(2, 'Virat Kohli'),
(3, 'Ricky Ponting'),
(4, 'Brian Lara'),
(5, 'Jacques Kallis'),
(6, 'AB de Villiers'),
(7, 'MS Dhoni'),
(8, 'Kumar Sangakkara'),
(9, 'Shane Warne'),
(10, 'Glenn McGrath');


CREATE TABLE Football (
  Football_id INT PRIMARY KEY,
  Name VARCHAR(50)
);

INSERT INTO Football (Football_id, Name) 
VALUES 
(1, 'Lionel Messi'),
(2, 'Cristiano Ronaldo'),
(3, 'Neymar Jr.'),
(4, 'Kylian Mbappé'),
(5, 'Robert Lewandowski'),
(6, 'Kevin De Bruyne'),
(7, 'Virgil van Dijk'),
(8, 'Sadio Mané'),
(9, 'Mohamed Salah'),
(10, 'Harry Kane');


-- selecting the players that have the same name on wich table using inner join:
SELECT * FROM cricket AS c INNER JOIN 
football AS f ON c.Name=f.name

-- now selecting the ones that has same Id's: 
SELECT c.cricket_id, c.name, f.Football_id, f.name 
FROM cricket AS c INNER JOIN football AS f
ON f.Football_id=c.Cricket_id


 CREATE DATABASE triggers

















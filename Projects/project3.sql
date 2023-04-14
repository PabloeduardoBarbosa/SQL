create table customers
(cust_id int, age int, name varchar(30));

delimiter //
CREATE TRIGGER age_verify 
BEFORE INSERT ON customers 
FOR EACH ROW 
if NEW.age < 0 then SET NEW.age = 1;
END if;
//

INSERT INTO Customers 
VALUES(1, -12, "Niko"),
		(2, -15, "Tiko"),
		(3, 7, "Liko"),
		(4, 9, "Fiko");
		
SELECT * FROM customers
 
create table customers1(
id int auto_increment primary key, name varchar(40) not null,
email varchar(30), birthdate DATE);

﻿
create table message ( id int auto_increment, messageId int,
message varchar(300) not null, primary key (id, messageId)
);

Delimiter //
CREATE TRIGGER 
check_null_dob
AFTER INSERT
ON customers1
FOR EACH ROW 
BEGIN
if NEW.birthdate IS NULL then 
INSERT INTO message(messageId, message)
VALUES(NEW.id, CONCAT('Hi ', NEW.name, ', please update ur name'));
END if 
//    

﻿

insert into customers1 (name, email, birthdate) values ("Nancy", "nancy@abc.com", NULL),
("Ronald", "ronald@xyz.com", "1998-11-16"), ("Chris", "chris@xyz.com", "1997-08-20"), ("Alice", "alice@anc.com", NULL);


SELECT * FROM message
create database Supermarket_DBMS default character set utf8mb4;
use Supermarket_DBMS;

# TABLE CREATION

create table Staff
(Staff_ID varchar(5), 
Staff_FName char(10), 
Staff_LName char(10), 
UNIQUE(Staff_ID), PRIMARY KEY (Staff_ID), 
Contact float, 
Salary int, 
Job_Profile char(20),
DOB date,
Gender char DEFAULT('NOT SPECIFIED'));
desc Staff;

create table Supplier
(Supplier_ID varchar(5), PRIMARY KEY (Supplier_ID),
SupName char(50), 
Product_Type varchar(20),
Sup_Contact float,
Sup_Location char(10));
desc Supplier;

create table Customers
(Cust_Index int AUTO_INCREMENT NOT NULL, INDEX BTREE (Cust_Index),
Customer_ID varchar(5),
PRIMARY KEY (Customer_ID),
Customer_FName char(10),
Customer_LName char(10),
Cust_Contact float, 
Location char(10));
desc Customers;

create table Orders
(Order_ID varchar(5), PRIMARY KEY(Order_ID),
Customer_ID varchar(5), 
CONSTRAINT FOREIGN KEY (Customer_ID) references Customers(Customer_ID),
Order_Status varchar(50),
Order_Date DATE,
Feedback varchar(500));
alter table Orders add Product_ID varchar(10) after Customer_ID;
desc Orders;

create table Products
(Product_ID varchar(10), PRIMARY KEY(Product_ID),
Product_Name varchar(10),
Product_Type varchar(15),
INDEX BTREE (Product_Type),
Supplier_ID varchar(5),
CONSTRAINT FOREIGN KEY (Supplier_ID) references Supplier(Supplier_ID));

create table Grievances
(Grievance_ID varchar(5), PRIMARY KEY(Grievance_ID),
Grievance varchar(500),
Customer_ID varchar(5),
Order_ID varchar(5), 
CONSTRAINT FOREIGN KEY (Order_ID) references Orders(Order_ID) ,
Date_Returned DATE,
Product_ID varchar(10));
desc Grievances;

create table Transactions
(Transac_ID varchar(5),
PRIMARY KEY(Transac_ID),
Transac_Status varchar(15),
Amount int,
Order_ID varchar(5), 
CONSTRAINT FOREIGN KEY (Order_ID) references Orders(Order_ID));
desc Transactions;

create table Storage
(Product_ID varchar(5), CONSTRAINT FOREIGN KEY(Product_ID) references Products(Product_ID) ,
Product_Brand varchar(10),
Product_Cost varchar(10),
Quantity int,
Order_Count int, #Orders placed in past one month
Warehouse_Code varchar(5), CONSTRAINT FOREIGN KEY (Warehouse_Code) references Warehouse(Warehouse_Code) );
desc Storage;

create table Warehouse
(Warehouse_Code varchar(5),
PRIMARY KEY (Warehouse_Code),
Warehouse_Location char(15),
Staff_Count int,
Staff_FName char(10),
Staff_ID varchar(5), CONSTRAINT FOREIGN KEY (Staff_ID) references Staff(Staff_ID) );
desc Warehouse;

# VALUE INSERTION

alter table Staff modify Contact float;
insert into Staff values('St001',   'Rohan',	'Shah',		  	9630799829,		10000,	'Clerk',				'1999-06-04', 'M');
insert into Staff values('St002', 	'Niketa',	'Sharma',		9826367698,		25000,	'Accountant',			'1975-04-06', 'F');
insert into Staff values('St003',	'Rohit',	'Patel',		9966338927,		35000,	'Assistant Manager',	'1995-08-21', 'M');
insert into Staff values('St004',	'Kalpana',	'Srivastava',	9109182153,		35000,	'Manager',				'1982-09-23', 'F');
insert into Staff values('St005',	'Nilesh',	'Joshi',		9826082484,		10000,	'Clerk',				'1982-07-11', 'M');
insert into Staff values('St006',	'Yash',		'Shukla',		8849928902,		35000,	'Manager',				'1982-07-11', 'M');
insert into Staff values('St007',	'Sachin',	'Agrawal',		8783315692,		35000,	'Manager',				'1982-07-11', 'M');
select*from Staff;

desc Supplier;
insert into Supplier values('Su001',	'Edward Tailors', 		'Clothing ',	6269382739,	'Surat');
insert into Supplier values('Su002',	'Sofia hygiene', 	'Cleaning',		9828586627,	'Ahemdabad');
insert into Supplier values('Su003',	'Aditi General Store', 	'Food Items',	7225338138,	'Bharuch');
insert into Supplier values('Su004',	'Subhash Mahajan',  'Dairy',		9111488776,	'Daman');
insert into Supplier values('Su005',	'Rithik Joshi', 	'Berage',		6265617819,	'Vadodara');
select*from Supplier;

desc Customers;
insert into Customers(Customer_ID, Customer_FName, Customer_LName, Cust_Contact, Location) values('C0001','Rajat','Sharma',8889498059,'Manjalpur');
insert into Customers(Customer_ID, Customer_FName, Customer_LName, Cust_Contact, Location) values('C0002','Anushka','Jaiswal',9425981034, 'Akota');
insert into Customers(Customer_ID, Customer_FName, Customer_LName, Cust_Contact, Location) values('C0003','Param ','Joshi',7993739531,'Alkapuri');
insert into Customers(Customer_ID, Customer_FName, Customer_LName, Cust_Contact, Location) values('C0004','Harshal','Mahajan',9682372435,'Mandvi');
insert into Customers(Customer_ID, Customer_FName, Customer_LName, Cust_Contact, Location) values('C0005','Khushi','Dubey',7822899616,'Makarpura');
select*from Customers;


desc Orders;
insert into Orders values('Or001','C0003','P002','Completed','2022-09-20','GOOD'); 
insert into Orders values('Or002','C0005','P003','Accepted','2022-09-18','GOOD'); 
insert into Orders values('Or003','C0001','P004','Completed','2022-09-15','Average'); 
insert into Orders values('Or004','C0002','P002','Progress','2022-09-25','NULL'); 
insert into Orders values('Or005','C0004','P001','Cancelled','2022-09-21','Defective');
select*from Orders;

desc Storage;
alter table Products modify Product_Name varchar(50);
insert into Products values('P001','T-shirt','Clothing','Su001');
insert into Products values('P002','Moisturiser','Self-Care','Su005');
insert into Products values('P003','Chocolate','Food Item','Su004');
insert into Products values('P004','Paneer','Dairy Products','Su001');
insert into Products values('P005','Energy Drink','Beverage','Su003');
select*from Products;

desc Transactions;
insert into Transactions values('T0001','Successful', 399,'Or001');
insert into Transactions values('T0002','Successful', 60,'Or002');
insert into Transactions values('T0003','Failed', 1999,'Or005');
insert into Transactions values('T0004','Successful', 399,'Or004');
insert into Transactions values('T0005','NULL', 199,'Or003');
select*from Transactions;

desc Warehouse;
insert into Warehouse values('W001','Vadodara',250,'Sachin','St007');
insert into Warehouse values('W002','Valsad',150,'Rohan','St001');
insert into Warehouse values('W003','Surat',400,'Yash','St006');
select*from Warehouse;

desc Grievances;
insert into Grievances values('G001',	'NO GRIEVANCE',					'C0001',		'Or001',	'2022-09-20',	'P001');
insert into Grievances values('G002',	'NO GRIEVANCE',					'C0002',		'Or002',	'2022-09-18',	'P002');
insert into Grievances values('G003',	'NO GRIEVANCE',					'C0003',		'Or003',	'2022-09-15',	'P003');
insert into Grievances values('G004',	'NO GRIEVANCE',					'C0004',		'Or004',	'2022-09-25',	'P004');
insert into Grievances values('G005',	'Used and Damaged product with bad quality',	'C0005',	'Or005',	'2022-09-21',	'P005');
select*from Grievances;

desc Storage;
insert into Storage values('P001','Levis','1999','1000','1','W002');
insert into Storage values('P002','Nivea','399','10000','1','W001');
insert into Storage values('P003','Dairy Milk','60','50000','1','W001');
insert into Storage values('P004','Amul','199','199','100000','W003');
insert into Storage values('P005','Red Bull','120','5000','0','W002');
select*from Storage;

#QUERIES

#1 List of Successfull transactions
Select Orders.Order_ID, Orders.Customer_ID from Transactions, Orders where Transac_Status = 'Successful' and Transactions.Order_ID = Orders.Order_ID;
     
#2 List of unsuccessful transactions
select*from Transactions, Orders where Transac_Status<>'Successful' and Transactions.Order_ID = Orders.Order_ID;

#3 List of customers who had grievance         
Select Customers.Customer_ID, Customer_FName, Customer_LName from Customers, Grievances where Customers.Customer_ID = Grievances.Customer_ID AND Grievances.Customer_ID NOT IN ( Select Customer_ID from Grievances where Grievance = 'NO GRIEVANCE');    

#4 List of customers that are supplied by Su001
Select Product_Name, Product_Type from Products where Supplier_ID = 'Su001';

#5 List all products that are delievered
Select * from Orders where order_status = 'completed';     

#6 List all female employees in the company
Select Staff_ID, Staff_FName, Staff_LName from Staff where Gender = 'F';

#7 List of products that have been sucessfully delivered
Select Products.Product_Name, Products.Product_Type from Transactions, Products,Orders where Transac_Status = 'Successful' and Transactions.Order_ID = Orders.Order_ID and Orders.Product_ID = Products.Product_ID;

#8 List of employees that born between between 1995 and 1999
Select Staff_ID, Staff_FName, Staff_LName from Staff where DOB Between '1995-01-01' AND '1999-01-01'; 

#9 List all the product brands that are there in the storage
Select Product_Brand from Storage where Quantity > 0;        

#10 List all the products that are ordered in excess         
Select Products.Product_Name from Storage, Products where Storage.Quantity < Storage.Order_Count AND Storage.Product_ID = Products.Product_ID;

#11 Count of different brands in the storage
Select Product_Brand, Count(Product_ID) from Storage group by Product_Brand;

#12 Count  number of staffs with Salary > 10000
Select Count(Staff_ID) from Staff where Salary > 10000;

#13 Display name and job profile of staff with Salary > 10000    
Select Staff_ID, Staff_FName, Job_Profile from Staff where Salary > 10000;    

#14 List of supplier locations
Select Distinct(Sup_location) from Supplier group by Sup_Location; 

#15 Display Grivance, Customer ID, and Name of Customer where Grievance = No grievance
Select Grievance, Grievances.Customer_ID, Customer_FName from Grievances, Customers where Grievance <> 'NO Grievance' and Grievances.Customer_ID = Customers.Customer_ID;

#16 List staff count in different warehouses
Select Warehouse_Location, SUM(Staff_Count) from Warehouse group by Warehouse_Location;
commit;
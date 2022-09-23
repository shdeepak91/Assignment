DROP DATABASE IF EXISTS retail;
CREATE DATABASE retail;
USE retail;
CREATE TABLE sales_people(
snum INT,
sname VARCHAR(30),
city VARCHAR(30),
comm DECIMAL(4,2),
PRIMARY KEY (snum)
);
SELECT * FROM sales_people;
INSERT INTO sales_people(snum,sname,city,comm) VALUES (1001, 'Peel', 'London', 0.12);
INSERT INTO sales_people(snum,sname,city,comm) VALUES (1002,  'Serres', 'Sanjose', 0.13);
INSERT INTO sales_people(snum,sname,city,comm) VALUES (1004, 'Motika', 'London', 0.11);
INSERT INTO sales_people(snum,sname,city,comm) VALUES (1007, 'Rifkin', 'Barcelona', 0.15);
INSERT INTO sales_people(snum,sname,city,comm) VALUES (1003, 'Axelrod', 'Newyork', 0.10);

CREATE TABLE customers(
cnum INT,
cname VARCHAR(30),
city VARCHAR(30),
snum INT,
PRIMARY KEY (cnum),
FOREIGN KEY (snum) REFERENCES sales_people(snum)
);

SELECT * FROM customers;
INSERT INTO customers(cnum,cname,city,snum) VALUES (2001,  'Hoffman', 'London', 1001);
INSERT INTO customers(cnum,cname,city,snum) VALUES (2002,  'Giovanni', 'Rome', 1003);
INSERT INTO customers(cnum,cname,city,snum) VALUES (2003,  'Liu', 'Sanjose', 1002);
INSERT INTO customers(cnum,cname,city,snum) VALUES (2004,  'Grass', 'Berlin', 1002);
INSERT INTO customers(cnum,cname,city,snum) VALUES (2006, 'Clemens', 'London', 1001);
INSERT INTO customers(cnum,cname,city,snum) VALUES (2008, 'Cisneros', 'Sanjose', 1007);
INSERT INTO customers(cnum,cname,city,snum) VALUES (2007, 'Pereira', 'Rome', 1004);

CREATE TABLE orders(
onum INT,
amt DECIMAL(7,2),
odate DATE,
cnum INT,
snum INT,
PRIMARY KEY (onum),
FOREIGN KEY (cnum) REFERENCES customers(cnum),
FOREIGN KEY (snum) REFERENCES sales_people(snum)
);
SELECT * FROM orders;
INSERT INTO orders(onum,amt,odate,cnum,snum) VALUES (3001,  18.69,   '1990-10-03', 2008, 1007);
INSERT INTO orders(onum,amt,odate,cnum,snum) VALUES (3003,  767.19,  '1990-10-03', 2001, 1001);
INSERT INTO orders(onum,amt,odate,cnum,snum) VALUES (3002,  1900.10, '1990-10-03', 2007, 1004);
INSERT INTO orders(onum,amt,odate,cnum,snum) VALUES (3005,  5160.45, '1990-10-03', 2003, 1002);
INSERT INTO orders(onum,amt,odate,cnum,snum) VALUES (3006,  1098.16, '1990-10-03', 2008, 1007);
INSERT INTO orders(onum,amt,odate,cnum,snum) VALUES (3009,  1713.23, '1990-10-04', 2002, 1003);
INSERT INTO orders(onum,amt,odate,cnum,snum) VALUES (3007,  75.75,   '1990-10-04', 2004, 1002);
INSERT INTO orders(onum,amt,odate,cnum,snum) VALUES (3008,  4273.00, '1990-10-05', 2006, 1001);
INSERT INTO orders(onum,amt,odate,cnum,snum) VALUES (3010,  1309.95, '1990-10-06', 2004, 1002);
INSERT INTO orders(onum,amt,odate,cnum,snum) VALUES (3011,  9891.88, '1990-10-06', 2006, 1001);
#count the number of sales person whose name begin with A/a.
SELECT * FROM sales_people WHERE sname like 'A%';

#Display all the sales person whose all orders is more than rs. 2000.
SELECT orders.snum,orders.amt,
sales_people.sname FROM orders
INNER JOIN sales_people ON
orders.snum = sales_people.snum
WHERE amt>2000; 	

#count the number of salesperson belonging to newyork.
SELECT COUNT(*) FROM sales_people
WHERE city = 'NEWYORK';
#display the number of salespeople belonging to london and belonging to paris.
SELECT COUNT(*)  FROM sales_people 
WHERE city =  'LONDON' OR city = 'PARIS';

#Display the number of orders taken by each sales person and their date of orders.
SELECT sname, odate,COUNT(*)
FROM sales_people, orders 
WHERE sales_people.snum = orders.snum
GROUP BY sname,odate;




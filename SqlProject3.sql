create database store;
use store;

select user();

-- patrick is representing staff, sara is representing customer
-- 9) Staff are restricted from accessing customer credit card number and expiration dates. Create SQL to implement. Demonstrate your implementation will prevent staff from viewing customer credit card data.
create user 'patrick'@'localhost' identified by 'staff';

create VIEW staff_view_of_purchase
AS SELECT purchase_ID,  CID,  prod_ID,  price, purchase_date
	FROM purchase;
    
select * 
from staff_view_of_purchase;

grant select on store.staff_view_of_purchase to 'patrick'@'localhost';

-- 10) Staff can’t delete purchases after they are entered in the database. Create SQL to implement. Demonstrate your implementation will prevent staff from deleting purchases.
grant select, insert, update on store.purchase to 'patrick'@'localhost';
revoke delete on store.purchase from 'patrick'@'localhost';

-- 6) Customers can view, but not change past orders. Create SQL to implement. Demonstrate your implementation will not edit past orders by attempting to change data.
create user 'sara'@'localhost' identified by 'customer';
grant select on store.purchase to 'sara'@'localhost';


create table customer
(CID integer primary key,
 c_first varchar(20) NOT NULL,
 c_last varchar(20) NOT NULL,
 c_street varchar(60),
 c_city varchar(20),
 c_state char(2), 
 c_zipcode char(5),
 c_account varchar(35),
 c_password varchar(35),
 c_phone char(10));
 
ALTER TABLE customer
MODIFY c_account varchar(35) NOT NULL,
MODIFY c_password varchar(35) NOT NULL;
 
 create table staff
(SID integer primary key,
 s_first varchar(20) NOT NULL,
 s_last varchar(20) NOT NULL,
 s_street varchar(60),
 s_city varchar(20),
 s_state char(2),
 s_zipcode char(5),
 s_email varchar(35));
 
ALTER TABLE staff
MODIFY s_email varchar(35) NOT NULL;
 
  create table staff_dept
 (staff_dept_ID integer primary key,
  SID integer,
  dept_name varchar(30),
  foreign key(SID) references staff(SID));
  
  ALTER TABLE staff_dept
MODIFY dept_name varchar(35) NOT NULL;
 
create table staff_title
 (staff_title_ID integer AUTO_INCREMENT primary key,
  SID integer,
  staff_title_name varchar(30),
  staff_start_date date NOT NULL,
  staff_end_date date,
  salary integer,
  foreign key(SID) references staff(SID));
  
  ALTER TABLE staff_title
MODIFY SID integer NOT NULL;
 
create table product
 (prod_ID integer primary key,
  prod_name varchar(40),
  prod_type varchar(25),
  calories integer,
  sodium integer,
  quantity integer,
  exp_date date);
  
ALTER TABLE product
MODIFY prod_name varchar(40) NOT NULL,
MODIFY prod_type varchar(30) NOT NULL;
   
  
alter table product
add column discontinued_date date;

create table warehouse
(WID integer primary key,
 w_street varchar(60),
 w_city varchar(20),
 w_state char(2),
 w_zipcode char(5),
 w_type varchar(35));
 
  create table product_warehouse
 (prod_warehouse_ID integer AUTO_INCREMENT primary key,
  prod_ID integer,
  WID integer,
  foreign key(prod_ID) references product(prod_ID),
  foreign key(WID) references warehouse(WID));
  
  ALTER TABLE product_warehouse
MODIFY prod_ID integer NOT NULL,
MODIFY WID integer NOT NULL;
 
 
create table rating
 (RID integer primary key,
  CID integer,
  prod_ID integer,
  rating_method varchar(20),
  rating_date date,
  rating_comment varchar(2000), 
  foreign key(CID) references customer(CID),
  foreign key(prod_ID) references product(prod_ID));

  ALTER TABLE rating
MODIFY CID integer NOT NULL,
MODIFY Prod_ID integer NOT NULL;

  create table purchase
 (purchase_ID integer primary key,
  CID integer,
  prod_ID integer,
  price integer,
  payment_method varchar(20),
  foreign key(CID) references customer(CID),
  foreign key(prod_ID) references product(prod_ID));
  
    ALTER TABLE purchase
MODIFY prod_ID integer NOT NULL,
MODIFY CID integer NOT NULL;

ALTER TABLE purchase
ADD purchase_date date;

ALTER TABLE purchase 
ADD credit_card_exp_date char(5);

UPDATE purchase 
set credit_card_exp_date = "08/24"
where purchase_ID = 2 or purchase_ID = 5;

select * from purchase;

create table delivery
 (delivery_ID integer primary key,
  SID integer,
  purchase_ID integer,
  d_street varchar(60),
  d_city varchar(20),
  d_state char(2),
  d_zipcode char(5),
  d_date date,
  survey_date date,
  survey_method varchar(20),
  survey_comments varchar(2000),
  foreign key(SID) references staff(SID),
  foreign key(purchase_ID) references purchase(purchase_ID));
  
    ALTER TABLE delivery
MODIFY purchase_ID integer NOT NULL,
MODIFY SID integer NOT NULL;

 insert into customer
 values (1, "Sara", "Haines", "7 Hane Ln", "Woodmere", "NY", "11598", "sh@gmail.com", "sh1", "516666666"),
		(2, "Jane", "Hines", "6 Broad Ln", "Cedarhurst", "NY", "11558", "jh@gmail.com", "jh1", "516766666"),
        (3, "Leah", "Kram", "5 Hawk Ln", "Flushing", "NY", "11227", "lk@gmail.com", "lk1", "516666667"),
        (4, "Kayla", "Will", "7 Tree Ln", "Flushing", "NY", "11898", "kw@gmail.com", "kw1", "516666669"),
        (5, "Harry", "Lin", "5 Inwood Ln", "Brownsville", "NY", "11899", "hl@gmail.com", "hl1", "516666664"),
        (6, "Jim", "Noon", "8 Jewel Ln", "Lawrence", "NY", "11557", "jn@gmail.com", "jn1", "516666661"),
        (7, "Jeff", "Holl", "7 Beach Ln", "Woodmere", "NY", "11598", "jh@gmail.com", "jh1", "516666662");
        
select * from customer;

alter table customer
add c_borough varchar(12);

alter table customer
modify c_borough varchar(20);

describe customer;

update customer
set c_borough = "Queens"
where CID = 3 or CID = 4;

update customer
set c_borough = "Brooklyn"
where CID = 5;

update customer
set c_borough = "Staten Island"
where CID = 1 or CID = 2 or CID = 6 or CID = 7;

select * from customer;

 insert into staff
 values (1, "Rachel", "Nin", "19 Beach Ln", "Woodmere", "NY", "11598", "sh@gmail.com"),
		(2, "Sam", "Hiss", "16 Broad Ln", "Cedarhurst", "NY", "11558", "jh@gmail.com"),
        (3, "Evan", "Jones", "90 Hawk Ln", "Skokie", "IL", "11227", "lk@gmail.com"),
        (4, "Samantha", "Williams", "25 Tree Ln", "Hollywood", "FL", "11898", "kw@gmail.com"),
        (5, "James", "Lin", "80 Inwood Ln", "Boca Raton", "FL", "11899", "hl@gmail.com"),
        (6, "Patrick", "Hull", "15 Jewel Ln", "Lawrence", "NY", "11557", "jn@gmail.com"),
        (7, "Nancy", "Alexis", "19 Beach Ln", "Woodmere", "NY", "11598", "jh@gmail.com");

select * from staff;

insert into staff_dept
values (1, 1, "produce"),
(2, 2, "produce"),
(3, 3, "maintenance"),
(4, 4, "register"),
(5, 5, "customer service"),
(6, 6, "kitchen"),
(7, 7, "maintenance");

select * from staff_dept;

insert into staff_title(SID, staff_title_name, staff_start_date, staff_end_date, salary)
values (1, "grocer", "2024-03-07", "2024-04-07", 20),
(2, "grocer", "2020-03-07", "2020-04-07", 25),
(3, "janitor", "2020-03-07", "2020-04-07", 15),
(4, "grocer", "2024-04-07", NULL, 25),
(5, "IT", "2021-03-07", NULL, 30),
(6, "chef", "2024-05-01", NULL, 30),
(7, "janitor", "2020-03-07", NULL, 15);

insert into staff_title
values(8, 7, "grocer", "2020-03-07", NULL, 15);

select * from staff_title;

insert into product
values (1, "Cheerios", "Cereal", 100, 10, 1, "2024-05-15"),
(2, "Blue Diamond Dog Food", "Pets", 100, 10, 1, "2024-05-16"),
(3, "Fish Food", "Pets", NULL, NULL, 1, "2024-05-17"),
(4, "Apple", "Produce", 1, 0, 1, "2025-05-17"),
(5, "Baby Food", "Baby", 15, 5, 1, "2025-05-18"),
(6, "Steak", "Meat", 200, 25, 1, "2025-05-18");

insert into product_warehouse(prod_ID, WID)
value (1,1),
(2,1),
(3,1),
(4,2),
(5,3),
(6,4);

select * from product_warehouse;


insert into warehouse
values (1, "2 Dog Ln", "Skokie", "IL", "11227", "Refridgerated"),
(2, "7 Arthur Ln", "Skokie", "IL", "11227", "Refridgerated"),
(3, "2 Sign Ln", "Cedarhurst", "NY", "11557", "Kitchen used to prepare foods"),
(4, "4 Main Ln", "Woodmere", "NY", "11598", "Refridgerated");

insert into rating
values (1, 1, 1, "number", "2024-05-15", NULL),
(2, 2, 2, "stars", "2023-05-15", "5 stars my dog loved it! my email is: jh@gmail.com"),
(3, 3, 3, "letter grade", "2022-05-15", NULL),
(4, 3, 1, "letter grade", "2021-05-15", "amazing cereal!");

insert into purchase -- prod_ID: 2, 3, CID 2 and 3 should have pet
values (1, 1, 1, 5,  "cash", "2024-05-15"),
(2, 2, 2, 15, "credit card", "2023-05-15"),
(3, 3, 3, 20,  "cash", "2024-05-15"),
(4, 3, 1, 6,  "cash", "2024-05-14"),
(5, 4, 5, 10,  "credit card", "2023-05-01"),
(6, 5, 6, 100,  "cash", "2022-05-15");

insert into purchase 
values (7, 2, 3, 5,  "cash", "2024-05-15"),
(8, 2, 3, 5,  "cash", "2024-05-14");

insert into delivery 
values (1, 1, 1, "7 Hane Ln", "Woodmere", "NY", "11598", "2024-05-15", "2024-05-15", "stars", "5 stars"),
(2, 1, 2, "6 Broad Ln", "Cedarhurst", "NY", "11558", "2023-05-17", "2023-05-17", "stars", NULL),
(3, 2, 3, "6 Bind Ln", "Cedarhurst", "NY", "11558", "2024-05-16", "2024-05-16", "letter grade", "A+ amazing"),
(4, 3, 4, "6 Borrow Ln", "Cedarhurst", "NY", "11558", "2024-05-15", "2024-05-15", "letter grade", "A+++ amazing"),
(5, 4, 5, "80 Borrow Ln", "Cedarhurst", "NY", "11558", "2023-05-02", "2023-05-02", "number", "10/10 reccomend"),
(6, 5, 6, "500 Borrow Ln", "Cedarhurst", "NY", "11558", "2022-05-15", "2022-05-15", "number", "10/10 recommend, for questions my email is nh@gmail.com");

SELECT * FROM delivery;

-- 1) Identify customers who have not completed a purchase/delivery survey in the last year. Display the customer name and email. Use a nested select to answer this question.
Select c_first, c_last, c_account
from customer c
where CID not in 
	(Select CID 
    from purchase p
    where purchase_date >= "2023-05-15");

-- 2) Identify the most popular product purchased in the last 2 months. Display four columns: warehouse, product name, product type and number of orders. Display one distinct row for each warehouse, product and product type. Display the product with the most orders first.
select WID "warehouse", prod_name "product name", prod_type "product type", count(pr.prod_name) "number of orders"
from product pr, purchase pu, product_warehouse pw
where pr.prod_ID = pu.prod_ID and pr.prod_ID = pw.prod_ID and purchase_date >= "2024-03-15"
group by WID, prod_name, prod_type
order by 4 desc;

-- 3) Identify customers with the most purchases of pet products in the last 2 years by customer location. Display five rows in your output – one row for each borough. Display three columns: borough, number of orders(count), total dollar amount of order(sum). The borough with the most orders is displayed first. You may need multiple SQL to answer this question.
select c_borough "borough", count(c.CID) "number of orders", sum(price) "total dollar amount"
from customer c, purchase pu, product pr
where c.CID = pu.CID and pu.prod_ID = pr.prod_ID and prod_type = "pets"
group by c_borough
order by 3 desc;

-- 4) Identify customers with no comments in the product survey. Display the customer name.
select c_first "first name", c_last "last name"
from customer c 
where CID in
	(select CID
    from rating
    where rating_comment is NULL);
    
-- 5) Search the open-ended narrative text/comments in the product and delivery comments to identify personally identifiable information (PII). This includes any data that could potentially be used to identify a person. For instance, examples of PII include email address, date of birth, Social Security number, bank account number, home address, and full name. Display the customer who created the comment, date of comment and the comment. Order the output by customer name.
select c_first "first name", c_last "last name", survey_date "date of comment", survey_comments "comment"
from delivery d, purchase pu, customer c
where d.purchase_ID = pu.purchase_ID and pu.CID = c.CID 
	and d.survey_comments like "%@gmail.com" 
        or d.survey_comments like "%@outlook.com" 
        or d.survey_comments like "%@yahoo.com"
		or d.survey_comments like "%@aol.com" 
        or d.survey_comments like "%Ln" 
        or d.survey_comments like "%Rd" 
        or d.survey_comments like "%Ct" 
order by c_first, c_last;

-- 7) Using purchases made in the last 3 years, identify customers with pets. Display the customer name and email. Order the output by customer name. Replace children with other demographic characteristics. For instance, dog owners, seniors, vegetarians, Tesla car owners, etc. 
select distinct c_first "first name", c_last "last name", c_account "email"
from customer c, purchase pu, product pr
where c.CID = pu.CID and pu.prod_ID = pr.prod_ID and pr.prod_type = "pets" and pu.purchase_date >= "2021-05-15"
order by  c_first, c_last;

-- 8) Identify staff with the most deliveries in the last 3 years. Display two columns: staff and number of deliveries. Display one row for each distinct staff. Display the staff with the most deliveries first.
select s_first, s_last, count(s.SID)
from staff s, delivery d 
where s.SID = d.SID and d_date >= "2021-05-15"
group by s_first, s_last
order by 3 desc; 

-- 11) The product Cheerios is no longer being offered by the grocery store and being available for 3 years. Identify the SQL to implement.
alter table product
add discontinued_date date;

alter table product 
add return_date date; 

update product
set quantity = 0
where prod_name = "Cheerios" and prod_ID = 1;

update product
set discontinued_date = "2024-05-15"
where prod_name = "Cheerios" and prod_ID = 1;

update product
set return_date = "2027-05-15"
where prod_name = "Cheerios" and prod_ID = 1;

-- 12) Use the SQL DESCRIBE operation to display the structure for all tables.
describe customer;

describe staff; 

describe staff_dept;

describe staff_title;

describe product;

describe product_warehouse;

describe warehouse;
 
describe rating;

describe purchase;
 
describe delivery;


-- 13)  Display the version of MySQL
SELECT VERSION();
 
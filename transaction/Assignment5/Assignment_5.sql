create table client_master
(
	Client_no varchar2(6) primary key check(substr(Client_no,1,1) = 'C'),
	Name varchar2(20) not null,
	City varchar(15),
	Pincode Number(8),
	State varchar2(15),
	BalDue Number(10, 2)
);
create table product_master
(
	Product_no varchar2(6) primary key check(substr(Product_no,1,1) = 'P'),
	Description varchar2(15) not null,
	Qty_On_Hand Number(8) not null,
	Sell_Price Number(8,2) not null check(Sell_Price <> 0),
	Cost_Price Number(8,2) not null check(Cost_Price <> 0)
);
create table salesman_master
(
	Salesman_no varchar2(6) primary key check(substr(Salesman_no,1,1) = 'S'),
	Salesman_name varchar2(20) not null,
	City varchar2(20) not null,
	Pincode Number(8) not null,
	State varchar2(20) not null,
	Sal_Amt Number(8,2) not null check(Sal_Amt <> 0)
);
create table sales_order
(
	Order_no varchar2(6) primary key check(substr(Order_no,1,1) = 'O'),
	Client_no varchar2(6) references client_master(Client_no),
	Order_date Date,
	Salesman_no varchar2(6) references salesman_master(Salesman_no),
	Dely_type char(1) default 'F' check(Dely_type = 'F' or Dely_type = 'P'),
	Dely_date Date
);
create table sales_order_details
(
	Order_no varchar2(6) references sales_order(Order_no),
	Product_no varchar2(6) references product_master(Product_no),
	Qty_disp Number(8),
	Product_rate Number(10, 2)
);
-----------------------------------------------------------------------------------------------------------
-- input script for transaction

-- 5 values into each table

insert into client_master values('&Client_no', '&Name', '&City', &Pincode, '&State', &BalDue);
/
/
/
/

insert into product_master values('&Product_no', '&Description', &Qty_On_Hand, &Sell_Price, &Cost_Price);
/
/
/
/

insert into salesman_master values('&Salesman_no', '&Salesman_name', '&City', &Pincode, '&State', &Sal_Amt);
/
/
/
/

insert into sales_order values('&Order_no', '&Client_no', to_date('&Order_date', 'DD-MM-YYYY'),'&Salesman_no','&Dely_type',to_date('&Dely_date', 'DD-MM-YYYY'));
/
/
/
/	

insert into sales_order_details values('&Order_no','&Product_no',&Qty_disp,&Product_rate);
/
/
/
/
-----------------------------------------------------------------------------------------------------------

--begin DBMS_OUTPUT.put_line('All names of Clients having "a" as the 3rd letter in their names:'); end;
--/
select Name from client_master where substr(Name,3,3) = 'a';

--begin DBMS_OUTPUT.put_line('All Clients who live in a city whose name has 1st letter as "K":'); end;
--/
select * from client_master where substr(City,1,1) = 'K';

--begin DBMS_OUTPUT.put_line('All Clients who stay in Mumbai or Kolkata:'); end;
--/
select * from client_master where City = 'Mumbai' or City = 'Kolkata';

--begin DBMS_OUTPUT.put_line('All Clients whose BalDue > 1000:'); end;
--/
select * from client_master where BalDue > 1000;

--begin DBMS_OUTPUT.put_line('All sales order placed in the month of June:'); end;
--/
select * from sales_order where to_char(Order_date, 'Month') = 'June';

--begin DBMS_OUTPUT.put_line('Order information for Clients C001:'); end;
--/
select * from sales_order, sales_order_details 
where sales_order.Order_no = sales_order_details.Order_no and Client_no = 'C001';

--begin DBMS_OUTPUT.put_line('Order information for Clients C003:'); end;
--/
select * from sales_order, sales_order_details 
where sales_order.Order_no = sales_order_details.Order_no and Client_no = 'C003';

--begin DBMS_OUTPUT.put_line('All products with selling price > 500 but <= 750:'); end;
--/
select * from product_master where Sell_price > 500 and Sell_price <= 750;

--begin DBMS_OUTPUT.put_line('Total number of orders:'); end;
--/
select count(*) from sales_order;

--begin DBMS_OUTPUT.put_line('Minimum Product Price:'); end;
--/
select MIN(Sell_price) as min_price from product_master;

--begin DBMS_OUTPUT.put_line('Maximum Product Price:'); end;
--/
select MAX(Sell_price) as max_price from product_master;

--begin DBMS_OUTPUT.put_line('Number of Clients living in Kolkata:'); end;
--/
select count(*) from client_master where City = 'Kolkata';

--begin DBMS_OUTPUT.put_line('Sell price <= 500:'); end;
--/
select count(*) from product_master where Sell_price <= 500;

--begin DBMS_OUTPUT.put_line('Order number and Order Date List:'); end;
--/
select Order_no, Order_date from sales_order;

--begin DBMS_OUTPUT.put_line('Order number and Order Date List:'); end;
--/
select Order_no, to_char(Order_date, 'DD-Month-YY') from sales_order;

--begin DBMS_OUTPUT.put_line('Order Date List 20 days after today:'); end;
/
select Order_date from sales_order where Order_date = SYSDATE + 20;

--begin DBMS_OUTPUT.put_line('Client with maximum balance due:'); end;
/
select Name from client_master where ROWNUM = 1 order by BalDue desc;

--begin DBMS_OUTPUT.put_line('Max BalDue - Min BalDue:'); end;
--/
select MAX(BalDue) - MIN(BalDue) from client_master;

--begin DBMS_OUTPUT.put_line('1000/- added to all Salesman Salaray:'); end;
--/
select Salesman_no, Salesman_name, City, Pincode, State, Sal_Amt + 1000 from salesman_master;

-----------------------------------------------------------------------------------------------------------

-- optional cleanup

--uncomment this section to remove all tables and data

-- drop table sales_order_details;
-- drop table sales_order;
-- drop table salesman_master;
-- drop table product_master;
-- drop table client_master;
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

insert into client_master values('C0001', '&Name', '&City', &Pincode, '&State', &BalDue);
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

select Name from client_master where substr(Name,3,3) = 'a';

select * from client_master where substr(City,1,1) = 'K';

select * from client_master where City = 'Mumbai' or City = 'Kolkata';

select * from client_master where BalDue > 1000;

select * from sales_order where to_char(Order_date, 'Month') = 'June';

select * from sales_order, sales_order_details 
where sales_order.Order_no = sales_order_details.Order_no and Client_no = 'C001';

select * from sales_order, sales_order_details 
where sales_order.Order_no = sales_order_details.Order_no and Client_no = 'C003';

select * from product_master where Sell_price > 500 and Sell_price <= 750;

select count(*) from sales_order;

select MIN(Sell_price) as min_price from product_master;

select MAX(Sell_price) as max_price from product_master;

select count(*) from client_master where City = 'Kolkata';

select count(*) from product_master where Sell_price <= 500;

select Order_no, Order_date from sales_order;

select Order_no, to_char(Order_date, 'DD-Month-YY') from sales_order;

select Order_date from sales_order where Order_date = SYSDATE + 20;

select Name from client_master where ROWNUM = 1 order by BalDue desc;

select MAX(BalDue) - MIN(BalDue) from client_master;

select Salesman_no, Salesman_name, City, Pincode, State, Sal_Amt + 1000 from salesman_master;

-----------------------------------------------------------------------------------------------------------

drop table sales_order_details;
drop table sales_order;
drop table salesman_master;
drop table product_master;
drop table client_master;
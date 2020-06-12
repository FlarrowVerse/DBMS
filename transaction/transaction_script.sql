
create table client_master
(
	Client_no varchar2(6) primary key check(substr(Client_no,1,1) = 'C'),
	Name varchar2(20) not null,
	City varchar(15),
	Pincode Number(8),
	State varchar2(15),
	BalDue Number(10, 2)
);

desc client_master;

create table product_master
(
	Product_no varchar2(6) primary key check(substr(Product_no,1,1) = 'P'),
	Description varchar2(15) not null,
	Qty_On_Hand Number(8) not null,
	Sell_Price Number(8,2) not null check(Sell_Price <> 0),
	Cost_Price Number(8,2) not null check(Cost_Price <> 0)
);

desc product_master;

create table salesman_master
(
	Salesman_no varchar2(6) primary key check(substr(Salesman_no,1,1) = 'S'),
	Salesman_name varchar2(20) not null,
	City varchar2(20) not null,
	Pincode Number(8) not null,
	State varchar2(20) not null,
	Sal_Amt Number(8,2) not null check(Sal_Amt <> 0)
);

desc salesman_master;

create table sales_order
(
	Order_no varchar2(6) primary key check(substr(Order_no,1,1) = '0'),
	Client_no varchar2(6) references client_master(Client_no),
	Order_date Date,
	Salesman_no varchar2(6) references salesman_master(Salesman_no),
	Dely_type char(1) default 'F' check(Dely_type = 'F' or Dely_type = 'P'),
	Dely_date Date
);

desc sales_order;

drop table sales_order;
drop table salesman_master;
drop table product_master;
drop table client_master;

SET SERVEROUTPUT ON;

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
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
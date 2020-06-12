-- input 5 values into each table
insert into customer_master values('&CustomerId', '&CustomerName', &PhoneNo, '&LicenseNo', '&City', '&State');
/
/
/
/

insert into car_list values('&PlateNo', '&CustomerId', '&VehicleName', '&Company', '&Model', '&Color');
/
/
/
/

insert into policy_details values('&PolicyNo', '&CustomerId', '&PlateNo', &Premium, to_date('&Validity', 'DD-MM-YYYY'), '&Claim');
/
/
/
/

insert into comprehensive_policy values('&PolicyNo', &IVD);
/
/
/
/

insert into add_on_policy values('&PolicyNo');
/
/
/
/

insert into accident_records values('&FIRno','&PlateNo',to_date('&AccidentDate','DD-MM-YYYY'),'&Location',&Damage);
/
/
/
/

insert into staff_master values('&EmpId','&EmpName',&Salary,&PhoneNo);
/
/
/
/

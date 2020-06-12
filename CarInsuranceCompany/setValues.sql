insert into customer_master values('ABC', 'Ram', 1234567890, 'L0001', 'Kolkata', 'West Bengal');
insert into customer_master values('DEF', 'Shyam', 5678901234, 'L0002', 'Kolkata', 'West Bengal');
insert into customer_master values('GHI', 'Jadu', 1234890567, 'L0003', 'Ranchi', 'Jharkhand');
insert into customer_master values('JKL', 'Madhu', 7891234560, 'L0004', 'Kolkata', 'West Bengal');
insert into customer_master values('MNO', 'Suresh', 8901234567, 'L0005', 'New Delhi', 'Delhi');
insert into customer_master values('XYZ', 'Vivek', 3456712890, 'L0006', 'Mumbai', 'Maharashtra');

insert into car_list values('WBCSH1234', 'ABC', 'SUV', 'Mahindra', 'Scorpio', 'Brown');
insert into car_list values('WBCSH3456', 'JKL', 'Sedan', 'Maruti Suzuki', 'Swift', 'Red');
insert into car_list values('WBCSH5678', 'DEF', 'SUV', 'Mahindra', 'XUV-500', 'Black');
insert into car_list values('MHCSH1234', 'XYZ', 'Hatchback', 'Chevrolet', 'Beatz', 'Green');
insert into car_list values('AIBPC2019', 'GHI', 'Super Sedan', 'Maruti Suzuki', 'Ciaz', 'Brown');

insert into policy_details values('P001', 'DEF', 'WBCSH5678', 10000, to_date('01-01-2021', 'DD-MM-YYYY'), 'No');
insert into policy_details values('P002', 'ABC', 'WBCSH1234', 12000, to_date('10-10-2020', 'DD-MM-YYYY'), 'Yes');
insert into policy_details values('P003', 'JKL', 'WBCSH3456', 9000, to_date('01-01-2021', 'DD-MM-YYYY'), 'No');
insert into policy_details values('P004', 'GHI', 'AIBPC2019', 10000, to_date('01-01-2021', 'DD-MM-YYYY'), 'No');
insert into policy_details values('P005', 'XYZ', 'MHCSH1234', 15000, to_date('01-01-2021', 'DD-MM-YYYY'), 'No');

insert into comprehensive_policy values('P001', 100000);
insert into comprehensive_policy values('P002', 200000);
insert into comprehensive_policy values('P003', 150000);
insert into comprehensive_policy values('P004', 10000);
insert into comprehensive_policy values('P005', 200000);

insert into add_on_policy values('P001');
insert into add_on_policy values('P002');
insert into add_on_policy values('P003');
insert into add_on_policy values('P004');
insert into add_on_policy values('P005');

insert into accident_records values('FIR001','WBCSH1234',to_date('01-01-2010','DD-MM-YYYY'),'Kolkata',10000);
insert into accident_records values('FIR002','WBCSH5678',to_date('01-01-2010','DD-MM-YYYY'),'Kolkata',10000);
insert into accident_records values('FIR003','WBCSH1234',to_date('01-01-2019','DD-MM-YYYY'),'Kolkata',10000);
insert into accident_records values('FIR271','AIBPC2019',to_date('01-01-2010','DD-MM-YYYY'),'Kolkata',10000);
insert into accident_records values('FIR004','WBCSH3456',to_date('01-01-2020','DD-MM-YYYY'),'Kolkata',10000);

insert into staff_master values('E001','Employee1',20000,1234567890);
insert into staff_master values('E002','Employee2',25000,8901234567);
insert into staff_master values('E003','Employee3',30000,4567123890);
insert into staff_master values('E004','Employee4',35000,5678901234);
insert into staff_master values('E005','Employee5',40000,4561237890);
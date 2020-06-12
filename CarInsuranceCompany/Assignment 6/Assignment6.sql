-- script to create required tables

create table customer_master
(
	CustomerId varchar2(6) primary key not null,
	CustomerName varchar2(15) not null,
	PhoneNo Number(10),
	LicenseNo varchar2(12) not null,
	City varchar2(20),
	State varchar2(20)
);

create table car_list
(
	PlateNo varchar2(10) primary key not null,
	CustomerId varchar2(6) references customer_master(CustomerId) on delete cascade,
	VehicleName varchar2(20),
	Company varchar2(20),
	Model varchar2(20),
	Color varchar2(15)
);

create table policy_details
(
	PolicyNo varchar2(20) primary key not null check(substr(PolicyNo,1,1) = 'P'),
	CustomerId varchar2(6) references customer_master(CustomerId) on delete cascade,
	PlateNo varchar2(10) references car_list(PlateNo) on delete cascade,
	Premium Number(10,2) not null,
	Validity Date,
	Claim varchar2(3)
);
-- subtype of policy Comprehensive
create table comprehensive_policy
(
	PolicyNo varchar2(20) references policy_details(PolicyNo) on delete cascade,
	primary key (PolicyNo),
	IVD Number(10,2)
);
-- sub type of policy Add-On
create table add_on_policy
(
	PolicyNo varchar2(20) references policy_details(PolicyNo) on delete cascade,
	primary key (PolicyNo)
);

create table accident_records
(
	FIRNo varchar2(10) primary key not null,
	AccidentDate Date,
	Location varchar2(20) not null,
	Damage Number(10,2)
);

create table car_accident
(
	FIRNo varchar2(10) references accident_records(FIRNo) on delete cascade,
	PlateNo varchar2(10) references car_list(PlateNo) on delete cascade
);

create table staff_master
(
	EmpId varchar2(6) primary key not null check(substr(EmpId,1,1) = 'E'),
	EmpName varchar2(20) not null,
	Salary Number(10,2) not null,
	PhoneNo Number(10)
);

-------------------------------------------------------------------------------------------------------------------

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

insert into accident_records values('FIR001',to_date('01-01-2010','DD-MM-YYYY'),'Kolkata',10000);
insert into accident_records values('FIR002',to_date('01-01-2010','DD-MM-YYYY'),'Kolkata',10000);
insert into accident_records values('FIR003',to_date('01-01-2019','DD-MM-YYYY'),'Kolkata',10000);
insert into accident_records values('FIR271',to_date('01-01-2010','DD-MM-YYYY'),'Kolkata',10000);
insert into accident_records values('FIR004',to_date('01-01-2020','DD-MM-YYYY'),'Kolkata',10000);

insert into car_accident values('FIR001','WBCSH1234');
insert into car_accident values('FIR002','WBCSH5678');
insert into car_accident values('FIR003','WBCSH1234');
insert into car_accident values('FIR271','AIBPC2019');
insert into car_accident values('FIR004','WBCSH3456');

insert into staff_master values('E001','Employee1',20000,1234567890);
insert into staff_master values('E002','Employee2',25000,8901234567);
insert into staff_master values('E003','Employee3',30000,4567123890);
insert into staff_master values('E004','Employee4',35000,5678901234);
insert into staff_master values('E005','Employee5',40000,4561237890);

-------------------------------------------------------------------------------------------------------------------

select * from customer_master;
select * from car_list;
select * from policy_details natural join comprehensive_policy;
select * from accident_records;
select * from staff_master;

-------------------------------------------------------------------------------------------------------------------

/* Find total no of people who owned cars that were involved in accidents in 2010*/
select count(distinct customer_master.CustomerId)
from customer_master, car_list, accident_records, car_accident
where customer_master.CustomerId = car_list.CustomerId and car_list.PlateNo = car_accident.PlateNo 
and car_accident.FIRNo = accident_records.FIRNo and to_char(AccidentDate, 'YYYY') = '2010';

/*find no of accidents in which the cars belonging to "XYZ" were involved*/
select count(distinct accident_records.FIRNo) as num_of_acc
from accident_records, car_list, car_accident
where car_accident.PlateNo = car_list.PlateNo and CustomerId = 'XYZ';

/*Add new accident to the table,and display the table*/
insert into accident_records values('&FIRno',to_date('&AccidentDate','DD-MM-YYYY'),'&Location',&Damage);
insert into car_accident values('&FIRNo', '&PlateNo');
select * from accident_records natural join car_accident;

/*delete the model Scorpio belonging to "ABC" and display the table*/
delete from car_list
where Model = 'Scorpio' and CustomerId = 'ABC';
select * from car_list;

/*update the damage amount for the car with plateno "AIBPC2019" in accident "FIR271" to Rs.5000*/
update accident_records
set Damage = 5000.00
where FIRNo = 'FIR271';
select * from accident_records;

-------------------------------------------------------------------------------------------------------------------

drop table staff_master;
drop table car_accident;
drop table accident_records;
drop table comprehensive_policy;
drop table add_on_policy;
drop table policy_details;
drop table car_list;
drop table customer_master;
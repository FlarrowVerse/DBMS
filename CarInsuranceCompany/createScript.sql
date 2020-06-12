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
	PlateNo varchar2(10) references car_list(PlateNo) on delete cascade,
	AccidentDate Date,
	Location varchar2(20) not null,
	Damage Number(10,2)
);

create table staff_master
(
	EmpId varchar2(6) primary key not null check(substr(EmpId,1,1) = 'E'),
	EmpName varchar2(20) not null,
	Salary Number(10,2) not null,
	PhoneNo Number(10)
);


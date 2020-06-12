-- this script is used to create all necessary tables for a Hospital DBMS

create table Doctor
(
	D_SSN varchar2(6) primary key not null,
	FirstName varchar2(20) not null,
	LastName varchar2(20) not null,
	Speciality varchar2(20),
	YrExp Number(8),
	PhoneNo Number(10)
);

create table Primary_Doctor
(
	D_SSN varchar2(6) references Doctor(D_SSN) on delete cascade,
	primary key (D_SSN)
);

create table Specialist
(
	D_SSN varchar2(6) references Doctor(D_SSN) on delete cascade,
	primary key (D_SSN)
);

create table Patient
(
	P_SSN varchar2(6) primary key not null,
	FirstName varchar2(20) not null,
	LastName varchar2(20) not null,
	Address varchar2(20) not null,
	DOB Date,
	D_SSN varchar2(6) references Primary_Doctor(D_SSN) on delete cascade
);

create table Medicine
(
	TradeName varchar2(20) primary key not null,
	UnitPrice Number(10,2) not null,
	GenericFlag varchar2(3) default 'No' not null check(GenericFlag='Yes' or GenericFlag='No')
);

create table Prescription
(
	Id varchar2(6) primary key not null,
	P_Date Date,
	Doctor_SSN varchar2(6) references Doctor(D_SSN) on delete cascade,
	Patient_SSN varchar2(6) references Patient(P_SSN) on delete cascade
);

create table Prescription_Medicine
(
	PrescriptionId varchar2(6) references Prescription(Id) on delete cascade,
	TradeName varchar2(20) references Medicine(TradeName) on delete cascade,
	NumOfUnits Number(10) not null
);
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

-------------------------------------------------------------------------------------------------------------

-- set data for Doctor table
insert into Doctor values ('D0001', 'Animesh', 'Shastri', 'Heart', 10, 9009009001);
insert into Doctor values ('D0002', 'Suresh', 'Ghosh', 'ENT', 20, 9009009002);
insert into Doctor values ('D0003', 'Jane', 'Doe', 'Brain', 5, 9009009003);
insert into Doctor values ('D0004', 'John', 'Smith', 'Dermatology', 4, 9009009004);
insert into Doctor values ('D0005', 'Jack', 'Ryan', 'Immunology', 4, 9009009004);

-- set data for Primary_Doctor table
insert into Primary_Doctor values ('D0001');
insert into Primary_Doctor values ('D0002');
insert into Primary_Doctor values ('D0003');
insert into Primary_Doctor values ('D0004');
insert into Primary_Doctor values ('D0005');

-- set data for Specialist table
insert into Specialist values ('D0001');
insert into Specialist values ('D0002');
insert into Specialist values ('D0003');
insert into Specialist values ('D0004');
insert into Specialist values ('D0005');

-- set data for Patient table
insert into Patient values ('P0001','Jack','Bauer','201 M.G. Road',to_date('22-01-1996','DD-MM-YYYY'),'D0004');
insert into Patient values ('P0002','Abhishek','Ghosh','51, VS Sarani',to_date('26-01-1999','DD-MM-YYYY'),'D0004');
insert into Patient values ('P0003', 'Ramesh', 'Das', '102, Behala', to_date('03-10-1961','DD-MM-YYYY'),'D0002');
insert into Patient values ('P0004', 'Suresh', 'Mitra', '12C/1, New Town', to_date('03-05-1961','DD-MM-YYYY'),'D0001');
insert into Patient values ('P0005', 'Vivek', 'Santra', '21/1, Sealdah', to_date('26-11-2000','DD-MM-YYYY'),'D0002');

-- set data for Medicine
insert into Medicine values ('Vitamin', 5, 'Yes');
insert into Medicine values ('Calpol-650', 2, 'No');
insert into Medicine values ('Aspirin', 6, 'Yes');
insert into Medicine values ('Pan-D', 12, 'No');
insert into Medicine values ('Atenalol', 4, 'Yes');

-- set data for Prescription
insert into Prescription values ('Pr001', to_date('10-10-2018','DD-MM-YYYY'), 'D0002', 'P0001');
insert into Prescription values ('Pr002', to_date('20-10-2017','DD-MM-YYYY'), 'D0003', 'P0002');
insert into Prescription values ('Pr003', to_date('10-05-2015','DD-MM-YYYY'), 'D0005', 'P0003');
insert into Prescription values ('Pr004', to_date('20-04-2019','DD-MM-YYYY'), 'D0004', 'P0004');
insert into Prescription values ('Pr005', to_date('02-01-2020','DD-MM-YYYY'), 'D0002', 'P0005');

insert into Prescription values ('Pr006', to_date('10-10-2018','DD-MM-YYYY'), 'D0002', 'P0001');
insert into Prescription values ('Pr007', to_date('20-10-2017','DD-MM-YYYY'), 'D0003', 'P0002');
insert into Prescription values ('Pr008', to_date('10-05-2015','DD-MM-YYYY'), 'D0005', 'P0003');
insert into Prescription values ('Pr009', to_date('20-04-2019','DD-MM-YYYY'), 'D0004', 'P0004');
insert into Prescription values ('Pr010', to_date('02-01-2020','DD-MM-YYYY'), 'D0002', 'P0005');

insert into Prescription values ('Pr011', to_date('10-10-2018','DD-MM-YYYY'), 'D0002', 'P0001');
insert into Prescription values ('Pr012', to_date('20-10-2017','DD-MM-YYYY'), 'D0003', 'P0002');
insert into Prescription values ('Pr013', to_date('10-05-2015','DD-MM-YYYY'), 'D0005', 'P0003');
insert into Prescription values ('Pr014', to_date('20-04-2019','DD-MM-YYYY'), 'D0004', 'P0004');
insert into Prescription values ('Pr015', to_date('02-01-2020','DD-MM-YYYY'), 'D0002', 'P0005');

insert into Prescription values ('Pr016', to_date('10-10-2018','DD-MM-YYYY'), 'D0002', 'P0001');
insert into Prescription values ('Pr017', to_date('20-10-2017','DD-MM-YYYY'), 'D0003', 'P0002');
insert into Prescription values ('Pr018', to_date('10-05-2015','DD-MM-YYYY'), 'D0005', 'P0003');
insert into Prescription values ('Pr019', to_date('20-04-2019','DD-MM-YYYY'), 'D0004', 'P0004');
insert into Prescription values ('Pr020', to_date('02-01-2020','DD-MM-YYYY'), 'D0002', 'P0005');

insert into Prescription values ('Pr021', to_date('10-10-2018','DD-MM-YYYY'), 'D0002', 'P0001');
insert into Prescription values ('Pr022', to_date('20-10-2017','DD-MM-YYYY'), 'D0003', 'P0002');
insert into Prescription values ('Pr023', to_date('10-05-2015','DD-MM-YYYY'), 'D0005', 'P0003');
insert into Prescription values ('Pr024', to_date('20-04-2019','DD-MM-YYYY'), 'D0004', 'P0004');
insert into Prescription values ('Pr025', to_date('02-01-2020','DD-MM-YYYY'), 'D0002', 'P0005');

-- set data for Prescription_Medicine
insert into Prescription_Medicine values ('Pr001', 'Vitamin', 20);
insert into Prescription_Medicine values ('Pr002', 'Pan-D', 30);
insert into Prescription_Medicine values ('Pr003', 'Atenalol', 10);
insert into Prescription_Medicine values ('Pr004', 'Aspirin', 20);
insert into Prescription_Medicine values ('Pr005', 'Pan-D', 30);

insert into Prescription_Medicine values ('Pr001', 'Aspirin', 20);
insert into Prescription_Medicine values ('Pr002', 'Calpol-650', 30);
insert into Prescription_Medicine values ('Pr003', 'Vitamin', 20);
insert into Prescription_Medicine values ('Pr004', 'Vitamin', 20);
insert into Prescription_Medicine values ('Pr005', 'Calpol-650', 10);

insert into Prescription_Medicine values ('Pr001', 'Pan-D', 20);
insert into Prescription_Medicine values ('Pr002', 'Vitamin', 30);
insert into Prescription_Medicine values ('Pr003', 'Aspirin', 10);
insert into Prescription_Medicine values ('Pr004', 'Calpol-650', 15);
insert into Prescription_Medicine values ('Pr005', 'Vitamin', 10);

insert into Prescription_Medicine values ('Pr006', 'Vitamin', 20);
insert into Prescription_Medicine values ('Pr007', 'Vitamin', 30);
insert into Prescription_Medicine values ('Pr008', 'Vitamin', 10);
insert into Prescription_Medicine values ('Pr009', 'Vitamin', 15);
insert into Prescription_Medicine values ('Pr010', 'Vitamin', 10);
insert into Prescription_Medicine values ('Pr011', 'Vitamin', 20);
insert into Prescription_Medicine values ('Pr012', 'Vitamin', 30);
insert into Prescription_Medicine values ('Pr013', 'Vitamin', 10);
insert into Prescription_Medicine values ('Pr014', 'Vitamin', 15);
insert into Prescription_Medicine values ('Pr015', 'Vitamin', 10);
insert into Prescription_Medicine values ('Pr016', 'Vitamin', 20);
insert into Prescription_Medicine values ('Pr017', 'Vitamin', 30);
insert into Prescription_Medicine values ('Pr018', 'Vitamin', 10);
insert into Prescription_Medicine values ('Pr019', 'Vitamin', 15);
insert into Prescription_Medicine values ('Pr020', 'Vitamin', 10);
insert into Prescription_Medicine values ('Pr021', 'Vitamin', 20);
insert into Prescription_Medicine values ('Pr022', 'Vitamin', 30);
insert into Prescription_Medicine values ('Pr023', 'Vitamin', 10);
insert into Prescription_Medicine values ('Pr024', 'Vitamin', 15);
insert into Prescription_Medicine values ('Pr025', 'Vitamin', 10);

----------------------------------------------------------------------------------------------------------

select * from Doctor;

select * from Primary_Doctor natural join Doctor;

select * from Specialist natural join Doctor;

select * from Patient;

select * from Medicine;

select * from Prescription;

select * from Prescription_Medicine;

----------------------------------------------------------------------------------------------------------

-- query 1 
select TradeName
from Medicine
where UnitPrice < 50 and GenericFlag = 'Yes';

-- query 2
select Patient.FirstName, Patient.LastName
from Patient, Doctor
where Patient.D_SSN = Doctor.D_SSN
and Doctor.FirstName = 'John' and Doctor.LastName = 'Smith';

-- query 3
select FirstName, LastName
from Doctor
where D_SSN not in (select D_SSN from Patient);

-- query 4
-- unable to form the query
select TName, UnitCount
from (select count(distinct PrescriptionId) as Pr_cnt, sum(NumOfUnits) as UnitCount, TradeName as TName
	from Prescription_Medicine group by TradeName) where Pr_cnt > 20;

-- query 5
select Prescription.Patient_SSN
from Prescription, Prescription_Medicine T, Prescription_Medicine S
where Prescription.Id = T.PrescriptionId and Prescription.Id = S.PrescriptionId
and T.TradeName = 'Aspirin' and S.TradeName = 'Vitamin';

-- query 6
select Prescription.Patient_SSN
from Prescription, Doctor, Prescription_Medicine
where Prescription_Medicine.TradeName = 'Aspirin' and Prescription_Medicine.PrescriptionId = Prescription.Id
and Doctor.D_SSN = Prescription.Doctor_SSN and Doctor.FirstName = 'John' and Doctor.LastName = 'Smith';

-- query 7
(select Patient.FirstName, Patient.LastName
from Patient, Prescription
where Patient.P_SSN = Prescription.Patient_SSN and Prescription.Doctor_SSN = Patient.D_SSN)
MINUS
(select Patient.FirstName, Patient.LastName
from Patient, Prescription
where Patient.P_SSN = Prescription.Patient_SSN and Prescription.Doctor_SSN <> Patient.D_SSN);

----------------------------------------------------------------------------------------------------------

-- this script is used to remove all tables created by createScript
drop table Prescription_Medicine;
drop table Prescription;
drop table Medicine;
drop table Patient;
drop table Specialist;
drop table Primary_Doctor;
drop table Doctor;
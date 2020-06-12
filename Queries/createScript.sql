-- create table employee
-- (
-- 	personname varchar2(50) primary key not null,
-- 	street varchar2(20) not null,
-- 	city varchar2(20) not null
-- );

-- create table company
-- (
-- 	companyname varchar2(20) primary key not null,
-- 	city varchar2(20) not null
-- );

-- create table works
-- (
-- 	personname varchar2(50) references employee(personname) not null on delete cascade,
-- 	companyname varchar2(20) references company(companyname) not null on delete cascade,
-- 	salary Number(10,2) not null
-- );

-- create table manages
-- (
-- 	personname varchar2(50) references employee(personname) not null on delete cascade,
-- 	managername varchar2(50) references employee(personname) not null on delete cascade,
-- 	primary key (managername)
-- );

create table employee
(
	personname varchar2(50) primary key not null,
	street varchar2(20) not null,
	city varchar2(20) not null
);

create table company
(
	companyname varchar2(20) not null,
	city varchar2(20) not null
);

create table works
(
	personname varchar2(50) references employee(personname) on delete cascade,
	companyname varchar2(20) not null,
	salary Number(10,2) not null
);

create table manages
(
	personname varchar2(50) references employee(personname) on delete cascade,
	managername varchar2(50) references employee(personname) on delete cascade
);


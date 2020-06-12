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

-----------------------------------------------------------------------------------------------------------

-- set values for employee
insert into employee values ('ABC', 'Main Street', 'Kolkata');
insert into employee values ('DEF', 'Vidyasagar Sarani', 'Kolkata');
insert into employee values ('GHI', 'Apollo Street', 'Mumbai');
insert into employee values ('JKL', 'Hailey Street', 'Delhi');
insert into employee values ('MNO', 'Nampally', 'Hyderabad');
insert into employee values ('PQR', 'Apollo Street', 'Mumbai');
insert into employee values ('STU', 'Behala', 'Kolkata');

-- set values for company
insert into company values ('Axis Bank', 'Kolkata');
insert into company values ('State Bank of India', 'Mumbai');
insert into company values ('Punjab National Bank', 'Kolkata');
insert into company values ('Axis Bank', 'Delhi');
insert into company values ('HDFC', 'Hyderabad');

-- set values for works
insert into works values ('ABC', 'Axis Bank', 40000);
insert into works values ('DEF', 'State Bank of India', 30000);
insert into works values ('GHI', 'HDFC', 55000);
insert into works values ('JKL', 'Axis Bank', 35000);
insert into works values ('MNO', 'Axis Bank', 27000);
insert into works values ('PQR', 'HDFC', 70000);
insert into works values ('STU', 'State Bank of India', 60000);

-- set values for manages
insert into manages values ('ABC', 'JKL');
insert into manages values ('DEF', 'STU');
insert into manages values ('GHI', 'PQR');
insert into manages values ('MNO', 'JKL');

-----------------------------------------------------------------------------------------------------------

-- query a
select personname 
from works
where companyname = 'Axis Bank';

-- query b
select employee.personname, employee.city
from employee, works
where employee.personname = works.personname and works.companyname = 'Axis Bank';

-- query c
select employee.personname, employee.city, employee.street
from employee, works
where employee.personname = works.personname and works.companyname = 'Axis Bank' and salary > 30000;

-- query d
select employee.personname 
from employee, company, works
where employee.personname = works.personname and works.companyname = company.companyname
and company.city = employee.city;

-- query e
select employee.personname
from employee, manages
where employee.personname = manages.personname 
and employee.city in (
						select employee.city
						from employee, manages
						where employee.personname = manages.personname
					)
and employee.street in (
						select employee.street
						from employee, manages
						where employee.personname = manages.managername
					);

-- query f
select employee.personname
from employee, works, company
where employee.personname = works.personname and works.companyname = company.companyname
and company.companyname <> 'Axis Bank';

-- query g
select employee.personname
from employee, works, company
where employee.personname = 'Axis Bank' 
and works.salary in (
					select max(salary)
					from works
					where companyname = 'Axis Bank'
				);

-- query h
select companyname
from company
where city in (
				select city
				from company
				where companyname = 'Axis Bank'
			)
and companyname <> 'Axis Bank';

-- query i
select T.personname
from works T
where T.salary > (
					select avg(S.salary)
					from works S
					where T.companyname = S.companyname
				);

-- query j
select companyname 
from works
where ROWNUM = 1
group by companyname
order by count(personname) desc;

-- query k
select companyname
from works
where salary = (
				select min(salary) from works
			);

-- query l
select companyname 
from works
group by companyname
having avg(salary) > (
						select avg(salary)
						from works
						where companyname = 'Axis Bank'
);

-- query m
update employee
set city='Kolkata'
where personname='ABC';

-- query n
update works
set salary = salary * 0.1 + salary
where companyname = 'Axis Bank';

-- query o
update works
set salary = salary * 0.1 + salary
where personname in (
						select works.personname 
						from works, manages
						where works.personname = manages.managername
					);

-- query p
update works
set salary = 
case
when salary > 300000 and personname in (
										select works.personname
										from works, manages
										where works.personname = manages.personname
									) then salary * 0.1 + salary
when salary <= 300000 and personname in (
										select works.personname
										from works, manages
										where works.personname = manages.personname
									) then salary * 0.03 + salary
else salary
end;

-- query q
delete from works
where companyname = 'Axis Bank';

-----------------------------------------------------------------------------------------------------------

-- showing all table data
select * from employee;

select * from company;

select * from works;

select * from manages;

-----------------------------------------------------------------------------------------------------------

-- delete all tables
drop table company;
drop table works;
drop table manages;
drop table employee;
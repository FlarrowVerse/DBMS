create table employees(
    e_id varchar(5) primary key check(e_id like('E%')),
    e_name varchar(20),
    salary number(7)
);

insert into employees values ('E001', 'Raghav', 1000);
insert into employees values ('E002', 'Raja', 3000);
insert into employees values ('E003', 'Rakesh', 5000);
insert into employees values ('E004', 'Ramalingam', 7000);
insert into employees values ('E005', 'Raima', 9000);


create or replace procedure dsal is 
	diff number;
begin
	select max(salary) - min(salary) into diff from employees;
	dbms_output.put_line('Required difference between highest and lowest salaries: ' || diff);
end dsal;
/

begin
	dsal();
end;
/

drop table employees;
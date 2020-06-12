create table Employee
(
	ename varchar2(15) not null,
	dept varchar2(15) not null,
	salary Number(10,2)
);

insert into Employee values ('Employee1', 'Back-End', 100000);
insert into Employee values ('Employee2', 'Front-End', 25000);
insert into Employee values ('Employee3', 'UI/UX', 50000);
insert into Employee values ('Employee4', 'Back-End', 45000);
insert into Employee values ('Employee5', 'Front-End', 55000);

Declare
	c_ename Employee.ename%type;
	c_dept Employee.dept%type;
	c_salary Employee.salary%type;
	Cursor c_employee is
		select ename, dept, salary 
		from Employee
		order by salary;

	cnt Number := 1;
Begin
	open c_employee;

	loop
		fetch c_employee into c_ename, c_dept, c_salary;
		dbms_output.put_line(c_ename || ' ' || c_dept || ' ' || c_salary);
		cnt := cnt + 1;
		exit when cnt = 4;
	end loop;

	close c_employee;
End;
/

drop table Employee;
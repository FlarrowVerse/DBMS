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
insert into Employee values ('Employee6', 'Front-End', 1000);
insert into Employee values ('Employee7', 'Front-End', 1200);
insert into Employee values ('Employee8', 'Front-End', 1500);
insert into Employee values ('Employee9', 'Front-End', 1800);


select * from Employee;

Declare
	c_ename Employee.ename%type;
	c_dept Employee.dept%type;
	c_salary Employee.salary%type;
	Cursor c_employee is
		select ename, dept, salary from Employee;

	cnt Number := 1;
	new_salary Employee.salary%type;
Begin
	open c_employee;

	loop
		fetch c_employee into c_ename, c_dept, c_salary;

		exit when c_employee%notfound;

		if c_salary < 2000 then
			new_salary := c_salary * 1.20;
		else
			new_salary := c_salary + 1000;
		end if;
		dbms_output.put_line(c_ename || ' ' || 
			c_dept || ' Old Salary: ' || c_salary || ' New Salary: ' || new_salary);

		update Employee
		set salary = new_salary
		where ename = c_ename and dept = c_dept;
		
	end loop;

	close c_employee;
End;
/

select * from Employee;

drop table Employee;
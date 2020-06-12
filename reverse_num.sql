
create or replace procedure rev_num (num IN number) is
	rev number := 0;
	cp number := num;
	ex_neg_val exception;
begin
	if num < 0 then
		raise ex_neg_val;
	end if;

	while cp > 0 loop
		rev := (rev * 10) + mod(cp, 10);
		cp := floor(cp / 10);
	end loop; 

	dbms_output.put_line(rev || ' is the reverse of ' || num);

exception
	when ex_neg_val then
		dbms_output.put_line('Cannot find negative prime numbers');
end rev_num;
/

Declare
	T number;
	n number;	
begin
	T := &T;	

	while T > 0	loop
	    n := &n;
	    rev_num(n);	    

		T := T - 1;
		
	end loop;
end;
/


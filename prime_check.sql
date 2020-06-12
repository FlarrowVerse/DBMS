
create or replace procedure prime_check (num IN number) is
	factor number;
	isprime number;
	ex_neg_val exception;
begin
	if num < 0 then
		raise ex_neg_val;
	end if;

	isprime := 1;

	for factor in 2 .. TRUNC(SQRT(num)) loop
		if MOD(num, factor) = 0 then
			isprime := 0;
		end if;
	end loop; 

	if isprime = 1 then
	   	dbms_output.put_line(num || ' is a prime number');
	else
	   	dbms_output.put_line(num || ' is not a prime number');
	end if;

exception
	when ex_neg_val then
		dbms_output.put_line('Cannot find negative prime numbers');
end prime_check;
/

Declare
	T number;
	n number;
	retVal number;
begin
	T := &T;	

	loop
	
	    n := &n;
	    prime_check(n);
	    

		T := T - 1;
		exit when T = 0;
	end loop;
end;
/


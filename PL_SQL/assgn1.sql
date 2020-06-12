Declare
	a number := 0;
	b number := 0;
	c number := 0;

	ex_in exception;
Begin
	a := &a;
	b := &b;
	c := &c;

	if (a < 0) or (b < 0) or (c < 0) then
		raise ex_in;
	end if;

	dbms_output.put_line('Greatest of the three numbers: ' || greatest(a,b,c));

	Exception
		when ex_in then
		dbms_output.put_line('Negative inputs were given. Please give positive inputs.');
End;
/

Declare
	i number := 0;
	lim number := 10;
	s number := 0;
	
	zero_num exception;
	
Begin	
	LOOP		
		s:=s+i;
		i:=i+1;
		dbms_output.put_line(i);
		exit when i >= lim;
	end LOOP;

	dbms_output.put_line('Sum = ' || s);

	Exception
		when zero_num then
		dbms_output.put_line('One of the inputs is zero');
End;
/